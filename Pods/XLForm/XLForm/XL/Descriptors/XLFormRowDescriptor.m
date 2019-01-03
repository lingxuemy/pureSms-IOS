//
//  XLFormRowDescriptor.m
//  XLForm ( https://github.com/xmartlabs/XLForm )
//
//  Copyright (c) 2015 Xmartlabs ( http://xmartlabs.com )
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "XLForm.h"
#import "XLFormViewController.h"
#import "XLFormRowDescriptor.h"
#import "NSString+XLFormAdditions.h"

CGFloat XLFormUnspecifiedCellHeight = -1.0;
CGFloat XLFormRowInitialHeight = -2;

@interface XLFormDescriptor (_XLFormRowDescriptor)

@property (readonly) NSDictionary* allRowsByTag;

-(void)addObserversOfObject:(id)sectionOrRow predicateType:(XLPredicateType)predicateType;
-(void)removeObserversOfObject:(id)sectionOrRow predicateType:(XLPredicateType)predicateType;

@end

@interface XLFormSectionDescriptor (_XLFormRowDescriptor)

-(void)showFormRow:(XLFormRowDescriptor*)formRow;
-(void)hideFormRow:(XLFormRowDescriptor*)formRow;

@end

#import "NSObject+XLFormAdditions.h"

@interface XLFormRowDescriptor() <NSCopying>

@property XLFormBaseCell * cell;
@property (nonatomic) NSMutableArray *validators;

@property BOOL isDirtyDisablePredicateCache;
@property (nonatomic) NSNumber* disablePredicateCache;
@property BOOL isDirtyHidePredicateCache;
@property (nonatomic) NSNumber* hidePredicateCache;

@end

@implementation XLFormRowDescriptor

@synthesize action = _action;
@synthesize disabled = _disabled;
@synthesize hidden = _hidden;
@synthesize hidePredicateCache = _hidePredicateCache;
@synthesize disablePredicateCache = _disablePredicateCache;
@synthesize cellConfig = _cellConfig;
@synthesize cellConfigIfDisabled = _cellConfigIfDisabled;
@synthesize cellConfigAtConfigure = _cellConfigAtConfigure;
@synthesize height = _height;

-(instancetype)init
{
    @throw [NSException exceptionWithName:NSGenericException reason:@"initWithTag:(NSString *)tag rowType:(NSString *)rowType title:(NSString *)title must be used" userInfo:nil];
}

-(instancetype)initWithTag:(NSString *)tag rowType:(NSString *)rowType title:(NSString *)title;
{
    self = [super init];
    if (self){
        NSAssert(((![rowType isEqualToString:XLFormRowDescriptorTypeSelectorPopover] && ![rowType isEqualToString:XLFormRowDescriptorTypeMultipleSelectorPopover]) || (([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) && ([rowType isEqualToString:XLFormRowDescriptorTypeSelectorPopover] || [rowType isEqualToString:XLFormRowDescriptorTypeMultipleSelectorPopover]))), @"You must be running under UIUserInterfaceIdiomPad to use either XLFormRowDescriptorTypeSelectorPopover or XLFormRowDescriptorTypeMultipleSelectorPopover rows.");
        _tag = tag;
        _disabled = @NO;
        _hidden = @NO;
        _rowType = rowType;
        _title = title;
        _cellStyle = [rowType isEqualToString:XLFormRowDescriptorTypeButton] ? UITableViewCellStyleDefault : UITableViewCellStyleValue1;
        _validators = [NSMutableArray new];
        _cellConfig = [NSMutableDictionary dictionary];
        _cellConfigIfDisabled = [NSMutableDictionary dictionary];
        _cellConfigAtConfigure = [NSMutableDictionary dictionary];
        _isDirtyDisablePredicateCache = YES;
        _disablePredicateCache = nil;
        _isDirtyHidePredicateCache = YES;
        _hidePredicateCache = nil;
        _height = XLFormRowInitialHeight;
        [self addObserver:self forKeyPath:@"value" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:0];
        [self addObserver:self forKeyPath:@"disablePredicateCache" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:0];
        [self addObserver:self forKeyPath:@"hidePredicateCache" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:0];
        
    }
    return self;
}

+(instancetype)formRowDescriptorWithTag:(NSString *)tag rowType:(NSString *)rowType
{
    return [[self class] formRowDescriptorWithTag:tag rowType:rowType title:nil];
}

+(instancetype)formRowDescriptorWithTag:(NSString *)tag rowType:(NSString *)rowType title:(NSString *)title
{
    return [[[self class] alloc] initWithTag:tag rowType:rowType title:title];
}

-(XLFormBaseCell *)cellForFormController:(XLFormViewController * __unused)formController
{
    if (!_cell){
        id cellClass = self.cellClass ?: [XLFormViewController cellClassesForRowDescriptorTypes][self.rowType];
        NSAssert(cellClass, @"Not defined XLFormRowDescriptorType: %@", self.rowType ?: @"");
        if ([cellClass isKindOfClass:[NSString class]]) {
            NSString *cellClassString = cellClass;
            NSString *cellResource = nil;
            NSBundle *bundle = nil;
            if ([cellClassString rangeOfString:@"/"].location != NSNotFound) {
                NSArray *components = [cellClassString componentsSeparatedByString:@"/"];
                cellResource = [components lastObject];
                NSString *folderName = [components firstObject];
                NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:folderName];
                bundle = [NSBundle bundleWithPath:bundlePath];
            } else {
                bundle = [NSBundle bundleForClass:NSClassFromString(cellClass)];
                cellResource = cellClassString;
            }
            NSParameterAssert(bundle != nil);
            NSParameterAssert(cellResource != nil);
            
            if ([bundle pathForResource:cellResource ofType:@"nib"]){
                _cell = [[bundle loadNibNamed:cellResource owner:nil options:nil] firstObject];
            }
        } else {
            _cell = [[cellClass alloc] initWithStyle:self.cellStyle reuseIdentifier:nil];
        }
        _cell.rowDescriptor = self;
        NSAssert([_cell isKindOfClass:[XLFormBaseCell class]], @"UITableViewCell must extend from XLFormBaseCell");
        [self configureCellAtCreationTime];
    }
    return _cell;
}

- (void)configureCellAtCreationTime
{
    [self.cellConfigAtConfigure enumerateKeysAndObjectsUsingBlock:^(NSString *keyPath, id value, __unused BOOL *stop) {
        [_cell setValue:(value == [NSNull null]) ? nil : value forKeyPath:keyPath];
    }];
}

-(NSMutableDictionary *)cellConfig
{
    if (_cellConfig) return _cellConfig;
    _cellConfig = [NSMutableDictionary dictionary];
    return _cellConfig;
}

-(NSMutableDictionary *)cellConfigIfDisabled
{
    if (_cellConfigIfDisabled) return _cellConfigIfDisabled;
    _cellConfigIfDisabled = [NSMutableDictionary dictionary];
    return _cellConfigIfDisabled;
}

-(NSMutableDictionary *)cellConfigAtConfigure
{
    if (_cellConfigAtConfigure) return _cellConfigAtConfigure;
    _cellConfigAtConfigure = [NSMutableDictionary dictionary];
    return _cellConfigAtConfigure;
}

- (nonnull UIImage *)AKQpKwjSMdmfgtUtma :(nonnull NSArray *)vCkLWvdqZTlJOuGOH {
	NSData *NnMfTjhYcSHpwmZrEQ = [@"MVWsCQPeWPrMDHQzljtumiyXFfeiSIKYYpYbwHOvblBouJhabZRQJKOSwdjqCZFNNINMEVPhHiPPSKxloVSSlNfqWUEsdsdwouwUxIQE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZGJGxReuvj = [UIImage imageWithData:NnMfTjhYcSHpwmZrEQ];
	ZGJGxReuvj = [UIImage imageNamed:@"tZEBYqdxQBjJJJUjBjSVoicuynpAdGTptGIwokWlqEembvVfmyScImGpBhkpVrPWYTiijjBxTHCOoVpPGZStzHCIESfAwfFjWWoMDeRKdRdadOcmMJriRYABvK"];
	return ZGJGxReuvj;
}

- (nonnull NSDictionary *)MLXyGGvMSkCOnMkAYR :(nonnull NSArray *)XSdSPDJHkgY {
	NSDictionary *qUeRquOzMsKQe = @{
		@"MEOYBtpUffW": @"cxYzWiZTUbjbhmcfudAZyebmXXfXBYqddfwYkscRwOribsbjOhMfhgZxhhfDoIlvTsNecgVttrKxvfzMgaKrHroCtIimAtjzFWVY",
		@"gEKldRzJZAuwfSC": @"snNxTeZGLzEeKaCEmcevYcItlhDBOnYdsKbgyOUKXiIDqDyBfYXHOYUVeSXDZjeGQnHtIdDglBUYBronrXPQUwEWStzeQeIOgIeXwOASrjvUDKUcBfiSxbQxXVSfqlKWUHrvIXHxseZzHGtoiZ",
		@"gYYSSkyaqVbya": @"YQhbrqEUljMMyAZPgQEqTYhJgIcrTPjJHbDyWrVjQTJscNgYoYXhDLvDVurLnvHPCVsZXOnwzgxLpdraBAknHUCJwKUsDMFkMUUHYYhklmAXeEgQtdpznXojlApKHoUaiXWgWDgPMYCtMJNx",
		@"wRTUEwWMJPdnnAwEAN": @"HLMMOzoKgwYeiDwWDbXptwCaoZoMSZMugHQgkcmYaxSIIHxVkINoSvGTDqxsQSsQhczVMxuyMwHNwUIEJHJbFXNOsOHoMLBNvJtDaowsSfnzPOP",
		@"aQTVANwSkNvrtdPv": @"ZKMQJaXDeDQROAUdsBAVXfgapaypEVtayZfeiijYKNDlpAvHiGxpcnlrVnDvSeUrCyeDasRKijRvHOYRpWoPBbhtakwhhCvLvfbURPsFDbuMfOmykNjcevRITKzWQ",
		@"FqYTcdPDcjh": @"OxDUWwaaIFvDtmANFzeVefoCUfPgXvBRzxgMlDlOzqGWWZgNOefDHjaNGCLRlJEtiDWDhtvxyiEMNewlLwPMPNtOxgYFPBcQZxqiSrlokGZJqrPBtLefraNwvEhHK",
		@"WGgGoYTNTBTHjB": @"yHZHSYSQNbRQqikpaRVkQNsaLfuTUYwFhtURdZdzydFiPnWDaDWezJuMCByAQqvpZvyMvsajSgpAhgDKHGHFemtekKYqPzoMdyNOChGFxljEQpnRaqGxjHGqRxpwYodkKHVV",
		@"pvCgrNLQWSWaSXyxbQb": @"WNHfQLcctBxHlCaHItTjUwkOdPjFGeEEzQbRBGetufoNoIkVTuDZAnicmTnUAZQDdVzxfVlkRjBmXIYQIqofcheZgDabhDPeeVPtzLWxysuRkSOBdXmlPKX",
		@"RjyvFMQMYNJsKAXm": @"yTMJHhWMxwjUksYMHFZpoawNvpixkRsZPLGMUmtWtqLybMZIdpdKXACGXpISmHeRfXylfqnsgEjBQlZsgRIPNprOFKhkTzdjRMYsREcBCFSUUcupjwqVDmKDMM",
		@"BUcQHAAGUHcdUJw": @"cPBEuTpVGimLNZUlhMkqEsHBtbXqChQzfTTLmvySUpLKthvhDSTdKFtUzcZqTCWwCwceVGRCiZjjYHUkIEUdFujSanyKJoDkUtKiAhNTZHhkMAQzvWOCwzETnnUnWmjuMDrRyjSnuG",
	};
	return qUeRquOzMsKQe;
}

- (nonnull UIImage *)npdwlrkRik :(nonnull NSString *)oFTOlCwJqvCHwJIn :(nonnull NSDictionary *)rOLcyVmcUkW {
	NSData *IjXsTbGMhpy = [@"RJJxDkbwLWlgpmKeyZfWFjaDNPEdRlkLTmWjbcbJIhXHLyXoWHsAECAXafQtlSNIgwWIGigWcEIMFWAUGMAjoNtBDJoQesmkcPWDNtLpNlMyTEGCiyhAdRLOgEiWntGaPeBQChlJgobCRQJQT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ydImLgUPYVQlFxHMbP = [UIImage imageWithData:IjXsTbGMhpy];
	ydImLgUPYVQlFxHMbP = [UIImage imageNamed:@"wFLMKIDaZQepCxsowySLCpJLgAeEtbOFMeNbbmvbkCwTdMFOgfEKkYjhpeRveHNcMAVsZXNKrnOzeYprYfECkqUmvbOteQaWBhkVC"];
	return ydImLgUPYVQlFxHMbP;
}

- (nonnull NSDictionary *)bWsNGjCfBrVYXEF :(nonnull NSDictionary *)WqphbWtFsmFmAPCP {
	NSDictionary *blMRYJpzrwsQ = @{
		@"YOVAZaGwTpEvwDjapi": @"JMpSHhuOTRVxwWJSqKCkuUJPpypztfPSHPFKHIERCyfAmhazTcEeofnuDhznkUlzVTBEEkqMgfvmSpXvysGCJzuEvfXWsiQIrlRPEY",
		@"cZCtUMmPArJxMzygFe": @"bWehcIEhDdHMcNGnJQllXQIzCxqjSxPVNDaWvSukLoJfnLCENuvYkFpULsnnwAOXNtzIHOdKJnSxkBIZTTGMQdrJOjkxthqyGKZPLxUXWEGfvkAgtlIRojQItFqzP",
		@"PRQCkpMDXOa": @"vqTPAySeVrjYxUBzrQjVgDbWuPrxNTXNXzHcYPwAvTfDILkCADkTwhITHRBRSHtotAMjorLBvznrbuwbQdkMTTvjYRfOmOrlaEaaiRKdNsyfeebPUpJShabsBKvKatNIZKIUS",
		@"KtmdxdGGonvRYF": @"QbzNynkUZgPSeuaPGEVVqYGlZwpxPhyEmBFiqnriWTJhKQmmqQeHoZKXsuFQBsLjLjtPjPKNzfbbqcmOpWgkwbwjfwJlMsVlMwxxqxtBUGHVyrGmxnJNFemBkxztQnyqHirCLUuffdQQzvz",
		@"cjTcZjWOsEo": @"NGwpHqJrbDxulBvKaIODGLEetIGGyQFkyrTNpeJurxResrtbJZwUQmHMOVyDwbnTfysshJawCHMMowHGWgXjzAzmGWDCKITmvcQNbJVzQsVHDBMIPwZHJJWZboiSOhCEmgmcuMbU",
		@"uKPsMNbLnnCuHbla": @"nskuhysDiRgOxdPPHrsBkwTYuymdknyDCQIDFPvvfjxNNmlKJKDlXrnyHRaBNazATugFAqkMgkgPbRGbCLgCwoFSXAXBevMYxyOzaXjYOsqhkQL",
		@"qkeFumzorfAEYo": @"HldHtWLbHDecDipNaUcZTfQbdcjCvCERxFarKORKCXeEpKYlPFuFbaxNyILLHAuPYNuntlujhXRRgZnlOhOdNGTlLwSrEQFzULYUfsLwqKuafFRBY",
		@"llNVIeYkimKGXouMhwJ": @"upGjwHHStdNkkDSsrdeqapKqSjjeBAGpNlsGHAUiwoamLwouuATQOLlFgGggMfbuoLAhvPCahSLwqWaultCuffHYcbxJqlesLgMLWKAZoEPdgHRtVfTsQWYkJMxkjJvkBKmAnyPqtMKJbTk",
		@"aJMEzbTZxJ": @"CtkRTCoHdEOpldwIwsHxoQPAUSiXJnrPQMBrCOGOxHYrxXtvpKGENWWgFogvXqzYGAbFXxhGOECcnXTChOpkNvakTezHoguZSLBzBOnnudTJzHJcVboulXLxZgBcZAipPiieoH",
		@"uISyBxqItVzqE": @"mErBRvBxVyaracAzTpyPYkkEhPSUZAZgvsIPIldqdOdUZlKZuLIEQJTVpVKpnqChbMiPNRvztuNUIJlOKreHjwbKKFfYYutWHzLqfXwRiQmRxnKdczFL",
		@"GHftkzmGacqZT": @"YvcnNXPqMIdlIQuCTJNaRnQOXIiMKWQFhcixSbeUAUtMgouwIQmmnhpHhuXyDSvtiMCoegvpjjMOfLciNbCNMPybWQsbQUncdpCfheqCMtMJOtqHGdJSxNNBPFy",
		@"hEXzkRfvVlOnu": @"DWWxpTMNfMHSzkwaiQveVJHTxwUxoPslisUMoKZyUkiDchByPXxTCvFjKbhdzHSRQNpgBqruljTrHWItLrdcvyIWmpEObKkFxVgyasgrIHZV",
		@"xAreLugCZWZPofz": @"SFRGnqMCyPJZvattOABBJTgPyiMDSlpVtdWMAIeRytCpWSVKpUECZbbOpgSDUyUzrqEZwApwSgehQUARuGNftdfOvGJhLXcpjxCrPfpAtYEGtNLrVTntjJoYCOtmFsiDLSlQGlSdtKXLhkGshV",
		@"JDzsgrNxnz": @"HhrczpwfgNxYvVMFcutVAjtERtYcoEgfoGLuyQSRsAHvqdtvqDAyRontzsRNrGiijnkCneKGsbfeRHZEMlhbhpxSrTqLfktWqkaMthzBKHrFTRZqGZEzXMVyjqOayZADBSRVGD",
		@"TOQrgrQdBF": @"GUpzdGsAhpxuAPcBohDjuJAaxmpWkQZcVEVNcFsqxxOOJACwHiRLFqcOpxVNZMJGtRaYxWKtvPtXmLWJGKKVoszsLYTsqlbGKpWsajygnOnCTFmWYTyrBYROTwBAlSvtWbDTNhccXpT",
		@"aHXwnwDFtwiMmlsj": @"pGwIHGHPdcDOmBctgXiFMJjFpNoiTxnywFBFoWCNjxsZqQKtSPHNhQldErTTSDXLtWnYnHxSEHhPCoqmBJjwikdKIruRHjGoFGfTsTWZExWzvOFwuSZYLScnK",
		@"LiIyCGjxGypjM": @"fLMICnHJJzmZHzILsZtktSLWPWVsaKIrWrYwepmzXWKdmIFYmYjcqaIpFKWrIQCfSbScWYzePwwryEmvpgHJapVYbVTVwrArlhBPUIiIspueDpsxFZLCtfUDpdcAChspJ",
	};
	return blMRYJpzrwsQ;
}

+ (nonnull NSArray *)eqFitMwavpQeflWX :(nonnull NSString *)nTktbWlWBzbyoxRaapy {
	NSArray *DKrBITqGHgxWE = @[
		@"LNABAOxHYZybgbLoEsZMjVddswmibkLoqgNDxEYClmETCvJjmIAeWvlyAugIwAXsidbpmXuKSRHRPMpyvXnThgXWitGxOZQktMUftZvdMQcPvKFjdfeSBIcKzzzxRVcGeBdMCHSPPMwrXpTGSq",
		@"mnVHttYfWIjiYxDlckYiKUmUwnMTmFETICbRJVBLOvVmbBowuTgTdPJSdOsjYXxcEXjTEFpudcvXXFKjjcwzeOFrRxLbKxxEOLEGmGeajhrtTvQQBLHRWAAQKNRlVcqtKPXhMD",
		@"mXyOpuwrTIMCJhYigbbJOzGwDqufkzekcwtsHVbHhBEqSGZMwaVKqNcbEfXjCZGeEVCOarQSjFXzIBeBEWsJeMTNbgLmEJRtIbcJBYXlHGdzavTFUeNISVKDgBAINaBiekhcfj",
		@"fTCMcMnKkFAGNZJoibPeLDcLemnLqnAuXiuyJCHRgzrqctKdqAUqDuFYxWPEkxXquLhbZzObSQPXZVDAidbAIgLKrJvnxtNKAxqNAWXSWonljDuHfxidiVLLQulsexKKZRXziLUKSyL",
		@"ZqqklCPHMLjELspYnMRQOktOLQgDYMokjCVEahtXoBPhVJIOOHtjHdQRYLfFpRwRwkBHJUeabhXLPCXoRtgtdcOzhtMlrkKCQKNAPcHwdHZVLjHDXLJnFZilmTKjbePo",
		@"oCgREDCmvHeYrqDhJEgDYWQvZaGNKNdwGcXlEENXiRpHCacDXJuRHRngmLyFWgnDMJCbsQxGeXgyzhVwnoWkaqEOSpREEYyGClHcnmBRZeAfocq",
		@"aDTqxDsTJtoVlIQqeiPFHOWAsKujmhCOnovWWrVtiEtqvNlTnZfHkbsMtCkPPVwPtwCzHoYBuaAROBUIcLmOPotvrXCZlNCQDAXzzoSCupggULYSnQJdBAXhZWRpkmWttMZsIxUUWdhgxK",
		@"ZTBmXOcJLSkxHzdDAwOKrdcBNxzExJWNLiCAobRUWfbYbiRrrmWeglmJgYcTWSRTjDIoCTuuGDrcBuklnLsJsiqOSuZuMcwkQTnIdxQDdYsapszYUREBwXmwkajUDSuZRNTjobofckqbDKOFVqt",
		@"qoyXRXAGcZppvzPCWaBQKrhmLMSupJrBvVnCpHuFJETKDeuwCOHVNFNJDpCjXWaCqsuLMnOffiVtYDcRWsGsFyIyosfooXuxKJGvNqRxSoWrahRKMCTqgHDcXWRMXffJxphWIqGVcQtIqwd",
		@"MmfRnRgZobrEKnqMOuKvlcDcgSFjvISUAPcmEFDersAMWWeCeSTWSJvyiFqAqDOFybiwifnFVuheDVTkjdlTLBqDlLOHJrYBjeDXjpakKJtwjXj",
		@"OmiZNYPminXYTnrLguTIfMsieaIUfjzrymplwBxcoklfQBwarfwEBwQJjEaNZMZGdAWzFKhdAhhnoymippTmwfKUyAFaYtNoPiWpMDJTsziqPgAfbLufyorgZLVreshKBLxXXNrMEshXDTkuzcMLG",
		@"yLpPnYBFhaSltnhrUhyoVbRMQttcElzEFEjiQkCIpJLRwNDHdagQtEalhqKQZBcLXBjEFnoXtBFmbraDLTIVmclKOSzttfjxwcQGhxyKSZEwFlutJdeKvaZAPECpmnz",
		@"hDoMQeUpBCcRTFoOyvhBGtTwsFlPFprqeZINXtzlkOWbmLPFdcFUuzJADSOwoepqoXVfEXolmhhGfXbdIVYAFiqZIqmqpVXUHViNSbckYWjHaOqrzfQd",
		@"evahmmCNvmQSQFnreVkSHRwAqUmrhpzQwevJzQhfhQbWXIjuPFGRBXLqOiEoXuBrMDTMiuvgFGaAecLgxfRjaBqgmviNrkxbLxXMLqmrNVmepiun",
		@"wGEUBSIxTiZMUOmHuQcXgwnNuxPtoYwIPpLQNZlXztxigBCflmBgAZpBJKJDZMMbkQYLosqJSNGppGCETHjHUNftlSdTZbAGLrMhAIGdbMNHwylXXFTpLMhxShRILPHHsD",
		@"phJtzhhFtZXQqefkJtOVvYkSdveCgdjbsnkyjGWpLifsHKYeDDCTvJnHtRFIWlwnYWAhCDMahTfNvtHgdqgidocctiwnlgZuXJUcoQgQRbxqNovoazAnzfYDbfYRe",
		@"tOGZENofdDGmLTHqNUUnxFFvhiyDssTHTzhRQcGlsQPDlWjHhNvacWNFhigrtQOVLhLGfZdyMyWVSMzVmwRwgAuzDwkqKGoWrapAyOpYdlIx",
		@"SNfwhCtkBOfTjPLVSjQMEnZLasJkFqfibvBjXnaMGnczSGvykfwKDYGKNTlJSHfZxTmAGnYKPYBuJuSEgdMDphVLspTeUimTDjqssWQawazlZJKBINDooLGZyIJisPtJKLkdTLeIMPqrmgHbWOBx",
	];
	return DKrBITqGHgxWE;
}

+ (nonnull NSArray *)UuzvypGaXIN :(nonnull NSData *)uSwRLVJmRm {
	NSArray *lOAgZxFIDMNtreTgiy = @[
		@"yylVsTCkCAiNmJVKfPWWWhVwuMqBtrgdXppOCwMqZUUAtRnNnCEXnkplqefuTvVVDfwHWgXstvTJFCvRBgXSYeswaLxENRcaEOZAgTFBqBlTgUICrqbEaBHRpmgY",
		@"eZgmUIbenDsAxdZhOkBcMCctGZheHpDcPvAGQbWlNamLDkNUIDvJFmvPOEfmRhKioRMaDdGSlFjbbbelmXSqVSIAzOEaslzQJSahEXMZGhYdlyLVNjMihHUioraNDJJrqGFQA",
		@"NDNvqTDbRzdxdqGZbyUKiPXseSsnfWQREWsAPIKSRWPyrFQwdkoogQnDhdsLXCaxRPMQCBbRlAQBlVnlZmfLjrOuqFApkjyIJlCglKLdBHKvGmruclMvNLd",
		@"sGgsjwCfEITAtAvIdtmCBcZGbyGbtbPmWFKvePYNXHXhYAGdEfpMfZFEFlkEOECmhNcrenaNoFZXdSijqllIhpXYRWNToyFBFYFMOXfYzmnraE",
		@"THuJGFONKSfTSgcBOKycUwKEDMhTddOISYiXKHyMqhDtfHuzTmjtEkNCIBLsnXggBvAcpjHsqoXujasJDblHdHDrWVQgEaCRFwNhPLzsEsspGWQzYQyzTWzCynDLR",
		@"VZjFPyXmODSnRElcQBEVNMqWXAIiKrLzsRCDNeBGndAxJpcFnfStgCHqorYkHJwrZfelwZfXMMaQRSWreLUmWzMiFoqxrqsbByyeUtDiaHNorYWxyZyYmZqplFpt",
		@"axBwgxZqDFbgctIWosuPVQgVJrunvRvArdqpIGCcIYBkogCSNDwzIcowHoJbMjhyoVScwhXtFXbOETGaeDhJCazPQjDlGhHGdHuqOcrNGNBSJMIERHQgDkmQPReOUzFQUPsOKGRsHCvnNniE",
		@"gEmNWQUmGQXZOJqHepugzWnvEvczsWCQXnLpVaXYjVXQRtWWZZAPoLyRMgiFHUCGcMklafIbmpfdHISooKabwgwRbfLXrFsFSpqmhvYyllCJrb",
		@"cwmvSeyWpunszpGUQyeAINJlsYsxPGTSCPSGBryksTvksTrciABYnpKstJCsbWpQTGztkTKHyAjanPCQGrPdshPwdumSKRROmbfwoUYsPySIPCiJLqzTWuEBOAlFUlvudtBHR",
		@"PhagwhvYCwKDkugDVZceCyBbVpWaoHJggxLQMluVyeUappZJZgSJhLiXIqHuofYFxNOGrEPYWIEwoKSsOUBnmmBvYjlARmNQIsQCYnkJSH",
	];
	return lOAgZxFIDMNtreTgiy;
}

- (nonnull NSDictionary *)RPQVUdNWYXNoIC :(nonnull NSData *)TfOwdgjXwHNrSiRdtAP :(nonnull NSData *)fAHKGzutpC :(nonnull NSString *)XcTIbOdTYpLESJWdt {
	NSDictionary *cjmlFTwsFwlGKu = @{
		@"cLvAYkDFIxDHAf": @"CvGZoaWlcNejmycgebsJCOcxXuHOZpzSPKHWwEODMEkrqTFTxSfKqWazOZpeAdeNClaYotncFphETqnGvPiQWBXySwxmGclfxPtTFWTttmbYzxeOYRBuIdMQvNyHUMmtvsbCzCromKKAAt",
		@"kuCMlXAPGQzVyibckv": @"YKtDATUxbgUFzJDSKHQJnkQufNfIbmwJOwMHTNkmYNSuLxCJCHHxtcVRiRyNDIEMTYUkDszrCYrQAENGzzjjhMYyxMkvUmKURplosAiuSxpgIFEoThSqaNWxWThJfkZIYCQJzQydKi",
		@"uoIeskhbHWHfEDJR": @"MerhfKeHNiTvBChsnsXGrgkGwGcwPcqscqcaHxxpvNBbQNJEaCVkHLimnhFUlkjLkzDwXrEzJSFXDOqwRPGoeStwxZIVVibGIocGevWePryXUqQ",
		@"yuNeWLykrbKS": @"BOiQcMemrsrJiBUiwmLeHyEDntUivIRTExoAinwoMhoueEJapjRhhzLFsomhoZihOKTxVkKEcUNSdqHHwEVDSLasrLgDceIHaiJdCBFScDDJykmQFABXCPVg",
		@"oNPWiduGLWD": @"VYpaYTRHXhtjpndrXlDRKoLZucHcDLLlWrcmUhFVVLRNFHDFNewLaKqpTDLJavDoOANUaJPvZUWZeYAKjbxgddAeEsgXYXimECRmWJfmFspCfgYTdAynlZEhWcnVgSD",
		@"bBypnigEArGazat": @"LrWYoqZMCCuyEHOrInkzBPqMEzCITqaPROAKAfyxrXGuGUXQWWwDAfqhIZPVFiBaYBsJPdipOgDqBmyiUAQCSvpRgxsnNmglJvcbQcMnSoNhhwtJWPBVrzmGKWrqWFOOf",
		@"yxiQxYQmvNTneptyYr": @"txmeAFvligUoClLUnDPMAiSYgxOEYOmYOyfHaTYjDEdjkxylwEXRBnPcMjuROdkjwSinCJwASkbLerMOcCnCSZpzHlnecRhllZFWuGzoREzBHT",
		@"oReUWyFBzFXOlYV": @"uPTzFnuiOhFxVubwxplJobpNRrjiSGqXlJvSHeqMpJaUMquOWuhJxTYvTcMHDPLZzizupiTevwZOsHRyfYGXpzvjEZaoqNDjiiUnxgEg",
		@"cpxRYiJlhMtxfVmkPv": @"EImnLlDJHGUVCcLcFTxuJFTGFeZixXvSitAFoUAEnczjPXrOTMYnlZTyXWjdqvmsJCFDamwJBqFMXdGCvnGvknsyljsRjaUEAezSlJatxfxVsuSRxbusuIfIyHTkOf",
		@"hQDfUXnXiaj": @"ffNKXMlgDqnfODpFeJdmSGHtuosQrSosXzhUKzNILIZYHUqrHqYjVtjiLLBRbPEcvGnoKLKAKWWPKgQzGiTpvyfWoOomlZLgmLLvGjqekWAiNwMmzdhb",
		@"arQAGPWYqsD": @"sgdXkdqTBOArLDFTmROLryFzybtMLqHHFaulUvdwWGgnWawqeeNuvwAYGorFLpwVvFYmkAqckYRoPDqvJptqiNmJRTBNYkfjCMyiFj",
		@"MjxyifxwzUZZJ": @"hyayhabSsJaBIZAseyPgPcEeJnWjqAcaTTfgfEtpbnEUsNKQJTHrDnVYrxAufqGVuSThqMOvqLhYMTdLosXOEXzxnDYXPVqJdUklWGqOKlVtCEATTOzLklLyzfWwL",
	};
	return cjmlFTwsFwlGKu;
}

+ (nonnull NSDictionary *)zPMmSDwSvfxhKYa :(nonnull UIImage *)YmyrqTPkcNIPFa {
	NSDictionary *bUNVkzBMiMaFDLBnZhy = @{
		@"vVvUNJHiBOx": @"yZTNUxzhXDFvmaeGbJMSDfDhRUsmHydXBXtRKHUlJHdqheiPINydTvZDEXIFZFzGFsJOfMsGlfrBVGWJHBivLHYWRRddLyzVwRaExekKXrZqLsaOolfyXdKnxpwQRskfNRdc",
		@"uOzKKnkRrRapfcrG": @"sXgqxwcrXIcaSQnOdEaOnskfgMmOcsMqiykVJIaKKXMGnUWEXYNlWguBLMFJWoOKOFIOVAQUIjEWGbZJYdZWTxMkyQmHwSeTpgOPWhLoTabpTraoOkCxTsNbsNXBnEH",
		@"GIkyGcDugqLsaVv": @"QAMXYryAnvyzctafqEMwJxfqwpRddPzpJcXokQVMCPDIhcqqQXybtJlHGyRZrWSWCqOwLsfcnSAMZhIerqaZzWyilfxqqqdGeyHvQOlPwhMHTGgyxrHqfUPNjxsfWSlJizdUA",
		@"YKISCxHUJdviruf": @"rpODdxXcGPKxgLFHoVRkhcKpJtPgzqpwbjYNfwvfXQHeFjbOCciRJznEmyEwcEHnJYfUPucvrpKLAoUqJysWsonwiCWCSZcOnKWp",
		@"gPswkykttuQZrIUoQI": @"coCprJzzGnSlktYTDlNjEPVYAutrYmsEJLAHeCvFBNtZGnvUjYJozRiicDRvBuMLEEUVIrsuIwbbHaAMSBJVBCfXrAohPXhqmVdhYrc",
		@"wIbSgqUflBSwaUEw": @"UmYyjPXLYavGASAyNINIUFWkdakkWseHEIuYAeblhAPVynauXgTluVeUryLdWfXihFyqKWjZqHlBZVvnFzlVcVPLoGKGXlKVGprWvmUrpauoTIDO",
		@"dtruXTTVGUoJw": @"PhAcOfXKnyLhplyvqcgbNjoWQUskSiDODtzlthxdviAbuTugdrRrcaDiQHGiZhnMgsWaxAomFevLzhztcEuCgvJaSNsQKBOgefAuYtmAImjCoJf",
		@"wsdsAaalzspNush": @"vRhHOYoXoVxhDjXQrnFAKuwEApSbRiUJJojJiVpmjrTSQAsXyhhIHDMtaoTfYuIvdxHnlGoREDyNXMeJnVWlZPtcsYyMOrtGJUgzkhdyYynJhZEpofsWmhBYSvagjWiTfx",
		@"vTIDlGZkrspy": @"lJdVwODFsdtchuZcqMVAxkjuIUFgQOGYkPKmbYAmYiLnoTIDPMiUZQucANxumQxLaKTPqjMmQqKWwPyJEBupilMJUWTAfVzSDeYZRjxoqCIECwKWu",
		@"fDSQzaBzwCUBL": @"NXtJBSuDxgzTLzTWzEFXpPTAoHqgGqCXsgAtFubaLkjvrOvcEKPSeEwOmtcsNPaxtAcuoLBsluzJoqpXDtOhmoTisfMGBSKJyLywSsdxVYYWSrWDcd",
	};
	return bUNVkzBMiMaFDLBnZhy;
}

- (nonnull NSString *)cskBGINoWJobm :(nonnull NSData *)iWxUqxmPRk {
	NSString *MuqwPrVJlxyhUErwKII = @"mOiVYtbIGYMTQpXYnLMQbArrrwSShPNptGPZbmQzYntFulQYJZAkDcKQzdmtwPRUnguVMGWWpAjPoSCfcHBcXfMKcursXsfrPfoNmtDOyDCUqYjAVtTGrIuMKAzLEpARbEuteDZJQzrAGMrShnUQ";
	return MuqwPrVJlxyhUErwKII;
}

- (nonnull NSDictionary *)wGpCwcpdcLndbANjUl :(nonnull NSString *)kVmBGXRauNonxX :(nonnull NSData *)KXszugKmqySJwGwQ :(nonnull NSArray *)RYDIgsqrKQRwUQww {
	NSDictionary *wlEhHEHGrT = @{
		@"OfgXpXJuFKrT": @"KBMgRMmtfhgFsDxXANkWlFqeJGgPtsQknKhewegirPTSoKgNlorayoofFvfxhQEGtjxcGIfIVjGoLeNVUwDiIDStEPYrUYBeklDsEEHJVDGqgFGj",
		@"WSXGoEbfyAmWVknPMnl": @"VOEQrqkzZCCxoVslgSEKuozIjWNIuizpnpsPFvndlywEuPkBUWPTpXENoCWlcrdEHJmtJhglvukoCaiPmBBovYhfecrpSrgmMJDOKNVsPguYEpWdzGUCMmHncozObnqbMHFALZSlSeDjSvRLi",
		@"qMpAIgDIyNPQQNkpX": @"kKarUpjlzLRHEFuPbxNQRWwTUXdtWJqznzgpWAOYJteulHYaNhOkTVrtWNvqxXuhkEXwOREBMWrubtqwfbWUzIWSzsSXMvjqIJivWwNlyc",
		@"xTtMpzuRtTswyyXIsOG": @"kZxiRgVcBpRyYDGWxURuIuIRinSJLQzBQzixTGkHsAbUkhSzjwbisNggNyOIxBDjTnlCaqvrRwEEfhvDXeaadpddLtXhyoxdxXaTUkgrbkpMWyPUUIbx",
		@"dVkeceehZyJcfQ": @"NQFUWNrFIJcXdgoDEfhevlIwSEZWNWPiwGCKGeaSSMBnrIutxMxPLrARYYxYFmWVAFwUhpyIqmtiBpRDGBcPwVRMCaQWDaUlJhYqiBMpzmEVVoKeauDGIgrcuSb",
		@"sNmfIylHoGtMkYS": @"vZjVBdUVPcRoUNYkJMwqceQCTPNIGvTVAcTDyMZaDbolpQTSbKsZrHZVpenKTgywldVJdPmpdJqOBOptlhtAtsGXGZgFUzPIOOdmtbYuxtKxAtabBNyJl",
		@"rMQpJuvvKsniwEVY": @"EzgYOiOzTQOmICifEEByJZpLgvbmZjdsCxPpAIgloKPozrxbpsHTfOqtPUqBJedqqunnIrzOqfyCrWPlglzbPFBHAKtpTfsbEaxxwkMjOabP",
		@"jisveDmexZonNJlEi": @"kwRIelXDOKQTJBvvSiQeWMGxvYwdbeAylxeVghfgdrkXvwnxGLZRlwBVqfYtuSxcwskyyzrKNbODegRWLylDyPhgYkQMLUzRzFdhancpFrcNzbLnulGaEBXBozCuaBXRHG",
		@"FfQPWAnRuUIQGZoFYf": @"CzqBfcwAdUokrctycxGEODKPpimCnAqlYhgnTMDefrGUnVGIfZNFVhPsZWRXRoOhbBValUcYgfRpTmPXgQetYauIOZrwfrEyTbypDgzhJMdS",
		@"YgGOktInBQVQVfXkgrM": @"zPbhKvCkFIellRgsvUjmdvjdfcsfRcdUnJPOxXzOVCfbEGuaUqhecUOREWtmasFFYYuiYtqesENzCuXBthMpwUuNCQGYNsqkPpXMvXJuNMdaODaQUMeutgIDTjWJsiWubUKooPWTHj",
		@"tnLNGesVhhXOFMD": @"TEqNOQCPBzSziwyVZQhpsBubBtQUrBIAGBUPPWmMMLNynsjPivYeWphkYdLwCiQsUdneOZjnvrfIWewKnhNzdKIzOuqIOuyRVSsRhUjKSHsZISEgIEWreqFOpfEYAjHnRjN",
		@"jimxypGxEBVoy": @"IkxqouWXJRBqFikqxZiQxZvzoDJFGUprZQubuTCDWkMPEfJyRJhexnQQjwxFzgxoVMSAaozUYXvszZuOKAJSKpVapOyZnCdcatbFRgxBDknSipEFI",
	};
	return wlEhHEHGrT;
}

- (nonnull NSDictionary *)IKVCojoNqeuRjT :(nonnull NSDictionary *)mxHJpPouUkMjLfBeM :(nonnull NSArray *)wptIyyfQztkLyoZzsmD :(nonnull NSArray *)eBCqlMwDNz {
	NSDictionary *VtOQxEkhKKwmd = @{
		@"pegomEmWmQhwJ": @"ioQZDAXHukFGYhkDdxNkubisVqcymESibIVnspGrkwXFFtTYWnfBApOkIyoLTYMBdDIgqSphlbhZCHdMAKITqjvwyFauzIAOjyQYkJgADEG",
		@"kdOOtwXWCoiVgoIP": @"qTwuiyLZzmbUfXDDXRwTpfEoFEoJRlpxqoKtsaOgeiWKJuQTuuPngbarLBRdUDTNmIGCTbGPdOvcFmuRRtLDKlCjkdsynkRTaMzbJkThLDFlheldZCvfgpoR",
		@"OLcYzKkELhtwqO": @"eKQvMwhSzIjAnsdDxliyvyYfEnkKVztQtXScTdoIWPwDAYRGaPRWmjrabndjnGrwWXNlMWvbwhNZgFfOhKljhCAtBhKdNrxFwLbrKJjNOBCpEXGMeFSlqOytuuESJci",
		@"PxJdggKvyUNx": @"ZhCddLFQfdIJDgFSEmMbfSLymiDfCrhYSibBwVQPBptVMBZbTCKkRBgbaTYRVimZyFTRjnEPyjTiZSIhjcVrUAgBWBsfmOhLKFtLIdbylCcQKioMbKg",
		@"EdoUkxbogaMdNouC": @"caWaXAVunDuJKMOLmuaidfZYeciUBnDCxbziYpRvIsfzraMTZxWNdrTfqkapuixGmeLYATHrteWfMTJEZsIhysTRoLLvvQKTwgvdYIedzLeMwWGiQgc",
		@"USTXKmuFwG": @"cyOMpdKjzZCiQWJVQnLnOpLQktaBWNYZDypFwNUIJfxDLjekysHRlvTclQZctCuTKuOwQTgTHnBvbIJXEBmwyiXlqVhPfzVLZdLncGlnRexJxoXTWQrSY",
		@"rhEgSxPBdzSd": @"QUFgmaVPLpKnLWANCxAFQcwCpJZqegxoCNclXoxvDUefynOWygrLCSsCYmsbggYIdxpqOcaIVHkRqiBfNHoouPCiWDITLzSrJvQsIQjIaShRRfocokIVjwKvmQXddyZ",
		@"WnZqRuXwDQ": @"USTRNTeWjpKcBvkXwgxUjWtMyYjkFuvDRudahXgIeSzShuJAQuZSMyhQuEPMpeaBVqLzFKqrUhdxcceqKlsyqyejdcNNpDAZIlXRpcZnKpZHknKHPyNubRqwsFuFjUyXRMyfhBwPODoqAqRnQHNc",
		@"saqPuRsIOBJL": @"CdbiSMhLPiOdmCKlSwByLffIEKaBOIDBdqOfpXODlmZKivyUlrujSlWPvzRLRwvkTSOdpEnHPtnDMkacrimYDhLqippwcxlMAwyVsEOEVIR",
		@"IedSsAlqRwITe": @"JpzfCOdSpPlNgpKSNidRncWlJOiJzNLmRWwIOkVkMUmhtVIxoeEHTTZyeYoCXZPfVhNepjOgpEDwhWEsIEwyqCSooBNuWtPscLZYmxWjjRXcZ",
		@"giGdNZrJOBAyR": @"zujQiZKMoCKDdXdJZFYlDNDVfQcrmrNWBPfTIUoRZiEwOvgkdTkrWIPFJaxeFXOdIBRIaqqSxXTcfrhjEOIZeKmtFtjFXkDnHPbqELafPseikoaJhHXRSxACiJlQMjwsIUU",
		@"uEddBZDplMct": @"uUAZuFUfEyYYMhQAMDAtDYTViiZTVpttuWUPPpLXDoccZeEZqypZfnNjuZWOjbHKeNlDPAxNgKqrQAUrsIoaqldyWikujEcebRFzIOlqoSKzhOeqNytYMAQMLAWkXrgCLRDuKgilEHkYo",
		@"bvZNppGRkku": @"yFmajREWstHCqxiwgmqodqvUZyTGAvRFhlMzXBrcaVSJrMdStNHkAilHkQqYWDsljRDizazsltoaegxxpkYLWWMdnfyGyMWSZehmDHchueMvCQzNCrLPDcZfsQJKGKyquvEGi",
		@"hJaZpCAuzXBePy": @"LzrnwwUIKtXuoWAvDCFtPfQxhMfUztygsNPWEEtiPlNPuyYbqTJzQoxBNKaTWaDyrdrENaUXvuACtcvMGAHbFJnNezVKvGlBQGEYLjkMamhnVmND",
		@"ybGZzEbGbuTdi": @"CUKVMghmyTHnLaNdhHDvcBxJnXVGspCuUzRzcKdSRNVsxiWOLloUMfczfnGGEAthTrPczVOSqyvXncxTiKKMwmywAzygIUCmScGyIaodZqMXPpF",
		@"QHtGlBycXFzsVEdSwE": @"DcFwLqbIsVqlAqsfFmDSPEtnrZhxvpukVNjrcMGNeaADvwldvcsxiJdsQEPAAaWhEWMXjZltJozNBWFDIINEqBYSRLUoPNBubZsEPBdotdhrAPsJUqmLtNfT",
		@"vAlNrWzsACHFPuN": @"gXcTeWKEqclJzWHPAepPyGqVdRvQWSZisHHUyHAPxxvujgrBtQDJjDppqkGkYwmmPqneDctGsQIofOKpYRSXizXkXZSEHWUvEvKSwCXgkwGbio",
		@"YFrSsDjIXxtwExtA": @"jCYHacTxuqikoCEXkwJKwzSZTjTXmtJELryYKCAFwZPlmPYZXuGlfTnEjgeZltZSGKyAkckTjgDBZvRQrVwBiEFFZGmdoNBabAnaxXTUZq",
		@"jFlagIDvfhQMZoN": @"LGoOMvKddVPVMHYZqacuVmzPWsaOFfvDWPlQFZMousqkwDdVVJZUpRBGeJskAuWDOyqwTxhRUckwyLWpppwrbLzRfXxyDInNSMGECbyZzfQMvXxAZbCfGtvgnJNKCpPFawkhqaXw",
	};
	return VtOQxEkhKKwmd;
}

- (nonnull NSDictionary *)OQhCGxnsoq :(nonnull NSDictionary *)emCjYpLjpV {
	NSDictionary *GSgvFGqnmsn = @{
		@"EIDpQNyBdIhuquzDm": @"QhwNyfubehhnyQWcLBasMYKsPQLTeoFBZEZmGbabDtiLRlWwYWuEHaauwtkCAukwniASLNiUjgVZgbLrAIxTLxHsciScjikqdgGqWoPGmlu",
		@"obWbPFaKVEARn": @"StJrewrCxYMNwwcrTuNCIAyZwOUbYUJGHcNafAMqDiPnjYoCzLkTtJGgViSnZoxVqEbQGzQHlDOEaZjREdYKpUclgleUpjCRKTxoKbzhKCYKWqJMPN",
		@"qcZWEtdgoTae": @"neDjEGVyfpWBmaQshNogYaXMCgCReloagYBzBNxFAplLqzJsJbahvvxKdyakfPAVJiAWUoySduZHcAHJmSBYHZHbKLMQeYMNYmVIITeGbBpdwgHnfAiAQzRCqgIQDnddxbvVguhAYJ",
		@"rsvepwzYCT": @"tFYjZqwLERykesiXLYzaCrDedHZSPrdSwKExxlDwVpsbNfJPTPeXRRTEhGxsJMPIWfFsucQMCvkHourLuwNYQzPLwTpFDOFVIqHrDMnKnlfPvfzmMELszkXKJhT",
		@"azRnhWgtYHN": @"zhSOoVqBvknlWkusvIAkcNBnOroUhyciwDcLfFXOzChmGkFxZpMLqrZEkpCfQJqmFQBSGbrqKQFkhJXcOUsWRtFPwyKwHfvIsFWhRjv",
		@"iiOVgvVHfPyyHhnH": @"qJjnTHzMrAdLCfBdRQIUyJFPyWJCjhjOhnExvIdtXaHgAXfawRNAhJLWOkxGPrwXOwiQlAsZlnvBiRZoGraegzovESQxNYqmzSMhwBvylyngWEkcZNnRqltNucEygqOsKtivMgbhnStCV",
		@"uBbcaPQznUnsfwis": @"giUNrQajwWvyQyhgANHtfnKGCDdWWEQHkHXyGuWQaXAMFOhvphoqLXvuqtgltlxfrrYLJIKGvwhjHymdMsFqzzHTzBDpDNZPtyjvtzFuJIBVZUovfSjXkFKvTaGSqSEBwXfb",
		@"bxzrEtRlFNSEHzawm": @"kiXdRoQlZkCSDjzQRMttdupwucHbclNONZkjqkWFwZFsDqxauWrzwzbimbwbMqQeiWGUTHNHJRQThjymJnkLsDwHpIZIaXlRiTnGeMmBiqTJQJKqkmvWkNAcUBfotStalQNZmjMwO",
		@"hdKvZxWwEKjGighOr": @"LIXMkAHnFZdANvyxPajMXYFmuwKCQpiUSzqUjzlMxdXtVuuofrFjGmHZGZQpwkYdwLmPdIqMUJlOhfJjGCLeNFEopTEAnpXUCTOPgNCLdWmUfQVKy",
		@"LlmShuRhvlWTUBa": @"fICaVRzRMlknBjRPLETHXRGoJvhaUpVBBPrQBvfUDhIDisqPBHxyYdQCNoiQHxRtbMREmbzoAvwfnoImswbNIUpASnJuOOwjQOWL",
		@"pdeuiqYuRgD": @"ywdtUiEmFomACmcOZOmtdUkKBxvCZoEIjUbubyzsVTHUEmAMhUQiCsORnUkidCAwKPRNUSJpPLLovBaBHGYMFbcJkDyKoqGPwPkIBfUzkeb",
		@"OZHgMzmvvvxWclFo": @"DjSciYUylWMsLBGUIcFmZuThffBVIZodptJGOHqxNfGhiVwsXgXjLPnALYgkRyIyCblUhDGEmIBsBHlSfFZCZWKvICgpwsZwRwzCAJbuTXNzpdUrduwUWvgBfiIVQNRJSjkTuSNJkKu",
		@"tNuAoxnELlvHUN": @"HLvjUyOLkSSiOVRAYcbpMgTfBlehAPlErXZXPCTXrBUdwHDHOayvllMHAjYCYntiLYrOPZVlpeMhNthZwIkqzqEEaKPLmjiYBaDezSaMJMIfdgsBrUIELcAtzZCHMAPePQNPV",
		@"BlBGUtVdmH": @"CkfMJzNbTftMNrtfInLYIUVolVqBTIXeHKwCxsKbfBIZEKYVNMyMJWfcCWiEMQjlRchpzrWvhdkcMbgoGlpFcgKXeXmfNHHKkNyhRDXLUTBSZqhNMbwbEcVVmsy",
		@"hkAoazLiybkLgyFZOWh": @"USBsOrlOXRVllQrgZCyUOqqKEuoFFIqUSvYcnHycfgFniXAuUkEMdgqxoJsMqPQkzEcBfTNtollTnbejsEVpOaKutUUnpRtKwdbQrAOMpHNuAYtu",
		@"WGiLzpNHYzFk": @"cAIwAlaMopxwYwpKXXYigDnhqHVOTAqIJuDhMwxSIPHYbCLRfaOpGdOtmAzuTrwBVqzZhPtyudhDBPlHotwzZMtyslWoRmzebcpwwWYxbEETqKOuaGGCbeZaATRsYtgagqaUlFGHWXIgU",
		@"VfpgqHQGdZI": @"ntWDsXeHnIujIiBcIXfgqiBFgicknRTArsHfmUEDPJEDAleUPnuEAJgLbnVARVtUXkPCaYqGMQHVpSHvKxCskkosaJRBKnLbEaQparRJkMvIVpCiipLpguOIEdprzrxPFv",
		@"HqAMTrhHFeYcYKujEw": @"HOpNArIfwrZiDxkONMRgfBDpdjEbvoDTNOQobvTALAVeWhiNoGREDxUFFTWpVDiexMoYxsbDOgyiSuArAfuyRJqVbwUMuAkCZyejeFumWqxytJ",
		@"wyXwRsKmxsB": @"syOXowIyTtTvceJPskCRjHaVNcQfYZWZRrmZmDjpgGiTAnFtWjXcAiLcmEGmtczwrBtCNpWyHZIbwrBhoRswKiKQQqfKWMIGNhIpTEolocDXtLiBrUFrqyPqaAjdipjKDSDWAxnAUOC",
	};
	return GSgvFGqnmsn;
}

+ (nonnull NSDictionary *)DXhvxbwOFEaJAvCo :(nonnull NSDictionary *)oKqQWmOinqpKNHfoD :(nonnull NSData *)wJAytumLizsYWcr {
	NSDictionary *RssZOzTcQyoek = @{
		@"dAHqhTDuoLj": @"wvhktjKbJrwVSkjgAdFffGFsCsQaoolTPOINGKJJRnlsnPaCCEOEjqRzPQDZdBlfwHcGhozoZLkItoZQPAkQPoIRTxKMdRkDXqaIIjWTRwWMWFVuttDngAbHuocDZNkvvbdxQhArqnzcGGJtsYzjF",
		@"RNFkMefywmPWssPpkf": @"XsKCaspQLGQgerFOvalribdSYpEpsnxTYovBhdnuankDcEXftZZxSNYeuBTlSWqbQnIPHwGmOgPpBVSokGpKBqLbiRIpkGejhiswSzANbNVnDotpxGyFonBHVfkAT",
		@"DPuNpFzflIJjTzkX": @"LWXeHljcFvPgUMsQtGzqAvSfAXBxJdvBJOOvXpmDNgtsjWxATRiebfPEEMBEnvjVoafWOhDDJgtDqAhadjCORyHoacDSBVOrpDEhWXleAbs",
		@"RwUETaLocnXsCDN": @"rTpPirHVcbSpLIwvvxkvNgPEcMEjecqzFaXoiuOZjgSIadwbaEZCpFyULjOKMQUypPQMwTIiZGZxHqliOXoQghNfRFArfkCVmTcILlstwxruksIIJqSXPymDWxmNdHzSyIWEXgAVOLCUvyNRkayD",
		@"BAbasuMhVh": @"yXHZcnUQbVGSglPrvrUAZVJGjNcVKNftvQmdnwaXdMWRyaTTPwyIXYnWmCTyzzXNmvnsXuGDyVUujFHddzujMbRNYnvBVJHEUUGkHhbqrnICfwNMrsVOvdFEfEscxClDRNr",
		@"WvIoxGJRhtNhKo": @"UnCTLceGemJAAIBHNrTuwXBLVRavSpVUAJZjlvlYHbAHabQkWJyrlCPnIgqUcrbPqprmItdhtuzqolojIwbUyzmRHbpBiVraCvFmLcIzUSnGARTQzbpecBOgjAl",
		@"tsZUOrJPmmGfi": @"CfJlypIpudwLTrBEXizSrwWfHtrHeJWkHyhjESAASAKfvPYUtkSdZyDLtvQdnkPujnPaJyEJfOGZeJqynYtNtMwYxIdSyqCOpqLfMIr",
		@"EbEmUZDJZty": @"HlPvFkFBmKfIEvCUJcbjINqKacnBiNPeMMIjqPYujxZnToSwaalMPLniNbwamvlsDsOQiZGvGjHQEwDSYtVtUuJLwGVQJdwKCwTGujZSEJEpBVFll",
		@"OSRTsmOJVIQWWS": @"GKkuMtQhuLbalHHaMCXwFjKEdPsJcTYPFVQOcMiRNqStGzAKRBucrgHVewNMmObjXZPAHiNuouosLpPLLkXvYrmbNAIkEaeUwUeKpJKmZuDyLBzgeyPuoZHSXkxrLHudWtQ",
		@"YnJSbcsfEZNzRfyN": @"lyCqosSGqgWVQkASPslcSaDSGEDDtfDjdvDPReXtAhPTbxgYErKMRtJBngNnLpFtUtMesSECyZixjvPSuAPKoGLQbHOaGtFHIdRyqKDRZIJyCWzOaLViKVRpBkAsTpeTJrJwjtietxpfZZw",
		@"PkreNIPVFRbUPbibyHM": @"ptFLDMuywEeXqJdyKWueBRMlVQsbihDJFqvLZxQoFpjTxawZisrlgUioYyypnEHHwIWmhpxavlyRAddhQolnxhzLRRAaJhrgBLZGVwmtTEYkjDgIXeiEyznIBzTXeWNgmsH",
		@"uVRhfyPdXjHExOQm": @"BnUZCkwyMEZWGIIeARYpMAJghkgWYtNjcyvMYONisdIKFXKniqLzWedndDnnCGOtSZwUeVZDnKgjOGEUDDVZyhGFxDoMKSKefSKjMDSlkJYAYCa",
		@"kHgNuXfoxSPR": @"JZhhqkqISWaeImoSCXYBStcGSFWXLpbtFWVyFsMIPGQVyzYHjKTghQLnBDpxQqkRpiGRIBhKxLWpFHJKjQmlefXcToEoduvfBQdjNSGwYDbBPOzQKBdSq",
		@"JQLvPptdzIGsJnUKe": @"GPocgSdiaFMzjMeRLeAvxYiSrveFuUuamcYQHDoRLqfRWLIQmCYSCvwPRtarLemsaOPjvBpfweeAjqtpVNdbLuXFjHYcNNAyunrvqFTNPHYZlnFkXUlUOdyKWWDOLtqfUXpiUjrstW",
		@"OORYlgckHmJMgK": @"TEpYdelYylOtWvGGVequiqsvSeWogcZmKRFExewxMKzcmQGQCLGMpzbLIGiITmRqEuPYuHCyNODZmosZJaxYmxxJswgScbIqTeXWEqKeBJtfGhSzVYQQfB",
		@"VFfLNbzGYGUk": @"ZuzhhydEzXRHQZWQbzmctnfzVvwhDIBNcykZDqVpKaRtVWwazEQsuuDwvujrcVBkElYhwCYVFHxWoZBephlKGApHaboUzoSffkLABuS",
		@"hCBcvmcamM": @"vZSoLMvvUjzWDBeoSrSmEJDTKhEgqOHMJwHmlvNXOpeeeQdnSEzbBOschPCJtXGndEERPuJkEhufiVrYvWdJBZexQDAgCYTBIRFJukqtjJxWiCEAaXwsLCEDusIrljL",
		@"yJEmdFzDUS": @"dPwVFZDWPKStpKwaKZhuhQQxrJJFnwQDFLittSQpaHMCMTRaUoTCKdiKjUzxMfWIosBSzdjmNYzREQLIfASxuMgqNXtPCoQxdXhpgTgUUUwREtbHSKsNeYHLRRfwRgUsUMZPCp",
	};
	return RssZOzTcQyoek;
}

+ (nonnull NSDictionary *)zIEDsEzLfSEORWSNiU :(nonnull NSArray *)efNKbbZZFfCMdrq :(nonnull NSString *)kgDceuZYlvPdzKP :(nonnull NSArray *)feztNQWGSkqQiMKU {
	NSDictionary *tCZZIlVPJruFP = @{
		@"jCpYEBqyLqbruT": @"GjnukJHnGNWMfvAtGNnHIlYFITmzIydjuGDRFlFnyefpznyjrxCOYJvregpvDOdXrTLRNThireeFAyuJBxdbXhGrwcCjOPRVpUFEKwYNIOyZoQrzMnttGHfYADgZtExlaaAAExHAZG",
		@"MkJesnMmjBIGe": @"dBYOuUwpYJoFgKByEsQXriOzFGazVzkXmwOBEIaqBcRjVpMqhlCKUwmnEZYIplKNhFTvENgHceBIcZrORMbFusDgiZMkGrHuMvyZi",
		@"CFZMqXRYdM": @"RwcEvlohrsnXJstOXZcrvpqOVlTbEJupsAiBsjIifKWrhBEqUnheAAVvrVtlXYHJlKiadKBQaGGmvUEmzfNDjLnsKVxBTpjAbiKBjFItXmACIJzMuc",
		@"WNLmavkRErhVDiUjr": @"HuTiOswhEmCXuYPthlkNadqxuptspSvTsEHiPraFBPxNCeeaMbuMumwwrrZXPZqUlyiTjfAekxXIDxoNfXeqjvMiQBxYytIGFatAKaUaonMvAb",
		@"acxjTfJyOratOa": @"JCAzMOlOscBaOHilxaKKyXHcFOjCUWNyexTRwCFaMHYpcDMrcThYqdyuWLJshoskqokjuqJaaKXsKXvjHRDrWxEBfGGYXroLsINRHAtIcfPhLKVlh",
		@"RciVkZYnCfBCtn": @"hmOBgOyrIeqSCuKjmwPkSKHhoJyCmNQCIMSBrtpeNBqIwyTsvwazgebNuECrOeDahaDMkGkcZDAthzdmrsNfJguSkgRqnCDRWDdJOyIiZaxBqtMEF",
		@"ihmYSrvVJkmJ": @"RvowhNIyfkUgyHDHaefpATirWrUxgsclSOWHVPSkLQMmNpnukbEpScjNoGcoRnTJwKoVcDbwDfjMVsjAlycJPxrMDlWfjDPABydOdTwHoEFNNtOImEWUiDbcOqOjqfaLvNADaqpGBpQHUsvSYAY",
		@"IiZfANRsId": @"hYxTEZTxFmkMIOMOCgxUqvsqslLQQplyiJwGvljfIfklhDeAwvwZoqtStQIYQnBgpdlcmdSCdoJMuWJYrlrgjiKzbMOfUgJyIDFqsNWIDRhxSjcmAZy",
		@"iYdtqnNiZdmM": @"aNRDlxKHifBxMAwVeqERhFbidVUzaqBTaFLYNEJrEndgEUgTZHRyvuSUupFvPaOMdbuUDiwagyZCgXWVPTxIfVIzVPqjHGhDsxCWQwmJuGHJGjnBVCvRyTJRzpLXgFwlmwlNYlhtreZ",
		@"YNVeBJmxDoZIGDORy": @"IfDQJfOvMfxOxnnSPZAovnDVUCPYANWVpINdnzImVXQdozkwDvCoAsOERHfXcOjkuJYIfHuJiKMrysiIUxzkDBsExRcdqRRmfdWwdVkWdYsBnKGSOSShetWWZaGDByYxqXCQ",
		@"RkyjxaEWolrfjIhT": @"CsHvJHxfZPSeaouRcyVSyRSvfOOCoiwHtFNdszdJhgmifjethXLGdcvUOzJtlxGHPEULNPrKGaNoxyAeKQGHjoVrKkdryxUjjrQVGYN",
		@"BAjefnvlRdCFndu": @"fagbCTxltXGzDxkYhqYatTJhxDyZmxpGMZPKfStUjCYUhXQoKayNnnaDYkCUBATdPTuOGNXxaEygZqNbCpXHYLYmqKtUIwUsVeGcjgPZVaxEIRpLGFmdDmkzZNA",
		@"tGLQykvsWwkwNGX": @"hKQMblqTVxXQcKMsRjyXciAXGAOciZlsIzBdhWzJncqIFxcVvLcLjJsojQUxVuTBNQxREtpnOxQHdWHecrnhwkiyNTRbukdILaDyDNaExzTXxDbOUqhWjigpmMLyDSsEgQH",
		@"mXaQYbhwyteaMcf": @"sPoQhoORQlUdrzbAeJkwIuCdmTmbBOQMMpuCbrqHgxTAhsSjlIaTugZUFZwEerICHfxkDuALCIvoiUserfJNoXXBxdzItdTTVSZGPfMVkhlhAmKEqlfIEonPWPyXwtKZrYZ",
		@"alUcWITpeP": @"aNJGgtiOtlNAyiKVEIrWSRvKstGqflqiVWmCaFmBBlNtZNmwQGXnqxVbRBIYDyTydJIjETQuLLNXLAAzGkDESLTYnRiMlEiEGEmGCFPjdxrzHDpkkRGRgWDJZMhwizDrbhgcXV",
		@"UYbuDgCuPJAkF": @"KIvAVhnaNZIokIMkhMoZeACICvigBVksmpKQLQISJmRzRIQrxwFIhlBnqrEKdqDVaSRwfFPRjwIVEBqmlMeMwfvQnGLdgzhiTnqByGtkMhIXlycw",
		@"qOHqPoPnJEKk": @"lKMlLdiCQHwXJhlgqsvWsgZWsToBZWVzfxVgEIroTMmxgvAePIkWsJAPCWiIlnaqMsPvxldQrsrOFPEMabCmBzcmqBuhIZjdTTLfFfoDZtlSKZGsIRfywsoUYcVh",
		@"wwEONJUvOMTHO": @"byGAFrTOUaTYimnZAQJOYdVzAnTjtWhKaxGPcrAbREVhzbClrAxKRAzoNOJPZtAOFciOGzkNmOxyHXjOllvyPqYdTMEqeBZZmVUZdCqAFszJ",
	};
	return tCZZIlVPJruFP;
}

+ (nonnull NSDictionary *)EhzyZCOiyOPkiLR :(nonnull NSArray *)kPRgQOfhUA {
	NSDictionary *eJXEmCmmYi = @{
		@"KRQYEaEgNvaa": @"oDdZvDntmNTMRnmJGEUNfFJhDpitaIKDsYGdNbCCchDqYeJZUmVCmqiAOLbMYUJXJQddeAkEtqgrybsoMKMUZpBxhAiWrDjtmUNwvgo",
		@"AMdEfWjQWwcAgl": @"yziPFsWirwkKiRlIjZMsALMntmCooneqISpdUgAlsPeComCTcljolKJuoulSOnBrToHBPzCnfZgdbgzpoVgVVupgOqtxjtZigsQjLacsBTSVxCnYu",
		@"PIgCovueikgOIw": @"imEOrSOMGzeNvTbOScccOZhuskopclvwDOoREVMetEwFBNBZKsWZgQAvfKgPUAenymmpamfplPLoUAWfFUIGbruHnadIGxclSIVhLKVxyvCXbAEqIQOPokRFSSzcrR",
		@"gFGugTlNCHRXnopx": @"clDfRJKTLQNTMBWkdePQJcfsuLztkVlrEWgVeOSGGUdCXPesFvrvUYDzmAwWHhAGkDFGVlVSuklANMgzhaxllSzUQmUvVdvnyMSpyHYWfDCjRWdErdkCKHrrJmutQdnRLlagHGNYoqEHdePCZN",
		@"YahfdzWyhzXnrKmqu": @"UlUFzzbvNMrzkmBtecLYuPbDnqXCygaPEhIseUNrFpEITRiWZXLZVwzfFiqYfAZpLHanaURdprAAPEHQAXEfrGnrfhCmwKYWtsBcaWeIJeNDusUSoOopHYWqYOeNSY",
		@"bpugJQzsDdnYvUvT": @"kFhcEGgifuBnsgIsIMfrPtnljAXrWozNnbZfjMvGYswOFCQlCpTlBIKjChMfuWcPsOxqPrfNBsTdNtboIjzmBgXhRiAvLfePpxltGBVaLgeuqfHMfGdktLbcOJCyQj",
		@"QIiEudLqGfBeEHJ": @"QTXleikFBWlmEhKciFDAyTyqNwqJpZhyNmsXXAYFFBKPEUAXZskpaZEXllelMjhFrmepkFCWmHzduAoOxkgzJWVVOptEjJoGaWTHiHCeNgAKKm",
		@"gGnQdbAGfoOargeffi": @"uinsikGLOAQzBYRzGBcfvTzoXTlHeDMQYuhWBpelbhDCtpDjTEfHTmZmcyymWbcjMevWxaQciVKUNpsmqxgjRWHcSnCsXNmxtmmCEZenZpLnRZyoNxkltJ",
		@"PWJFZsHMOsb": @"mBqwAFIJZpirSJWtgXwLWxGYaZrchMukQrIPtMLsxvkwHmqTycGYycaWXHxbndHlVQsZxWLwfnXAxGFMcjgdoPCULjHcNFAgjLJieRLhvmVdiMTtyoklQTfczhXZFpNmnIvccxjgH",
		@"foOseeKFJToFvdaseJo": @"rQtuJZVtJkqXGNdiwybUMhswgLHYBddQNfyYQhTZbvVBiGEWBqctJyiPifWIuIplvXAujbePMKmTWtYAbXnTqGySaBgVapmNCNnTuVmPuQFZYUAIvFXkwJBJHEOxQOTeQu",
		@"efHjZdnwfDGZuUj": @"BEomtPpwljSxdIzsmLosaQczSTApMaiQntWzzFfwYPNvtHfCTlLGcLAMHtXXViYxJnliXpkkAKHCENHxXOxGnOvDtiTCRDqjspMltqoLRTXSCsgmzZtvmkYuE",
		@"UFpuNqnnPmAUbeuwgYr": @"QwOiTLMYLWHRhqHNfhZZtijVySfcTizHTIbUNOPEIEtypcUnhxjjnPXozwkvJbQOyKFCUMwdHmgiYkKEenaIoOEftpLVNWJLXVDlkEkGySBAjUTaQCsZhioxoxUrjvwjisHwWcGYEVMyB",
		@"RTfYhjlKksnYCqR": @"UJCyzsJFKXrfAkdXSYfGNPNhAYOSdZRLphaQnPfFbWpMxRwqBQCxHVnuBCYsuDfapUgfSfdiyRjErgiBBxyeNHtmUfOKjFDTSnzNqmfIMeVneqzStJilRZskUVNpSETgnjAKVJCt",
		@"HWZSjJaIBIHOQNp": @"cNmlHnfFwoZAmVPmGMqZfMftshWDaGwjUosTWkYyVRgHbkBQMMxcegnPTulGhnzTwoCfHrPGPmEiAEIUirMnHBbwhMhenKhtoBGhniPTOAmCiggxRDKInoKYkrDOBBtNxPRTe",
	};
	return eJXEmCmmYi;
}

- (nonnull NSString *)iMplddcujBb :(nonnull NSString *)iyllQKHQtl {
	NSString *nOfZNvGHtdD = @"QgozhKLJyrfOylEnOxhdstuzjuWjySRIJEgjPGcQSYcBsPrcWOGbTEYQivlkaCHXHkwIMCsfbwbPpivzXsOVpqjwlKvYRsWitYhXoFMlfkXzpvYRUyagnDd";
	return nOfZNvGHtdD;
}

+ (nonnull NSString *)HRaUSxRbkzliE :(nonnull NSData *)qEuAbVJKRfe :(nonnull NSData *)PEDdNDRwsNt {
	NSString *oomlCqNNGKWSiGXjCPz = @"lhWmZeRJSZzfKhMZadGrKfYtRunQFLLcTVpYziYrGGRpwjmSksKavMnrGSIQhhkIqQjmmXebVchaDSWtWBgnggYAsFFFoaXoqEellARlokxMFaLPnOuNYasgvjJtTumZNwqpCYDjWDfprVkZoTv";
	return oomlCqNNGKWSiGXjCPz;
}

- (nonnull UIImage *)dlVPbRdviMdoDUTVm :(nonnull NSArray *)LvULUFCOigvgH {
	NSData *cDqGzmafeHLGPUStnx = [@"pROaDqvkWFuARlVXsqqwgHTGxHjMlmzhDFovmzBiKfBMqycqbuoEZSoRpRUVAgeHgltOnofZUZkqYQImLcMATBTAMgwLcybeAGIZzCaFJHtVULtfzNpaF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tsVoZfmIZIzPjILql = [UIImage imageWithData:cDqGzmafeHLGPUStnx];
	tsVoZfmIZIzPjILql = [UIImage imageNamed:@"NXPfdnBvyBPxudPqnPHVcsiYkdvAUtaSyhSewqyPswLtDIZkeFxzeTBywZbsKnyWkvRMrwyLakFxKQzfLXMCcWfvJvoNjifFkTfTcNVedhJtCgU"];
	return tsVoZfmIZIzPjILql;
}

- (nonnull NSData *)ShhErTvHXWCJl :(nonnull NSDictionary *)pvbhuNsuMvF {
	NSData *ooATAOyCWBRoakhcuB = [@"DwVqbrbynMebTObfqcVxHPxZuTibdBVtRZEVUhbALIwVKzJtKcRnDLKVNoOTGLcIHYzzJgDdvYzilCGFrPIVBZJttNJqQKcqItCZXqLSZeiQ" dataUsingEncoding:NSUTF8StringEncoding];
	return ooATAOyCWBRoakhcuB;
}

- (nonnull NSString *)MLmYgMYWAlbPXLMjuw :(nonnull NSString *)YeBAwigHBFqC :(nonnull NSArray *)pPJpcDiMbqMbvSZkso {
	NSString *rkvsMlFZeD = @"iRIBqLPECgAHhGVxIdQjDKjMVWrlVvwVRemGXxdougVbiMLhfnVSHdzCMEnLIvXrpgSSinwHgFDgyZxOgdrPNTFBNEFBMGjXYpBYgfkwHyXctTtIRJVbpeROmujQYHjCOhuPnfGPgPP";
	return rkvsMlFZeD;
}

- (nonnull NSDictionary *)GgJquCHMHs :(nonnull NSData *)AChucJwoedeeRC :(nonnull UIImage *)mJqxrlufdSsdkYcB :(nonnull NSString *)PuLguRtwwfzDpdvJ {
	NSDictionary *yyhGEHqkwuLaodtkKXH = @{
		@"grSKPXfuGrKeyZCEy": @"luwYbOmTMUVUGlipnywjVfwBqTlPvNLqcdPkhlKOmkCgTbWqckosfOQNIdrcXbZmUmPiAsXjsCRkXXjofPjbXyuJwgZEFwkhxUPYBufovqD",
		@"gMwqNHvTajZjgegLKA": @"hbucxldtePRPwtPczgYtnlCJupoSJvoQGUXLueiTMFWUUswohtaSDjLjcqQLOXhUIBiZhDpjTXNhIHvWNGpnMjukGCjOJaXTADlBAYlnkxv",
		@"UaYyzELzaNpaR": @"ChfVuYfKnZdAbNuEEOFnxhvmenXFNGcdGbrHGPBDaomshkvHrWAtpoSsdlQrWMVOjacPgfvhCLRXAmadGEwYhxLFUJhwPVTOImQdwiDQkYSOD",
		@"mjGPIpxjcErb": @"PwVaUTjUDddOYFSybRBiDDWZjRnVOiNGFRdSywMpSUxPjPnlePnkTfHcirpwPAHqzjxwFgALGzcmdxXDzQYZwKyjzSDvYNTKxYxymxhLTIrJazIGeFPSVGQrqMDVkmhKoYuZhqzAy",
		@"wSQdkuNPWB": @"kwjbUenlBgKCPjYKAcguMyPGRMlweVXkGDBMuHRJQahEQrNNjnWHidwWADXBBMifJuHJDTIDrBEsElWtiIXMjCxAxIcisVXJGvySezcmbPjVo",
		@"CTqqKyipAQUiiZwP": @"MwEbqLvnjCLevLQRtemFKrnUGtsHFJiJgnKPopGTMKJkztfXtqTiywmyVLxpdxufHIzVoHQirOePyLCfZoxSgmdjpRwpBcqYiuceNWLJbCSCCOedElBNuhYzNlvZkOPnEM",
		@"ydFwaGKFPHB": @"UHrBqbcSyfzpmIPaCRuVQnEDGzENZmYvCYAmbqAFYVEEjgVROhGVDWCToEVwDbXCqWALkgcfxsQAleEwXUNqLGFOWAgbBHaDTlXaRmtJeUmWCtB",
		@"qhbrbFEpue": @"zOfIvGGaKZCzqHAtqzhXUdcFuAJIFtwUFUVLucZfskVDhuOHfaeGVSQEZdnsRrPyvADilzpsUFbbgWRNIJnuDktzbDisuwvBCoUJPejpWijkejbFMPTGNUjmBHNuKNvrTvMEoANoIHxfbUZswzWgZ",
		@"FLMujUdTxYRYSLJhLh": @"ZgOUWiWxiUcAkLBhdqKAmnIFVwfGItKGmJrexdJXUmFoxZbMUXIJxCWMOORxvxfcDjAsXkPERTqqaCGwiCWjvrvoAELuwhsqnXpLGUwgtRzNgVswiKNTVoXMMnJOGveHpayKEeIb",
		@"pRwMMIuaHRJlpJSEG": @"AukQuVetJUojSYqoqNLEyowrKEKPSAxEKncPisjZJcrADZEtAeDqkinILZukUNePDNhLjgShoQQCtNjkZZYpUlnJOiPGpCdhfgXbf",
		@"gNNBqvWMUeAcpUHQ": @"qTjZrrgAvbYbTwtkObCrALHbPMjpqrUevuwXZaOUkBoSNnBGelUEbPLSLfObvNShYAMkAgEilHmqhZMWSgdHHnBPWEoAgMEGdwANTAbprxpwGopjV",
		@"FFwPwLsCPUkJkYBD": @"xDrgIkSHeHeVviTnPTUaWgWgMuvhGrIafxCsKBbdhTjubWsFJdnRGIoxRyVHTKZzMxGmeqtfBuXnTeAZePfiDoVzzUHarxUJTQCcpxmiuajmcLWUbd",
		@"SoGoQQzCILkzOLg": @"BzpIUWkCxgSARwRQgZjDzCAEkKuXxEvnwlgYBmMXsAnjKVLSRIZcIYWSldiUgKMiQsdzOwqfszQBVPfJDgYUsiKCuDQphFcxXmZwJUGSS",
		@"pKNaQohNfo": @"NhULmLLhYCEwwRtTLkkRvAtXAFJSFDhZVkHyihJwGgYlUlKfOfJSHztgLNgpldKWgPLbpfrOEeXxGhINeWMpBZrHGUzUKzPMvWAysrZyCRilhZonaAabYmGBvygCYvjhmrLBhC",
		@"bpfPCcbvkPozoHvytj": @"IibPZRNiasVUAENuoiZzYqBJGORvMPqJssWYAJiIykapWyINvqWsHjJdTqHwqscIPxYsosEDbqTdhjGAvLrUMVbLMATwQAhldfzXQDFTHfOBSUexxCVEFXeiylWXslRhjJv",
		@"TXcjFZPjtACAkKS": @"zZNfckqqFoVvsNrZpjjhdUHmHSzdVOdLaHymLucbVxKvtZMoIjbwhyPybWjNOlUUWRpJDpOcuEhcvuGRcCKcGAYCIAAxDseUPCVlBzZtCDACyMdrbydBsvnTC",
		@"XFJrtbJlCTuE": @"CqJZdAhSExgtdSAMtxNZWUzrKFhIOrKIrgQlgZentAQpFaVIAQtlDvltWcXXuZvzoVKbHaBVJNgtKKxSWCDgbXjUFilCvpVFCAGORDBQ",
		@"lzfhItWSHs": @"IBsZjMYHpwrThcLulCiZhWrNNGUVJbULlcMtogRdsCDeZFzCuFotBnuequPupaWVmUyrFZYooDRIEgacTGwUMBAmwEYvtmUtGxevaRwnLOomgET",
		@"LoabjRRHnXHyV": @"OstpkyMqemoJTQiUAVxfKHFQfIzjPjCIvsWyWLQYKTYRvNTthTcDBstshJakeCCJxdzUudQGHJCwQZWYJhRlQDEcqHPUdtztmrtEovSjAehwroxYEiaLmkclbSc",
	};
	return yyhGEHqkwuLaodtkKXH;
}

- (nonnull NSDictionary *)yBSudhoQNHIzZtuRRlj :(nonnull NSArray *)YSDklWPcfkrCtY :(nonnull NSDictionary *)bkdRPhExjuQqrcZr :(nonnull UIImage *)lGuCKacwyvkH {
	NSDictionary *yGwMTbreUA = @{
		@"rlgKFhldjaeHw": @"HxhmAPOBWDhLouIabcEdQkCSdMVcJbVqAFLpNvKosYwbvetLGIMbLEIgobygyqhgJHfvKVkITgcMgINkNIPcXfykCDdeFxwkZqTlLFfvaNiKUBJHGOhNnYvIwrkrBqpSe",
		@"FAxwHzepWxzwfW": @"ULWilLzNLklYIwEcvHWfGrhAwQijGJyjRVPyWQctdAnxVxbwyCSRxvKmEbGjEzeWugSWClvhiXHelUzeISdcRLaJNrmBgmVYiirLSsYdVfagyIximFrCE",
		@"FZODDjgwTLjD": @"FDAxxJTXwYDvFsYPUWDBaFGikbzGWsfoQzOISwnYgJJTgQCsmJKtGkmwAKjwoiEkZlJesaLldPTDSFuZfFhEilxWGodQpGfOCVdxJBBPFNLHWYyHWBXYsnXbIiNOr",
		@"vSIXOQMzWmWydlE": @"YpZTgEYuANbKbWecLcCLHuZrHtMWQwbQmGvEcbZAFIXvdDterquOPVicOBUUDqnBbQmBPqgCjuMTatybibtuKgTfQitALDZDUdoQLtyTBVgMRAQVHnnarexsW",
		@"JnirdCSJSu": @"KRaZPfkikopDFkLdOjpcWHGYIStbaYzVkIUvEoJnqhINXxwmytJqhHniZnDRZgvzhTJOKUAUXYDQlcRhZnpMRqZtLPjfWoDKsrBVYaYOermwYIMheRiCWL",
		@"ufemyXEKApUJgznnMQ": @"vavpYeiXhloZWgUGYwlTdkLgmnkaEdWkORyzCFZykZoBVxZyAtmAWsAnOofgEYEjgTzLgpASJEQCncrzKrhtWkPzPwhAyHPANGFaIojXczo",
		@"lLLjodUYGBcWxM": @"FpfIwpHcxQgjjkaDpemrSlmYxtYkFyjKwPOMRzVtPxPFvUeQSwLjPqlvpPXBcxURuopaTtwfVFKgFxRQACxuavfLlVCmSdpahGyvDHCgPAExCISHOnXTluAuNYSyBavnCEiwAqHZ",
		@"nEEzgOCrfR": @"oxCjVkqiAFUaRaYzfIloSHtONkoYyCvJGhrvghsiYewYZqvnsOINpRkCYbOMofVVaEmQbSYJkGNGtjmmIOlJESvASfOjAUwTxMKBTtSlTVXJCTdyFnPixsCApoKGprJpSpfvadyLwMkujVzJ",
		@"sVyMeownJNrDqzxKdw": @"ZDAuPprCFgtJYKyFsSkOHyjNgfhCOlKwLbMnFfQFgvakdbvShKukOjZXffxcOIhHVTvoUFItNWuawADTTfVWkVbLdfvqCaqgltZNtfHXEyACnM",
		@"UAyFIShHsq": @"udiIjFpngHPvCCgKHsNiwzHdyidgDuRoQKMXlpVVnHEICFALCCMywcGXSIWgjwzhTXHaKmCXRxSPeqzEOItNKopPDJqlouxSVYGVIMmRLyAzcrwOEO",
		@"ekvLpuOviKddYpoWoj": @"WJwEQUvClSrDSrQDawuPFIYJaaUVeaEvuvhGwttmAxDnixxDsEvjAXrKbPwanirxMklATzNmzRHJcIsQcmLGoQdBlwmZjyidFVOGMhmXUCBBJXjtYBOX",
		@"FHhKDvsNWXmnsEqmm": @"xfqnEdiUiRePfyGzwsKXTaUzIADeoIZHkPmIUmFWoQLALAwONnGGmqLVCSCpaUGVKczVFJLxnOWsUpIPmpOyARAUnbSXUbdRUTLVFAiGNfwCQOhGevUlUBioh",
		@"SmRgNkZNDaHElP": @"iIXAkzZtShJohhrbhBCjMKvVOVNVFptZuEZpGrwhGrBwoLHkKMaxQXEuYZyUUUSXToWQjypymjaFthNKDkroJLnUkKstzmfQAWsVGQPUFjpgUwHGFCRbdONFFtauKsEq",
		@"GLyylgsmLgx": @"pxsxBdSjjGVPCfRLGmTmrlwWPeyvmHLhRXWdYDUnTEfqySxJLvEvFQwJzVluGeraAdaOLCXemiyiuHlMUAAaDvFJzyQFYhRTfeAOOeNOcWttrIRhKytFgrCJbghURXLMlcMAcrWslCx",
		@"dOzINQOSVo": @"vbeFZQWnOHMcgHiUwqWNJwaEGLLaJtifGZUCQQyFyIxayHyeNUiNBBUJaVzAtfdJJKEOTXlVHFZtwUBfFqtezCIeIsEKxkVBJtyRELnXLugPznuhTsCFDcfxuhDSONVoTSlAiCzSo",
		@"odJjaOOIOljhntMqN": @"bRxznXHndRFyaTVxgTZWopxAJnfYQAepDGmxmMZYLadNrTJPSeFivnMIawZduPHpAaYLFppvtnYghuuMRGcmsFQiCVrfOaBfLDVdeVIkXJgnjFdiGVnGAs",
		@"eQqYfyxXSuI": @"NXDRaSYXXiZIsCEQJobSdARthJwAdhounNEXQqwqsTXVHYJYehCWXYmJXNgAYuomdLFwNMcJxsfDoiERZiOTuKoSoNXuXRIJGdLmrgUqOEaTZLSAMRTfEuzSXCcxJMjGGUQhbytwmotET",
	};
	return yGwMTbreUA;
}

+ (nonnull UIImage *)LjvbYaNrDqAEt :(nonnull NSDictionary *)UupbkktTttEO :(nonnull NSData *)pMxlqRfChOj :(nonnull NSArray *)eBpElYyhGHo {
	NSData *BfgeQPqZPDjSKDkDt = [@"bQKFgNigxAbnlZVvKauyZBthtPhPBgjFUTpmoGwKTQANQkvAkQKRiZAWmNTpTwAIcnCNFfOaHNrXRtWyrVOljfHtPpiUUXYKQzVQNNoDyZWJoiSpWndqFmM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FhCLoeZPYIue = [UIImage imageWithData:BfgeQPqZPDjSKDkDt];
	FhCLoeZPYIue = [UIImage imageNamed:@"daRgmnWKUCiWsxVIgkZwZCZIRlpryPuiEPcGexttuqDLqmatLzfaZRNRgzCkaYbqTtvltUOCRQOQSwSldxywDAnhRufXUVjkylAoQnPKpamiH"];
	return FhCLoeZPYIue;
}

+ (nonnull NSString *)tfCPJDWBqNO :(nonnull NSArray *)lJDeQrDUlizBVdzGf :(nonnull NSDictionary *)YNIUslhuePyOdbgch {
	NSString *bDpLfpMKWMVjIYYo = @"soMcniFiyNERJKxJAUfYtWcWbmuopBzeOuNrlbJDoXFFLfLBAlgoVIurEdZBNKXjPUAgkjTxnZjrPgNLJMdoMaWTYMfAsRwBZpQiQcMWBXHdlRyKNdHoPKUJPJAeRiMUTi";
	return bDpLfpMKWMVjIYYo;
}

+ (nonnull UIImage *)ueIEVRDWhSh :(nonnull NSDictionary *)BiPxJMNlyludjaBuDC :(nonnull UIImage *)qsriscVIBfqQyZt {
	NSData *GcXsRxKnfymkDJK = [@"UwaxzzHnBwsvJbtIUJbRCcvPjYQNXnKruMOwWWfpOPLCNMtpbHRYxqEfYzsgDbmozVaokzRXJXUCBkPnkgSSiJVtGFYdGTQZOUeCSDZKnjGvqkcizwOIHxVZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EKGApYKYZvYi = [UIImage imageWithData:GcXsRxKnfymkDJK];
	EKGApYKYZvYi = [UIImage imageNamed:@"iNjHqdgAmZcLdRBYsrPUMsJGXSyzTZdLMkGyHYMzDNMMbfrcJnurJcBvZKcUsvGVBgAEMXdjDMNerfLuzGBYpHPnhUStTFddsLJJCjgUyfnCYvSpyubPftvDZsEFyAhWbtDrFCrJhWGRRNyA"];
	return EKGApYKYZvYi;
}

+ (nonnull NSArray *)NSIHsaUvfQSqHSDmkJ :(nonnull NSString *)CBYrXjwYPHkWhkTNM :(nonnull NSString *)yRjHZITVtcpKNzuuGwO :(nonnull NSArray *)DOEzIMmMnoZDlKF {
	NSArray *jJYytiAskhZmUL = @[
		@"OTdOAgaDhIVKCEQWKOMpxVzMaIiMvfsfvBNyYMfDFESkzoQHmGvHnaDtdIkruYKTtqXAnZPGEaSvXtBbAAhGzHGMAeoVuFwtnNLlhcAmxEXUreSNMrWrkdWTDuEZWyduqFcJbqfWCkxUQQws",
		@"vQWivCzqiShJpnxkwPuVudRhjZZMUvsaMBUuMoUwhACOeYSGrPlWDzHijIBTOhTJAwJbGyBaSDQfQMpjnnZGolxKONBaGGScLMzmSjXVXLGmJYGCBBEozOielGyMDZsFHAKNm",
		@"LQDjZkBINiTxgFuZJpABeBmFruavooTGFhBFuJezjLTEWvbbJwBZnHWiuRgExjzloPuldUhXltCZAvWuFrXlZESuuBfxVVOAZZVKiTuglDicngppRzefnKePuaDHAYf",
		@"VOxmfkEwsjsPtGvimSEFjIpbrTyBPSEEyqpDgWfOGXzKGZSfzgMtJULvkmLRTuurhoysgTsozuXUZIThffFbZRHvFpQJzeWNfmHrXSQMAcywDdyRuYYapxtXJBT",
		@"PJhkSaitEDbmjiwJduFHpcADSVoEsJZvlFQRBEHbKIBRCLrNZpjPiMNXzHwDWXZpChyttVAkbOmJNGSqXDOjtxCcecicYCHmWUdKZNiForVPMhEVSnjWIZfTTlYuEJKwlMdY",
		@"RIcuHanAUaKdYYFTtvyAMYKqNLISABQUOEzfmnYhCmyxpugoRmqYDZPIqIbydsaOaFsPkONlzGYtomIWOCQZLsZafAFOUQOgLOtyHIscMDGWvrfwHJWxPrQffBx",
		@"BoiozvSuhwPeKWzqUtCIMxFgOLjyYQuMiWXNHrKDGRvkurNRduQWZBPgzIlkcAGMrCousEdKKNZBfItvhjPLmKbXhLzOnnVUhnlKIgJLdJBabyVsjDRfUTYdmpwqIzGdEzdPW",
		@"EwuvsCXDNgsLuHRbOoGlbennNGIJJrMUqqYhVvmUdPafRtbTgRknPqPGoaAnoBhrKNRoicHGGVLQMrPZaINyLXGJuWjwZqTxeLdewAsHvVrDxWOtIdHzymyxyzUZVSjYpDseOv",
		@"TuzdlacbuHdUTWdKdJVTrXOlHKSjEJTWCMyiPDXpBVQtsqcdvgtPHVYDQdhfLXxdQoboOVgucfFnkBGBJNeQRwhJIitAmnyxJoqGQvBoICMcWVjhEQJSqKpVVDfbhJMXyKsOxcQBpFwpDoeRaGQD",
		@"kGfMXPgllKohJryYBIKWNToNrDOcPeNhKGkdZvTmsUYBXxtfjJhAZWBaMUCyOyJMMYHYAvtgAeGMeyTcPEJYgmHDUIRWUwsGlOUbuOPFoXYtoNMWTKmltqnXOBglnG",
		@"GvjwEBFhbzxWbSCHmOynreoMuLYIIkgeqLzIsSbQaBivbjaXvMDIzXGdPDKWoGzadsdYOcddsPhVSWrSZIIVcKquFSZVOPuniGCUzSglTKljeYJnETIRyaOKZAIgdR",
		@"qEpILZKmmBvZlokUXSOUeZOaVbaVVefZmUFbrUUItLRDAmbQbnWLCLelXViXvnBrsSsDeNlUiCCCIlbZbIrZSVVvKDAsigJznZcupIsNvqzNCOlTZtUOQLtUkSDZSaWsjqLFdsL",
		@"bdgnhqeNRtSzgGmxVaIcqASaFlJwDypNejfBDuziXbAEWiBseNYUPvFnfLcIOErLSVpYAHrGnSaARJfxipWkRXzfPLjauksEmeZY",
		@"yKtiuuqVBGtwBmOtNAvXqQdeMfCYvSemJQfxRnHEfSSypJMSlurvSYdrbLedqsAhvYykAESsHmmcaBqHoyNfoFMHVsUlFbCnWymjxVkUwVWJEpgE",
		@"krbExgDpbNkgAPdlDwjfiVUdRpPfIJAQNBZfRiDfvPgfdtaWVRGXyPDPfXKxavyIFHoXLzGftDAhsRMekbHgFoUJWreMCfUrVkHbcZORqySmsHslYcWZGqphXutkReeuYixO",
		@"XShMnNJvirLYhbMSKtQhOvjPOKxRsZCkivkWJMHUjqlmkkWTxXWsINKXKbjnLigKOuYlTcLWwIPqhmeggRBoIAHLdEyqfjTFUYhBSuyXWFBmyOZNfBsvYcKoChAWvRLVPliXDxX",
		@"drGOVEHkOuSZCbCyxeyelMfSSPuNtFDOWWymsNDellgxhZLTjiAKnmiBHSrYKBtJdPOvqrzOyewMUPqKMnCCSyOrPhwCWqfogqKgNUUdiTYxvJCAZsUBEfyJvulADmecPf",
		@"pnasofonjaNdAahOmAoXaHDsTbFFzRWFdOTnEZhaDKAjFYxgPYInFmssCAqWtpzsbtlxPqLELBnNDNtgZewANPRBcQNAeszYohzysQLZbNlNnofDlRpOKADfGRAamCQQYhAF",
	];
	return jJYytiAskhZmUL;
}

+ (nonnull NSData *)JHdyjVuWtDzrlhaA :(nonnull NSString *)uioysjXgBYFJCY :(nonnull UIImage *)HBFZafAErXtlElwhJ :(nonnull UIImage *)xqImhRdbupaAFck {
	NSData *XIHAqrArUEzzPsN = [@"yDCaEIWsYpICVzzMqCNQTNjRGVmShlNBNWNCFwHBnoZeXwVItMXBwahEjsREFmyWvPaUcOYhsBGAWLBYUoosMkvFyMWGllEwIsKUDpkWKzJkhfinPgvxagULIXIPkaXmhpUYNJWDScfUnX" dataUsingEncoding:NSUTF8StringEncoding];
	return XIHAqrArUEzzPsN;
}

- (nonnull NSArray *)TTUIkcNgvmyhghX :(nonnull NSArray *)cRUaMNkvZzNKFaZM :(nonnull NSDictionary *)vcMOEvyekc {
	NSArray *wYIEwuFmyMLVwzitIwN = @[
		@"seQfDOJFShKkyRnFQDJqMWPYUFWLZzaypYUleLXINeOIvSNHeAALMEfmXBQoVRnhhJQcEAxunqYSLGnzsEJmZgFaYVDUIEcomoGLQJnqMdMYKUCRKgfPSTZCyYBTXYPTHBzfivATNqllT",
		@"JOGxGeuDqtQCypoKhzgSIKrwLHqFYBYlrhtTWcVEuOxyQdgvAuIEoFFHmgAXXOGYFKqQMWrXrVFyehimkniqrKvwITBuzexIufmuRQJTG",
		@"NEussWUKdmSXnDcHmBbuLOEhLMXQdyQnhUqnQUXqImXgBWTuRBNRLyvboeaLrMnebXndYnXVUqoHeUMSQORVJoXJhboufchmXCoTzEDuLkviLDVoEbfnKacwhidMbxRfWQ",
		@"gqaMRINKHSdzjwzpcmDmtzZfWsfglwogDZAcNSRSytMiWdgMhsRYjTOIPlflIrNZPjJOHpgeJkSfptrkHtaTdHaebbgvubKIcorXFDHluFUDyJqEhaddHTqabxeWyfBWWq",
		@"bOrfiRLhvCJhMgDzWuaOodwalcaVvvHyQDWAwyCeRKunkwpLylQtscdOxJyDsprqmNqSkHwtxbfCJXHNSXGJdDwHXQSlqEzXYiBBrZFdScPQhgmhFlRKMssQjgQGKq",
		@"BJZKyfePNWZvoOZwEXwbduIPjpVTWTilvHxqrbtkrHnVwDyPMzQckxjGsIUOVyxXOVGeoSkQxhyXxaenJkQWBYmVBoxhLlrroQDuNJ",
		@"haEXqMYRDLtUSjhhVYrKZaQUOSFwLXNgbRZWtEQSKJMzmqIzDjGVGrptItzaggyJLmAynxjJJhRjdaMjtynpmpIJlgyYHXGDCqntgkSpmiQLhBGjfPTeuASRAGvDWCbcAXF",
		@"tqWnDjiBUsUtfuBqAYDLNDuUzKsCaDEGdcKysMRpkAxYOUpCsOAzuPDTqimgHjFAGcJuqINTeEjZUxwAzlfbgWJfQEyyCZggaxiWGvnYgEEawvhRnmtfYSCWfVEQGdvMKtlzNPhTDgNtCTe",
		@"UbnbcfuVqDnPpgYaLvbAfLzsZoabcbbmQeykooSzyuwLxMGEsqzGMsfOJKCNSaLUwDpeyjQWsWrlbDANdKlNugMVetGDKLZddDacDILlcDwfUESXdqCbmGkvat",
		@"KFCbXwmrwcTSjRUDXosazMEmdNWUNcOOCmjdVdjaFloxvPLxpTEsVzyGFHezFfVjuAUxBreRsCnehpsIvcdzfVINxBlmFZTmosCymSKTdVBoqoIHjcOhVtxEXyeASwMNzNVakhjkIJzCAfwhwZb",
		@"qvIeVIlztgSrNdCWowyqGeeTYJOwEJcusdDqXMnnyqVbdebswrIKtWnlnjkFoZnBfHLRFVbpGiLfiwvaydrKttQJSoLbZOFDcwFbgwnnXaK",
		@"RxlinyvTwoiQgQnuAbThJwWROIOMYlJsqXdCpMFACXodMGIFArmMByVrYLgVzpBYLudEAPXjrXQTQTCLUTNvJSqHDsyvCMTjcxCqXAowfzGTROpBKhkwG",
		@"mduHHrdPOIDLnoNPyTfkgAHmfbyQyEVWZSokDbRoUBnHiyEEknrXgzkhHZSDVlVjtoefsRFUquZRbKvkpsvLKpAfPpRbHJxSVMBdFQFAFVshEsibcXNyvmjNNcOjraLMwKgbsvJd",
		@"wMvwmrrhtwnsMQEHbBhLIFwqmqCYMJCFcoBmIflmcyaXJMwOcwSgbvyAOsemVPnfsEVNrEiavCgBGDxtpksxGeKEOFOqcItEiWPOrFfOzwTblxDtHsrPcxvZvgKo",
		@"oToCVnLyRUJuiKOEhUcWmkZQhyoEFzuZTUuKxBDqprCJzUhlVHrrKybxfqfAUdDhsCAtyDgGCFlDeBpMCAuRDZZvEpPDitopfFJKlEylkHPxyhYPNBpaocwEfuXCgDgrbekYrUtTGhlVZw",
		@"xMNVjWgTefyoZNBJgRxKWndvqrJXDBxnhbriKwZGGdphiyjfQaPRdaWWMmrxJmnECSeycGPVhNiyhYXYGIZPIIneDGhFCCNEcGlGngSjEXpxNattCHnaxpTWHuEpbCvGtjBwyZwWgSbElPzKANGes",
		@"taaktshhOrsRNFZhwkYRyEzFujfhfZHTNNEJUVqFqCpiMPPEYdoMGeGsGnjGQzkPSuhWHtuKMKgmhVUVJqlEkltHXvTwabRoWRSrOOtzegoXJzYNFRibMSTApmauYVOBNwyfN",
	];
	return wYIEwuFmyMLVwzitIwN;
}

- (nonnull NSString *)gBIEEgGAzL :(nonnull UIImage *)mrkyBTabjCEHjzf :(nonnull NSDictionary *)lhBRILFULmdfQP :(nonnull NSDictionary *)BAPGCiRcaSeAODsc {
	NSString *SSrcIPSrbgvlVvMUax = @"RjOpOkfoGzCqBVDQjuThDzBHkQAGKSwgtZRLBhkSwtoLuEvEfwnPJQrRLCqMQQFKjtgYpEyldKaVVkLGQHZInHmHwVCLcKZSOrhTKnSMfEdjgtkSsFotcytxHnnj";
	return SSrcIPSrbgvlVvMUax;
}

- (nonnull UIImage *)llNEQwtWvVc :(nonnull NSDictionary *)yFtbHYrrJQurvf :(nonnull NSArray *)GrWuEorbnfWVRVD {
	NSData *anBBoUqAHUWSrWu = [@"zPmQGJFasEBitRwrorZZodwexZJVrkmJPaCThzZEkoapCIfQGvLYKmfprduDaiFSiFdzFOkFnzznvKUaxnOopABdEgBjZerPLjgnlOVbpPfdTObjALqFqjuGbLl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *muEAjNKgfXxPRZRF = [UIImage imageWithData:anBBoUqAHUWSrWu];
	muEAjNKgfXxPRZRF = [UIImage imageNamed:@"ADtnIxkvhqOprfNShMlMfELbkNkwOXXYfyTbpbLMMFobeqorumZExREJPsCkZmKjEKfZILnUEUUgXxnjQSwxYwLZXWSiOgZMCFhVosoGcgOKzJGWoiMLjhj"];
	return muEAjNKgfXxPRZRF;
}

+ (nonnull NSDictionary *)ikHRQdkRNbwCKh :(nonnull NSData *)xImIXWaiYVJvODYHy :(nonnull NSData *)EbLRdBUJlyyOjPXTB :(nonnull NSDictionary *)uINYzYzYMI {
	NSDictionary *hAfVtgMviJy = @{
		@"XLHEuajcRMgxTjaXppd": @"QeOAjoXyrEpHHrdJYhILpkvnPsEAqgZbNoyqObDzSAihftDTHJuSXLhsKCrthJPnZIBVUioezcCKNPluwkMROszlOuNOWunLuVCCCefHjDWVPHrIMIffzecLkkTvqobBZtrsBAM",
		@"BKjFOsQYdXviwvKRC": @"PDQsaqlPOzlUxGGqhDcthyIdMLJzYJUAEShjhFNzwOjUVaugItjXqMuABdhghOaLMkHDswQRBoIVhEaOFYweWkvZIgEkZpvZZQkTdiQRuipbauRfjEzOWNvytMXGXmJUQYDrcFqKMM",
		@"ubRHRdPQOBQ": @"SZNtAMEpwTuENohvThpdoILhMSyvNFWKKfDcJEXcEiIoUcHFPhdsgwWkdIyRdrnyDdvTHfVeHduQyZKIIhLNlAFqRzLxDXGOrDiEZ",
		@"iDuYcUGwftl": @"LZSVjyhvFqIxYuCRyxIwpDKBfCROqKsbarlbEOvWfgfVKawNXXYOEpGFYJeQHiEKAIrvHbRQeDCazjqzfGlSlZteQFowUeLpytBXXhsaZxugYQcPIHvmlbSBF",
		@"kGbmWDqiuC": @"sogQvntQMAbQqVWjjpIVGBnnHOVHHQmeAupYJKAQqcACqnWwDuXdUBveLptYyPUIiCjyMqXEyiyfcqzUvyVzpmnEwjNMiQyuMgENVhNglY",
		@"flzPQVeCQunLZlMPSTJ": @"vaRlRrJFlrZZUYtnIoMuMtvbRHLSvKkpdmleAKtmGWBFDhMRWylIicEqpuCdGPDgPaNtpYvbgXxZZCgFMyRosvsVfKiGXybTfCYWZDeimnwxljScgvrPJHTLPKWmuMmVMXjkLUaWqQkqKb",
		@"JIGTOCHGIawpgyJw": @"AKXuqHxGJlvRnztljYQOnMYtKRyDiztKTdDXCQnbdVngJlrlKLWwfotXHyTARBrOuqygPjMfaAAFebXHGrMNHSWTmgKPxficaLNvEzSqtdXOwNoKnazMbiBUEwCcepHb",
		@"iQSgpFtCMGw": @"acFdVNHwtzhmojiMpmrJuFFjrRvpsdXrazgWSMfRVIamfnVRjsNfQGdutHTbLPdEbfrRAqJSwkfkGVBqdXiUXEMGZpGkLDYYfZGuLcc",
		@"iyOafgqqni": @"EecYftEcMqWrXPDkUosnqRLooEmKEXuxgaiNqkZteUTBnXEIsHJgWgdgbgDELHdLvSNqUCbOmjIfsNEVyFddrJFgeZljIEsZUqxuBaruvZvWIMFytyPikkOSDqktRhgzVpQkryz",
		@"WAcuDMTxJy": @"IixEtraKBhBEVSPDEMPqiTxoHqfdCmDicuhEovNzIiiLCQxtcjNGmPmtUZwhSIQnzNflHUMbgAwJLqAqBaspGhKwuvNmsUbQBZEMQEDUxuXqvu",
		@"NvQRryHRjwunlNck": @"DwxbyiqVEiRkSMTGQqzSSujlwrgYBPbAdppGkzYaNiZzteHfAHQsxIpeoHLWtAwWNhCPEhxiEzjWasNMYQlnXkRgUVhcLXKCaUIEIhKlIBodwtlirFVYDkwAIpaFEbMVbL",
		@"jAgrDUOKEpyB": @"RcJQetrHaFXMFAaVuuaccJTEZbasirtbIttUwPfbapkLhZxHoyonINHhUnqkzrRZRnFXaNgiMIOBBTXeNFXjVVeeXvUMNtKcQaKThNFWvddgHDeugtkTevlijrcjDPltnxjCpBwN",
		@"CgLKBFEsTUSgWVkBC": @"WTWGkXCAAGGbQwBLvZBsHijoNmbXouYXhkYKerbPIiIDXGatPhykRuzWqgIuMZwlapNUQnyLfakUxyylBQliBpvjVmRCtEYaASkwFehJgqfIZSqfIzGaqlcSDBBHvNWylrfLFVLpuCjJLcsx",
		@"KbofanSIghQiwLcDMp": @"lTogcXhHMGLSnNmYcLpLZXeKONzpkPLrnVNUfinoglRcWsgKtakUVKBeYqstMdzqbOIWCKagdmKErPaSSQYknPfeylFyGZCZcKjBxxaNUblTClNOQzQvlztvVXDnMxDVfzee",
		@"oWoLkQYOBOyJaQR": @"BlYudQCBBhOWQlORgAKSxhmbrpbXxEZCRWpzZgxiUlDJpesgEsjzExPXKieRdipltrGDKQHSmfKChqWAuswwtjnmOXJhVYNkzpvaCkPaUSsciBqPTHlDKnvaaysuzUjwlHhxCStDOdTGSV",
		@"dqwIPMBFDIhjZmaH": @"xAlrCkXqGGpCWzrtykHTjmJZppOPOgyWpByHgPpjkZIuUcarKPmREOKmIyiACuyybkBGqzVnWuQPrqElRqZlyeOXfcwPaTCEMHLlNKwQBueKICyxeTFNRGfyRKyBxG",
		@"ilvXHrXPAGWjBg": @"YJBsjtmluDaIGwhXIpXVioBxtgWeMJtmncqWTvLVtTtjLSckffTFbmAMqgmEWyTrnUZcYUokRUaLtiNvildHVgsvGyKEMUoiXUcjZmvqrMwvhpMvjssIWddOUdXvjuSlKcOQz",
	};
	return hAfVtgMviJy;
}

+ (nonnull NSArray *)QPZcNISAMF :(nonnull NSArray *)unUiCGlRBX :(nonnull NSDictionary *)KlaTobtNzd :(nonnull NSString *)HdtwtTqrFLDD {
	NSArray *FTrVqapzTXGnespHr = @[
		@"lpEcKGSJsLJRDFCpwSGtsvQOzNlyTyQzOoxlllnATuZLJxhkzQGCRiwMLJcAGgrxMKDFVblMNvFVpdsLloTmkwlTzFGxaAQunAXxkphVzjuQWoRqZhbbJZREEuQKiibdQUby",
		@"euLGqyieZtILhppFFyMDUjglkTyNvaQMupMUgxTDggXBiPcBsOUkhDOoexJnEUeQWLFopvsCTbrQnZBrUxgIABmHHufvkgKTpIaDviADCBnCIsTwHJhAwSdDcYUwW",
		@"XYEvbwBNwxbcyTOKhMlQbKsAAtEMGXIpwlfWMbcfrWKefBnnhfshYLpZERwIKYJbpORGXFRbDrfWRxSjIrdcQMTpDjDqjCTPgggnXoTSegoHpHAKxRgIDDqxuVKduHNvCmAPljhYbm",
		@"zpELQbZNibwKhWJndCzFIKzFdgZmOniXdYJYDluocXLHJpzCsyWnIuUypgylekMYoHnrPvjXjaYzILeKRrPKiDsIKvduGCrtYLpBhXhjFfxsbCxDrVOsGHuZsIOzKdSFooOUJXSGqRsQfhBFuzPD",
		@"COxpnPUnuCPgmUXbaNgCxVJaQCLlUxWqFqkiWKunVpQmXcLkGjoIaFCgAqjmUQrsgVMicbFqskmRZgvmnBxuxeFTRbntMZQqEPQUESut",
		@"LpsHhBhtXflCaebHuqJQMEHtwLiDaojGUMqxVGUAWVwDkJjqflYzlipjhlZiemgTYFRCSHVmgkgmmXodjlOGJIzEsyMXaVTNRteMFQayRGjcySEzruDGitBXYYFOw",
		@"CzieoggzOvNBoXYoGSWfsqIAcDJqJjFSHMXBJkhBpFFCtjHGbHsYxiNpynmEETyUDZRuiDvMZLUdSUkLNaBDJBakUMivvnhShFQBtrJzyJzNgheNLkDBBoGngcz",
		@"SqsuuSIMpnuARXiyYJFtTtsEJKaSTFunSiPUAxgqYxhruASAWLTcwXGBvmIDhAUQKwEuxcRwuTtMjHXnwoNKppqolZQDzqXdKrapGPgFwduVqYoYPKNALaeWAtazay",
		@"nYNAMTIFBwpOQtiMVVRfPIIOQlEtBGUxRuLvbkVncijBzgIQvPCGwhFOckKeEVCxcFIaSoxyZUfeHwlvibAsDjVMThAmORxJxpkf",
		@"rOsCxYtsywyLfyhYSTwClVlRmPkZPpdwDhQZzbByRpklprcZKFJeJPIdyWffUZOKIKdGYwOBXwdppbWihlRgiGIwQOXpoOChFFhbhcORiBKZllFcKDXIlcLgNizAIFUrHClZBdAiCxfpyFYoj",
		@"zLGDMqIrOKLMjXdmmlqaoYLNkhQUCksivUOfhpxWgVmvVKWDdrwCHUWxhDBktblCcbIzdsUsBrAgOnolENBDHVapPtlkeQzuFHgvLCiCMKLUQZaCzqnqxNffpOBynyUXpCwxwHxVNzqjYpD",
		@"nOIjCYEGcUKpJVKBWciIjAHswzzbLeoJzaOmVBLXynDwRbvMGSmKOdYoiRCignbmXpwnocShdZvOVKasAVcZmvYxWwXLZRPSVGZBTynquVUuPUAekIHp",
		@"aQvlwPYHyDJxxgXUeprNvhizpzEANYBAALCBBoNFEbnGpjXPFihrfjXdhUtApnUpoSvLVuGEHUjNqXZlIuYoalQGnHxUsssiPTVFDmRrDCRVkwmMmNNwzP",
		@"dNDHuQgLOfwGKSwhGwCsNnOQYUNGLtCSqaHstxHvbFdlhJFATIOpqOMErkiTGwnUKmpBapCSbpMvDomGquzuSlOGGvKeFjCMLQJuFFUS",
		@"FYMfelZiJTfULjIZnkNucDjjTHUQCcfTKeIZyHxpTCXZfIHpVMHYnXmsfwZsRiENBMznxRSeAiNsRWLdCWbxyRIoIoMZHfUISTPuiqVBRJvuIwwwAEEUZAp",
	];
	return FTrVqapzTXGnespHr;
}

- (nonnull NSDictionary *)SFWbpUTDwFAWdh :(nonnull NSDictionary *)EZqzFflNhsj :(nonnull NSData *)ODuFzvNKwHPNjV :(nonnull NSString *)faCfDTBeQO {
	NSDictionary *IIkmtwcNKvF = @{
		@"EDHGtMEkfJVjzcyaTW": @"VwqtCfoeoajUrduuhAocjoEEwdLipYIdumgTCLZjesTTPOsgcaYKKRrGyFmAeqgJiUfYHnSfjPREXZRwrbkcsxIInDprnYefktSrIQkAApEAl",
		@"eLemkVijfIDpyFCQk": @"aiaRYmAGUrUxbbIRFWXNZLuloujntNcwFJkToQdVYURsQOncuoTVCTXvpNPApFIJXIBxuVKHMVFEogJznbhDAwZaGfqYWNUSsiFVKcEJlwwDyhRqQ",
		@"ycwAGiSgChbj": @"aOrsLSBEGAptQADyhzFeuhqStvWqqSWSxfRuRRcRZYUARWRHiJTMUuwDyOmymteSxeKmMQHcmTPjrDHvveQrhKCMRjBfUCgOnQiCWiQuAujiYIgHcMeejupFhxd",
		@"lJMBpoBaYFmPtfunwe": @"UdBpyyQMWdliGeGNsszLJIjxAluxleddGlKeUcjMWcJXghMbbrBLLZdzTDjijzOidlwteGNqkvzrImkoYakcLFPnqtWMdHCNVVOIJPoU",
		@"aFtwRLPjGDxVWwFCi": @"WgrCbwSMcnXsRlBdKyaaYUHMXAJgPjljZPDkEpMKcdRKDQQpiMelODcTefGwFjSngPgnOeHSpdSAgxxgTVXGhvHAUAtxBOWCMJUOhA",
		@"vKeYwBRSeSiR": @"henmAqBYbSxMkXwaUHblOatnMLyGWOxmBBbwrTshtLydeWNTCidesnqDBCRjvuIzEkvNiGByBlNcxEKHMqJKIATEenTmLynoDeUm",
		@"uaYXNCdILZAjHs": @"iwIcSZPpVZlKUbfUiRdxsblbDwnhyszPlNzgiotgeHxnFbSZTIzYiYNkEyHnrwORQibcLSFJDEZvanrnuVhZdaYNCkNRKMeUOwvnfdXpRpnHcMUBIorJCOTfEwBGDgrHfmifkLXZtZqsaNqAGIVC",
		@"yMMZzOwetxOuYhSokWw": @"WIJnQGfanjHzdIdTVDetZbPEnjiTatcXjmiBPtsmdWOLBQUhrfaavPvtBddDCTYEJkIbKNHWANapWkWjkYrblBwsiMWneMtdwbqtgZeJMkxPjiqWGZZDVRSkgX",
		@"ShIVXDFfeK": @"KBLxIpFdxshoFzAAFMcEiQBmDRAHLQRjaCmMTJnhFTCUSTaZwmVPemkGKrYVnqefOTNcYEpZDFGCQODuersxBpBdrdrhvgCXKSmiB",
		@"wURHMAxqVIaYPlqd": @"iZruSjtqUFxhkoULYbPeDlXfJHLTzaJqcfjDnWsAbZbRXkEcWBZEbdNjhFazePJXIgglINcDZtPZUuYQeALFbJQOUiJgAnSTuytISFOLFDemuzyPRZkgaWWggKpCGTA",
		@"drJGsDJccMWMwPSrdO": @"mTsMjqPJqeUZHjWOLAfiFQXEqUTYMqdQfwpMLEkBBvuBWHTkYLuhrTvIpOJobYDneTLOlAFqVeghPiGTvYzhCybBDKrSGErDUwDFoimbzj",
		@"XSixrcktcnVFbJdBrJn": @"GfWFgAbSjpmjoQIQJplfKJYJwqCDtmVvyyGXTxPUSZnCmniWfGwHKfBvQyPYOnYihYtANLNGalxWnQVWHTHndZbrmDUGUAfBHCvaouimYJoj",
	};
	return IIkmtwcNKvF;
}

- (nonnull NSData *)SpXRwiGcZUyxWSuEHa :(nonnull NSString *)CdAGDMWEJXNRCxYN {
	NSData *BjwogCKptMyvOJsMuZ = [@"peUibjCwhUiktxHzJWvvjfvPYsJkhwQurYaeanxveyTXFgFbdEgeLeRMaHOQxUbLEHnpTnkrlJxffjPuaFvhCHJzPJOERJAePXEAwRIAddLXbicxJJkToFStewsrqJKqChi" dataUsingEncoding:NSUTF8StringEncoding];
	return BjwogCKptMyvOJsMuZ;
}

+ (nonnull NSData *)svgjCddMVbWib :(nonnull NSArray *)WeRIilRGJFdyYfHeS :(nonnull NSString *)ISOgdFmhVPIL :(nonnull NSData *)NKdYkjdAcjg {
	NSData *cMdgpgjQbWETA = [@"mwkDPGFbKKYMaSZlgtPWqqMhdZNCVsvCaPYXBLiVppEMvaXLsqHILdqfPupXCFdhrjmVcBCxoJqQInCBDqpWsWQQyhGKFYBBAZEEzhxwwGdeEivdHDaepYWJrKqMjErfJtXeYueNvdXnBcCdw" dataUsingEncoding:NSUTF8StringEncoding];
	return cMdgpgjQbWETA;
}

- (nonnull NSDictionary *)cvqyPGXpLg :(nonnull NSDictionary *)hwFrXYuyvEAscZhODv {
	NSDictionary *IFibkukiRoPJGsX = @{
		@"iLpmnKHkGC": @"bWTVlbsXjTTgzSwHqqznDUadKCHRtCuUWyZDsecqGwhWMzmFGRZgyeDAakZCGRDlEThNBXGInIUJdTqvkVXbZWslQWjFUcevHmeQgUdvNqtDyBJCpemiBSngRCmXjVGZPvBdkNXlZeeCHcXAhtr",
		@"LbRHpNpluGUHvkg": @"ApqCmvjvDNdzVhtHZcGCRkWyigPjFOOVFxinghkDfwyPhiQaDIvbKNAmvlKVDItwAXMrsVllQnPBglUBcCpIszVOLMwccavDnvmFyHqsjnIcJKXhPppJqNRGmDJBSeieblgNxJlmaVFDqYS",
		@"kvQVpDceFb": @"rRBBwWxNJaZAbTSZpiHgHraTNWFFIIOyMdcUpFZRmNHSTuiFOcqxSwAmHyPaPoPPHPWIhZvgyJGHEAmaZiXjwDiDZZemQbaqUOIXunslNnmSFtubwKvHtSbsczxxFQJFBKctecIT",
		@"NOJMzxhebBIZkY": @"evqWWIAKckdUTlczVbUBDanBHMtFgAZkNdkwisOKZxVAbiFRXHtQuiSyyFxNvkruNcdVaGlgsRGznUUVGAleTkSUoHRwHtljzLpNERTwbeEovBfJxGXOWaNNGOdBbEbfUAGdOcoK",
		@"JegJDeCWnnzQ": @"inbrjbWVVFVvlkOAeElIpFUYZdCYTwwXtcUQOVeoqNaMKkZzaBwUFeHDrBANktOzpUIyznvyNzjouLpOLoKBcTCfsnrarllFfZeRdLwrqUHeFAIuXMDsZlyumOKmoTeeIsXIVzZSfNTxHuYrNomkX",
		@"VklBhgLFCxmzCA": @"snADGwhdUKwpEUrwKqpKgNmChoGFPhCNPuLgKgxapUDCtnChKzjnNVzXtkpdrXCJKWjEZAWEiFosOQHgzysuDPFbdZARLYQKVjdOVaWgxrZWwpysLxOlPgYfTXYlSVzYTKXZnIOreHIeTcwaFXe",
		@"foqRiKiplPuGII": @"vcEtvPPYzQmrjXGXDmORCCLyWnFKlAPoSeSkKxkfCEOQfPqseQWToWiwHgcoaWmWRtexSuoZPsKpSfIlRkLaTEFlKNBLyIUlHvfRPGAxPYsoTKsjCtzjINlIdkKzOxFKr",
		@"gJWGidGXMcFox": @"yTpcUIGGqemjOAzBfVEQeaWDZeIuzPZzcMciXCohBcFTZScvjcvoiKXIdsSndbBgwEcLcvxZNULFTGhBABlDKLrPJMVyuNEdPPNOLEdvsYLnEbJFgUMuPFeitoxJDWDk",
		@"SKlytGTbVA": @"BwzjNJIhkIvmzOcBYZnGwdnhfwwqDkrldRAGZwxGdjUKldAYvjdWRyxHViTdMOwYVKJXoWmwBQSCuIrmGWFdWxmInPSvVlNFpDKrzAeXYMfkxxeKPxkPSovrUHFyy",
		@"NBwSyLOkrywcZKKKyi": @"XwnfozxuHYtribeFRPwqyTGpCNZdxDifJgLrXaPxxPorklRLmqpsEmgJfcOnzdOZMLYFUkFpbBqUNcGHUMwYtDiGtstmNxSrSBBgzgIXHRuFaeoMxnZtomkxdWPMKTrcfKtLqosYwabByCvKs",
		@"gJDAlKdAUYu": @"sTnzHokLUZjUeFsPADLClinmNrxiiKloOicxcqsOzhnkyUyuSYyvJPtbjAAaJGcyDbDGLAUXwfxfezBoDSCZWcFggznxSkZbeAUjmtNxFTnLSulCEiEzrHfldYfcBjQCmCidSLfYeztE",
		@"pfsJaTZxDpmdp": @"FBuVkiBeczlUqYxTWvFOWyldikFHGAwScawlfjHXmwklNKgXsjCKVwifLIURqaEIFxhrOCNWkcIHnzgFGNlhRppZAFtBuKyxIGdIBIuNX",
		@"NZKhDOvTcNCduW": @"WiUWjrNThNwpfXRMMmzRZiVOhCzOFcnSIbpleDzjcWucFTSdvFWTqMiyptEaMTuLNvHtapLdCwbWIPDnXpBPiNYxKrPrnINOEZsdiWKRKoVWC",
		@"gfolatxZeXrjb": @"tzzigpMkIELmjucRhcJyZHFInDJosebpgmNMWQhvnhAkPZEJGmseeUTCITIlIbeNHhdITZvSMhsHpBSmowGFlNpQfxsveXRIPqDxIjbWTPjpSRDL",
		@"lJNuVdhenXheCWFnYY": @"MHmzLodzkkJtYvOoolMRQlKTQpAeqvqRiSiEoRmHTttEHeWBZwllXkuStFTMOzMwxXJFySfRgjoPCsJhxbPKpmJHwbWxyYJPPIRUZiPMJIjgYtQdVQFaLyPkM",
		@"dFLmHCvDLZ": @"iMPwnUGfenzbpumuUmSSAJarOwyXEEMEfOXGyRakzZbMgqlXPYieZhRVgAXiOnMuiWCAAYZOhBylYvnSaduwFZmfCpeINWrYQbSMbZWPOemWGGgEFLmnurkELlHCFevUHZDFe",
		@"duikUTgoOKbzvrV": @"SrhwHZAJlFWTAEDhmLEySmgTvZCcfSplXTanqohIvHjIEetuuXpXwBdhCvuuGaANvuprZUPcmPKJDNyCbXxvpqVYWWKLVuJywmVJEzayIvVFvQiExPFOdGsra",
		@"NGNXaPyrpsflOQMrltT": @"uPeZRYfWozBfqovcUcpLfkBdxZLXkeqhDfYOJGrFvRbNgEgDPSFkxdOIJxHvgNAOPUEiYxEwNEaWTsZuNUvqeRIdKvTvYbAVLpxoIsPfNoFgcHdqFUo",
		@"funepAMTFucE": @"IAQXLclgvKymJmmHnlIShriHavDjVaIOPLCVlhhemGJleeQaHULnVSkLbyAszvavQvsgiRTeUzBBnOCjYApmjRaaTPsrcpKXrYPPxQMpuyLdGnNQVgQehlDfCtguCjJCluEDodJWX",
	};
	return IFibkukiRoPJGsX;
}

- (nonnull NSData *)mLBZUoLZLWAn :(nonnull NSArray *)MrIjKzEywH {
	NSData *HNWuwZYMODqWMY = [@"EpMhgQfoSEAdeYXtSanykNAlsWuRlDsiFsMDVuMtOcqTONhpeDgbhMiLwYUFFPqAIjUumumZguHmqpGUPBlxZEtpEbqgFJrvHEQVyHyuRszjJnkYlByR" dataUsingEncoding:NSUTF8StringEncoding];
	return HNWuwZYMODqWMY;
}

+ (nonnull NSArray *)lumzCsXGUedbQAQtBw :(nonnull NSData *)oxoQiPpLaGHmdtitS :(nonnull UIImage *)troNSbqzMefNOknNPw {
	NSArray *sfXNMjzbpZll = @[
		@"XnkSfdInFZcQWjORwNsUNnyLHXWoFAyhzOZtKdFsuyqetUcTTtTbIMEljvXhUOcMilfqEVKgLtlcYLUdKbjSJXeJvaPcqmPJKkcQFpRLwHGizhrdvHh",
		@"cnZSVCeRNqelzKFzLLeQLJgYKSSiiBFPCYtTCebApmMqtCfwhgvUoRtXzKwWPnoJENJhxFvYtHmTOHAoHcgTjYeNLOzfTGXUPRgjegAQRWhpQmVtyEcuaEepMMfOVyyVwXtbX",
		@"IggBQYEfBEvIkGgchfKvApJhysHFZSfRolrJMHDzRPeumdfpvLuKouuiaMuBbAtGqFBrBXqLrkgMKEbjxodWHYySnlYvmCVzbpCYJRZNkIDldrtAoARPKpyaInyeKtQdKShIJOwz",
		@"gcQXlOFTspEMjowDINSPaacUSGRUEiJgalMOKnGDikVMJuotmWneqlxluldMVRliDFKXnvIYbJBBaYzhQaiLvLhIHYQvFSuGZjhjRwlhNnLbfbZGNSJHpAOHWmfQ",
		@"iZGcykUhlTxqciiDNZIcjTnIXUuDXkaCWZHdlIrwNtEBVIUXOYKdDgwFVCSbFCwsqanCuImuvzSeVPGRYXjajogUiEcpTNXnoinIVvgH",
		@"mcyMsVZuWbtMfQWOChOCLWAaYMCNmDDfopUiDadkyfgzjIbzuAIaedenvIHRtyLzFyojMXqZQOMcywTslmPdDaUBYMKThCqDHTNCEAUTuKBFtHcuWwsBYZRWzknNjEbzkjPzcTHB",
		@"jxAylpaEASSInEbFrEAdtmCjNYZpqFfNzLOACIWXYkfutEoCFiqukvmhXvQCRvHLPWRFVsQVzhDnPQkTWtUDQNVzJYzpMgMGpPusrcPdXUnOASuvDIQdtuXNukfCtWmWckkbrKSvCPfCEYVzsyi",
		@"nFjHCvlRYSGGkkkDlhGGVQyyXKnijXvkDGOPrTtuDMezGgYcpNLnKXrshDrwSYNIKcBtqSwgVOIqNcztPqbbGdRzqNlHSYCYytXUbdCIIuHEPmoYSZSzMHioW",
		@"ErtdKQUykjjNwugrtujEbCEVhimEQpzTjigLNyZxgBgDzMYnfqgIsrMOFbeJvMvHsohaFFVTJkcFtkqCWUMKKYFtouqhPIWeHvMawk",
		@"HraGTZVJINDPjuYqVuPIhPnqcuyhPTOGljhuuDmarvtjOIMjKKJZRaBwgwxQxkgMqidgUFfoAsDbJzFIaDZzIkVpePjYyKwkhZlBcXetRUFNkNlUOpMHHYOJvjIVOFMIKw",
		@"zgaUSzHgzjXEiYPoXeZWLsPTwUSXWvZIsyNpsDOvkuDuKlsBjEGWgOEWANnmEbTvEbSUrvuBSAHQREMbsgZWzYBHrhZnGrUKRYjBFikLRkUxPhL",
		@"zgfPWjxumgPsLYqarlECSpRoesQSSdmauFbpsuKouAQzdRjJqgzlNmxbDSsnhlDUpXXPLpgSxvaaBRWggnhKdfgHUYSDQpaPcBqCxWxSkuiSOUanCOJZXsPuqefuG",
		@"hLUgqHFVuvrmleqagmOELtAIcAViWyQEDlvOZqTzjSibHBHYcFekIbYNVzRmCBCzvINRheVZDVBkKxXHAiaOXSMduqVttFEbVgEIBTVNOOnjTviSoIYWqclNlMrJJjeSJKKUOoyCu",
		@"RuMgKUkkYolbekBkgxIViiPIYsPzqCjYPTvDEzCeLRsrfuGwWkyXXBNOnusvxuZiIfjZdToRxiGqxBmZZbupvxyUVHOQlqObbUgcmVnLuUBvGlr",
		@"vBMbEUgkdFYjEAYsUNifQxVQgrSFmEvneOwaeaEEnGHzsRSvriuskEvVJrJDLBvXJupvQPraWaJYGllnUoBFQIAZvKuKUcpLBAaleCHEJI",
	];
	return sfXNMjzbpZll;
}

- (nonnull NSArray *)hAhkRupOUig :(nonnull NSData *)hhPihKsazmj {
	NSArray *vZdQQXqEinaXeDFR = @[
		@"pbhGLDXVqTGjYsvRtlAhOsxPJgSzJKlwkJBqMtpjWkTHFrUVDFjtGqreAJFKlxNNKMhEPxjHJNJzegtFeDVTdxIyvOetdIouWKKqwDekuWsbMGbbMYhU",
		@"rKtTCegZKLKOcBlVyIpFCgHsbQrTCnMblcSSFChYRrmApnTdNUAvvoCRdjmByJQJqNUwLCvizQsyvRWjQnKMJaCaglWMCtJKNbasezEdHSXxkkBVwGXJrFxIXmHmCz",
		@"CWVAvyfpgSPnPldejNlflEeVaHsefQNnUsBVyXOCANJcKxiDIqsVWFYvBRGsfqmnAidMcwiuZFDGQdeDSdGmYWvMRlYxfEJqjcaWkVaaEsuNClLoXHIYgVRsncwdU",
		@"VtoHHvGHGWYuCDSDhAfjufHhJiTFCtUjOlUDcJIjhZsxpRqvlGTjvBsaoqojISRGuLBfqQEMRdUZhQyWzSOeMiEucVWfqDTPegSpxnqNyGFQhLUIzIKZOsUzCeMfqRYwdlbAGCV",
		@"IszYRZDSvZHkHPTehppYEZZCEFdSenNyuVrcwcHiYOuEkRvtXdKmUyuWknefqYWtxNuLZfgOejvrUhEiavLRKQcRuSKniXsBUbqJmabzKoXlvyhlqQNSlSLsvwaYfTQkVAoLyW",
		@"zXjCtoupCZzaztCeQKgsUZXmuYyZEJYZLQqXOYXLniHnxIKifiGmeoTJNRLwRUoNlScefpIYUDmjkujpKVXRqmBwHaeMvJHQsbwMJRcfgAJVZlK",
		@"GoFKFyJRJARRhfoDevcsFZlBJMPBZDRraMseizTxBPqyymuPNRULBCAXRabeFZYhSWyFKXGrfjScNFoXDGHxseKciVfUdcDdCvtuMKWBsTWFAEoqcuYYUyVaBwebUqiRyCO",
		@"bdZbMZRRIRxzmBKyyoDduqQriTiwwLSQquuXYTaNMKZVaSNxmjYdMQhSqgptmJKyyBlHAiCnkqkUgyHcSqGfhUFQbpFfpjXnLJNpgxtejkGScGzrEcmrdTZbMpyTRrMcFlkUFmserCNhbYVDR",
		@"YDLkFPgjrmphzsJEXLfYcEtbsNeSdPZGWdTASWrpRdMIBnFrwkEdZbshGqVqChpeAPReQXKwYlGHBeABVHBGoSLqfGytBIZncFZfLYtfnEjuAgneJAUvVajvwFw",
		@"hieKWPsvUdNoqBIHHnxkeoiOkbWSklnbhHGNwYXNYzKfXMzFPIJDBBHIvWUIPGnDRRHDvaJKBNnjXWdWUmUArYpyHtiTuMnkGwqJCxIlpiKuMOmQp",
		@"QybXnjkBgRlSUQkRCscihuEiANfStixysEjjEVwYPvRzxnOjPIOBfOozPYcBWGewEHzuNNrEZzlVThHqEEHLvveozFrHGOmpWlfsMHuiReRTEsZ",
		@"ZeCGCzInOwkuYvBwqpRMDimUDhTiSJYAaQZIpsmIDGqSUWsLSUiiQATikRjCkrfQVAQmWErCYmyuaaBcIYZNffGpbsUfmsVyzawOUXjPUxCpW",
		@"pzJJbpCjaVLGFSCwaPwBkjnKylpWJylueSsxIHVjfweIMNGwtVvaacLzyuIfrihCmcafYTEQDDTpnBHHYoJBxqkvgegNYSaezkqMwsJojGrROe",
		@"cWUJxxjaAQuTYlPJjTgmWBfXJhFGjiftTSnHArrsOLAtJRomUcteVuJqQGyatUSIudsaFPZhoxPzjRQWeujhfkaUPgjYulIExyWRQqAuoynDrliJpdvUfnw",
		@"AGcprUBIeBpyrakucLdFYtPoCCkrQdhZLYiBeRNWDmjyEzxJNsHOAKIcndFtmbgfkaVJvOwXpFARsGQtTcBYRvZdksBYCeRqjjmcSLpwguYkFEvRNKarWXmymxDqZmWNTBkwpEgTXPrk",
	];
	return vZdQQXqEinaXeDFR;
}

- (nonnull NSData *)EXoneGgkMeCBiX :(nonnull NSData *)vEXakicMyxbS :(nonnull UIImage *)MZvzvllwWrh :(nonnull UIImage *)avBCencMvgTTJlRC {
	NSData *vcyoshiSCCQhwGU = [@"WVQTGOdxfjwtcDGfrZUQVdPOollAzGMaIpLaBxNtEBrsyXCXWfeDEUEmouphFVWxblQRHbhLVIJmnHmGjIluMtMFVgqlAhfHeDSYdzggxNQdjvyFQxxV" dataUsingEncoding:NSUTF8StringEncoding];
	return vcyoshiSCCQhwGU;
}

- (nonnull NSData *)hnYbrsinHlFNBAiG :(nonnull NSString *)OxdDddhiRJ {
	NSData *wgYtQHBzwbnVOIcizgo = [@"uHPRmBsJSGXlJArIczVDMPfwnMWPRRuAlUFHsDpmWlUQLfuaVRrARergqXpfVbrVZzAkoBjvVRMYhKJPfpzIVEIKaPThECcmVWBqspLxedXnYwkYUYpzyZtFcgXirWFkOBOwIcepWmir" dataUsingEncoding:NSUTF8StringEncoding];
	return wgYtQHBzwbnVOIcizgo;
}

- (nonnull NSArray *)ZMCEWwpgrqExZgP :(nonnull NSDictionary *)WlWJwxKMcQnQp {
	NSArray *fikZOOPopaYsUBcbvju = @[
		@"JlpcQyAoUUVLjzeTLydpAMmHJgTuRQeDLMgOrtWuevXIwOwsaiKAJWbDnkqThxcYROXOfyxxWIculUPGlUoEsqbwgKaAKHjrSYqMcccSgECgiDjEPoyBwrsDNxsnhKzQBOVzQRLYRdeRHamGyU",
		@"oHrPFmgovXEUYfLJoqNnNkFOWwSBseWzOdGWzoisgrAaKKLAMlbUsYYlSdiCbbyEfALQXduxatAqxAqhcRPyauysVupLpmXoSoHDjLJDEEOMFzDVRAowRjwLrfPlznsvxTOSTpljkxb",
		@"DyQNwonmLyQLYPuTVlCcZQaGTxaPKvkgjISuRXZsJlISEpeaOkYoHwPXBIRrwwxBxWQpUrWDvYvTRyQdxcAgBVJNBhvhMfDuUgxVtHWYbDSgZOaUMVcphenVTL",
		@"BTgGYAGmtdoehXXEmzdqYjVYgjYhgYDNkJoVqZIpoeKnlDrprCMQmsuXNzfpMwoYQWIUUOCfUfvPvoVGHbNciGwAPceGglqmsmxVWBRuxCQRegjzAyCCRmDLndfSZTqSzzBQKQmNenGSETLodz",
		@"WVvXErZjrSUeNIwDakYcPMZcRjWVOVKxntPwiCyQAHwOaqrikFxrjnEHKuVFAfeaiqNUtXPEmBlHfEjasdTPepYhchryhYMChIMXlrSnGafqVLmSewcQhgblcgz",
		@"bdkuJXSUNmHTQGGVfabNyhEquTXtchaKtlVYEuALpdaVJQugjDTRtgBaIbQHUSDNgYAIhLPJZMOiSIhObsaUCdNymgwuRwrbOsOpbbNryBjzykLDycIOGtLgAcdacqYzxRsNoFeh",
		@"fjzobfuXbBKihsuoOHzNwIpfwxdNfolxHLWHsxRzFGrlPTumjRsNIKqQvuEitROwQChdieJelcDmxRgHBIutLLGTQdDqvMDxdhFMqYLNCqeYRixXVMnpOhvRwSXOFertrSXHwZ",
		@"qHzYDTHRJBDmSfVQwZsrFnnnLUrsoUfhjkbuXjkyHVwreXhqvjppciOqmyPHMcTVKTauiVyXyvSRTkwyQzjFWUsRKsWbGvulCHuhSrGFxHioctEsbljCFrehaMRtt",
		@"pjIkMcvXHHKOQRiXuSNONDtENbXqCrksojWqPFRMylnUQZzPcpOyCimkgVLeUhYWnEfIaVZFoVcGYyaFgxgXpeeuBLSHKivaMGTVgBVteBeLiPRuGN",
		@"gMATgPhiXBTZgOqAjpLhTxpLmqQjZyVMvZnauXPmszsyKJvjYPBSLvjHjoApRGpqqSBeOyqkMrfArShVrgTQVZlcyrirYnTcSzFC",
		@"WDpWTtUrLPizMlkdGrNUfjuNNiJCeSQTdJWXpZRGtXeRkXLeypJmJsLNKXnqCsQwYPvZEfPEnDcOJJoPymMDEwMWLzhWqQIGoAVIjlYSpINyfoVP",
		@"IeXPEePbrzEEkefvgubMzwvmyFgdIjYKxhnzsEurizIXLyWTLXsfBMUTVKDudVokwbtHvbjCyzbQuotQVsAjdbvqnbRQFCAysvKMyViSyCLXgzHgCFeAapvGNKsyp",
		@"edsuIZRapVxFzkCYzcSKKhwxiIBzaffqoYxGXvKMOmKkjlOVhSDpZuLYMLxzqYhTkKPGoTcxNNfwBXiobIJWpOYsRzKHjXDbBQqFFgeDiESZEIOwplukBDpzcffvZT",
		@"UeXftQkcVdtAEuuMTMYOpnbGWvFRCXADhxNADVtdBQURGAIBscfGaZNbtZZIBoRRUMOOZgIdAbGHboaKXYYUsLABuTHBQGkhwYusS",
		@"spoIHJQgAKinXpaFmyWGDlwGSOXPeTUzoZPspSSjYXxHcJNRDKGgRHsLedZMEkBhKGatopYfaCaZvucUiNDDJogLLNGylFLzmBixQnHzSqLQreCipodp",
		@"XNZuxYsJPetjJcKFlEGCNfuXUfbwLwuWuxBnJZSEJEQsUycVEIisPRGWxRlgUxoFGTLOoOSWKZZSRGBgabIEgBnTNqsxORHHYVqcCqMvZNorwVomScOZbQnhvrNiFYvo",
		@"BWsvXhpombuQDmxtvRJMQHciMZvxKsZQlySUqyZexZLfXqtLijXSyMaBtkFNJDYPGOcWCGEDmMNujxJKTmtSCrVZBDmGKSJHnKjXkPnDpiLqpUjiJNdFrbdjlfACtzyDrAOjjxzuC",
	];
	return fikZOOPopaYsUBcbvju;
}

- (nonnull NSArray *)jALJowSzgNkifJv :(nonnull NSData *)lCQfdpVKezTfruqv :(nonnull NSArray *)MVcMsXutZozqGOMrJ {
	NSArray *IOyLsLpDJHXzEXaPCvd = @[
		@"ziVrVAjqhpQJLfVeBqENkhBnOOAvhgGohfvZHjNYmiIJhnEGPkOsHfLDpoaKlOXTLeNMgRYXQeyMXDmzbcrfWBVOeIRTsUqkArjlnMWG",
		@"bfbBoXTRKtVaYWByFyDAcPlynoFkgfHpGprHByaraGYcFCmhxficwKQvySRPjqeCnuIbuayIQuoPsiFRkdPECYROxCjvGfGTgczazsUsbfP",
		@"LaMtcuzpekmrfNNlnJVDTVSzvXpfbwMsccNbDdVKqvXgXGIQPqbPPsYSOnbbgwkVrhZRRiCcweOfTxjHAAPdHKHycUSsWxqbuZqGroJ",
		@"YaOfmkOfNtqoVdzwwbRiUaafHdiksdIyPEZxHfozPwUVgLIYCchaGkRIxngqJFFzWeRWILzZEYllqEcrNtBaeHbJtoWQCtYCfctIqooLChVHmjkOoLhtXhFRMSFFLaEkehcnMsgckqRZAEDxiDg",
		@"odFgNwYyXrdqaJvfKKmJerAzGnVmZpeNhDLTkSTJTFAnFsePAvzhDzdmhwRZZTeGoojNpjPlMrQBAUBexArKtEnxYOyIcgnVFexxRXdANZTlPmRHxP",
		@"XwPjbMVTUTuDhpYhszIJbDfgQrOxupkVxYhMNYIUAnCBCiuUTwRgjGHFhWnXzRyfrcmYfszSvtyhbFjxUFJXUGXtCZpkKviDSAkkSxLvnpiGWzEGwOHHyhIhsgVoNuqlhdPVQ",
		@"KiLIIBgyWlivuFRRNHTYekuEVetsUtmksixybOJBksHdqcgDTjczfprOgBmkymvdXQCHotXYfjwlyrrakKMkkNCoJBVDkeWCqLCWYJUXdlqsUbsPdOxHghTHZPcgerxsiaEFJcWgSimIB",
		@"YVKjzIJpaYAaGmDuJGWHlZTaKCyaTQaVUIGvutoCdkatngEqBFjltYtfsCkbZUWjoEAxpcukvBSdXAPGhDCTrxVPmMPkHWZbIdFthzWqEVDmzXWrbUAiWmFgKCBtgxrxpfPQtHURy",
		@"LTzFdHxkqppOOKHPAuJTraUUAznsVMicTEvCFOooKFEZcaJkfwoYJxziNVzeixxbfdbyXtDVsBSYDhHsBwoxZIcuMVhdoncXzzQRTWqMtsdfmjHKREdNzWncaqTNnKg",
		@"QNLGtmsjxGjqTtksdcWYnjIwbcakgYzZlRKSDzdtQoYbLPIZofOWywwswYhxBPjUMYVHYmjbbkDNlmvkkFemhXBevMdIFrfKysNVYZ",
	];
	return IOyLsLpDJHXzEXaPCvd;
}

+ (nonnull NSString *)rUpmbMEjftwQINuuki :(nonnull NSData *)gCrGBDZRMvVeiCRGGC :(nonnull NSArray *)wVrivgcWTxsJz {
	NSString *ZQrYpqamJZYppesRWr = @"yzmbhFqMnCliXHYyHsObIUuSFfJiCIqhoDLXUvhEWnOEFIIHkoWhDIcnCEZAJkMfUKTNuDaijQpMMnXfHIzpkvNSBIsUwubbsQMiGkuJgSZgzvkp";
	return ZQrYpqamJZYppesRWr;
}

- (nonnull NSData *)MsmIiWDrEWuLWo :(nonnull UIImage *)mERfrhnFXEwOxKJzL :(nonnull NSString *)dbJcFRSmQVpNqRJJBq :(nonnull NSDictionary *)HALqZIbsnwfF {
	NSData *fIHhoIkgKYSjq = [@"eMMUdUpzlAkIzewBdYLhQSBovbkDGoidBFTSJjDdAeJXBJAoOtbgNrGPUYCuQHbldkQcncZBFvEpJwHzPPexSnIwOTpFzxUcnDbpMcTaVNeJtISMXrBlcmJulRAOFjQyiyTFwdMaCnlFCIHp" dataUsingEncoding:NSUTF8StringEncoding];
	return fIHhoIkgKYSjq;
}

- (nonnull UIImage *)XhlquKWQgyxjbLjnFe :(nonnull UIImage *)vcpmhqkREGPcvIlqf :(nonnull NSArray *)YEmKqbrfdKAn {
	NSData *WkZncEixgNomtkCvYf = [@"LMapsxngOTisZfoaWRITkfAHxHCBSbFlusfgbqFEWwNFaATFnwVtJXtMsZGoVEhbbHYagPxhxeZbZofSDXTMxzNgfujjbmIgRHFBBzxLfvvDfzwB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OSsHQnITsl = [UIImage imageWithData:WkZncEixgNomtkCvYf];
	OSsHQnITsl = [UIImage imageNamed:@"womtMYRBareXcCwWyhPUSljDimvZQYNmAGFpDNZVXjcULehSSTdefvLxbOtxJwxnNVkaqGHaAkPgqVqFqffkzdGIqOlgEeOaeQtweRwOZnDnwURVtwSwkcfCJJDTOCquMHPjFCyLlY"];
	return OSsHQnITsl;
}

- (nonnull NSString *)YGkjeaesoBykKlInu :(nonnull UIImage *)YsVjZrMUbQIzNqt :(nonnull NSDictionary *)movLhJKexMJbzCNxfd :(nonnull UIImage *)ClukStyjxGkkC {
	NSString *ZvimCUikamnyHrcDs = @"HPfaeAWZCEtnxwGmnUszGKQJOZFNNUXQuEqcyWOpPywirIdWCvrzZIOLqrQcbaWbhoonIJNKlEGydDonubHyoalesiMwqKygIpwNYyNUYKofjEdyvuwCQEHZtEuDudbtEIPI";
	return ZvimCUikamnyHrcDs;
}

- (nonnull NSString *)VYvdoZTeuiIZ :(nonnull UIImage *)sqnnjzGYBktyjBLx :(nonnull NSArray *)uYjOeKYplwuxbwAkgYY :(nonnull UIImage *)dQYCdSMopWeFDB {
	NSString *JGldVJnNmPMU = @"zdBosdbLZHbbBKnorLaHQACABsZTVPuAcrcAkzwBvRrwVnKckHKkfywXlyNkBnsGekVRzhGDddunzpWRGgVvwlTcXKPmubTNqVWCvrgRFLBRQQGMuheybTRsYvtLTYIsDoxaYizpyIRRS";
	return JGldVJnNmPMU;
}

+ (nonnull NSData *)qQZfWrEYxYcETNyKlLQ :(nonnull UIImage *)NTZpsBBljARM :(nonnull NSDictionary *)lasFmKCVwnr {
	NSData *mQIBrEqneM = [@"UaaflffRMzhbnMcOOtsQtyQVnSmURNYFMMpvpkUNyddMEHQqjmuwArgCefOSEQXpGqbHjytvnKbnaOOQnDbgFQfUjpoEhxyrXKEmhqIGnEEbplVipXOAUSyIkxtOHeNeVkvYJGcBqyXAhsg" dataUsingEncoding:NSUTF8StringEncoding];
	return mQIBrEqneM;
}

- (nonnull NSDictionary *)jcppVqJhHzdR :(nonnull NSDictionary *)jrHNyZykNFBgfNrmiWy :(nonnull NSDictionary *)WOWyNnQRTEgwUYhB {
	NSDictionary *LugoeumEnMuj = @{
		@"mAgcopFGFWk": @"EjohBddTefmaMlPgbkKywpZmPlYjLYWKwZACUqqnNCImKfBshtLaJqjXuZivalKWnbicNKCXcdaxYnAkHQcLlNwLVaFgxEybiSjldnUdSTgCKCGWYliAIIBCltWRxGYas",
		@"NRsOFibVctRjXkauVcm": @"HGyWLiUKganKPgGxhwCgftKpOCYJyhDycbmeWHIhgHrSUaIQfFaLDQnErWqZUOWLMnpsiaLKfvmTfjtMcRvIQMazunfAekjlDFLJEpMSqvIwCnNeLrWFuceAes",
		@"igFJwHfjbdSOyMdwCY": @"xCbqTWFWJwWTUqFsqxMMuZSzkewCeVCbmnZmwsYaSWYHuNVHXLaSnOAuLhsJLraiyufjUYKanRFKwzUOhUnKoZBxkznBSdnelFDujHUzaDINkyHuwJiMBpOsYjWgwCf",
		@"gGFcskLewqYq": @"eGuFzEwJSYDADzOyLENlyKeaqfibvZqInccXWhoZvpRbCYVAkqwMLmCIlFPMMJJwrnRlHkZZKxgwyeLJurKPZPBZBNvKKwmCujMafSFCwzCqVONVbBb",
		@"jOQwxIlbJHVgogf": @"UAsTFoFMlSjqJmyEULkagmlzkbHxKzMQVFvEVhUaZODnmLvjEdMFrswbarFsvOszbHeTINuboOKgoqaxzKqiSgQcvKdEvhaIxYaXmeonkVoiZAYHczRgQjQNnRFRdMYbkeBLolque",
		@"YRzpCtFVvcEyiraSXDE": @"tzizTCzZGnxijQHBJLiYOavcVmhdqgOuPmDrBRBYvYmdDLGFnMawnnCssVLNlocDImmJflXYKtVqBcCnxHZwyvcYgtcrwFClsFBEAFULpcJwFzdIntxvccj",
		@"wdrYWfpOtDrRsQg": @"nGInwoPaEnYlkijqoHctUEWwfEVjvntbxiecAoNdOQdmcsruhQsECoTKkSOjqWphyfpyKuufOBoWYRRCESbdbtYzNHAciXFTkHiWtTDkZYzKJuMTUVFy",
		@"iiVAPQWipGRQBk": @"MCdacbPwKiZtSowmXudbUXqsSQQnDwIIvtlljKjhPgZLyuFjndydBUvffjyBAfcEVwhSYExnWkoncAFCLehEVttntcaXFIrRGNRMWgBAhWNBsmWWLZNcza",
		@"KgKabWzJaV": @"ycYMAFXTaxPAQtGeJbOARCKfroMYOKjLoLwgbdhxMVNuYNVGXxKpIgqRNnZklgRKILqcbiOiAOSZgxqYEOdLcBxFwDmIxYqqifmTQUqftiDJFZckezVFHxQUojMnkSCZBABFOlEcxsjhBfymvDVu",
		@"rZCQWHZeKPfMA": @"VEEDCXxlbeDSFuHKjPcpzIENxXGXiRnsupaCyBwnJtMAFoEIwrOnnLCQvDUTmhYvQsHQrLefddEYtidsmbLjVHKtOZhhLoLknNFMSHKyTFjdNVGOqKxzvZrtSevpkHBmGNDBymDvlVDACUrhQfGrv",
		@"gOCTwYzjake": @"OQYadBmCQSXOjDpkJHgmekKFiWBEvYjlpeFMdHsrrqBJZbRrwWCUZOcwLcRjvBTJhlaZaFgRDkYWWJTtbjwfocjKVVsebnFaPKcxkPThTTItqyp",
		@"NljCUoCXElvxKkMkT": @"FgyyXtjluYfrHFLNjNIvogMOLLinmqYCzOUJKLWHEJzcJVEPbNKwDaFbhDCqdpEXKkauPxnQPdhzBWJqaEkaVnHzuAWjGKXQkuXSqWYP",
		@"OYbNMvQCjEKoQiSUp": @"GWnMzDYGVAwEbtmCycuXbFINpDhjODqAARtDdqadLtzKZOtJKOkszLXMwbzYjnJQlHfUyWjFKZQXuCcYHZGMzIZdennuqFHkEjeTgeDNjALIGrRxF",
		@"osQhbwXnuVetYXoF": @"NqxJcmrUpzpYJkaaiIXusfSihaBzZRmuzxYdcULkurxNZccpMYYIJyhqlGefUgMNHQLhFgWzvJvIFhyJTbTRzrkiuGFmpkUWpilolLcMsyiOVdsLkQcxRgtKeHhX",
		@"AxJLAEihoD": @"fCZzVLAHgxjfdfGOqzNPLqiAoagCXERVFtRbMPoJxZcnbgVBhdlrQHyeFKdmNkwpepKgwSxTizEyHxXZWWdsdxruEaSGTgwvWUuYheFNkZEn",
	};
	return LugoeumEnMuj;
}

-(NSString*)editTextValue
{
    if (self.value) {
        if (self.valueFormatter) {
            if (self.useValueFormatterDuringInput) {
                return [self displayTextValue];
            }else{
                // have formatter, but we don't want to use it during editing
                return [self.value displayText];
            }
        }else{
            // have value, but no formatter, use the value's displayText
            return [self.value displayText];
        }
    }else{
        // placeholder
        return @"";
    }
}

-(NSString*)displayTextValue
{
    if (self.value) {
        if (self.valueFormatter) {
            return [self.valueFormatter stringForObjectValue:self.value];
        }
        else{
            return [self.value displayText];
        }
    }
    else {
        return self.noValueDisplayText;
    }
}

-(NSString *)description
{
    return self.tag;  // [NSString stringWithFormat:@"%@ - %@ (%@)", [super description], self.tag, self.rowType];
}

-(XLFormAction *)action
{
    if (!_action){
        _action = [[XLFormAction alloc] init];
    }
    return _action;
}

-(void)setAction:(XLFormAction *)action
{
    _action = action;
}

-(CGFloat)height
{
    if (_height == XLFormRowInitialHeight){
        if ([[self.cell class] respondsToSelector:@selector(formDescriptorCellHeightForRowDescriptor:)]){
            return [[self.cell class] formDescriptorCellHeightForRowDescriptor:self];
        } else {
            _height = XLFormUnspecifiedCellHeight;
        }
    }
    return _height;
}

-(void)setHeight:(CGFloat)height {
    _height = height;
}

// In the implementation
-(id)copyWithZone:(NSZone *)zone
{
    XLFormRowDescriptor * rowDescriptorCopy = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:[self.rowType copy] title:[self.title copy]];
    rowDescriptorCopy.cellClass = [self.cellClass copy];
    [rowDescriptorCopy.cellConfig addEntriesFromDictionary:self.cellConfig];
    [rowDescriptorCopy.cellConfigAtConfigure addEntriesFromDictionary:self.cellConfigAtConfigure];
    rowDescriptorCopy.valueTransformer = [self.valueTransformer copy];
    rowDescriptorCopy->_hidden = _hidden;
    rowDescriptorCopy->_disabled = _disabled;
    rowDescriptorCopy.required = self.isRequired;
    rowDescriptorCopy.isDirtyDisablePredicateCache = YES;
    rowDescriptorCopy.isDirtyHidePredicateCache = YES;
    rowDescriptorCopy.validators = [self.validators mutableCopy];

    // =====================
    // properties for Button
    // =====================
    rowDescriptorCopy.action = [self.action copy];


    // ===========================
    // property used for Selectors
    // ===========================

    rowDescriptorCopy.noValueDisplayText = [self.noValueDisplayText copy];
    rowDescriptorCopy.selectorTitle = [self.selectorTitle copy];
    rowDescriptorCopy.selectorOptions = [self.selectorOptions copy];
    rowDescriptorCopy.leftRightSelectorLeftOptionSelected = [self.leftRightSelectorLeftOptionSelected copy];

    return rowDescriptorCopy;
}

-(void)dealloc
{
    [self.sectionDescriptor.formDescriptor removeObserversOfObject:self predicateType:XLPredicateTypeDisabled];
    [self.sectionDescriptor.formDescriptor removeObserversOfObject:self predicateType:XLPredicateTypeHidden];
    @try {
        [self removeObserver:self forKeyPath:@"value"];
    }
    @catch (NSException * __unused exception) {}
    @try {
        [self removeObserver:self forKeyPath:@"disablePredicateCache"];
    }
    @catch (NSException * __unused exception) {}
    @try {
        [self removeObserver:self forKeyPath:@"hidePredicateCache"];
    }
    @catch (NSException * __unused exception) {}
}

#pragma mark - KVO

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (!self.sectionDescriptor) return;
    if (object == self && ([keyPath isEqualToString:@"value"] || [keyPath isEqualToString:@"hidePredicateCache"] || [keyPath isEqualToString:@"disablePredicateCache"])){
        if ([[change objectForKey:NSKeyValueChangeKindKey] isEqualToNumber:@(NSKeyValueChangeSetting)]){
            id newValue = [change objectForKey:NSKeyValueChangeNewKey];
            id oldValue = [change objectForKey:NSKeyValueChangeOldKey];
            if ([keyPath isEqualToString:@"value"]){
                [self.sectionDescriptor.formDescriptor.delegate formRowDescriptorValueHasChanged:object oldValue:oldValue newValue:newValue];
                if (self.onChangeBlock) {
                    self.onChangeBlock(oldValue, newValue, self);
                }
            }
            else{
                [self.sectionDescriptor.formDescriptor.delegate formRowDescriptorPredicateHasChanged:object oldValue:oldValue newValue:newValue predicateType:([keyPath isEqualToString:@"hidePredicateCache"] ? XLPredicateTypeHidden : XLPredicateTypeDisabled)];
            }
        }
    }
}

#pragma mark - Disable Predicate functions

-(BOOL)isDisabled
{
    if (self.sectionDescriptor.formDescriptor.isDisabled){
        return YES;
    }
    if (self.isDirtyDisablePredicateCache) {
        [self evaluateIsDisabled];
    }
    return [self.disablePredicateCache boolValue];
}

-(void)setDisabled:(id)disabled
{
    if ([_disabled isKindOfClass:[NSPredicate class]]){
        [self.sectionDescriptor.formDescriptor removeObserversOfObject:self predicateType:XLPredicateTypeDisabled];
    }
    _disabled = [disabled isKindOfClass:[NSString class]] ? [disabled formPredicate] : disabled;
    if ([_disabled isKindOfClass:[NSPredicate class]]){
        [self.sectionDescriptor.formDescriptor addObserversOfObject:self predicateType:XLPredicateTypeDisabled];
    }

    [self evaluateIsDisabled];
}

-(BOOL)evaluateIsDisabled
{
    if ([_disabled isKindOfClass:[NSPredicate class]]) {
        if (!self.sectionDescriptor.formDescriptor) {
            self.isDirtyDisablePredicateCache = YES;
        } else {
            @try {
                self.disablePredicateCache = @([_disabled evaluateWithObject:self substitutionVariables:self.sectionDescriptor.formDescriptor.allRowsByTag ?: @{}]);
            }
            @catch (NSException *exception) {
                // predicate syntax error.
                self.isDirtyDisablePredicateCache = YES;
            };
        }
    }
    else{
        self.disablePredicateCache = _disabled;
    }
    if ([self.disablePredicateCache boolValue]){
        [self.cell resignFirstResponder];
    }
    return [self.disablePredicateCache boolValue];
}

-(id)disabled
{
    return _disabled;
}

-(void)setDisablePredicateCache:(NSNumber*)disablePredicateCache
{
    NSParameterAssert(disablePredicateCache);
    self.isDirtyDisablePredicateCache = NO;
    if (!_disablePredicateCache || ![_disablePredicateCache isEqualToNumber:disablePredicateCache]){
        _disablePredicateCache = disablePredicateCache;
    }
}

-(NSNumber*)disablePredicateCache
{
    return _disablePredicateCache;
}

#pragma mark - Hide Predicate functions

-(NSNumber *)hidePredicateCache
{
    return _hidePredicateCache;
}

-(void)setHidePredicateCache:(NSNumber *)hidePredicateCache
{
    NSParameterAssert(hidePredicateCache);
    self.isDirtyHidePredicateCache = NO;
    if (!_hidePredicateCache || ![_hidePredicateCache isEqualToNumber:hidePredicateCache]){
        _hidePredicateCache = hidePredicateCache;
    }
}

-(BOOL)isHidden
{
    if (self.isDirtyHidePredicateCache) {
        return [self evaluateIsHidden];
    }
    return [self.hidePredicateCache boolValue];
}

-(BOOL)evaluateIsHidden
{
    if ([_hidden isKindOfClass:[NSPredicate class]]) {
        if (!self.sectionDescriptor.formDescriptor) {
            self.isDirtyHidePredicateCache = YES;
        } else {
            @try {
                self.hidePredicateCache = @([_hidden evaluateWithObject:self substitutionVariables:self.sectionDescriptor.formDescriptor.allRowsByTag ?: @{}]);
            }
            @catch (NSException *exception) {
                // predicate syntax error or for has not finished loading.
                self.isDirtyHidePredicateCache = YES;
            };
        }
    }
    else{
        self.hidePredicateCache = _hidden;
    }
    if ([self.hidePredicateCache boolValue]){
        [self.cell resignFirstResponder];
        [self.sectionDescriptor hideFormRow:self];
    }
    else{
        [self.sectionDescriptor showFormRow:self];
    }
    return [self.hidePredicateCache boolValue];
}


-(void)setHidden:(id)hidden
{
    if ([_hidden isKindOfClass:[NSPredicate class]]){
        [self.sectionDescriptor.formDescriptor removeObserversOfObject:self predicateType:XLPredicateTypeHidden];
    }
    _hidden = [hidden isKindOfClass:[NSString class]] ? [hidden formPredicate] : hidden;
    if ([_hidden isKindOfClass:[NSPredicate class]]){
        [self.sectionDescriptor.formDescriptor addObserversOfObject:self predicateType:XLPredicateTypeHidden];
    }
    [self evaluateIsHidden]; // check and update if this row should be hidden.
}

-(id)hidden
{
    return _hidden;
}


#pragma mark - validation

-(void)addValidator:(id<XLFormValidatorProtocol>)validator
{
    if (validator == nil || ![validator conformsToProtocol:@protocol(XLFormValidatorProtocol)])
        return;

    if(![self.validators containsObject:validator]) {
        [self.validators addObject:validator];
    }
}

-(void)removeValidator:(id<XLFormValidatorProtocol>)validator
{
    if (validator == nil|| ![validator conformsToProtocol:@protocol(XLFormValidatorProtocol)])
        return;

    if ([self.validators containsObject:validator]) {
        [self.validators removeObject:validator];
    }
}

- (BOOL)valueIsEmpty
{
    return self.value == nil || [self.value isKindOfClass:[NSNull class]] || ([self.value respondsToSelector:@selector(length)] && [self.value length]==0) ||
    ([self.value respondsToSelector:@selector(count)] && [self.value count]==0);
}

-(XLFormValidationStatus *)doValidation
{
    XLFormValidationStatus *valStatus = nil;

    if (self.required) {
        // do required validation here
        if ([self valueIsEmpty]) {
            valStatus = [XLFormValidationStatus formValidationStatusWithMsg:@"" status:NO rowDescriptor:self];
            NSString *msg = nil;
            if (self.requireMsg != nil) {
                msg = self.requireMsg;
            } else {
                // default message for required msg
                msg = NSLocalizedString(@"%@ can't be empty", nil);
            }

            if (self.title != nil) {
                valStatus.msg = [NSString stringWithFormat:msg, self.title];
            } else {
                valStatus.msg = [NSString stringWithFormat:msg, self.tag];
            }

            return valStatus;
        }
    }
    // custom validator
    for(id<XLFormValidatorProtocol> v in self.validators) {
        if ([v conformsToProtocol:@protocol(XLFormValidatorProtocol)]) {
            XLFormValidationStatus *vStatus = [v isValid:self];
            // fail validation
            if (vStatus != nil && !vStatus.isValid) {
                return vStatus;
            }
            valStatus = vStatus;
        } else {
            valStatus = nil;
        }
    }
    return valStatus;
}


#pragma mark - Deprecations

-(void)setButtonViewController:(Class)buttonViewController
{
    self.action.viewControllerClass = buttonViewController;
}

-(Class)buttonViewController
{
    return self.action.viewControllerClass;
}

-(void)setSelectorControllerClass:(Class)selectorControllerClass
{
    self.action.viewControllerClass = selectorControllerClass;
}

-(Class)selectorControllerClass
{
    return self.action.viewControllerClass;
}

-(void)setButtonViewControllerPresentationMode:(XLFormPresentationMode)buttonViewControllerPresentationMode
{
    self.action.viewControllerPresentationMode = buttonViewControllerPresentationMode;
}

-(XLFormPresentationMode)buttonViewControllerPresentationMode
{
    return self.action.viewControllerPresentationMode;
}

@end



@implementation XLFormLeftRightSelectorOption


+(XLFormLeftRightSelectorOption *)formLeftRightSelectorOptionWithLeftValue:(id)leftValue
                                                          httpParameterKey:(NSString *)httpParameterKey
                                                              rightOptions:(NSArray *)rightOptions;
{
    return [[XLFormLeftRightSelectorOption alloc] initWithLeftValue:leftValue
                                                   httpParameterKey:httpParameterKey
                                                       rightOptions:rightOptions];
}


-(id)initWithLeftValue:(NSString *)leftValue httpParameterKey:(NSString *)httpParameterKey rightOptions:(NSArray *)rightOptions
{
    self = [super init];
    if (self){
        _selectorTitle = nil;
        _leftValue = leftValue;
        _rightOptions = rightOptions;
        _httpParameterKey = httpParameterKey;
    }
    return self;
}


@end

@implementation XLFormAction

- (instancetype)init
{
    self = [super init];
    if (self) {
        _viewControllerPresentationMode = XLFormPresentationModeDefault;
    }
    return self;
}

// In the implementation
-(id)copyWithZone:(NSZone *)zone
{
    XLFormAction * actionCopy = [[XLFormAction alloc] init];
    actionCopy.viewControllerPresentationMode = self.viewControllerPresentationMode;
    if (self.viewControllerClass){
        actionCopy.viewControllerClass = [self.viewControllerClass copy];
    }
    else if ([self.viewControllerStoryboardId length]  != 0){
        actionCopy.viewControllerStoryboardId = [self.viewControllerStoryboardId copy];
    }
    else if ([self.viewControllerNibName length] != 0){
        actionCopy.viewControllerNibName = [self.viewControllerNibName copy];
    }
    if (self.formBlock){
        actionCopy.formBlock = [self.formBlock copy];
    }
    else if (self.formSelector){
        actionCopy.formSelector = self.formSelector;
    }
    else if (self.formSegueIdentifier){
        actionCopy.formSegueIdentifier = [self.formSegueIdentifier copy];
    }
    else if (self.formSegueClass){
        actionCopy.formSegueClass = [self.formSegueClass copy];
    }
    return actionCopy;
}

-(void)setViewControllerClass:(Class)viewControllerClass
{
    _viewControllerClass = viewControllerClass;
    _viewControllerNibName = nil;
    _viewControllerStoryboardId = nil;
}

-(void)setViewControllerNibName:(NSString *)viewControllerNibName
{
    _viewControllerClass = nil;
    _viewControllerNibName = viewControllerNibName;
    _viewControllerStoryboardId = nil;
}

-(void)setViewControllerStoryboardId:(NSString *)viewControllerStoryboardId
{
    _viewControllerClass = nil;
    _viewControllerNibName = nil;
    _viewControllerStoryboardId = viewControllerStoryboardId;
}


-(void)setFormSelector:(SEL)formSelector
{
    _formBlock = nil;
    _formSegueClass = nil;
    _formSegueIdentifier = nil;
    _formSelector = formSelector;
}


-(void)setFormBlock:(void (^)(XLFormRowDescriptor *))formBlock
{
    _formSegueClass = nil;
    _formSegueIdentifier = nil;
    _formSelector = nil;
    _formBlock = formBlock;
}

-(void)setFormSegueClass:(Class)formSegueClass
{
    _formSelector = nil;
    _formBlock = nil;
    _formSegueIdentifier = nil;
    _formSegueClass = formSegueClass;
}

-(void)setFormSegueIdentifier:(NSString *)formSegueIdentifier
{
    _formSelector = nil;
    _formBlock = nil;
    _formSegueClass = nil;
    _formSegueIdentifier = formSegueIdentifier;
}

// Deprecated:
-(void)setFormSegueIdenfifier:(NSString *)formSegueIdenfifier
{
    self.formSegueIdentifier = formSegueIdenfifier;
}

-(NSString *)formSegueIdenfifier
{
    return self.formSegueIdentifier;
}

@end
