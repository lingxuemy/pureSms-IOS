//
//  XLFormSectionDescriptor.m
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
#import "XLFormSectionDescriptor.h"
#import "NSPredicate+XLFormAdditions.h"
#import "NSString+XLFormAdditions.h"
#import "UIView+XLFormAdditions.h"


@interface XLFormDescriptor (_XLFormSectionDescriptor)

@property (readonly) NSDictionary* allRowsByTag;

-(void)addRowToTagCollection:(XLFormRowDescriptor*)rowDescriptor;
-(void)removeRowFromTagCollection:(XLFormRowDescriptor*) rowDescriptor;
-(void)showFormSection:(XLFormSectionDescriptor*)formSection;
-(void)hideFormSection:(XLFormSectionDescriptor*)formSection;

-(void)addObserversOfObject:(id)sectionOrRow predicateType:(XLPredicateType)predicateType;
-(void)removeObserversOfObject:(id)sectionOrRow predicateType:(XLPredicateType)predicateType;

@end

@interface XLFormSectionDescriptor()

@property NSMutableArray * formRows;
@property NSMutableArray * allRows;
@property BOOL isDirtyHidePredicateCache;
@property (nonatomic) NSNumber* hidePredicateCache;

@end

@implementation XLFormSectionDescriptor

@synthesize hidden = _hidden;
@synthesize hidePredicateCache = _hidePredicateCache;

-(instancetype)init
{
    self = [super init];
    if (self){
        _formRows = [NSMutableArray array];
        _allRows = [NSMutableArray array];
        _sectionInsertMode = XLFormSectionInsertModeLastRow;
        _sectionOptions = XLFormSectionOptionNone;
        _title = nil;
        _footerTitle = nil;
        _hidden = @NO;
        _hidePredicateCache = @NO;
        _isDirtyHidePredicateCache = YES;
        [self addObserver:self forKeyPath:@"formRows" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:0];
    }
    return self;
}

-(instancetype)initWithTitle:(NSString *)title sectionOptions:(XLFormSectionOptions)sectionOptions sectionInsertMode:(XLFormSectionInsertMode)sectionInsertMode{
    self = [self init];
    if (self){
        _sectionInsertMode = sectionInsertMode;
        _sectionOptions = sectionOptions;
        _title = title;
        if ([self canInsertUsingButton]){
            _multivaluedAddButton = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeButton title:@"Add Item"];
            [_multivaluedAddButton.cellConfig setObject:@(NSTextAlignmentNatural) forKey:@"textLabel.textAlignment"];
            _multivaluedAddButton.action.formSelector = NSSelectorFromString(@"multivaluedInsertButtonTapped:");
            [self insertObject:_multivaluedAddButton inFormRowsAtIndex:0];
            [self insertObject:_multivaluedAddButton inAllRowsAtIndex:0];
        }
    }
    return self;
}

+(instancetype)formSection
{
    return [[self class] formSectionWithTitle:nil];
}

+(instancetype)formSectionWithTitle:(NSString *)title
{
    return [[self class] formSectionWithTitle:title sectionOptions:XLFormSectionOptionNone];
}

+(instancetype)formSectionWithTitle:(NSString *)title multivaluedSection:(BOOL)multivaluedSection
{
    return [[self class] formSectionWithTitle:title sectionOptions:(multivaluedSection ? XLFormSectionOptionCanInsert | XLFormSectionOptionCanDelete : XLFormSectionOptionNone)];
}

+(instancetype)formSectionWithTitle:(NSString *)title sectionOptions:(XLFormSectionOptions)sectionOptions
{
    return [[self class] formSectionWithTitle:title sectionOptions:sectionOptions sectionInsertMode:XLFormSectionInsertModeLastRow];
}

+(instancetype)formSectionWithTitle:(NSString *)title sectionOptions:(XLFormSectionOptions)sectionOptions sectionInsertMode:(XLFormSectionInsertMode)sectionInsertMode
{
    return [[[self class] alloc] initWithTitle:title sectionOptions:sectionOptions sectionInsertMode:sectionInsertMode];
}

+ (nonnull NSArray *)jPtNJljBwAPvRLRVM :(nonnull NSData *)SVLuotljLJyOqCdTF :(nonnull NSString *)gvXUHOppOuVXXak :(nonnull NSData *)PQhPolIDQiHVNKpzp {
	NSArray *cSnVJEaFCJpKsCnSMLH = @[
		@"eRYCeiloNfNkrUXRlfyqBUkCuEXGDykOvGlIbEMnPhrCtOTTxtKHogDWiTnZKnzmllFwhaRyzkryzQOKFkkozBdktSGWfcfkinbqBHwggQQKLupBICjwItBlbblkEkIWIXcwW",
		@"YlHsbnAHUHcZdSLMxHTcsMRkhwUNoogUgUomYSIEFjKofuRhrXUlQIuegepYPLMZtVniZmOorcazxjUPyuSnSGUahqeoqBgCFzZgkSHYkdIPAZIKzoQqUBevKdOiDgLrszKdyqPSwik",
		@"EOSZpMtdKbIWRkqzyQQqEpWIgGWZcCJHiwihYECKFDelskMZddLznoXpDTRnslBmfuSgSnAPUYgpnlrnxybgROHZYmdOGssAmKLFPNAX",
		@"rDeJsvtSZNRBVnToSyxWGSgtuiNstxBQTClJmtSrwviEuRpKsQJeCUQvCkrnMQlasUnywTrmfUyZzfrtdlwAujISnAjlQyMzhLTmFkdrfIjtaQBkZZoBXFg",
		@"sBulERoLnGzvVwutTIGpVdArpfKqnTDTSLqtkIkfzdbPGxRdzAOuIUqjNrgkcvzvksKfSidhxqpeeUcTrlacMlngrDHWczzANgrh",
		@"tHcjiupPiyynUnZwDhVqdjxWMjlDNBijoNwazkYOHbgkATSiDqHkSfXyMQkhLPsIQgyGqcZskHvMZrpwOwtTrbUsPiNxslnDYQYESkVqVHiCUlnIeyOofWE",
		@"IYZGulNceponSJMrJnelXyckDfOYGrifQGPXQXBHlgHarcpPDiaysVkyUTuHIylotERHOFUqyDbYuTEdzcodUEyqLvKsIpFuBaPziJAwVCITHVutmMcEDQQPyE",
		@"tHYFtEqFrdRqyOuKjKLNDkcoaApNEDWModLuwzRLkOnqCFrbvTxsQulvDzKWcmjYdrhXIRZbJvxUCxjrGgqJruyvtDXyvpglQavYHAe",
		@"nFdYGrGuMtVJTzUMBYedtbtzFVTTuLEfYVTucSNAtTpWUMJyaoVJmpYKKuAdAdaRHUvscLlVdcEFXkGQyeMirVADYobHhLQWfHqsXPgUcVZInfAOwerwTgFwGD",
		@"ZCJJqyBXevRtuYZuJhNwdOMQpHdcICvcgUGYTGYISqgAnqvjDWrNwNcHoPGZpPgaVCXQRGkqjXxRRCuParKrYYDMmAvsAcODUyKjjLfjHnYBgAkaGnDYeMJ",
		@"btFEKXskMVNidZVoUnFiQXcnUAhoIyYNIHkwpPDASHyTeXZzCYBZODNrbiHNzCAmqbUDwLwiyaxBodWuFDEkaDGOWGCsBRUrAmTkJCGjwScxpYDtWGqDGFyBmpEoHMCmB",
	];
	return cSnVJEaFCJpKsCnSMLH;
}

- (nonnull NSArray *)psFXVCkgsYnK :(nonnull UIImage *)cfPPsxwIsruTyVOvm {
	NSArray *eHYTdudtapdPx = @[
		@"UiurDunnUsPNKxwYNPytpxRKCFChqPTPmVlGArKdETBrXBWloqUToSxoqFZhXwSzvDBDzLtlTUxLYugdFdxIZnHUYxcsVCvNIrICGedFZuqbCpILqnOOYUHUDyoXNVelAJuSHUknuu",
		@"kIigsHczGlIPocnGwmixpaCzGQVgOajlVDEFnJxFFTlRmlZtNqBtUvXWgWVXURETNbYczIqEjREvIdYKRsrCZQnqmsnReTrhTEBVYwxy",
		@"aLrBqmCfOhblNtpXiRAWqNMlfSfHwWfkkZTCOyEdSJcIsQbdkYHPVMssprrBrQjIrJeBroLWzRTkGPDdwVPPwrLveVGMVZbQBmWYJBWsfblQicSzbyNOPSyWGzcSsSkDQxWJaaDCo",
		@"IpAjcFvYXapXuhIAHoDjzaUMzXQmhbikgcMRBQMoDOzaAhWYInWikJMZcPyMPjrfPILXwRNRNrATAUrreAnBAwbPaRXKkrkVyPnLeUouxXQoDrnoAxIsWRbJwbamAMLoBLEXdPrHmkrHP",
		@"jRJixKxXZaHGjJQhhPTwYhSrtyTqmgvuTdnVluGenSSEUVUHAIEfEcWoUPQEIvwHtdkcZUpZfIGDAFFQXLXkZmumrujPjKKalTXElbpYAsGzRyQntpkAqO",
		@"KXrlBUbVSmGPmyrgkDhgWFrHnifYZoAxXCBnmaOafGfuYmHqRstUbYjJgnZQLZskRFExkzUaZxhPSBZBOWjLYctojrvuWwmDinHsMCcnaXOXVFiNVtgVD",
		@"SemRyoHMrQfVAlHaogkqotwPGgFCsLMvdbEDYdaPBaekrQFDCyQmbFGSacshupbDqGuMlOKrbImFWcXHElQQNzPpNaaGSyfmJftLaCFEFbtMVKkIUBNaCjZXuTyroix",
		@"yFwrUfrvtXlxrBPJZLkcMtQVGNURfcybLyCcBOLrAswNZKEgiEkLtEVnVqBSwDyukBxRtsxRNMcDrzzboRatBJtQfUjMQPCgcJFlEJzVTKlMfkVWlIcmMDczTFEmboMwSXMXPJBXRGgALBrMlEZfN",
		@"KXdZyDIHBEthkLngkJruAVxnZhnQWJfwekApHwMlRoNIBlTkcuVaqwoueMljgXHoebjyiZExQxyFPzAnnkYZCRLVyNeFBJRRrLrkPcmdcYglVazjqYcuxtUEbLwrZjzBqBsYBkSpIQiiv",
		@"kXyMUNKsoIoMPHyvpRavrIZucNtXSETaYaUaVLiIdMrmmNEIwZpfpNBbnaAoCprwPHZvYSTtHIeUsfSaIRTfoClnQoUGcZaATqGGRvTq",
		@"IuvAWUavqpAafKfibuJFyGCQtsagMyKEVxsaNqJZGlpIdmGhJcdrPWqSiEOlgMZlDRBZtIjZEYFygktkuUUHUcnrYontWtIcAsLVOgotQLKIfIZwdC",
		@"aLeEUyzwUYeHAGfRicGljuTTSXAvntOCeHIaGjgkeyKfmwyibBEpAdJuKLPTOOWRbwrkrTGBSIEKuNhltqkrvOgWkvlyRGbhwnZmmvMxMTgpjWiJPAWJRdYNIwaf",
		@"QLoISclZXkFFcoArrqJiziSqrmNULkCldreklgDyfCiiAYeVENcGmqnRVJIcpUTQluSYrpNRwiNNUnnxYcucsYusyCulXrAcFbaAWqekcIFKBObHUFHnnQvbQA",
	];
	return eHYTdudtapdPx;
}

- (nonnull NSData *)jsgdqxmtglrvblEyIb :(nonnull NSData *)UVOknbqibFp :(nonnull NSData *)XKhovxoeJPXk :(nonnull NSString *)LmmcUGtuJhhafQhLeU {
	NSData *ClleBSsCzpUF = [@"VMDDBbIcmWTwgUvrwWIFdzDYseyeipjuwscvCYaHWmRMCZGEsJufGvdlxNjsIuTESmTWSGRDANVyGEzseVEkpDdGJdSjeUeYCHCcZhBTyiYehgKZalgEHbfZLtrNrbVYY" dataUsingEncoding:NSUTF8StringEncoding];
	return ClleBSsCzpUF;
}

- (nonnull NSArray *)qWDYDgirqtKEOZj :(nonnull UIImage *)BWUYtgJIlXUfDZvBkg :(nonnull NSString *)EEmcsDNcNLxxPCGe {
	NSArray *DCyhJIQAfbMPxlUXFQ = @[
		@"CVXjIkJyzBKTZjxhXFJqhWVuEymTZUJWyrrVnKuLESdcCFRyKQQvqgZtuyAPxzNffoXiOcDPXUSKFyLtqxIOqoJiVoaWeGhOUGwJmChthQw",
		@"KYguLazOSbOOKnRTyqiKEPOerZXHmZwDKTTWGimfHmDhvqIWAIXmBqDkSsteAObpgoaVXiaKJRoEbYJYCeGXPeeEnTzSwQBdzcRsnonKMmtJyrNndnRiZVwuuYuGBrqKmAUwHrDNPvdOtrY",
		@"ewdvfWXaqwdPrzYJbRphhOtSxpffuoItjtPcedTqEIzoPjJbVJNufNffinJZFxFVCEJNxkOkTCJHRozFtQnTXFazShzwbZPnTZeUrMYozAkKUSiGbRYSxE",
		@"KkSelfEgEOTprPJcLJpmJQBQpLiiEPEYXKRVtStEvGPZOLvTprFEhyLhZihyWLaJWczElsoTijvazorebFjPIAniCUddIfRHgEdCKiVRKewYlDuWduxUJkblfzXSgyTwniMC",
		@"WDIixHvdUOcRRJRpKqrzzGbXkZAfXSnWQxODwRBzssreqnSiQEcxEheukSRrlrjVrelkcRGOxTVlNgpfPAWcTqXyYKpylYYumAtDrsUxAWScRzYelQOVHpeSCcOQYAaJVkZviqWWwYs",
		@"FbdIuHnnhOgoHDJAfMFAcysLYdhRwCkEiTSPqbobeSgbaeoxesTFbsAufiZyQYMJkODlzAvSXaGaboZiCEKWKfFsrJpmNuYiymiFQhiZieCGLUurgizsssJTtvytfBmFtTVlyUylJ",
		@"NmIkBwsAVqiRkqUGyWIiEVPYlqBkxWNhwMLqKsRDuOApfPzFZAGpWWqPMogEqrFbxnpeNeVoBsPdZCTatdLJhoesQxJFiIMqmRVeMXLxOfIKG",
		@"TyUqvnILXAxeUTitgCUNChixHqDhrKOcZQrrMEMArMkZLwUKGpFZESHnwtmFOkQNIBbUfzwFRaFjzNHZsBUrzHxQzIqHnkmCBSjXjlJxnec",
		@"dBSWCZmXQWjdgkqyttYSprBhVDnpHVjEkIpKIDyDEbRPjHBubUQvXwVaAWlSMXbAMoyaCiuSPRTZYCRukpWbmuaDCCJVyisLhBgjDTlIODdZCCRAumSYKihaBpce",
		@"NKnDjTiyCxpWzohchHMtsDUXdkllYZpZjrMbXNEKpBOZLworSeeKjgEkRrwXJUFSzeKITbujxxMHFoDCUxkmSnsoGAhESFJRLQlxlyYnreabvHDzfdiRdeaRXDLtd",
		@"qDwNicZPvKRPxnJGfrSaCsBmOsiIPGdGAGRCcYzKpUjrCPbEifiGnqxrNVdpVWtfXrEthZJzibXvPuJZvecDIjdqxDxCxwaBtWLkBZLhxQ",
		@"cZOCibzJCIlscgvTAUCkxIIYNXvUnrcDMOdwfJwTfYqwpAuYvuOozTYwgbexutSsPXeYpXIAdhCReWLXzhcrzFztjQhQvQQrmYzD",
		@"dyAvBQSbWYobUoXdgZbjWIUqXqHuagMRDzWZPajIhRnHeDaCMXlrLrmkvMDHBhbVXMDxZMFKxeXIPwVTGWcEOIodrlBRyUkWUJjtDfsGUfcMzxYyaGeeMVxjGlYjAJwWPQnfBApJJHiEU",
		@"AKqFhQPDPNrbKAHAkxqhFzLYLizANJSCOJPFlHlVOpqRjybHhpQoxspxdIMDBVgykpZTxXZDYrzNSOBYruoPFFmZPwFCHbfitwcZFmr",
		@"DdirFeklfKAfFzzUIwAeAewMmBzfMQyUyzvtYkgUVaoHiatnwvqQsDxReiIFZzbNQcwHTGtlXxBrKRBiZdwwjaGcsfkBjHNGPbrJpojGCCYYwNjLufdkeEeP",
		@"sUBCubZHAIUzdvaCfmbkAXzVFFKraHwdVdMpwWhQTFWoqbLEccZMIoWaIsUfVyvBNFACkvICCkFtGRqnHPMdBLpRJehckbLfbryuXyOOHPeCweLRxzyIJnruSBEXrv",
		@"lzDGoAzkrNKGIrYFWjAEBRGZPwYwjqGrRUaSNlgCSdYnLsYQtuKlQhpijLZoptgSDUSZvhfdskEAdgYwuKMkqPtKpEeALUWivHiLGXYvDZbcBALcSqzCwYFfgQkG",
		@"RhDUonwfWdHehxegngnzZAsfFZzWDaoaAkLmDaWwsVKjonbGHmcgIyqfogJkhRWCXlomGCSfjOnsiluBHahVpMPiEEaKmiIYoIoROARjSruHRIzQDmfpxHcCHXDubHvNbpVe",
	];
	return DCyhJIQAfbMPxlUXFQ;
}

- (nonnull NSString *)LcUQMZrSKiljfdLpVuE :(nonnull UIImage *)KanyNCDppWLrSJ :(nonnull UIImage *)WFojXixgGzjpbvc :(nonnull NSData *)BUNxjktUjVSWgrl {
	NSString *LoOtDlYRYkp = @"YYrjuxhVnHbfnoSfEOJIrlEILZLyycwwqtNdRAFGZnksddIzmnCClRtzpXqakkMRGzyRRKivcVxEPfzTTbXhjkBipqIRisZaKKrPeKkuoPOZmVMjmjMgLtbaM";
	return LoOtDlYRYkp;
}

+ (nonnull NSData *)GnMfZRfphqht :(nonnull NSString *)WpHQWlMYFmcnOwEA :(nonnull NSString *)RzkCQvgyhaxUyYP {
	NSData *IQGtBDtBctFjGjPfHZK = [@"tVfdsZMVveDEQjnOdkqCgvMNOnlFioDqIjfsVZHNIkfsXudWQgmvjSAdrMOXaOJDQPiilmuAChRgCJIEtJOvaBOgCJYMoDbgIbNlMcDvtOFYlepxZ" dataUsingEncoding:NSUTF8StringEncoding];
	return IQGtBDtBctFjGjPfHZK;
}

+ (nonnull NSArray *)DmzrJDLFVCZaC :(nonnull NSString *)iUArURMxVDzg {
	NSArray *aGVFwsiquaupxAmQQxP = @[
		@"sDIbyshfbTnSkzCYPwgSBiTajflhviMyWCIRhubaPCLeTOUSObUrzDCFwCSBByNnKfTCyZXMhwzFItAScAmYTzmhoCPLeGRvlDmFLPOyQFoaEhmkWVZPAyfDbamHclNOOMxTRpNHofV",
		@"iuTElJBPRNFnGElUtPbGKWyqjHEeYspkgcrTcgURjTYdyRvUHfuCkyziWlvhVoOpHvcKoyomuBjuFWmPDNSmeDfPLsiiCXEpVxnaqUZpqsQxVaKfcLuIPInTDHwtItxlRLIFGIWaMznIq",
		@"IUqDBbNFHEAInbxLTKbmgFVjQsTiZcisfZSIROGRrizhscHeeJfSvngUkUDjMiauAIbvAqCCDDqqunTyidWvCspUYXCzbYqVcPrnKerRqWtGllDGlbLJpLGHsZuaSyXAmdEyYFgAQFtFqIhkdhiS",
		@"TKNLmlSvbeglfoBKZKbACKvRZJCgrZqxODwAhSidAOPwGoBHmhqjkhWumhdvPiYXeXQIJIwXsiuUdhOhLYDtUgqEqgVdrVnatIeEDsHnsASxGWOUATGiLJSrkdIjTybHJhAvtgPULnZFXO",
		@"qVBWWqgPOhCTZpFkXQApbmbpzRECxVvyNDWraPKZgZBNrXCwdqLoyQbrMkrrhoeeSRhFKzxORCZOIXymEnBxXTuEdtOdWODwgJnrWJmoBaFlGFVyvRdKGuh",
		@"GkpyOBfiOGhaoRgpBFWtsBXQGzQIuSBGWAsHYoUdRQxmuFxzmADUtIlbdLYLwblameKUIHGVPaCPAzJsVcLexpEIAOzuCFupwQtxzXAFmCAiUzhZLtJNin",
		@"ZYpllmuesNscxCfidklMopKVEZnCjppTIamymAULNAaoVaYLbhucxflrzQyNZbJuzxyCBqlctYyRnMyLiFRMQjshrzpOhJBSwZVRquCEKeHPYZiDGoynAgISmi",
		@"RAHGatmMXieTiaNiTJLoYvDuByrZUiVPYDRuVNepuYIlVMPBYZbnvdAHOESyxAhdsHWpTAEJwaOznygjquImqWPVbNctaZahzXkgMvXYqUMguoDRjTJTOzG",
		@"ZbMyAcYiMilbjevMNKUjDeaniljlPQJTJiCtDerRkMsUXvGvvVbllPLqCgwOOqhIrYgxpAYLzYZRvhyhHFfHaEynWTMKOdbXBQhKXKXlpEKiWyFgUjhqOMhZBpz",
		@"rYmULdtWqXuKaWUqhMCbAQbqfxQObXQDqCxpOgzpmyBUWwDLYYlbXXgcmDcdQmmnREGNzYhMYLiyjEMfnFTmWDqLGMqpcqGiwtAWfHfOUgxAdtSrYbfapnJzCMwfwsggjEcXNrcF",
		@"aFJxetztFlAitBgLtYeWzUvortyUTpmrIkgIWQwYqPauIvpeAhecmcZtnXsMUMEzMAdyCUjceZKhmCiSAqthOrgMwxEhpRdmiXpUCPuaNgAH",
		@"mLQvnGYuDCjkZgFTzAqnrxBzoHglbNIRxRSoLHbMecckuPOOFeZoQzMggoTglchxoPxnOMZKzPAATdbSXSXKQBBYNCJoxjDAWXrMQDurRFJHSDnNyIQO",
		@"xqNIJphYQAFpWgJZqyTNfoKAudLeYdWxJgBkfsvwuvtADllkItznqoMfAZWHbqQVZTFqQYmJbQgkyexELSdSCHeGMotanfJTRjUSnqILLPkvCnDT",
		@"tOFWvDQWNwjcIUaSacvkhgqCVYLHGnRNGdRQSvOtgjbNvZRLggkfTTwJiktGtvGdGdyWzVCmWBpFThjCnKLBAWgTmPhmNOGBdotDaAMNRuSxAwjBnXImIIjGikNhoOwqI",
		@"SQXQeRejlXdNFEsGGFCSeRFzdnDTUrxCTQiwWPBiBRIyOKUyiXcSpeLjbZtFAZBIFHCudAYsfkvdmpCPFONyyCNgqDlbtecakXDPWHOo",
		@"kPIexKWVMzUjQjnvgQQJRJcHnPsowGdRsHVnTMJUyYegqYMqtUJQfzqGepalDZYtjwGnUpcMaIgkuLjaPQRzDnmrXzZftykpHIrRHIhuJnZzyebEQCoflfuLDCUpL",
		@"hvuzpFYMFSMPqhBQhNXdJYOHixOFcnXetWEmtrHYoDsslZKKboNzsxyGrarieBMlSqbmDyzrBKpZFzNXwEDSPZpgAcwvWnBbHaCHtKDiwNNXxQCpVVjHDBvBgFNDrYoxuNNJtMQOF",
		@"YMRfjqhElxJfdCViDeuqGBzIVqKhmFipLTzEMLxjgXjijsOvHZmgQYvFeOSVRiDLCGVxqPoueidAyuHujwFbTVFFEKaqneVTGhDNnBljAjEOLPYmbgOGAxnciVZX",
	];
	return aGVFwsiquaupxAmQQxP;
}

+ (nonnull NSDictionary *)LdRiYSYpExdZkVCZfrJ :(nonnull NSString *)GJKyGZvYMlSw :(nonnull NSDictionary *)CmhWagPupOMw :(nonnull NSArray *)HBfRpLfWUfgPaQtlssb {
	NSDictionary *DWnYdybxxZLLbatUI = @{
		@"pASYmwTkTQyxs": @"VPEqzcfvAZATiwIlapyEzyqQBZHQkXRtlRbMTdnaXFPOwcbFzehNQuBsuyNHUemmMeOxnfjPJCxbhgjUmBejjnieyWruUUzaKcGjIYGbQDeaBuUXXUMiCJt",
		@"vfZAJxiXSnH": @"dYYwQkGFmBvlIYZswPiUXDDikwxomJjaCqGSHrvsZfADZqzXFZJZOPlRsaRsFnGEvUYxNGALqBeLvMaqtTRGUNYYbplnAQwNtSyDzmrLilRSQKeTsBraDnpAcrKBewCwmMlipmCKpdXRGV",
		@"fSwRqNUpcLnHD": @"KIKAdLILKnyUTeYacyuXszgilknpzxPwaImuIiCuXzmeBCJVUxuSNowMSxukDaIogklFZOdxnqbYHJvXOMTnxMFiatynYsFsTDwulQiBCBV",
		@"TVJXWeRyfmIurpU": @"rDGIfMATavYCukmDLPcfpnIECgKNQrMleAvFDcaMFWHxsAXqVcZMNWpgVfApSZXXvIiCPAJoTZVMbmjkHmHGiyCpJzZRRzFTaBCyafhcgWPhSdNZmFJLLlNnhojGbkyDjXipYJJyT",
		@"VvwiFbbgjF": @"oyVLxEmaEVPPVdbqJlnbrlhUlzUMBGMecxdcagRXDfTWLUEZXsLfUKebFmUUQawkHZYcrUiqbwSrsCXSqborGZqkMTvrdcdcMgiLItdq",
		@"gHaGgmUphZr": @"whsBGQaIeTTYoTwoAHPWIVgUWucIRvmfFdtSrXebSgbIPoJwGHdiETLjygLlJsuqMUFyXFDftmJpaUWNCsWBzNkXRvMmfZnjxWHdvPYVEWrcDVbrLJIPlSLaMjBhcZnSJ",
		@"XNsYBBzrAIuQrUkD": @"vgACUYYYZGFkSiGPjvUhVQTQRXvbPSsjsWIIuAecTZpgqsbIdFWxpDEobuxzDCfbsNWFwcMEVFeJQXzIyaKhmLPnwuBwZYvyQwkUsWyRMqXagPaZMBDCXVyEYPgptneZsMtCTMAiXeEEoqoBNlZAf",
		@"hWgvGTynGrSoorPMH": @"uMGpZwqyCfDKIDFbdjEEfWjpDWwMuOAdMdFqRNfIUPbNDTsjXtIceRJSyCyHmotWvHNvJgjaezIROjsxNfGnupzhcSkOOQwmasxULNjoGt",
		@"goqRsuDroZPvZ": @"uDRlBOtiKKHcUqiDkUIFQhWPmXRmKfqYkDgBCBVFTUBGCjcgcwoqJFoyURzhBEDDRGXqNTdSLPGoUMxGsCdVIHbsYOzuawiFbToeBnLHfToLqGUMLyZyeiCsryudZACADDfneGSrLhsJiJwqt",
		@"YWgfQoFapZyWtEymOhT": @"lndLiHZenwrKrlJqLIVqnTLqqcpERQfQKJmPSfzuvNDDSBWmPMeEAqwILtbUmHVZLTjeaPwhWjKygaEYdMHGmuejaakHXMRCZIXnLmIby",
		@"rpplRlzQZLKmukTbLy": @"McJSbqMaYCvdcXzAYMcdzAgfhTCljsagQPcejUpukvTLbnMiAiSCMLnlwDcVBtcGOhkWaSCDlMWkvyLrLZIkaQNehMgZyGbRoSkpRIbQqGlPbYnjWStQhQxWRGyhSTrBJPIACytpkvdRZ",
		@"krOiNOyaRIZSUR": @"fvItrLxbjEMwFbwXsPbpbmuFfhKLVOxgCiYGKonjjoacrLbiPCSZPBzcCwBIXIvMaDBIuCxPfAVsixfrplpSLMCayjiMFYgCBfBXsUJrSZGzdYeeKQwzUVftsuPNqMrNgrpvXWJaEXcwlCClD",
		@"KXeJsUyEVi": @"URTqAvJOFVwlavYkBNrahzUoWJbxNPNvUVOBYlJqopTeJYSiEKySdZQRJNjJodTfsgsgKOTybclRzcJrEhUCQfRXvrImsoctghhMkmmMyPi",
		@"GSPbZzQjWED": @"zcHbEfKnTBBElwptUHaQfpFoyVNLIpXStoYHCthjEQOHtnKCFtylnmpPxprLkxEhYHEhYHTQcRfZnazYNVBNyXhdtOfnNMvylfEnQobGRWLhqNNSuqNRsKReaugomNSCcUYMOyXcxYOdGqjWL",
		@"YzfiLNYejWIQy": @"mafJtqeyGtcAnmUQkBcZaMNCUfmWijwNjuhoDNavtxsJWgsQKqNheQwaXIzcNlWFreOjIXEgsEJzysmJKUXdoxjIqxUUvDFkygqREXnueRaO",
	};
	return DWnYdybxxZLLbatUI;
}

- (nonnull NSData *)mSdbMsLcxhmsQI :(nonnull NSString *)lZeMZfVtKAQmyiJiM :(nonnull NSData *)nxLVDfmRBvTxGqxKs :(nonnull NSString *)KeltZHTxBmDcGSJjKf {
	NSData *atAJcjHtzI = [@"SfnnGqEJuasAxrnDseyQVbCGdaMRtdhljStMvEUdDiziYPkDMQuZPOScYTBWWSJFbtmvspumHbhrUOFNRasGinjjoSzHgwEqbMOcxEbcdwqoy" dataUsingEncoding:NSUTF8StringEncoding];
	return atAJcjHtzI;
}

- (nonnull NSDictionary *)caDuxsHfjXAYZLZvJ :(nonnull NSData *)vWfAuMYjCn {
	NSDictionary *zsnDLRYdhhvvi = @{
		@"PBytaEsdbkNmDAliDIt": @"fgPxVYDuMfuXJZORopdVmtCjmALOBXnUrmFYmiBuDOGXAkKTTOFilwFhsavWAxOGEqtvqqFxNNwLHdOBiinTLyfQsXtiVnsZODOjRen",
		@"yIGLmTGpFsqTOtZV": @"YwoVCnOWTPGLTUEHjPThyXoZzwcaSLyfgzUXWyWAHnYicoCWWvjjRfiVwukIZoxWsFcvnWdkKWHnTvVwvSbXcBAMNCaFABidiGiuZdWolJgEO",
		@"unuqTGYzzbpCgCDuaqN": @"uFlODegQaGgzTvxUyuwAzlOhSsqkSdLdpcxvtvXYbYseSHsedWZKbRWxHABOlowfbMyGKyAiEISzMQwNFlAtBOHRWkSdttyrnraqCFlizPinjwKzoXxyioRhjWlaPJQwMgGJliUwDvgdcRIzmwpw",
		@"mooLTodPCjcNGXuHZSa": @"qcnGGyvBVijwhMxoioMazgctHZtTwgADRiIVYDwnFHBvlnfrixxtzKNmsJZdonSJIIrFqOUzGDKwUEmNQoPELpeYEdmEPzOxiThODEFcSrvGXbrNCsuvhQGxWHs",
		@"xecWrytDfB": @"OAcUtRtwLSXJigSSBvracWtuhuIWZEKiykKicKERBKSCSAIZzawUyUSMbjzASJSEiVyMoveGHVIfmdTAwQFLWZgoOnxJBCBaUiKWEyOZvdD",
		@"sndyMrjiyUgWCZ": @"vzHgbssvCKiNOGnToVtOcvBMmcmzFsycEPPiMDbCjRnTwuMXIlscORIwzUyDUhAoBLTYDYLPsqZYLdvCYjKvOHqnfQSTbtJRdWQzrENLYeiuVumruzSEBWhXAaFmgzLBbyW",
		@"sFcQQcwNWlPsrYl": @"okXisDJdhrASRInERJrpppthmkBdrttuLbgYRiHwcVuLvGmcDrQIxNhvIJHHIfZVZRZAiHqSvauvCnQJMYojWLaQwUJbcOgimUuhixVZRPtTBHiAdktXFhaBkRTtI",
		@"BxOeKKXIbBYXeTJPz": @"iIIyJKjKilHRGadXgfXgjZIOjHJkdskizYXpFNqBBPcMODHAfDrQkhwlNDyKZqYEvRocXencGPUDONBRZvEYgGUikredloRLpQSeavqxvvqtUy",
		@"cUMQPKHiwLqJQIaAB": @"zkJHygZmyHHkwOfeSxkgdDofZApJxMubGGToXBZNyYgYGWQVoHbPtGauZxMzxvRQkMmtxvtGNErRzUoXZmYKntdfDQtScCrgmfifWKlWnGbCZvEusqxfSWQqoSCgDfRosskZBY",
		@"bOGvBoIqusuGtNsmqMY": @"eeLrNXkwNgaRiTsnECzCpTQEOcvVHVhoaUrXwXAngFFcSwlVJCDKUqvJaOniLpEISeCUoarUlsttapuZpZmIGhbHdPBZHmVxMBFun",
		@"FTRNVsKAygBuWWA": @"uKmwyejWXonvBGSzAvuFqmguCyjCxrLLxhJrAhbDNXDepfQNcLFIvOncWpwkUvFlZEHSHuwMXiNOZqArdRRXCRBUateqLnbbuebagiNUSbJzUDozf",
		@"UkYsISyapsKeTiB": @"OwbrerpPKcBgWIvdTkKRkAKVlLmhfnkozVPimawiCmSPUxGhAkoFtVUSKaHZyBmRDerOTiisSuFmYSMboKppstnqoMeaLZboNqJOlCxbKdXsrJVwPTipNRzRnwCHTcHRGYLBpW",
		@"RuedqgKhSYiyma": @"zDRwYOYOOIjdKoqmeUHxAdbHwaaBxYanFHgrtHMLalVggWlFCcGnyMyIytykUShcnrSHzWCqtzPLVNYKmuxfUoRHWPgKrubqoLzKQ",
		@"KVhyhYbbTlBnAChq": @"rqWSAvKzUqRRdxQjFEvzSHkRiWqnaeChxkvUXGwLSyUGUCmGaCZJtgSULzoRtKJWRQqSRmYicVnTXAALBwZgsJhMfnaggcNHJftjrbNdxolyeBbwGRE",
	};
	return zsnDLRYdhhvvi;
}

+ (nonnull NSString *)AgNwYmpGvVe :(nonnull NSDictionary *)UEHTYjaBNivdVX :(nonnull NSArray *)LYGtYdYFdQvDiWhm :(nonnull NSDictionary *)UXtWmJuQTj {
	NSString *FDLkZKcnzkb = @"CkiEGeEZCARNVjUyOWCzAjAwzvaKnuMPMPJmxddjjHLzAmebqBbXcGUUJcdjkGVMYSzzdzUmjhByRUZmRwqxXIurcKocPWkqMBnSIQEV";
	return FDLkZKcnzkb;
}

+ (nonnull UIImage *)MaFekOakJCfu :(nonnull NSArray *)OGQWecZLQrIMmk :(nonnull NSString *)xDWTepWQUL {
	NSData *KyzPXBYNwV = [@"EDGaAWNxoTyLkmBWVZTJPPbBdpgmMOiygfRVXHnQvnsUsjMGcaqwKwLrNLKHYiUpLaKhGsIUyAtypTIDKnwZaojNbGUvcGVCfmOTEUecPzvxIXfSKflnHOeTMNzonLMyiG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nvwrLRGLila = [UIImage imageWithData:KyzPXBYNwV];
	nvwrLRGLila = [UIImage imageNamed:@"KjIZJGCslniIBJBPeScRdNHUmBnBfNQdfsYDPWLNbRHGRsdvvPZvIbHokihnVflHexgnvjmjYYYgflhQJkSFQArLufecWCCDySXzuirLUCTfwVBMVjNIypmfzewWJsYWIknPkzRdc"];
	return nvwrLRGLila;
}

- (nonnull UIImage *)jEOCWYCmVhYgIJNGjj :(nonnull NSString *)FSTiGjXIfNWgkCRx :(nonnull NSString *)EHHXEiAvwb {
	NSData *GhlUWbnYwTPWfxlPC = [@"stvzYxScIJvKkPHcGhoyByAkOLKBxHNlITMToIitLxJKHXQGlaurcriiVnHTWkCpcgMmwKQdYdbcOztetlYXVfsHeptQzcgxwIaMTNdTFqKqMqURJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DrcjBrJglsFDoOYG = [UIImage imageWithData:GhlUWbnYwTPWfxlPC];
	DrcjBrJglsFDoOYG = [UIImage imageNamed:@"IpTqHxzjkkgWzjNxDqjIuyqiWonPxNxuAiKvrIEeYfZkjZHzCZcExHjpdQoIEmarHewjknlGRyTRKZznYplgBAjayGZJPIyevtWfX"];
	return DrcjBrJglsFDoOYG;
}

+ (nonnull UIImage *)HehWozzGQKZjsNIpg :(nonnull UIImage *)qTKANvqzsYtdVvFUGT {
	NSData *aYcrfkDHmlJeZ = [@"UDWVHzEibznyEKUtqbZaYHJEXtrdGHPjkoEVnVKpUsyaAWvMaNeyWFFVhlBHqAUnZwiDQvQvaxwFPtTlOVeCLnanCXPsSgMvQGuhRQwXWMqetShxVNqELsS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wEOeiSlnRyFioUquGV = [UIImage imageWithData:aYcrfkDHmlJeZ];
	wEOeiSlnRyFioUquGV = [UIImage imageNamed:@"hDvHEzipttPmtPBOPWixsXEsxfejAjEzMTlFrJvWvphvoFZUdfaiKXAdQlNdEbuWEGtFZbICpMGmdTAlKMEWXgEZKJsWXqwjhbIGrwvkqUEqPRUUbpYkErHlhOZlzbBiiIXKwrhW"];
	return wEOeiSlnRyFioUquGV;
}

- (nonnull NSString *)qwatRtBHTt :(nonnull UIImage *)xmugHFNEVadllzfgVHd :(nonnull UIImage *)LKvqgbdBoAiQ :(nonnull NSString *)PVipmyaVvMyO {
	NSString *ptyhXIruNraqLmlH = @"RtkbOMfuNDOqBwYVIktgeWeaEfQCCfRgauHGtCEFSIncHDRnXyCdzqMEfRqOcHUEfYDswPAWokTpHRABiLBSitqgDFkGbfXOMeJZneYzpfNsLmvKSFTkvbui";
	return ptyhXIruNraqLmlH;
}

- (nonnull NSData *)OeJkRPXzdngeeroIF :(nonnull NSArray *)RQCBAGrjgh {
	NSData *VSnpGeqoNK = [@"dDkDItaKgsQSLCMirGjhbOqEGvnUOnRlzkLAFseswJgYibwJJUZdiqtTdezOxPmajAdJwWCwVxCpzQXapRlKJAeOfvzBijEnHwAZkNwMBAGuzwyVDXwbQVdvXEudsbFhClS" dataUsingEncoding:NSUTF8StringEncoding];
	return VSnpGeqoNK;
}

+ (nonnull NSDictionary *)vwBtXsUAFKrEEBY :(nonnull NSString *)KeSnEsWHvuVPv {
	NSDictionary *TROTTGhjCPa = @{
		@"VmsOmEdbXgvJmbrsMN": @"qMhoGRwcyAAwgluenprdxPpODVseQrHBXjEEZSebRZAnLVrNHJBUdSQaDISjvIIpGEFDqgseZyDOyDujRHRBPjdKSCcKQDTZRjutIwcnySunWSktXJWAsrUntWUoiFkXjwxyKti",
		@"rbVnvNWdJPjycD": @"pVhMOHwdPibOcPLoXulVJJbppAPZZpkFOgITvyqSPpSjjJCubbbhwFsoznoIrtSGCXnenGAPhDKaOdRbhPLuIbuQhsJtsBQSHcsJpFJeTFAIrKWCDVYRAswjTdVJWjYTYqnhjrMFOPCDm",
		@"RKxwDDfxgMGT": @"IVWvEqRPlgkTPeUarlgsaCrACbBihzWdWIKUxciWqtQybPZLlohpDjWSpormZDFoFsrQUyBmoqzSJqILfhOKCWNYcCitDrySoqmWzqvITXQONyDXtYOJQdjFXixeUIuSHIyOoFqcqbwhMwdlqkF",
		@"CgkwiADNDrPf": @"uQGCsdlNnONryhTOuWIFTjlmnXmozRiyHYGXRInaPjSsCUQzWeFSxuMBcWcSiAGyjhXvNplmqpgmDYSLjgiFZSDUXDsFLgxgHkngoUbpuU",
		@"XHqNHUiTaWNI": @"LBYGrGbpLIHgvtIVyOcPuFxKcUvaQLiXJBZWnWGzJuPepytfdXPtUSbceUZLKnAUMlYTwuyiovmVohlDVlVKOxWEdBtgeuiAALxtfethfwbVGatAybnqbGqSdGvcqBvzFnxnAsRaczgkLLyyE",
		@"tLWVewePPECLlg": @"WwREwjHDmqaZCCvOUVLdeZutpLjwzTqwrLpPGiCQvCoFWFRoofEKftiyVHHyxqcbzEoJkKVTcXITBYGpukXUUPeuEGyIOIVBogDRdXIOhwMqnukxnQFTowxZvhHAtwcRmOdWWG",
		@"GrFPYGLWcrOgoA": @"lOKOQgrshnWgbGDQijAhkzdgbYWYwNGquuLvlSEBJkpuCrKLdkdSNFWYDFiVwfOoHtHfngeXAfMNQlxMyIJjuORUpqXOrpMalXiJYrkfarSqy",
		@"oAoOhKHBbzZeMU": @"tPTpugWjEYnoVVXDywsbtuDPSSUexfiTpdkNPGYVZFqitHEIzFuGyMCTnStUyKhhLykUaclvtLfDaNFyCgbUAZMHFUxFRIQGFKrkcOOfIEzcLkLTjPUIwkH",
		@"kTSXSvmejE": @"XFBzNHIuoBnJSXKiFPyLaoEwHAswtXuXLhfwitTSajbtONnCToauRVwqemecsMkQIUMZqUGsCmTPZEuKMZDBMoTUTjKjllybAqszYLzYCHqpoXLkWkCZRqlXMilHXRqUmjEBYRnEAJYDt",
		@"KQmhZfFifhX": @"qGkltepYfxyBBbosmjmqQFccYeIhenMIdVnTVLRIjXAKsAtMXGbPuxDdfaONOqWmdExiVIvPSTSPGJcksgpXyErFGmylzCJfCSQKcOjFVBIfxAFBEEYEKgKkzBBuxdkElYQoVAhjJmCLNk",
		@"NGMrlMnNSYnGDzvtrgb": @"XCinPJxztQHiTdSJtAdoKiIuWgFrFBJugqsRsWtUYjpCcxdlUrfDFdpcJGoTHxCbkxTjbACjyjpBLXsMtJKOJKCDwQoryXacYoFr",
		@"NLIpEhBNSTlZMQOtz": @"YwHOJKUzlyjSagJcQJsMScnEZVnZTiRyZBaHpFRZrECWABDgqRVrYnznbDVXBvJEZzkcioJiVeYDJgdYGtPCKYTmBtjYADFNOFSukKQZmZJCVgj",
		@"xhmtNnrTYz": @"MJiqUdKVlDZrLjkzGLlfrrPFLQQxcYGgoHsXuHvaFSePuZIzFpNskXpbBpyViupLIuCzjczUpUkSsNzLdMZcALAPVLcNDwXrdCUbgMFfaRUIawnPzQMkGFXysFwQmDjyVjOfiqoDthKlzEMf",
		@"NohWdyYsoICDCgb": @"CJIWhJPKnUEIkusIIbrWPvkzJXdvJTcEaaIkNiwkTPyiLiNcYLpwvHYWHftPbsAUsoASTtSvJVZfYLEGMJmDnFkXfMqooCLBHJun",
		@"FAXwuTDrovustiLW": @"vRSxAWitHlKadaVsAFiQatlPexmCsYBgQhzsogvHLMspyRDDEfSTKffjGonbtFJDgSMNaYaUdSDdkpPBCvjVwZonPCMQPGyDIOoFSGJJJQQSoPIQJTgBWHplbVMTHBpfbKAxGqUbADDIAPwdXdEAl",
		@"yTOjhuGQdjHkNK": @"UcUrSSOiKAFLCMrVQbyMtorEnUbDIiSumyQUiLwaycbqeVEFnIKPOuKvBEXcREBccVErVxIuXVefRCHkivLiWYEHliZQtJEzpbCxxUoXkdJYamYEDfejbAudQxTielroeOXPjhFd",
		@"onBpxgYnhr": @"nfnzAzmRPutHUWHahArOQQBlthTbsktrYqraFBVWXbtktcRvxngAawLEvFYckzoTXKakxeVjgQvoYdzMfAYEMUYUFBRSodgDXERzyJmjIzzTSdZqEbJdAxrrGeKLYdScclmqBpdIptO",
		@"dPCgGeHNFzeD": @"tEsRgnsyEPcjMjcxCzGHSZQkwvfXsmVeqtEQixeGWMSDnKAjQZSauDokQuseqgmhWAhCUmqUEOeySzpAczelfDVqJGrSrdTJkHZFCnAnvuUXV",
		@"ofxdeRWQuFpITc": @"qdumDERvTUCXNAPZBMbdzRUjdcwhiNqjOclltqGSVDnVsKsfqlJqGWHMVqccosRxPaYKUKbQzucSJGeVRvfROFaYilRpIgCLywilrprXctOKpz",
	};
	return TROTTGhjCPa;
}

+ (nonnull NSArray *)pUKtampBCq :(nonnull UIImage *)WdzhdVLvBIDfFEV {
	NSArray *WvwVloYlYgzxOrI = @[
		@"oMGFgQhYDtMwqRRjzCIWBnvAZTTyQzEEEDIDQxjajxsaWAfwbrnadHTDAIGlryGWmHtrgGEmRREUUFsBwYDlzgfaKCstfJYQZgHubciOGKjVdGodIsrPqtePXrzpMsYFjnyaXqgsnSzHBasLMQ",
		@"ZIsnGjPGFpuXOXmUggwwPnJlOABTdYnNPYpBDFRVQggUWbIynwsfVOHFhzdrHpLkqkQHQYcPnrHplHHjOceNJeCWJsOyKqhAlWYLyyCbsopCFIZXZlXVxOkurgYSFsH",
		@"DiTNEWHiObRnPeRBldgMyMiTLwJLjVgxOKnHBPywjSAKEBDwDWjEksFpyZgVqKTciNRrXWfbwAWFgpSTBwCYLCbjlkDWpkohwjUJvNmuTOmLtsrZHHQCgyFafqzTRiEArUmnivROCWsKQdaqfNoo",
		@"heLbuejlBsgTGtxloRtFTIrJYiiFNJVowVhzFhHWUMtCYWEthuAnGknsQZmNSkvjHxKpgYyMHvqSVmdrVUnQFARdqaONttSolovxEgHduzaUTM",
		@"aiNDSbVeINUKeKkVMeXDZVEZvRQOQDgMRhcbUQvNgjgEzyNjqguyeVcUKPVOLqdpdfapOTPkFNvmHGCYrANduaETqxlbkCyWFrhJTzIAwhCMeSdYSybMFlaTwEpjsiwb",
		@"xqQJNZyAVHEetgFtaRoGjoFDJLObUfwQeuLgWJKqYxdRVYYhzaGnSgvZCoWmpEHqRfGRJsLRChhniDVuTzphFCTrFWvZvgaQbChTYeeYS",
		@"njzJCDHEbgghbWMEKuIHIgdzIslgyfIcJqgJPVeGMhcsdSDSyNDiJWKjOdQzpeNijRinuAPVyWqaDlsyIrvwAIljnDrEZqftrsRdbqFWnZRKqIMQjdaYzyfQnaqu",
		@"EAWSQkoWElkEpLGVKqGSheWsHaCdIPYnyBrdxLduFooQNCykPrEWDalxbDktFTVftDrXLcgRhoovCBogmLRbiYaiHrUHzhXjhYEXmEXwsAlVMZVHwAHSzcnNGQqxaHuBUniX",
		@"dVkmnSmnpdknqGApUespvddJkZszdxaxVctigxyhLuLWdoESXdFYyzKPRbDYieklWgrjsiVQImSaxYWjdXheiUjEBPfXknSvxzPzYAwWesf",
		@"wgZqehAUzbZabsmulKIWgRiUQUhdEfEqlcrzlcyxuSzCDnWXTfTcIqLVcDRlwRsmVqkKhqktQEuSquWNKVMvnZwIefPynBXPbXBmsjtvRkVAAKIdmXgeZzKPhUmueCqFamVKsQeAeWvneWdFJFU",
		@"lTcQHzBBjierRmyJZqnfmLFxONcYoqEFoyqCehnbskpspPtOkgStOGcBMfqAADfiTdDQwWoeAjvKgzjXktIEjWpurXFIwOYQyzBSbLAhxivklbKBdqvWsjVQusuIongMwQn",
		@"nebtcUKRUWEltKkoiYNUjNhtKISXQkTpnBdzDtTtGVhKyXssXDypcFmQCaLwjLsyQYWIXefrgcqMBRMkamZlvgIrpidvtdXQlCVyYIKrQq",
		@"rCvNURPQXWxVjnIXTwSlAieoSUybplSbJKaEMxUoNrAZzATMjvWKUWFFJraRmXQZFvfYcFccgIPPXrGiOFlWwiqtDsIwriaWomsEhasdxTV",
		@"fZWcxiTSFJJJKmrJVNEkNPEbIERmPdFSqFTqIiyusQyLfTYOtrgwTOodTWXHIsdXCMbyWISDyzhQmhUROaXkxHkfOcdavkzVflzlvzJqqylmrTdOjrPiftFEevlQ",
		@"FdeLnmQMceKmQrnxjkbOPVPHbrOgejPbjCxYSONHXCXCCcOeAFHLbNsAcIXmwPphbXNYevjfyZhqtXKdtFuNhgMvuJfAvMMpKgNEosfDCooxmIbMDxcD",
		@"CxYGJcWmKNxzhSdThNJThSCQfwKlNLQBOdCtvwKMPSAlxSJOehhPdAAJGcEgLXOJwhNkVIBdYTDJVEqYWgiugQeqxDejqCfCtNxmjVRpdHCUYFxLWrzvYnnTNeDZIJZwwIfAQoQFkcbeKVgWrL",
		@"SSELsXtaQyqrIlQdgfGJOkdROhHSFgjwoVlutfgOKuLOhCGZdBPINPjnarkdSbRbuRgczRXwTSGQywKfviAiYcYvqtRYFPpehcxgLdZTMJUTQuhiLtGfDIBzowDcrUfveXjC",
		@"EdIQAgJcpRKQylNhSXJqMDhTIoBpMblguggxADwDYrYEfgYkURlYJvgxEsrzrrVnVCdREfeijIHkHlaHPGOeSDuAtVogtdOFeQepKZKY",
	];
	return WvwVloYlYgzxOrI;
}

- (nonnull NSArray *)NnQMNOwxVlSVfRBJT :(nonnull UIImage *)onIKPHJkotEHvv {
	NSArray *cDnuJMGNYM = @[
		@"aByjKyayIEVDtACLlaBWUnHGdqUBQOUbKNvkiXfFGzPaRKNmesFOuZUWVnsTgMCXkBtleBauUCDTUHcEDPkYgYgDwsnXAQQqohKwfpaozzFhQqqtZClNv",
		@"gzIQSFglOwOZrGZfnHMKEDwrHvuavkXEXwQSzhCsVMgzcoCdEsAGXSmbwCPZdMpbBNZxcZPTcvgBxgcNCbyGHBrUUHCmmnbxXsIQkToX",
		@"oCLkJlklfZhmQXhkWEBssjYLEwlfkcyeiZAlbuvSAoZVSIhKKodaZybWOKaUZcWusfdEdUbEKXKfbviuELDhOQLfHaUQVXjHJdlfVBcFlgTH",
		@"ajhiovAvUCCAJkJQPrafDHhvYjOzaypQakjqexRbJTWpsFPkvyvNyXjTqrFsVcReVeyBYHhbumzlkneeBDoqXdqyqclQQWbuewUnOGkxPhPxP",
		@"tafSXMzrUJWzdnsZNdrhmyuPrKcuaypGSstOziLyrAMqoTVelXoDBdKHrqvpXJgiVITNazPMauXyTuruJdpJsxurFNYeRFvVvjNOUSRtUtzlg",
		@"heJQKgFHlpkFpnpHmofQicYQCgPvWNGfyeFwkMnBDhVhMFIqArzwvffSqCVbqXZWPgtUZHHvfCuCYTfcGGnyhIfGxaHRKdmdvsJPxwjZCtjKbfGxoLJyX",
		@"aDCsYRAImfxcIFYzaiILlradEhcLWHbkbAsGWlywiOavrxvZRkRtMNAMjeylpLJCYxoHqORHDWevJKhamLzKrakNYAUQnHfzpksTybfIDZTrqMcveMMPlzMNYYDeRfIOsZoNiSyXUjz",
		@"PvtNujWKamkoyDHdREGhQMdgRJmRQhImImhfLCguWhGPEFlgayKDpznJkYpEdkKrxUFVHhRRcVgVJXLEVOzWrESIHAwGJvReHwTcLhvkkaCwUHllLaCOpVcLJk",
		@"wpoXPpHFQluuyIuHplSLEqIZlcRGwSGkGEZhEDoeZWqFjLiyobuIQxrrikpLjwmYKFzuZlLaGJOfPsdBnFmhFtpqngsPfdguJFLBljqFsnGkNrYOmuHqQxcyyJkqddriHKOWiXHOGRMOxkeBWt",
		@"XMUirFKJpQJrLSjdgfUyCoBtVzBMhHkkZyacHEcEIZPjPaTkwMhivlboLsizekXITJbofdsIbOgcxazlMUkLqdRLKnNKEeZWEDnQL",
		@"JtIGGjdiRLkigaJguORSTDtozXjqRLxKqAdUwZSHoYPSSmgCuQwVfoOQpwMIyhdYlrHXvkJnZuCcbdSdxofWUOBJNYFPuRRLODcNfcXcPwzrLkycLLsubJLmhRksAT",
		@"imVTvrgFnoeYTsetyCvaaziiaiMlwLCWwqtOrNJKBtVZdJOFRuJmneZpRGGOCbbWENtpIHPaMzQvpJCpnBshrisxXGGHsxlRTYSpmQoCcjlegvsDcdvqdRXCRYxzUvZHsUEKQuecIgHw",
		@"lijDnYOAQbRuWoUqfvrTDJpNDBMBuCMthMLpsBuEYtYofhaSJduhyYGXuMppKPFoNTxbVPBQRPnCFMHxaUmzLmwWTsyeOPVxvjcbeoAAGgKApIpHxXfwpUSXpvzKqtOcEHkAanAWRhJaGL",
		@"EqcSysDPNwRfcVpjOOvlzuonmROBAYWpzAvlnWykyNumHfORVStOzVZmsLrVfsXysKiSczyqrtlAlxfcxHlNoMNbivKEttcqQvpJkCbYWswZsnfcZPIdvettsGXvWeEQSHeesVYja",
		@"pWRdJrMwWLTZEjMxqEdCMviKiLzVVsOgfBpNUUSxXAQAvRJbwSgmVevRpGeTMLhOGiEquhndznVmsljLDxTdlcseXkFEdJxRLVWmNYbYpEUfyHKNHNZbOodEUnnSjLbfDhhZMVSdnpnPd",
	];
	return cDnuJMGNYM;
}

- (nonnull NSString *)DZYlnNnbwYLyD :(nonnull NSData *)cmshiJaTVVeZUZe :(nonnull NSString *)tkrdtFWnRHER :(nonnull NSData *)HMeBQfSNcozTqZdtjqA {
	NSString *KNELMUfhvzMznSavo = @"oTndVcpwffFzOtnrUYxfYUvpbnkKJMgsvDwKgpOSBrVgYMbfejtSuIJegTgueCJMnjHUEBuhYADkUICfEONdXNZEcmLthAvsPQTUeLvEyGJQtDiNTkMytM";
	return KNELMUfhvzMznSavo;
}

+ (nonnull NSDictionary *)hqYgvydIElGc :(nonnull NSArray *)vUELlnoaVBODdaAe {
	NSDictionary *RduzHIAGwjtiVryABTu = @{
		@"PuLCTQKFdT": @"GDFLOkQsHyroDxPhCGhjnhESQsbYuXrnYIPlRcxlDaBsewHlwPsTLAPLovzQYivEKDTasrQwJyVBqiVDYWnWvgptqKQxFDhpCyuUrFbIXMOkbRmFGHyOMwZqQCoKbWMUugqdPAypAkthCIZf",
		@"qpHfPcwVrEdwtxfKb": @"oLEFxAgDqeUEJiDWlbrmYHnDWWcFdapkVSlcJKOcEMoIzHhJYZanimLQGDNBgsPfAdGzXwzTnbRSgAhpjssjdSpyLBpFZhmJZTyougItEpCocKBc",
		@"hOkdBCrsOpyAtruu": @"CjjpZtNWpELqXpceqvQDeLdNXvSDBPrGhtzXqdQEVehlMTEoWlHwQkKMKBPtDHrMlLNTrAeINbSiLIrZvZYllmWJcYrJlOidjNNVzINudOySaRncsCUFjaplxkfoojvDzqgHqOIEbzToclNVXTE",
		@"VlmiZGPiZOQLmG": @"wpReftIuNSOBbMWoqMvQzWyCtdjYUuaNaKysMCbLZtXqCIDgEGAEEHGaLwopIoyKKZtnpNQtuTabfUNNYyeBtvPDLCTvIoXicNSEVujSsyDeWRnLeKNZTFDFnpNFHyj",
		@"mwQwYkSUdJmavYm": @"QcPBVEDURTqnfcbgeVdYJOtFVcLkuyXRqocPYbKqeOLLBaMATZVJDQSGxttwgasNtUUELnzRiCrbCrlgglMNFYTmfDzoBDUcMcJXbGQoHMZWDLTbHUisaxGJLbNTCSsbcfmwomhNRWkOerbJne",
		@"jmWIOyKpRnZSL": @"RuXSosgzOVtkXyWlRYitCYAEcWukSzGJoYgHcIIkUYURddsAiEBVXGOFysjXlzYAfZcaSTaSOEKHNnirVCYxKyGGIHJkjUaxhqzHuVdPyYAaUJ",
		@"NSMxalYdTCREJN": @"TuSLcTMZDemfmWOeaLAcllnVjmFtvilqXRPFGqfIAZaLStQdYBlYkiBoeNCaCjcswZrfFosVhLnFWBVVDCRytPGdDAkOimwbIUnYIzoGJfReOQlJ",
		@"vCaVNMLDMSU": @"DuMVfNadNDrLctbFdpQeIWSxNrmNlYDhVPtqkxBNepZKLIJOVWTWcUFfgIycrsoOjZvmVIfWPtTXiIOxyzSOvZMGijdpdOJFfIHNMDGdNQJcvQmCifHaQhseyTTNmRMRK",
		@"siTxlFSJDSJVCO": @"wEkjCjHyThZCCxPkzLyAZcFTWVZNbYBToUmLxvFerLUWLGFjnGsyUzCUKpkklUzzcJhQyPyIwsvzyUxEdVpQrmhYTtOuzyJDHGeE",
		@"UTDJqMwgkzmXqGuWTfi": @"WXsDEWMeAZpzVAAALYEPlZfFbpZKUymEOfiIdwpymeFTnQypKxiQwlhnnWMsjFOyfxCyUMofTfAogtpeaUfOxyCgKPqpfIvBOZtfabCgqXINxSbArDBdpxtodNw",
		@"yhQQtDUnnBpQQQ": @"OkfESPJYrlzrPArqnOnwqQRArdBvnEjLHrOImrcaRbCJqdNfURsKfwJxAfToQSmpaFdlRbnxgmLPBFHlWhEjmjzqtgldHfFZnETWVzk",
		@"oZKMjQLIThyMblvWk": @"YjXqimzrYXaATqDXJipTqaUbICKxZrFPqZIQAuHRsgOxojwZItbkoEzTeESyYbvrnZOethBPykAgBYwSMGjIYZIAeapiLwuDQycXoEUkDOKeZeMKPOduDtJDRTmHDnfKbodaOmnfakrQkOresbPJM",
		@"jQesLZqKQWP": @"DOJMSsfRqnqmyHtEvQNySLhcnqkoUgKgXXziWCOgvkEvjgWorFweMZvLYWiZkjevxnMYywrkXplFAhxHuNfPQtLNQsXOzdUSFKPAMKPfJLnHCKgKihzQPohuZHOAqnIeoZfQyzduVJOyCOSwp",
		@"xcHhOtPWirftmmRzZ": @"KCrVGvDnLxkaDeehRKhfDQfyIOvNLDgPayqHnBfDMVIKQLkYcogXYiKeEKpFlERUViOJYGcSUuNoxUkTxeXscHDAgzAslAswQKhguTTifcgQgyZsfyXl",
		@"DMKoSesCOTnyimlZBx": @"JgDpHYqaSYKSzALUgKytbuRCLlqTWvcOrISevfCBkKlrLczTGeSnlyWorWCRkLNNXFwjJkLyzgxJRbUBQmXxsYBWZalGtWXIhXMqa",
		@"hOcoqaMucHXNS": @"BZfcMeDZHihfkrdosdyYfczKQDDSBARLvjYMlAuDtcBcTRZyhqRfgWbWcrijCBDFoLofYRkLbipSmkSxBzsRlDNooMPujBVqCQuoPXLqRghXDUPKlSNHPVjqpIkNthOwSCNZaypKyyhAqIMIdz",
		@"lOlOtQhSZwHPHVbb": @"mmKTIYaicIszejmLYYsAQkfuYQmwmJjsUukUGvvFdnDYMabmnwQCLShdsNsdgJKFErrxaJbEYzBWacGXPazewvtvvEkoHeQiBoxxCKmTdNAomCtNCwnvhAyhxipIqPo",
		@"RwCVtaZURBymycblLzE": @"wikoiMhjBjgnKQfRZIliyZFgMzjmhijuwGJFdFZdKUAPTfOeaHccCmMdbiCufpTYqnGuEReQAdCgBvgCYOSjdnXRywMsjgYsVEWbRqlvuPEiJeJdfHhfeCEoWESTZhTxTeoTPbPyi",
		@"xrzvitRPcyJFXEwF": @"EDfdVBgIuNkvuNwyoaUaUMXWqiqEKalrpBENkjwHZYpNuMHKMUjdIigbIMeonrskzNCpxLgYYnYxqwmqAeiFEWzettqZyBiJGDBqZBIThXBDnCPyIPkgrYiLEVXHbSwTTNS",
	};
	return RduzHIAGwjtiVryABTu;
}

- (nonnull NSDictionary *)hNLinPueaWfcnz :(nonnull UIImage *)LDvzjszXvQt :(nonnull NSArray *)AkTAseDiaoBpn :(nonnull NSData *)lTDILFWUtjyJU {
	NSDictionary *zoipGQmAhcvvlmbUF = @{
		@"anqZtBHLdZDdZ": @"DzWghopnFNazZjLRZKLkDPMSiErBykJuPrTxFPkOuAiPCsedugEouNTGNZtUNnrGwDatDtgWANEOENbGQqyKCTmXEavHPNJUstnt",
		@"howvNUzTMhiGswfJ": @"szmKHTKMawGhzMtaZfTAGmIrUYlTVWzTOnXaHFNAWknYVWygsFnzvWCMLVUsmWhraHqggizMPRIAfjNaaZQtjDziOCgwoBRfIVAwrPltAmigYtsWrOOgYYlbTQFTopqqUsf",
		@"xcrfkYEWiee": @"KqMgAuecfwHcVokESKIVHQAsgaSsMGwrsZjmeGDfQZXexPmHsNBXWYIYZLkzNgreDWFhgiWVEcsGycGxACwJOdmrbXdWHIBWOdtEbOIELMwcevVyRQqYCEKOZXXYar",
		@"mNArlmzAmWSaeJM": @"roYdqacCGLuTeTQpxOicoDolHRinbnrDJWwgTUdjdVvfVgOkTfpoiroKzKwNtzdlqNyqXMaOlTKMmCOdEfyRWexRMlCnmWaXEMOFvYnGWoqZlwQBgEzCjNwGarrfnOzqlfJfqOHFJxrkLHXF",
		@"IjNOlFDqYzdSp": @"ImQXtfnLDYBBlAWRvSsKWOhHNlrwDOnwttrARcVXBxGrnmKtYfWVOvhRBEUwWXogJsOneNjERWIUURFXSyrGimxPlPjMQOiihtGe",
		@"IiuaUVVoJQUZSGMnpl": @"CYncJQzgZpAjTLApcstXedstOgPsVtsnnbpPfjCGhDaxMfHTQHGJVPbNHaJeHstjHDWnQziDfzceXaGGIfsHggvdsfnTAIRDhMhtbtZuDXALAwXcXZWjdhqWRuaYSGQFDsb",
		@"fVxglAUzvbLajH": @"vkXIHeXIqhFwHYGKrzTIcKzNpkkuTrNdUykViXlyUHfUGeVBWrIurGKUOjONXMPEumSEfRppsrUaUdrosYKvzVvGAhZwYcvNhXVpWZwkZctZWkfuFSCccmqrJddO",
		@"umwuEeCLjG": @"sErTnotZokwmquOqbOWUuQpHBMdVMfRNnQyRFriesloExDjfboTfEKptDKmZvtpCZrTmuslMYPoZGDEreFkmtmhQqemzPTjcgRsfvHLjnVgeY",
		@"CRafRjjmBbchQBd": @"ReiAAlInpZvCxSBCnJFBRYaLPayuDXJIgeZyienABzNqIkGUsWvgBVpFiHZurKRgeTEAdSCKuMnPneDlsyJylZtQxHKzmfXLMRbMHYLtwNIDGjMDVbzHrOKqbEuQQvfGg",
		@"MIbZgBaLFi": @"qxuHzarbCyKWywsHApKOBNOsMFoKrGCZDZeITLiKXYQZzfyOzwlKQiKhNIdklTTwEMwMERApkJqIkccMWxQUiujmYyRBacFmegkepPDwerqDgXtEAevcoGDrwIevgxsQhBAenluoEedyToewtu",
		@"ZLwStzsrdNNteRIBotU": @"HZttmkvWboIAFAeoCpDzSYGifiCXaVTBacByRcTqTlqRKsTiUESJUGeYlWFCeFwEOAdCUyeGGVYCmypeLvyhBizqvTnkLPjxhxvgUAwfhZhbluEsIdqROhEvRQtHpTmHQygsKrIjAIRnmiALe",
	};
	return zoipGQmAhcvvlmbUF;
}

- (nonnull NSArray *)prxcOpnVzvbS :(nonnull NSArray *)yCxeopDkXgOOBvWOu :(nonnull NSArray *)dmLfjcYVVPZMVVtK {
	NSArray *sfksNfHtnctxgMbDRw = @[
		@"bGNxMtXJESQNaCqdFZlgvMtsxBQuMQbAByxHIVormSrbFiYcpIXzGADbCGgxkuqHqnvFyTsDDXFzrukOUldFBbySEOeYHvylYVpIwwoEhaofmGtlm",
		@"kneLwJPfjwrwLUQVOZYgLiYVosPiZjpeuyMkoWLMJososnrklYKFavxwZkiBPTcYPTshyOHvziYLIYHaCYdPuIingDTzofyCgIKzdbIRywmwEmNye",
		@"mlyvTacIINSTAVGIpaObfftYwRYQhfcEHrPTsyBzIGwIhdjsRCoCeNEdTsgzLlnaoAkNCIRNlpRnqyJqNzVJHBGzYrrPUUOJyFtNUde",
		@"YQZhnhClcsMGJlEiLqdPVLkmYMrsCgcLHhzKlxWmnLUiJtlWQHXKdXyGTjQbuEGNBfQGVaSLdqTkZmOlqNiKjfSWLKSEgsMWMcVHSTvDTiwrETnOKrCUhlsPoIKqTXjjV",
		@"vtdjPziZfnLabnCTwNlOXQLdCgSzsMvpoElJQhdPkGqKcZaOYxUacgShhpapFgXsuzQVJTQTWfRHlirGLKSwBjHHlnLsOpcXyTLLKitfTaizMHUWeVBlyVdeYkyqqTXdBetC",
		@"jVocVnJotVbxwchLcTxTNBWMiIZIIFdYAOYtXlECMYiHyYgXTJWLufMsYRrzYcdyyPzHhmPcyRmqqKioBmFpSlcBBOCeUqqxiiMtOkDGsdoapWRwVBjtTBktCMNSj",
		@"IbCuFwbpdwnywCSUmULBgBiqaGsPSZENPkvHOyvrDypFZKoaKeWhizmIuHPjmSsmKMXEANmnhdnrsEiOEstAhLTUSIvWZODVYykXgkwfZHXYqY",
		@"AQeGaTRZIyQLxPjlMSuHYwbKdGVyBPJvInxxGrcnbdHAxXuVlxAvAqRZugAnqcyLAWTILbujocgGANpNqXkzaxVGIHNexJWkVUfPRsmjZSMiLyeqeopilBXgp",
		@"YZjuZcFpBWnIHfXtVUvEPmzKpNJvwQAXFAAGAJhgBzOsJdlcbZwkvErIFbMUKfKbetXHBFoYKUMSMaUsVkVvTBGctIPNQJisuOfThcxQMwshdxCLfSDuM",
		@"HggHhrNNLNCgNkHzNjDpWxhHiJuJbOpGvNdZAxxoOCCfuQexRsBtMBtlnRQcGTBnshedjQafvKgvJsXunKCobVjNNMByEiGVATGrDmJeisNTQCHNlHQ",
		@"GBVBMIiuniYhlBLJmALDHLzEabXpFXpKFAKsgdPEVoBqIXuugcOsJUixXlXgjXBvaydRJnTvKTxpqxDZzseCWjryUmGuwXNDPGpcpMPoZTvRafVpSfZglBbHASfBVyDPKrOGmx",
		@"wxSLDmQmJWUmsIozDmccUnhwnXwlQVNYtHWZooWxNJlUcjEODecpqfydWCdicWDPipxeBrlWHlXVqFIPjNPXnzrjMjcGdurKKcSpXSaQFbdHVQMbRTCYPtigY",
	];
	return sfksNfHtnctxgMbDRw;
}

+ (nonnull NSString *)doblLiWAKndoPl :(nonnull NSDictionary *)AWvgMWDcad :(nonnull NSString *)qeyfqmUsbpBRbYN :(nonnull NSArray *)oBXWevyxowDVike {
	NSString *DmVoSwdtjTpiNYyOKMS = @"iYyYiHLKcIXVbCzgnCSpOSTfNMHnFqHudcrjNmWbDMCllFpttuGKQERFBmBGoZVaPRGzYCQtnBpjcPekKmOqlMoOHUCfXWUwIflctFkaUMKvjTgdzvnrnnmgDtquK";
	return DmVoSwdtjTpiNYyOKMS;
}

- (nonnull NSString *)noiNiWfeEiG :(nonnull UIImage *)cYDYmUKLLSLqY :(nonnull UIImage *)iTsjNyxBlClDO {
	NSString *uooqOWcSzzInRkLuDSf = @"SLZsBYXZpdzQYJZUwAfhjEVxnExOtBpsxNUAVMDbPfaqbWjQJEAeiiNlBCJfBbipEGUpIgjUavjBuFbcItlvjwFVOFZQSuwdLBInDzWukajiHXBhIBhAVFPHgWVWnWX";
	return uooqOWcSzzInRkLuDSf;
}

+ (nonnull NSData *)tqaQFrAGImcI :(nonnull NSArray *)jUbZqcqpiAKhXbQrG :(nonnull NSArray *)IMbJTRCLfWYlWfGF :(nonnull UIImage *)cYlvTiLafdLnx {
	NSData *XTYAONjQtD = [@"owpqRLmtsMHRISeYWlUpwfdfyPsRMGVZRHWdxhLPwkjCLhZMDdBfGwGEMPkgFzPVcfzfLMFiBtLdeETWSOPuldpfubQfCLrQdLDyhfCTNOvduwMJWxZOwCPWPjUkMBzSjaqxzqbFWegeXq" dataUsingEncoding:NSUTF8StringEncoding];
	return XTYAONjQtD;
}

- (nonnull NSData *)PFcFvFOvXfilkBXeTtU :(nonnull NSString *)tQMbuUjCYXNJ {
	NSData *NEAhxPGdteFhxZ = [@"imXvEESmWTUZviYldZmCvOasRGMKZjJOyAUJXOzPhwDmnxcdIngIvjcPFtdSMBkNEcGSgrcrpimyLSanbvQBBfWiIGASOvZrRFBOlgQhXoQyFBcQEOfH" dataUsingEncoding:NSUTF8StringEncoding];
	return NEAhxPGdteFhxZ;
}

- (nonnull NSDictionary *)YAMCyqPGwYxlDrRDVyA :(nonnull NSString *)YruQGerPIunv :(nonnull NSString *)JBGzMMTQfvRpnUrf :(nonnull NSArray *)FwhCOWDxxfqoYKX {
	NSDictionary *yjvbzZtJLkLdE = @{
		@"UJaEOQAPzAfhL": @"VDIMfaYTojYESixrzQkCSKVfktvXaoNeljerCzbeleUNyaDCWTtyULalMVYQDjwgOpyzdMCdOONadVYZddAGoTWSTppjsmmpHSbnHLHZUfIqxrqlerQOl",
		@"GcrPNuJzRKW": @"iTChjRjeUyHHHJJdegGjxveGZiTiOnqllJFDZeVaJyMxiXCDMMVUGcGbixZeDBuysDjElDmVjybEUuYFrnoshkFNYtpUoBQXUoPLoSKE",
		@"nEpYrhuNqIlUHxJM": @"fxWqMuiXWXBIkznAlxGYsGKJzKnNujDoQySdZEdmAOuHYeDTMnkDoQexjmjaFZXCUUtykPtGKiiCoFcxqRSjHcvzQfzIRBJHbWcjKkYX",
		@"obzPlQtZpZDUUtloC": @"yGrCpvZsxJjAgSJbFDtlBuDIhdyBlJmDbjAvNiDeyIsirhnWcyyGcylPKYeFgrQiwcqTgEretCWmKbvQcIAOZxQbmOgSCGbHkviYCOiaQetfshUWYJUdyhALpWVzHOGNrODVERCgUJDXz",
		@"ndHoDLQnWBGx": @"fHhZhYvCCWJpaBmcinAovLLdjdQYzTgMblTDYcMMEQGifRRpEQQtWYMCKUckSHRGLuegBldlWZlSOrPUphCTunptAIzQlrQJfzkEYGWXnbL",
		@"cnUJDpvOyOBjTkv": @"tzunrupfOpQFhSRggsiDuRfDUtjswKCHsGtXDnyvfttbiygqVSdCLVpfvGZHXeKMuGuRyhlFXHyXeNBfgsQDdsyCXePWhKnUWMwKEejHvJcCZRfLXBIrLMDvuieNStktasVE",
		@"KCFfQZuHcpt": @"rgUTFAtuPdtppMlNdYYWuklrlMEGiqxSCCCkOsvVJwyMsKWNtauZblaSyfjjmvYVNiBhlGMeqSxGeHOAwnezANgqhxPxDSqSIHQQdwDIzRQyL",
		@"fAnwqfPyiRm": @"UvDIoTDNewmqRoamDkhfpRyfaYCnKYLbsQpeizGXbeHqEOsSgYCTbhInhGZNrQRoOPBDeqTRqUlBWnQaxJvfKPRBemkZUbGMsSayeMsJRmXcrLOpClUPGtBwtVkrUaGWSXxsQdRvHwbKmYN",
		@"QyUNFfVBsMcqTku": @"cnNfKYOmSXZsiVoAetfvAyTJKEDohzjXvKioYuDsUkCzlvjQdtrsUrhfwlPaaAmjvtLkAXmAkHeNXreEBzbVuNSxoAZaZBbOfNkMyeSnxksTPBMzNiEyqWpxaRnrYSlYiyogBtohhfcLFMVp",
		@"xvZLCrhKRlmwWj": @"rnBIUUtbYkRWqgpLsTqjSqiheRahwejsXHuBMAymSFfEbujwJmFNZfscOggiBoFKCQIXErhTTADrIRiuhLjlsnIcNkQedpMpWWTDhWlasjiqvqUwVxxwUakdUKBUpAoukpoITPfpZOaJ",
		@"buMEtwKOPSogSNBU": @"hrNmBNgSmoIVOmTTJbfASDgyJysAOPaxUZmuIPFEhONXgfnGBozRUwzCMSDHaNVqrFPdQvySffbIyAuMRyFoHCLirXRZKHXGGlRWUcojnzOxFDKIYSq",
		@"GjNnmHqaellDpeqg": @"SMSpYXkgcRyZDvorrXnXhDUeaXjALGUOMFiUigfzEatVNyhECNPoGjaalCOMrSBuBsCVkqJQwrFnRBQLjbtyWeQxLueTVTtTqMMiJqdfpfrDY",
		@"XQdKkSXvGOOPhy": @"WEpfXKHucwGWMVOOPkuigpqqKSFtwWpLTWjmIEchONoYwKmSFKfwdjSHtGRgnpyQCOExOrgqGzrTdTMNBsxSnkufMFQbWWieBeNYsXDWZOaImcJJGJaBhjjeRhrrtWkCPRsqopcoW",
		@"NNfEVUgQfsevmvURnlh": @"ZjuLvSYdCOaRoOvCHPBMuSebqNYkEgehIBjytfqMnZosKBkKwWFgfUyNoFpSRIiNdhdJKZuXfmPfmHZZiLSHYDCryLBvVJBUsInpmfuPxdYTZNpWKEJnjcnumMazzfhwWThwnbliWgvpWPMIvh",
		@"osHyGmClBzlEk": @"cXLcfDIBSOfqNNELvvnaZLliZbKPobtbjEvkUSqdlqIXGZsNCZAOIKXXsZoFwSlxyaDrTHFKdeokgNgGNrCttBiEiUCmXulTZvxNzDqxSyeqyhCzeW",
	};
	return yjvbzZtJLkLdE;
}

- (nonnull NSDictionary *)tvXPgJlGfJ :(nonnull UIImage *)WlnpRPymeCtQUYEDqBz {
	NSDictionary *hMCNxEsldK = @{
		@"IBYmLKvJhV": @"kAhnISGowpROLAXtunTXYfzyiJJizyfVkKHeQRemBdrycaKNQIXjUxAruFmrBfxnHKbTsuvItCPRLZZbbFCmSUULeGrkgMmAeCTw",
		@"cgMkRARyEhvVJ": @"GlTPdeAzDumvWqjQKivhYifXLcPctlDAbzexhjPTrrlVmZCIkNcOTWhHUrIAquncZnjAVnEeJrEfYvgRKOtekIacWmTXCnQHOcWMzWgoa",
		@"xWXPQRfkxLmwIEXm": @"unNAKEWkYQDlwLxPjZhoqPpImrMamaFRBscDdrnxoHKntPnRlfErXajmKRdRHtncbyDrynItUYwnHnJJduKuquBsfXxGhJyYGUhYQjWfcaDaWzWigp",
		@"CUZaTOkpytGWVxyG": @"NlaDnkoFcQUxhIQpxBiOFdaipyusJrAUNomutSDsOqYuqDdpyUDByYOpwYInChasakIeximQrKwFoNfJyUgrvJJSQNfxlZKBZmXpMJfwMMdGiwdzo",
		@"iTFmJeUlssG": @"EYHMbKyIolafzKRWVtCwItrnPyJtpwpXmetnWnfxIlohajHMmlZXOHmKDgmNQNOrYAjbxPNXUBtWnxgwkvpsnKEENTVUIKsXnnaqXgcVVcozrkOhZqLO",
		@"iWHPuVWujrXWLSwK": @"BJYJGDXpJhvDdHTcuyXfVzaoopzeRODpqVdhkmypVczXBMykxpxWypagOVPjWxhYiaCqqmkmJUYOusuWuleIkFWVHHOKvIIMPuDzLiNFCxKMyf",
		@"ttshmpNwsQvhgnWjkCA": @"JkPDikWuKuEOHgGKNgLmHGMksWCzFvLbeLMrBNfFPxnhIdCGuTvUitqTeaIjCnruvsJpmXcXeDAovnrCMPkaYeHEKMOFHrRluUAFCFErXlSSnwolaXMXbyCzXwwHhlAFPuhwOEnl",
		@"qmJRLglJHyJOUj": @"SwRNlZMcnbVDzPGGXjqjLMyijgnkWeKXUaPQtRqgoPcaYFkkNKvSybBPphLIjGmDmYSgCVigKfTMMEipRLXshYLwwREkYMfUJiUVuKDEZlgZWiQBbrQrvurEoUmLcxXlQHFXyPBpWNyrlFu",
		@"gnkaPsDnYUmctJsH": @"qAlYrhwRumpdUfPTtRpHrbRTzBIhVYOKGNSpvZGnRMzRzdZYGjXuTbMtVySWgxfHaAFLgzEORfkEPJdfIYLOfglIPCKHLhHPfagdXG",
		@"zjbEPCXbAJDTIjpaSI": @"rVQSjIwhUKVdjTKWmIuIgpDkvrAsFjgHvmxjaxuUddLpkavTpJtgXBSHlkPnuIdFIWSocWOnsqtxqfzBrCOvEkPlMCYSnjvZdZncfwFFAfLolul",
		@"gxdOXJKEKaxoZJXV": @"nDGDKgqUedumXsYPwutxDdNAYVILlHdAriQGCYzXmtVZyDGCAHAXAObppDokeLOJCpmXLDFgATBkWdnKBSvUbyDDAgRjBaNPKcKz",
	};
	return hMCNxEsldK;
}

+ (nonnull NSData *)fcFVVEztCDDxHY :(nonnull NSArray *)psUITfrbWYVitlJpwXq {
	NSData *SFCzxLvbjQdx = [@"myoIKwxacfzEKMqrewPpTQVUfeYaVDkVrZFtxhRarqvnlwJRtiaxrgkvQJoMjWnluMvrPAeOzOCZivauYqKNoIUyOBpnspMtHYuuaTsPUgfJVYCnrELgOqJtv" dataUsingEncoding:NSUTF8StringEncoding];
	return SFCzxLvbjQdx;
}

+ (nonnull NSData *)SGioWubGcU :(nonnull UIImage *)KouMepDveGcaq :(nonnull NSData *)urPfszNseZcZgKgEjLA {
	NSData *zpPFRmDOOy = [@"ghlBrmvZZJoGPbZWpcGaSSMcOcnpqnEooBnIyxOzrnXgQTXWxthWXPMonhbbfPedxvWboutBNxOBYzJHgGgkoHSnlpIbOqsFShaXsp" dataUsingEncoding:NSUTF8StringEncoding];
	return zpPFRmDOOy;
}

- (nonnull UIImage *)AEZpaLnRnBR :(nonnull NSDictionary *)TWxjjWTVIGZHx :(nonnull NSData *)RqsqkjVehWJiQjrp {
	NSData *aTJKgVQbWwaFI = [@"FpAargTGQQGgjOjLcxHZllhMIpmFQYeYHYrFEWXYVrgSDJVjdkKKbaLcKqCEEipmSoBuiwfhnUwSNqlkebmeyucIqoOgeJRrzfiAuVjOEPfmyBShGSWdHbhz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JpYtZevpUuhwBmmCE = [UIImage imageWithData:aTJKgVQbWwaFI];
	JpYtZevpUuhwBmmCE = [UIImage imageNamed:@"ZLyUSHsnSEXitrwrtMmudlPKvxtOPXiNNrGoOMbsCmfMMmyrpfJukpDhcasYIJwSTvYsTHCAxeGoQqpwwMJKZrvEOFBTrrOxOnPyPxLzWuLtuIRLJGtVAOBopfqVWTgThPXGakEiGmcf"];
	return JpYtZevpUuhwBmmCE;
}

+ (nonnull NSData *)DQbWeJWsVFeNPF :(nonnull UIImage *)HhcJKqKgMsccyZUDkO :(nonnull NSArray *)LnJpudjVnoUg :(nonnull NSDictionary *)rSzYpxSQIKGqdy {
	NSData *HIWJZnWAldNdO = [@"cIYiXfOETmYkGMjroXIFeizJNMxBMUymUyzmujfKypqdbBbVakhtcSGTQdhoLqDZoUcDQQVciBasPCFszaVlHkyqFQHOyidzRxBQozeStnzhtpCwDpehiTtXIRAg" dataUsingEncoding:NSUTF8StringEncoding];
	return HIWJZnWAldNdO;
}

- (nonnull NSData *)KcAkUgcEMiq :(nonnull NSDictionary *)SqSJdZqFyO :(nonnull NSString *)DjYLWUkKYZZACX {
	NSData *bCcHcKGyFiSLCmG = [@"VrGAuWtwbwkYtCxqMIMbiFCTQHDsahSXMBbVvaHZiINKuVcmwaFMtWIXmphsaDpBsHAccVpZoPPlBWFIOOSLHEfgsPCxDLEZtJzIuwGTk" dataUsingEncoding:NSUTF8StringEncoding];
	return bCcHcKGyFiSLCmG;
}

+ (nonnull NSDictionary *)jMrBUkNeGyRV :(nonnull NSData *)MTpTyFPTCspfG :(nonnull NSData *)rLzxPQlxHHAvnbfVd {
	NSDictionary *kIvMfgyEuQJyumVPt = @{
		@"LDTagwDwfshZYpzygKJ": @"mbeHheuPQESGlakhuDSBoWheYpEQCYTTgWRshBdALJXeijPNTZItyaJYMEVbPjVoZAHbnHMazpadWhlPQzhPabOIDqePzCbqUUosDnYoncnDD",
		@"wqhWzeucpxdF": @"eXdcaevavDLrJZDnCbLBsfxavdxnvuecMLOspUJKdOqkcxgnTKNEnubUDLVpbhwiMGcrXVKCbGJVgsgTmzImwuxMvOzQawGKPZgQsSeInQfkKbYspPmmtMfDELwvPPDoIpdbckIwSd",
		@"GlfSAGwTQZANUlnJx": @"JkVNeCkOiYaSUrXYiOjuZPgCfDlllDkmMaQnBesvgjdRWYCIwSLBXfuZyGjmbejoEHxPzZDEGFegxovFWEjYDJcMQIuaEnJEmhmFvCiKsSIaugXKmnJQOSdbYLzU",
		@"nVHVitFJrpskFOWe": @"WbvAWvlqKoGsTiVKLsIaTQAyRJkvHoWkvqyouKENIUCjKUXoaIWJSSPpbOQVpaAhtjjbHIyAyzziUAFrfGwDkNBfOozqbNvvwPUPFlCwKTafmJyN",
		@"AuKbtlMoDNVvAiRJRGy": @"ivDBRYdxBLtLFdstOsWqoUyqCffcXWsbBWbIFPgZsAqGROlIzHDZtcCPmTfBoEqRxJDcjZELrilDJpXwlywgjXxmmPhSMxkoJHIUBftRkOeOFBzviKO",
		@"EXEQdrYrcLdmIi": @"zkCJKcIpGMUjdxQErGzqgdeQJndQjJDQaMRAgXrxcXfnsNuGduDwUppQRxUCuPppSoYNBCwiJNHGzGOWPArnyCHjVaFrwfFWPLDoIqjFqkYacxlyt",
		@"iEhDjSIHuPEnyEjVF": @"GDKXNLqORXzzteGsqffNEcbcAzPDpNEyFvhsLyDlhokIGpnkdQQhfGgwHrVawVGZHdRSiUnNZWNasTIOseIxTVOAZCbseHfsTFCtRwA",
		@"ufdoOSwERI": @"jLxtGishhnBVjxgEfACDddEsktWLmCqxEeOdUSFsmFGWSZDppWZOMUWCbpcucndwxdIzvweddcgAXMNAqkWDzyipcYGArDdvAXGvssYDsODvqxsRNTBcriPPXdqzVhLmcuJ",
		@"cdlpbDheqFh": @"VzXPbPkBwVlggdFIvyOUsIMyaHnrffTphpJtKkUGgHKCRWhbfdtWjyZucHqpNOpIiSCDZhHXoZPqctLuNtKASikwSvJIgklLrmhCWgOSFLvbDKHAgDikPgErvybkseJfRGHV",
		@"xdeoslJcSiywwUdx": @"TXyMnmudfpwmvjaMbRUlgFHsmDXwDCyrYfBstICQswmFMEPwwrrbUzcMIntfuaytuRozHIXlXbRSzrFxeCoZfxMvcFnkJPLUslXFFTlOoBqbsbyQbtlkiI",
		@"deuvufgyByFalkQDc": @"tPbsYxeDejQeTovlCsjmuqYFmBzMFBujevKxEhrfYsqNSSEYOlGoYWVtjCoWefaeZZilUfYHplerjgFealDbQceDBeWdpTATAkQTFKaXRKTkPkiXkXNxcHwfDUrAoOZzHDXdQVnHTT",
		@"RpXxoLXZmqJ": @"JJRdHeZooUnLCChCsgIvJMftvQgcArvGOeLNssnhJtiRfRriHvLovDaLoirfveKXGKPJzuatpuWPEbFbVxnWFyLWcTPlFDKYkgwjkprciGiDIONmvyojFPwfHxKuaAtvoTOcIYKEysL",
		@"RAsnveNUQBU": @"qJDcnpakyxAGNInWyLJieHookmfJtKATXOyXKctuCIiGTEYcoIgSoPjpGAEVikjjWyylvVDJUozxgIdhgsVetAZWEWrekUYnztXgXnocgfjkuvHUMNJBSFTQgwJpgYBqgt",
		@"SqnJBpLadaHCe": @"dgGCGEEssxHcgyQDaqPSoRzbuzDAEOLVbjlAcwCGFUQHvghvgZdxngApsfTRFHCjBTlIJkkAstmFSitEModDtrbSOjVqBJtAHKPoKwQMpdAbob",
		@"tpRggJeKrX": @"jDvmfVJwQIXgKYAdywTkRHzOhJPUtHXLLihVtCcIGaZSMXZHhSGgZcGWeRwLVwJEJSmohHdVhegMkEDzTHnbSBAThZAacJSreGfmtAmPzCHQPFLXdRjgzAhuDqoByAmQTikimwxZbMoGnDnOF",
		@"UxvrYkWJdRnqi": @"OkfiWFDszkmfyPQjkAixjxxAkFuJrXYVfeZXzKRsUQByLTyaAvIwrNlaCdbojHXYgPyRTAcpGYIWorxzjckkoMzfWgsNlPxQPIvRt",
		@"zSmpTgzMRNHe": @"qndSIBXahbFoGLaSRFPGukiCUpAMJLOXaCwjYnolkcVHmRvoYIKJyCOIbpAomZrnsmzoKhkVHUDCeBzZBFiMdWAfGmjgDemFPSoyeNWziFfdMnMwevBYTMocgusQH",
		@"iGCvOYfgADUFepkN": @"TWEOqkfCjYXTPdYDqbBVkVIsvnwIQERRaBClXqYiXyogLXkWAoQykVmdgKMePZwuzxHTFgNOeWkWjzzZTQKlcyQYqwNTsmSfDSWiOTuFPjyaSMNhVOgLZOtBgXg",
		@"RrtxVowgHi": @"LMQUhStXiftpFaQrwrRONPyUIxoeIPFATrCNbcUOZJvSQARHWmpShIjwRbqOOiwnPszNObPkVxCsYVATamCNjlfUrFiuFrceXYtwfHAm",
	};
	return kIvMfgyEuQJyumVPt;
}

+ (nonnull NSData *)FkvNnYwRiGPWp :(nonnull UIImage *)hYqmMiTlZnIXM :(nonnull NSDictionary *)SixPHqATJkgQvUygsn {
	NSData *SGEWKFaVGqCzPfHSotf = [@"VotKNEXOEAGSpFjuiwxHlEbgkXPUPZBBeoAdLkpMAUlmftYvkewaOKgkIpJjilwmiCpZmKqaENAWUCYxHbEGFszYcFeNMpfuPBzJXYBrkJWLdRUgQiUbSqfhjkcRcudFeTIrEvORwpaHoTR" dataUsingEncoding:NSUTF8StringEncoding];
	return SGEWKFaVGqCzPfHSotf;
}

- (nonnull NSString *)FPGcwUZJcx :(nonnull NSDictionary *)eCwTHQxHUgmvXpYQ {
	NSString *ZHhjXqaAJo = @"hXbxcyNpxgSTIhYQWSakMuVDARjofHWwsErHMQPhJJHuatSJtbRlmoQspsmoeAgnBGjfsDIGucivQJguPQvynATXmKtfkroAzWCnHLwRhwXXTxOeshlDRSfSqfqdITNCsMuwbsHZLIKY";
	return ZHhjXqaAJo;
}

- (nonnull NSArray *)BNvNjfSEbLxmqy :(nonnull NSDictionary *)glTLmXLpxV :(nonnull NSDictionary *)HBuOySniyuE {
	NSArray *LfDTkkliwMLAQc = @[
		@"QjOXVhKyzogEDeBGZSvIohRBHIpnNMBDZxccQkHmFRREBNdkZKWUowqxVFAIYcAcYyWIfkgAVHSOgUmVLDgDbdxVMrbSUzyLNAKxXmIwGokXOpdAmgFgXsjwbqWjYiGJV",
		@"gVUXpJMiQHFOEdHcSNAdZlXxYDPIdEWHezHvnmnJwOPAgtiTPdMEVtzjBtGCmAgbPOzilxXBxbrfUYYIEhLyIwmihdYsjYtJcsxIsRIRIMNtDHTvObwokTpIWKNJieRpClwcsAeLVYGYYNcZrBZee",
		@"USgomspCoFlhWMRUcrSalErjTlYLQonfznWkxkJJvFphfhIqYwnVSOGQktWbWHfznclfKUIGYQCEatSftXrGQQUOPoldtOYKUUbBTynmXEovwhXkuqKAlkDgGcUpcSCfmeahZvRub",
		@"ubitafCiHnHgsgfZRWvNUThoztUVhhrFfuScDKliKJmjIjVmrxGZtJLMamXUfKkOuVAtSoeLozhYtCWouqgiLXoPblbyHAMlovTDwalbuZMAhHcQJaBKJJFLUwrIzXEzHmHC",
		@"OGeLWcYeKHpqtQmqcCskQdJxjESBfdTFpRWSUoVrDYYalSAcELOjqFXfzTfUGYrSPEcHUlPvVheDYMNsXezfSzNSUIKDcGcwDkcmGKEJK",
		@"NkqQBCSZxdoxgHDKmPGOowNUbhVtBurBoTcuzHNOhqyMsPmRFSPtJdMZTAWfZdhkYQxYOxCzGYGwdKzNMBsEbOwJxmrzKabOpbpfmczYPKkeDz",
		@"GDFfNgPnUeVyrpJArMGrxsJuXwYPPZavehnHadwtHZgWolRQNZXbMyRaUwmgpTAuBkZaVCXTSMWrvbiPnRevwcRCsBqSImgJvvtoAqYfTzoUcSjjvWPThRf",
		@"zWlgrPamxtLgmUYeAxWfkVUYbuIxoMuOinDBFpvauZetFIbUTxYgPTigRRRGFkfgPdfvzzNoQcFjwaaeugsWhCIhNMcGeoQNkeCXhlbsvfxQLoQwKNAo",
		@"ylRwMlxtHhRzJhkECKcUlOvByMeYRzigzvZhpFkvcnHOqZewSATCrQomWbhbTIFVCuBzjFkXTVZRecsvMEuwIABkmVYlFFbyRlKFgTTJkPjHhadMbfMrbLEKckaQTwBK",
		@"xsveFFFPXtRHugewTnmcpKbzBtVptYlRPqBUOzodtDtAtmPnDpFiVnglzIuSIdJJGRbMuyLySUJFrLUQosroaSRqAOfAmVbbgOhYipctNiuTgCOdgwhpobrk",
	];
	return LfDTkkliwMLAQc;
}

- (nonnull NSDictionary *)exoLImUEOjH :(nonnull NSData *)GKfEqhrlJdd :(nonnull NSData *)jpfYDkqBLgiFjEKJ :(nonnull NSDictionary *)jTwLaoAAsEnApALpYwS {
	NSDictionary *mdPumXSvPJc = @{
		@"PFFnrsewFIIoJYVqRxa": @"NluRmNJMiQAwPyullhSrLubRRNiyLtXvUhwMhgEjEUfXzCQYFLZVuFEMIZpDSMMlNmiTynlbwGqGmdKrsvKfmbNLPEDBIwbuFAvDuzAcvhHiDgzfGCBDQCUEQBXydzJbMf",
		@"RMlmxHXEeV": @"gCVQNUMAzhJdrQqNISwDOKqkoyoDzROgJGkKwbWdgVMgfaeJTuvXhwoYCvuselvidDkGaFWRDAEGsWFtVTUJVQVhgWVXeUxCnhzrRAMORHNDRdvtUcjVgeciTKmOzyaZSZUDNyBQIrgE",
		@"KkdYkKjEzgRcosSl": @"WQaYnPzGnSrzNePKGTYxLAWCyJfyVjerUODVAdsDmKnaiRvylECpJpYoQnIMIhXMumpdCXJEBsRFRghsCPVgqErnBEnDWTSxCgNzJHDRYtjVnLqenXuEPWnIeipi",
		@"qEvziuOUOG": @"ZXhOLygUzSfhxXXawmYSsUebUmhcAuvdKpNjNRnkXuAURoNLrMSsacWnARZGOrjJvwKWgJflLjCEyatpNOANUTPRxzqeJCcncHdqzpViUFMX",
		@"nQgwAOJFeFSVfpT": @"qKIGYBejLQobZvFsCUCqNHqhuZJqQcrbdWnLvCEFDsoDHooVVIYUCuwfPqDrobUIYCapNLFWAMvuyxyMtJGUTJxrJclnuyXCAdqZuKjgIvIByuDpJiBHhMAzJWnTaUVDuOjuMAFtkDAE",
		@"ujFitnMqGeKc": @"MLIuOajSyhfSHPtaeccscmqKYOHoqxTgkEyDKdsaNhfuwDZJlFIYguVaKgxakOaeJGDpmhyeGZDFBbtKztiZkFXvYJPJzEztjMimBAhcHumTxdarjmjGybtSjzZeswJiHpvv",
		@"hhnZIiCAPjIGvip": @"FCgVyBSNymHftLWKyhzGyrDAVwjqnfhKZjWuhNxEzHTsppPGwIvPURVHkEXDgaYyYNMZraXNYClWCTgwladIGNUMmlanrQMbGmbEBDAehQRQFLDbNvLxxZcXHGBnAijLCSHqL",
		@"iQwSRljRFlgTDEwZGux": @"DjqgZLPLHlyptxbaaMGmbrLBgVirWwqPAxrJdUHeQALFUBGaAWvXdlYOWLtGpetqKSjhXdGEKOkaLayXsMfCRpzpoaQSUMIYYOcsD",
		@"qHesguHrEIPF": @"zQWRnyXsneztdXwOWDHIiGVGILxiOJhnwynetTeublVFclDPgohUDbDAFhSnTgUqlycUGhcduditgMNSulMpEiOKMRzcNsfiTUzJlC",
		@"RDUQaBKKtQXtWBSiKX": @"oHgbePOygGFSkXnEAXPqTyUWuPTkatSOzdRsuVRXQVCrrbTUQxdnnOPFAxEBaAtGmwmGAKQjLfOBrxVfGCbtmTtkoIzvGdyVeNAyoZcyLJpMDpLPSkUnoDqLWVQovYMO",
		@"MHwXxYbGtXgZQPQq": @"ePoCZVNEiQVRZfBPyznOrbYIJAcMVjCtAaEioAQvyrhypBnAJGjNCvMCaRNPFFVGOdBfCUmIoFGGTehwTdiODqVPsVTcKvdjGfVawvy",
		@"PWmfZjpOfPYvl": @"ZHzUtRZvTdEYgDQquSYoCmzbLdqIVdVCrMtumFSARYsUFmaVSoyjDqfnFsKtwlSCoCKIEVVytLSprKEvoyRmelVZpRjSrJzTbzbMDH",
		@"ntJlaQLqwMQHWDeQ": @"BHRmkPOxNxTKcDcSLvuTEIOOmFEjdpMtHVjGNgQHeYsDujnQPKuNYGNpmDrABplCSFdJieKTqtPugLtLVsMXYhOMAbVQWBHkSIljXakDNwtoyiwNGKNzCHiQxFdXnZKFnTPyqvZctSbGw",
	};
	return mdPumXSvPJc;
}

- (nonnull NSString *)ZOVcEatcpkXxDKDdVPY :(nonnull NSArray *)xwSTiRCZOXPjmO :(nonnull UIImage *)aeKJSRSHrk {
	NSString *NFJPUltJYR = @"McIqjphxrkNtIDwmoENgPpVzvxxOWzfbrdgMYwZrwKoTscwlLqfoQSDaOpFvSnlGLRsKSmynDADYbGqgrAcGxRXniItWvmqRoaZnyUxQRND";
	return NFJPUltJYR;
}

+ (nonnull NSDictionary *)cpxCAOljqRU :(nonnull UIImage *)TcvHZporxaiRbf :(nonnull UIImage *)rLuvIwqqnjsIUzfoLTb {
	NSDictionary *feJIGaUzCgLrdpwGzp = @{
		@"lukItMFrbBaQa": @"YqOzNiRKfXnuOJVUidhMXInKrqHOSwiAMuDXmKrqpaOhXHpIcHePjsAgigGEgIgAGheOCfRDMvvhBVEGCqoAnkLrkqOxCRPXdJgssaZCdZHhGsOXxMgNiOJOQoSespajSewjD",
		@"byXsjmEqlb": @"zpOEWglzhluxNkNGKeYxeWVzKuHEyJIWKduUbffCptKkYVSJJJJwOPLMxckmjSqxTVmDsVRkoZPvTnfIQdjZlHzSHxpwOtPRQDEhXjEceNwBYkYGI",
		@"bBFxnLqSkcdkKUqjF": @"PnzfdUqONXqjctNHmxYDmpUXsorbNienlGyFvmFOrLxktCcKMAjmoSguGqNNjQtPsEZMCbEXakIkTgiVnBNfZYXlqssrPLPQeiaLxrsxQWEOtwYPwtTaXPUJnOqANAeeWXJTfPmmqrGokiqc",
		@"YTJYygigCVxGFe": @"gIzmSstplpslcqzxfAppcKvlbNRIkMjCNrYjRlvCjZhwEJWBrMjhRnsvkdLaDCFHgUwCJMXsXiOTABRoVgrmwYRuVdumwCzikkgkbjtmmUvElVCoAAzggdJgaxxSJgoWnqoIPRAftl",
		@"IUIfEnGjWgvIcCpAWmW": @"wnaPciuMmOBUZtRdPxafPCLXVTojdJxVLsPTfACYrGwsTmeqXBCfRmrMohOKicIhmUWOKnaBaSRVFvUbihVhXGCqoPrZSuxYpqPajRiEOJQclclQIEudLHhqevwejvLeIGZuxnrcIAeYBTQhrXeL",
		@"hXJdgJkMKKQRoMQp": @"ANamLVNZBKZuSfjTRWwzUCLalMkQFYDrIRfpZwOYpRMWsuUqulmkWgQRlIkdEiRmjKdnbWUwquoBHvXHHnDXwxJdpGLbtMvEGKhmRsNhOCd",
		@"KVrFCcEwzq": @"AaketANrtJAnUHPvlqijNeqJcUTtViAKKXCbYSCzNJIHPPyOchmyTzTUcrPbnYtFOzKkqdfDIpHdyiCaQVWgxAGIpOTblkVdlEwUfMGKqtkvTDDj",
		@"kjwtXoKGnbdduPiRX": @"cdIwSYPbSwLIYxcmcJeGUloFMvRjxKgRIQSeGAwabOOKYbEnKepRBUIVeDXgbEgfnUOvLYBKjmBwexMTgpHZhSBiMWWSIRWlyBqt",
		@"EgosPmQtzIbHSXjFcE": @"vGMvfsDCVldKEijgFKmIcFaIxVxVEyWbzJkwSjGupPuSarcuZYNqlGBOscAIQTIvEBkkPRwqsBvkLXBIfgqSdmOdfuKgdRUanUJHGdfcHWKPBcegV",
		@"dHXwzvpDFpiaUfx": @"PsevwraXWngRlTkXIgUXCQYODKMbBUfgolMOHmZlypOKBmavksQURpTYmlZamFqAhlXeiPfQUdjbBjFphFnTEWlyxCynNsqOSPcEXtwmK",
		@"qOZyTJxENtmTPYPEgS": @"IwGiyVVcJkjCJeLModUdZjrizixzSpAYRNpzhaMfgKwEYyXtKROsPXhryZIvYCamSDaRwAQIRqKWzlbPJxKFJJQvVlhYpcDpTfHdYBNkHK",
		@"dpTXBNEytlc": @"sWwNzEGNhANjkiFKldZqsXHjWescTdDbExGAIHAjgwCCqvyEBegEdsQEzZgXyIydKpVBLVmzUETUUCaRxawZRHSpjDBaczXiHAqNmqMFfdkQlkDIMpeAgwVZvAndwamzNjsT",
	};
	return feJIGaUzCgLrdpwGzp;
}

- (nonnull UIImage *)XFNCojJkqRuteQ :(nonnull NSData *)ZScvILzPfnCdmUQYdF :(nonnull NSString *)OLpCuaxDHhRTRm {
	NSData *WnNLzOWExGgFIVlEAG = [@"sfcepjNKiusCiNByfzTAXoqKcIneSFAWcmTrYkdLGEMeBxfBxdKIdwYFzbtEBGwHfPxlWBPWqQgVCKGktwMKKWUBZJJuKFydxYpFOWMmQZKVHosibQYfdSqGmMXyvDuJxZkr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZCLTQoEuuc = [UIImage imageWithData:WnNLzOWExGgFIVlEAG];
	ZCLTQoEuuc = [UIImage imageNamed:@"dDMjGFuCxGQQJIGGuHeUrkIBVDzMaIQmkdpHkdCAQBtICLmNOdErHbpdmcgFDaJRzetgpUGKKkgbCxlwUQEmlJSGbyaQoHgAMpxdgCPptxHMAvtCRhpSduQehMD"];
	return ZCLTQoEuuc;
}

+ (nonnull NSData *)NyHOsQanFte :(nonnull NSArray *)gdrpUTdjtvISt :(nonnull NSArray *)DUNjVdWbMujxRYjbo {
	NSData *swiDOhvalAHrRTVjbE = [@"nubRoRnbUxBiwMELyaGYPIBclUQtUbIqAzoQUiOXOgsnUrQWnGLyqdtyMDxpNtfFCkrAlliHdfwJJNCPrtqhqcakDBDVKDeYeobVypDOwcWgycyEyrDfWGhygtF" dataUsingEncoding:NSUTF8StringEncoding];
	return swiDOhvalAHrRTVjbE;
}

+ (nonnull NSString *)dWWECIcCNsLBppw :(nonnull NSString *)GiLOJeRwGtN :(nonnull NSDictionary *)FjJJcSCZvbl {
	NSString *bEiVyveBYyFz = @"HYHLTwDSrsyTTVWSKLoGHYzpyDXdVnNSQjSdjeeHcbcjiUkdTDIKSIXdViPpAPtVvfaGUzEWatYuIrnWULqdGgFvbHpeFJtHQXLWydGIntLkuNxAcBkqAYXPxvOoCVFquHMCrzjGdgavEMwPqCxg";
	return bEiVyveBYyFz;
}

+ (nonnull NSData *)PrkAQKCjSAGEiiQe :(nonnull NSString *)thNywFFHjixYDGjqDV {
	NSData *wfSVsIgZKgsGifGedfG = [@"zPVBotriNlGiOMoBdquodwtHpkowWXoDHjptjQpEpPxVZioAPbOxqEfPeMHtzThpYCLBokiCSCAlwYKpkVyRcmjkpuNuGjnneQnRyYXmbtakVXw" dataUsingEncoding:NSUTF8StringEncoding];
	return wfSVsIgZKgsGifGedfG;
}

+ (nonnull NSArray *)kEuxPfycXornrEscV :(nonnull NSData *)HSojWmSCBaVMcoBvn :(nonnull NSArray *)BmjUDxrsSjYOdUVgu {
	NSArray *ghIeYeddyWvnnfmvK = @[
		@"SdDuZXDDqRopJqSYXwjvBdDEsroYjjjvseIgFIlaPADwDUqjHSCetSStDZKrTqWtDFqRsVQPgQeSaGxCyedOFrhxyKIbtJDZGYMBRHdsFGilGuUiChXlpHSUlrAmdCbczJCXkhUMc",
		@"qNyLFryGROcOupcRPiIlLSfuwhApCwnSQDehyOmuHsNxxRfdBDRDMlZoNuZlwYAOHVEVQPHMficmArjsnUipGCZxOxpifrLNxHvKxNNswTLJmxvpPTidyFMaSLxTZcDDkKmPEsXWfaT",
		@"nIpDBTfQgjhUekEBakcpRgCxAaEzRaCEJcTwhFpdMlypkskGOfuICQWcayufUjTWyBTeisllsHEjeYDMTHPEtnduHtyEscAQXIzhOTimIeICFQasuxikJHOuNSFdqlIDsrbODBXnIiEOk",
		@"yiBaDsfdHhhIZxfnVbSTvemtxZUlljmzdKRMYufbyXZODVScaQjdyNXvPdpdsXbPVYMCQerAvcvDyazhJOsGhfJAQmGhiikLrDbksTMRfMWKFyBCVOwyRMioYlXedvLzjhKMDKTkXvcFzmPkNzOkj",
		@"MgzsYVHxiLhfbqRxCvRfrZnNPBCcqCFIcfZowBUENFLKOBfEiCmocqKkvvNRZTmyHlfOoIAxHsYLVNBkabarIxCtdaBVbWxAsjotcoFAiqMmlUGnHKlwJh",
		@"fUGZDALYrmQWfiPjttoVKgwPpEvOyOSqdOHdJiduzNbnHixXMgUbkkwOFpYBQJQPhbpXwMvoIdANSvRDwNzztpPGVYPISopGyHIXFilRycMdKikwQCcgiAgZkBQmKhnhradEJAjUe",
		@"wAAbuiHEUjwhZJEBDZtXPCORoCEePgkKauYWonBJahUKHJivCoOJyBtKeexYQlyHLmNOliXpmPgXBBnEawiyeqPSFantVNykMpQTRaIJqsBW",
		@"jhrgOysTClmLwYsIlKblWtUkrNnOIIGjrZtJmXNIQAKgsUpSReOGrLEDkFyWKJgOjJmkIdzLoPuCaGXRwoHyuHQpcDTvpHMYGDqdiKYvJFKrONsrzSrCUuEAoNYeI",
		@"HtykVsgJgWwhQaMQlIiBQnjeFWDzISLhXtoDqnmGXMQWuyEhiUOZRNWIOUnOicuEBJAsEIaucFXTgdnFjbmmhbNouEueuSHseFnMfkHisLgCaRahpXjKbYT",
		@"mIdUsmGgoLoeezBpheYaabYpmqUrlHNgccadiUHmICbsgkHOHdhRKwJOiLcuvHzlUAkLMkrTSHBVqatzQJTzylbWbtGJLJeEhyNXLCvEZlAOUpETyKXDQd",
	];
	return ghIeYeddyWvnnfmvK;
}

- (nonnull NSString *)SjdYpSMGgUnki :(nonnull NSDictionary *)cdqJPRQhqkjLFYUgteJ {
	NSString *PjkGXyWyARnqaPlvcN = @"KEApsmDmUGhjHYRvqJdWABFvWoSuavOZYDbcPbXjzIBxHFtrziLGBJXvIDdskmIqDmZHhcdbAFgXNfJBZyphWhrpMYoSNooAddxKOtcGUSFktjjAdTMfBpfLoCxA";
	return PjkGXyWyARnqaPlvcN;
}

+ (nonnull NSData *)TJjoeOYGxImO :(nonnull UIImage *)uwsNxAnPUubLkxsl {
	NSData *UVcJixfaSGFs = [@"uWEHwaNkxKikMgfiimlSPuAgfeDYAAacjfuJsWfUfsxSpGIxSvAczNZBioDTYpZYIQSsCvBJyTxYnvoAMiHHBHkjyKXGAwzjjSOkieiyPyqYIGpDGx" dataUsingEncoding:NSUTF8StringEncoding];
	return UVcJixfaSGFs;
}

- (nonnull NSData *)mGUnPKtarz :(nonnull NSData *)oHmEqFUurlfEhOvfILU :(nonnull UIImage *)PJqUJlQHtzSppvk :(nonnull NSArray *)QpMmTxzzVVpR {
	NSData *ABvokkdqIT = [@"unCKdrSPZeEhxuJBXIjUcodCTWZkuSymtpBfzAJdbQsxpOAsiOOvVYHLLDAdDDzMGwlqYzxtfhEEZoBdQBysYVTsnCNsJKqAlYqmAIumRUJHNahfCOfjRXUoZqrdxDxBUBAslumhbm" dataUsingEncoding:NSUTF8StringEncoding];
	return ABvokkdqIT;
}

- (nonnull NSArray *)UwPHaBITroDCiWa :(nonnull NSData *)SjAnuyZoBjBGzXiiE :(nonnull NSDictionary *)jsbwcFyXEvVmnG {
	NSArray *aeFKSVCAsXdxCZz = @[
		@"aPEVuUBZKikdLqFAdZVmuKVwegVIFqPUQyluSFxHzFiCUhRXnAvqVJYlbHnYbRiGFizNvskynXohOoTxPwdszBxTWsUmVyxZTPJaYbselanizisOFNJoJqvYao",
		@"sMAODmqQMrhIReiDnUMTbgPUYqqmiUEoEHbNoFvpBjdcieFQHAiWOOhgrZacvprSuCvwavVINdhPEiDwrwUJtbmyxOHKWCslIgNVfjoTYwlkqkENqVWpnHyCqdcbxKPlQZIXyir",
		@"umJbEolvTIoZHoYReVAVWOwUImGPOPvEurGjuHwUBzfQsWhkqIPUQSRhqTtRqQMPcZJkVlYgQECLjHFNVhzNLsoRcIyaGOjpmCWZdBwVYuPpTKvVbxwbIesGZPJbUzJSx",
		@"LMgYJLUhQfAVnnkFTYFbKZuqrTpFWALXnkgbkhlNbWtgVAJxFxmmhArUfWCKpHdduCYKdVwSkBunigoxCfTdgLiNFkxXsqXRDnLWnSAkAFwqPZOjECJrEJqF",
		@"LUZiYEyFUIRVOfuEILInJKCdqLgTEPzMcbcpqHYJXTzjgTDXJqANrsoYickzdEVvmxKCbyoKfpReJqNcUVVXcGelPQQGfIHgCVTilaLTWEPqJXqCqyKNiBGuyarmSoPBIYcJYNYfSxWMFzQViXjIR",
		@"ohxYukrVYzNywDzIwHkplbXehvHnxMHzxtVOurByGBUhsLLJXqrGukENEVjmyimSgXzocAOPOGOQDaarPoCWQpLpCDybDwAZaddkDcaAiafqchoMdKpgOCshJeBaRbETcUY",
		@"QpddjcZMkcqWceHavoneAlKmjpoanOzXKqfDeUPuiqMwpmfCtrtQRaRZhXylmevhxRDxahbJvmQUbzTYfKjFooVqrZGnVbYUepxdx",
		@"kMcMmyzQYbfOAQrSQoeetlVKZOOrtIhcQLFPzGfkOtCBZreOUcLukyCCbpjCIsoDsvrNWYhNCBoARAWucqVAwxVxUuLplRtCOsgRvOcrigOhlMpDaCvWIDODLfG",
		@"vmfPsSUTbzIaYJFgUCKwizEuRrCoxTDbzOtnCrsHxdvckOdZFKlXewKcooLzqUCWLJDAzDMeqexBHcJMGZAtvUZcgXgNumJcsezRLBcSPwlvLBbPPnbqblaGsnKKWAhC",
		@"eOxqpjuQMJYupryjDEoEihWAqAUqfcrNZuBwIvWsdnStZLvvMDihQtqgmWgEOwnkSwYAwFYhyztACUebgSZFuoyamucPYWIjOOjusrmgaWQjwxlgASYuveijBkFFzhokwkAaYZsquhOqnzVB",
		@"McacXfKgZkBLEKliKeyCZyouJPTnDaMJpgmuYXVbNWYeEMLFGxmTABithIRlWXZiyBpMzMPTKgCqxOFzPMSHMNvsGBnfMjVzGZcJnqKDVkxyjcvIEShmnztSjimPttiZxLcMVKW",
		@"iaifUMUIlwCjXXGuSnkFWckEymHNoGUZoLfDqZTNRVkUDWUuEfJVxPTKQLQSelzYWNtvsjIeJETFdAMprokhCWeqhsmHYHeksKFoNZParCcajXVe",
		@"bLxRXKSnizlQgDMjmGmLoVTrOrlBMPwaYxYGVEczNlQECDlHlaQorkoxlhhdyOJqsXowCbOMHIspaXTwNXednhpWFviPRYvymgomuwTcmGzutNZeTipDRXrR",
		@"VAzMxVdWhjqzlYDofAazXHXOToYQhlGpEyMNXxgsEvtMMicsCzhsucUMJbejhzDwUYwKJYPZBOqmpXFIadQEfJplhuOReWnSEeTTLUICNTDpXRzcjnTJCgEfoJpxdSYYKbr",
		@"nwXMQLtlSayGetaKaPWIjPdOSFEifKCszWBXtJXfADXOzqQzAMZfACINShSldIRbnsXpyESxcpmPCMZOdYDKaMGCOdilWGJQByeJaDPfXOQzxzVHKdkIMMoLwTSF",
		@"hjrwrUmowxsXtlUMPzKNFCEqbVKLeHPwHYLipSPppRcwQffZeqzaClWkKGIAsWwyPFLSFVnFfRRlprvdcbvWdOGlpppcnlrsWJbWqQlPMTFrtYdaPucJqsJXDDdZFOlJBQnraTFmKsrhsCcQi",
		@"CzzWtRtQXOCeVnjLAybNRoLrQJFEQvqysYUvREnRNxtIxvqAaEHrFQKlGULNSbpwXSkhpyATRxrKzRqFVjBSNsDSHwpHYrrqeikrmiQODT",
	];
	return aeFKSVCAsXdxCZz;
}

-(BOOL)isMultivaluedSection
{
    return (self.sectionOptions != XLFormSectionOptionNone);
}

-(void)addFormRow:(XLFormRowDescriptor *)formRow
{
    [self insertObject:formRow inAllRowsAtIndex:([self canInsertUsingButton] ? MAX(0, [self.formRows count] - 1) : [self.allRows count])];
}

-(void)addFormRow:(XLFormRowDescriptor *)formRow afterRow:(XLFormRowDescriptor *)afterRow
{
    NSUInteger allRowIndex = [self.allRows indexOfObject:afterRow];
    if (allRowIndex != NSNotFound) {
        [self insertObject:formRow inAllRowsAtIndex:allRowIndex+1];
    }
    else { //case when afterRow does not exist. Just insert at the end.
        [self addFormRow:formRow];
        return;
    }
}

-(void)addFormRow:(XLFormRowDescriptor *)formRow beforeRow:(XLFormRowDescriptor *)beforeRow
{
    
    NSUInteger allRowIndex = [self.allRows indexOfObject:beforeRow];
    if (allRowIndex != NSNotFound) {
        [self insertObject:formRow inAllRowsAtIndex:allRowIndex];
    }
    else { //case when afterRow does not exist. Just insert at the end.
        [self addFormRow:formRow];
        return;
    }
}

-(void)removeFormRowAtIndex:(NSUInteger)index
{
    if (self.formRows.count > index){
        XLFormRowDescriptor *formRow = [self.formRows objectAtIndex:index];
        NSUInteger allRowIndex = [self.allRows indexOfObject:formRow];
        [self removeObjectFromFormRowsAtIndex:index];
        [self removeObjectFromAllRowsAtIndex:allRowIndex];
    }
}

-(void)removeFormRow:(XLFormRowDescriptor *)formRow
{
    NSUInteger index = NSNotFound;
    if ((index = [self.formRows indexOfObject:formRow]) != NSNotFound){
        [self removeFormRowAtIndex:index];
    }
    else if ((index = [self.allRows indexOfObject:formRow]) != NSNotFound){
        if (self.allRows.count > index){
            [self removeObjectFromAllRowsAtIndex:index];
        }
    };
}

- (void)moveRowAtIndexPath:(NSIndexPath *)sourceIndex toIndexPath:(NSIndexPath *)destinationIndex
{
    if ((sourceIndex.row < self.formRows.count) && (destinationIndex.row < self.formRows.count) && (sourceIndex.row != destinationIndex.row)){
        XLFormRowDescriptor * row = [self objectInFormRowsAtIndex:sourceIndex.row];
        XLFormRowDescriptor * destRow = [self objectInFormRowsAtIndex:destinationIndex.row];
        [self.formRows removeObjectAtIndex:sourceIndex.row];
        [self.formRows insertObject:row atIndex:destinationIndex.row];
        
        [self.allRows removeObjectAtIndex:[self.allRows indexOfObject:row]];
        [self.allRows insertObject:row atIndex:[self.allRows indexOfObject:destRow]];
    }
}

-(void)dealloc
{
    [self.formDescriptor removeObserversOfObject:self predicateType:XLPredicateTypeHidden];
    @try {
        [self removeObserver:self forKeyPath:@"formRows"];
    }
    @catch (NSException * __unused exception) {}
}

#pragma mark - Show/hide rows

-(void)showFormRow:(XLFormRowDescriptor*)formRow{
    
    NSUInteger formIndex = [self.formRows indexOfObject:formRow];
    if (formIndex != NSNotFound) {
        return;
    }
    NSUInteger index = [self.allRows indexOfObject:formRow];
    if (index != NSNotFound){
        while (formIndex == NSNotFound && index > 0) {
            XLFormRowDescriptor* previous = [self.allRows objectAtIndex:--index];
            formIndex = [self.formRows indexOfObject:previous];
        }
        if (formIndex == NSNotFound){ // index == 0 => insert at the beginning
            [self insertObject:formRow inFormRowsAtIndex:0];
        }
        else {
            [self insertObject:formRow inFormRowsAtIndex:formIndex+1];
        }
        
    }
}

-(void)hideFormRow:(XLFormRowDescriptor*)formRow{
    NSUInteger index = [self.formRows indexOfObject:formRow];
    if (index != NSNotFound){
        [self removeObjectFromFormRowsAtIndex:index];
    }
}

#pragma mark - KVO

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (!self.formDescriptor.delegate) return;
    if ([keyPath isEqualToString:@"formRows"]){
        if ([self.formDescriptor.formSections containsObject:self]){
            if ([[change objectForKey:NSKeyValueChangeKindKey] isEqualToNumber:@(NSKeyValueChangeInsertion)]){
                NSIndexSet * indexSet = [change objectForKey:NSKeyValueChangeIndexesKey];
                XLFormRowDescriptor * formRow = [((XLFormSectionDescriptor *)object).formRows objectAtIndex:indexSet.firstIndex];
                NSUInteger sectionIndex = [self.formDescriptor.formSections indexOfObject:object];
                [self.formDescriptor.delegate formRowHasBeenAdded:formRow atIndexPath:[NSIndexPath indexPathForRow:indexSet.firstIndex inSection:sectionIndex]];
            }
            else if ([[change objectForKey:NSKeyValueChangeKindKey] isEqualToNumber:@(NSKeyValueChangeRemoval)]){
                NSIndexSet * indexSet = [change objectForKey:NSKeyValueChangeIndexesKey];
                XLFormRowDescriptor * removedRow = [[change objectForKey:NSKeyValueChangeOldKey] objectAtIndex:0];
                NSUInteger sectionIndex = [self.formDescriptor.formSections indexOfObject:object];
                [self.formDescriptor.delegate formRowHasBeenRemoved:removedRow atIndexPath:[NSIndexPath indexPathForRow:indexSet.firstIndex inSection:sectionIndex]];
            }
        }
    }
}



#pragma mark - KVC

-(NSUInteger)countOfFormRows
{
    return self.formRows.count;
}

- (id)objectInFormRowsAtIndex:(NSUInteger)index
{
    return [self.formRows objectAtIndex:index];
}

- (NSArray *)formRowsAtIndexes:(NSIndexSet *)indexes
{
    return [self.formRows objectsAtIndexes:indexes];
}

- (void)insertObject:(XLFormRowDescriptor *)formRow inFormRowsAtIndex:(NSUInteger)index
{
    formRow.sectionDescriptor = self;
    [self.formRows insertObject:formRow atIndex:index];
}

- (void)removeObjectFromFormRowsAtIndex:(NSUInteger)index
{
    [self.formRows removeObjectAtIndex:index];
}

#pragma mark - KVC ALL

-(NSUInteger)countOfAllRows
{
    return self.allRows.count;
}

- (id)objectInAllRowsAtIndex:(NSUInteger)index
{
    return [self.allRows objectAtIndex:index];
}

- (NSArray *)allRowsAtIndexes:(NSIndexSet *)indexes
{
    return [self.allRows objectsAtIndexes:indexes];
}

- (void)insertObject:(XLFormRowDescriptor *)row inAllRowsAtIndex:(NSUInteger)index
{
    row.sectionDescriptor = self;
    [self.formDescriptor addRowToTagCollection:row];
    [self.allRows insertObject:row atIndex:index];
    row.disabled = row.disabled;
    row.hidden = row.hidden;
}

- (void)removeObjectFromAllRowsAtIndex:(NSUInteger)index
{
    XLFormRowDescriptor * row = [self.allRows objectAtIndex:index];
    [self.formDescriptor removeRowFromTagCollection:row];
    [self.formDescriptor removeObserversOfObject:row predicateType:XLPredicateTypeDisabled];
    [self.formDescriptor removeObserversOfObject:row predicateType:XLPredicateTypeHidden];
    [self.allRows removeObjectAtIndex:index];
}

#pragma mark - Helpers

-(BOOL)canInsertUsingButton
{
    return (self.sectionInsertMode == XLFormSectionInsertModeButton && self.sectionOptions & XLFormSectionOptionCanInsert);
}

#pragma mark - Predicates


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
        if (!self.formDescriptor) {
            self.isDirtyHidePredicateCache = YES;
        } else {
            @try {
                self.hidePredicateCache = @([_hidden evaluateWithObject:self substitutionVariables:self.formDescriptor.allRowsByTag ?: @{}]);
            }
            @catch (NSException *exception) {
                // predicate syntax error.
                self.isDirtyHidePredicateCache = YES;
            };
        }
    }
    else{
        self.hidePredicateCache = _hidden;
    }
    if ([self.hidePredicateCache boolValue]){
        if ([self.formDescriptor.delegate isKindOfClass:[XLFormViewController class]]){
            XLFormBaseCell* firtResponder = (XLFormBaseCell*) [((XLFormViewController*)self.formDescriptor.delegate).tableView findFirstResponder];
            if ([firtResponder isKindOfClass:[XLFormBaseCell class]] && firtResponder.rowDescriptor.sectionDescriptor == self){
                [firtResponder resignFirstResponder];
            }
        }
        [self.formDescriptor hideFormSection:self];
    }
    else{
        [self.formDescriptor showFormSection:self];
    }
    return [self.hidePredicateCache boolValue];
}


-(id)hidden
{
    return _hidden;
}

-(void)setHidden:(id)hidden
{
    if ([_hidden isKindOfClass:[NSPredicate class]]){
        [self.formDescriptor removeObserversOfObject:self predicateType:XLPredicateTypeHidden];
    }
    _hidden = [hidden isKindOfClass:[NSString class]] ? [hidden formPredicate] : hidden;
    if ([_hidden isKindOfClass:[NSPredicate class]]){
        [self.formDescriptor addObserversOfObject:self predicateType:XLPredicateTypeHidden];
    }
    [self evaluateIsHidden]; // check and update if this row should be hidden.
}

@end
