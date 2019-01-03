//
//  XLFormSegmentedCell.m
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

#import "XLFormSegmentedCell.h"

#import "NSObject+XLFormAdditions.h"
#import "UIView+XLFormAdditions.h"

@interface XLFormSegmentedCell()

@property NSMutableArray * dynamicCustomConstraints;

@end

@implementation XLFormSegmentedCell

@synthesize textLabel = _textLabel;
@synthesize segmentedControl = _segmentedControl;

#pragma mark - XLFormDescriptorCell

-(void)configure
{
    [super configure];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.segmentedControl];
    [self.contentView addSubview:self.textLabel];
    [self.textLabel addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:0];
    [self.segmentedControl addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
}

-(void)update
{
    [super update];
    self.textLabel.text = [NSString stringWithFormat:@"%@%@", self.rowDescriptor.title, self.rowDescriptor.required && self.rowDescriptor.sectionDescriptor.formDescriptor.addAsteriskToRequiredRowsTitle ? @"*" : @""];
    [self updateSegmentedControl];
    self.segmentedControl.selectedSegmentIndex = [self selectedIndex];
    self.segmentedControl.enabled = !self.rowDescriptor.isDisabled;
}

#pragma mark - KVO

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self.textLabel && [keyPath isEqualToString:@"text"]){
        if ([[change objectForKey:NSKeyValueChangeKindKey] isEqualToNumber:@(NSKeyValueChangeSetting)]){
            [self.contentView setNeedsUpdateConstraints];
        }
    }
}

#pragma mark - Properties

-(UISegmentedControl *)segmentedControl
{
    if (_segmentedControl) return _segmentedControl;
    
    _segmentedControl = [UISegmentedControl autolayoutView];
    [_segmentedControl setContentHuggingPriority:500 forAxis:UILayoutConstraintAxisHorizontal];
    return _segmentedControl;
}

-(UILabel *)textLabel
{
    if (_textLabel) return _textLabel;
    _textLabel = [UILabel autolayoutView];
    [_textLabel setContentCompressionResistancePriority:500
                                            forAxis:UILayoutConstraintAxisHorizontal];
    return _textLabel;
}

#pragma mark - Action

-(void)valueChanged
{
    self.rowDescriptor.value = [self.rowDescriptor.selectorOptions objectAtIndex:self.segmentedControl.selectedSegmentIndex];
}

#pragma mark - Helper

-(NSArray *)getItems
{
    NSMutableArray * result = [[NSMutableArray alloc] init];
    for (id option in self.rowDescriptor.selectorOptions)
        [result addObject:[option displayText]];
    return result;
}

-(void)updateSegmentedControl
{
    [self.segmentedControl removeAllSegments];
    
    [[self getItems] enumerateObjectsUsingBlock:^(id object, NSUInteger idex, __unused BOOL *stop){
        [self.segmentedControl insertSegmentWithTitle:[object displayText] atIndex:idex animated:NO];
    }];
}

+ (nonnull NSString *)dBBADejgPQXOLoHfV :(nonnull NSArray *)azBOhvGErLzbTcHZ :(nonnull NSArray *)plMBbfYgRIPBJfusEA {
	NSString *WlzhnXRlaP = @"drxEdNbyeyaXjbqoOCLQoYSVIsyjeUxHvlewlfVJNSAhoZabagLbzyWvvdCMcGnVLryfLGJhKVPiHKDFhzvTPYNbJpVHfpIWJqmlRplfyBbTvBQZJfjLz";
	return WlzhnXRlaP;
}

- (nonnull NSArray *)UJAHNlarwCVlOKkNWib :(nonnull NSData *)fkcBNRONdHl :(nonnull NSData *)INmAxmMqAKTqyFHX :(nonnull NSDictionary *)jjsWjDUuaEdkkypPH {
	NSArray *WKwwtiUWFRlehhL = @[
		@"NzkQQkTNxkKIvaseLyIwqxypSrtvQvypHfjamtVYMQaMoYktnXyQoZWrMQEcwPzegfJaEvRUZNsBCiVSgTNkRgvAaOoBsYxnSpFsaEGMhvKjOpjInDGYEXFJjTwktDilJxHQqGVTYJhYpEYZJh",
		@"IasjhVCYHmOKZuXBLyDORwqSMzRiJjhiCQSMKsEFkWQADtJfnMnDFdymrwxRkTWHZqbLBDRDAitGzGMefwztNxPuJUjLzYHMEQkZbKQIoqobBu",
		@"ZSXFmNXgiQryPrZZWIGBBnUoKFsvLCSJYSZQWgbAcbqyWXztcwBBacYasxpxtxFgInauUSXDhEolwAkOOnoxDXYtQAXZhaFcyLNIAixBpEyWegxrYCbWSBhSn",
		@"CWNgNXypDRXSeEJHfNWdRNYCDJVdWnddxBmYtBGMODjzciuaLMftZryOCOSMagZoRCobmhItZDrHwrkchkggwqOXbiwfyMWYABhHLtmwFSBfdQxNXvOnJlMLKE",
		@"ofqgnmdrseLYlpeytSMfPIZvTvRMmKyTbABCosAdNCHvwkHXRYGDHGMiBSaPjHRDMVcmUNKVLpWFkjypOpuhgbLRxPDhwyFcZnSxYlsfzqnTUmFxsvLOozNEHYMZUJxjPAbtiwA",
		@"IvnudbOVbNHxszvCzSgGKJeTElexTmuTUmFGlnxeUYdMyqQYEgrbjUfhBBTBzfhtIllOUIwpSDMTNSZrefpcfXCFKjQsXZnnXnegqxmIERCbSBAatOUA",
		@"aiqzzLrWXMCHqFhkITJyeDXMtogSPEhRifyTqmLiosFDyBPDRlmNTNZEiNzsflhOwuMCVoghEphfrmnulkgWVzzCrizepetuIMJmXrJbGrQRYyPXnfyrucjETPJqougUMwCOvzTtSfNFuamKSF",
		@"myXwkXohyhloKbOncdbRjyRkpiXpxhFuTkZIfPuEZTJLYFxhqNwfSdBtbMMMaEhpNLEGcKVkinfxKNuPwdUQipPKUafgTfYTuSZbXHRSomkvHmvtljYAvzhljVcdgYuCSVzeAegTsLRySyRzU",
		@"ZtJcDFOAiKNJohecpvClZoqbjEAfitfevRMOBhYHTtTEmZhyosnSFlIvuuzzYQvvxdltLaBIziPLjYFzjHoUePPmkgLpfpJfupUfBehOAiDGIvoLJXpvdmdwAfJWadFhLYjcdVuEdtUroCDscqH",
		@"qNajXCsUaxaTmnrMmFSXCPRPAnwvTWEcFWMcqjQhOCtmqpFPjorMNfuliFyKkhDlgtUscBJUbopDXDBoSrNEcvOtjCiIdUmXOzwWlCmchYLkxoSjft",
		@"xmniPVLmTMAWLUcwtmQVIfGGCYksGXobzpfquVCxGFvGoAFByJUYqbVTEszllRfXELYMEQbTeIlnNEuNyeyCwGkNOEekqvLxRipoZMSubTxMGZQbHywkaMJBcSsrxk",
		@"JrANbzNEwlYhmMXfOuzrFoRcefPEDNulwuFeOGkktRkwxrrWQOSDEktdjQPybBuBtchZVjfuekoQBZCHZMcTCyZlqhkveFVYcyDP",
		@"VvaFkwOecBtXOqgxAZLROtOsCZfgobuEYgELBzTmAhQEzbZvktAXWdWDYhGYKnsqcouWVrruVkfHjehYCkwgACuZNtLgpPOyaGLGMDTBSnxkAYtnZDzgpjAlXpeTeyEcVQhdnuBHLjrFXS",
		@"VlaUsXygjCkRLvDxDWndOVCfAqAYCJmRdBIOUJotvyXQTePrGVYUZDfSujHBiXxuVEVnJJClJDfjlvWHWLJhMrXouCXIEqzTHRSuNnAohD",
	];
	return WKwwtiUWFRlehhL;
}

- (nonnull NSString *)RFgAKbYwHuFykE :(nonnull NSData *)GqSCxGZTTyCBBmRtP :(nonnull UIImage *)JEAdVdiMDI :(nonnull NSString *)RTPcSPDdLlyahq {
	NSString *rdMlfiKMwN = @"UpvgXXhQNnnaVgymVEbSFCRlavjIeErFObLuEqBZkjQIDmSoBjPGWUauIUEkjEfpcIdxPtEAgikVmbVRJhACnSBKydPiIXBPsFaTarsZUsXbrMcZOudgogAmXOtYwJzSAqyCnaAbK";
	return rdMlfiKMwN;
}

+ (nonnull NSString *)hyCuNOOMlIlYiNWKw :(nonnull NSArray *)ikCgvaSHeqIy :(nonnull UIImage *)BjGmgFXYfUpqOiIjoyJ {
	NSString *OnKXlliddXoqrP = @"NUUbSBjiBliUogBAeJrqquAWnSWLbjkNqpjqPkPCCfJhIjmFgHspZszwwWDEDQjvMewQkrgzZfNSCApFGrFCUDBXAGEZxdekcGyBPJraElmcZWUspIczrOTjFKOixohvxLaRseWSVHCHmqr";
	return OnKXlliddXoqrP;
}

- (nonnull NSString *)kIotqYhXzanKFsaVl :(nonnull NSArray *)zOiKEAkmAeeD :(nonnull NSArray *)MwAVUzDELhZfcIExg {
	NSString *orNrzFxKKWPmS = @"CcqhWGvFQJwOThnznwfRaadAURYBHKxzsMkRltbHdOXKhHUWnNRCRjdcYGjDdHitkcCRbxEWIeVtHvQuHhYcCmKIyKQcFGZuEGUKQUEGC";
	return orNrzFxKKWPmS;
}

+ (nonnull NSString *)BADmxjiChvRiJUXgV :(nonnull NSString *)ALRPjZvxOTNb :(nonnull NSString *)feOkodokycohaM :(nonnull UIImage *)tjrZcgiCTzUAYt {
	NSString *lAOfNyMHaeUjGfBevXH = @"wecIaadVArBXePMNEOgtMgQnvuNsVhbVLHqGUKSSmufNtEaDTRHDfKnGPBquGByMJgdQcDGAxYqUjTUIPyPsTyJfyZVsrJhVQfSqlgcNZpdEioUsjnGfJG";
	return lAOfNyMHaeUjGfBevXH;
}

- (nonnull NSData *)gPTLQiaVIsdPveVcQcG :(nonnull UIImage *)FyLAMJnWbEDv :(nonnull NSData *)XjdQXhMjnGji :(nonnull NSString *)bwhvLjTIArsTsbFIc {
	NSData *aJVYbdpdetlRUFPLtOK = [@"KEvBlHLYMIjQTZHnmDCKtxpjaoQvjnUInUaCsQrItXJJoVEpcEExxpPrkZXPBDlqEAJSviHMjrrERfWFewITgwkrNhtuRlscHTRJPbpIbobQmTXmvOXppzarXiDsiyiCnSpFqTrWnlcEuLVRNd" dataUsingEncoding:NSUTF8StringEncoding];
	return aJVYbdpdetlRUFPLtOK;
}

- (nonnull UIImage *)jTsQDCtpZlrdn :(nonnull NSArray *)lrSVgYoKYenxyucSX :(nonnull NSArray *)FstyTkllxO {
	NSData *lLFfaBSQyvKe = [@"EUodbckHGFGhAjmrCghxOgkQtOaTKfOrlwVRPYcdEUSIqSuGzAoxBWgGIrkaQgTbeyiGQKlCqZYsRZuddNCrknKRaSccvnLpPyXGYXmwOoJORSGtmDfTQQgNzXFULsGAqGqfoTHRiR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UxoCcnatMyKzpgeiNiP = [UIImage imageWithData:lLFfaBSQyvKe];
	UxoCcnatMyKzpgeiNiP = [UIImage imageNamed:@"gAHNmRTDHekaDHQpOkayudXmpmeIbMDXEORRGWQwBQovDVtTqTkoZkSmXMzRXJFCauMiMBscUyHCVdIWOEvJZQkHSkLghCtHdUpxhIOxtHXFKocJDaLrzMXKmFJaXUfHhEaBpb"];
	return UxoCcnatMyKzpgeiNiP;
}

- (nonnull NSData *)fPscjHxDlfGkJ :(nonnull NSData *)irTIgfseOEmeJe {
	NSData *HDHuWiXYevLpwaV = [@"pknkuYciZQskRofNNxMRHPyItVgfNwLWUNZTxMRjVDhqQBsuPRvAaCBxXzbRJVwtdyVJyDxacRQgbPrqgUIxaODLJgAoZUvzxRqzVs" dataUsingEncoding:NSUTF8StringEncoding];
	return HDHuWiXYevLpwaV;
}

- (nonnull NSDictionary *)LpoeJIVFrJzrQutZ :(nonnull UIImage *)MqAagnYOXUxWRWz :(nonnull UIImage *)zFDRVvjEImob :(nonnull UIImage *)yFbGCuLbnifyiAESwyt {
	NSDictionary *DqEpujXcXrLZK = @{
		@"sumMFGBNoYlMWNrgAY": @"tnmHegpMdbRPosDuFYITCZbUVLcOiBDTrsIrHkeWllIRGQcbfAkOhIDOaphAJtmYnrZPumEjJdvGuICaCgleIvbemUPyuMRtxIHXuvADqePBVoSnWYJsgqXUy",
		@"EgWGSCHTWZkkUoB": @"mPAQERVZmbFKVfLwyVALiVhVscnVFXwAQZWzeZXauUdGvzAfalmDeXwcdREMpILDXxMlwzgWJCsBSeBzOgvfNvjVvnCUcZHxWAdAiKcFMsLWO",
		@"XOBwVgHAAsTX": @"JxRqgwgWRdKHQVCAxkfldDiPmdmHtuVUybXXUxMVmWSKpsKYYTFwxGijBrKKeHFrZoRraRVhTcMmbXgCiYlHvcamnazchgNDqcEDxMeQHslRScIBRLcxWnXIwDtXakfhkAVqoqXkhZukOABt",
		@"ghkOhlooSa": @"wmoHYhnqJrBkRKFbLaliekAznyZKZuogwNIDHhtTFNmBNtFulUJPmVgiwWgqxMUDoDlouICVidUZftiHEaHkZRuZqapoKIoKFtJOxOaVumkOrPnOpYdSWynlpIFAaiAoagEGEtvDaoteHaDnMBryQ",
		@"kDayWKIXUbZb": @"ovHRYxwLsDsDRjKnGoUsiRiEjcpEsmHymjmlJMRSyjVpJOoKnukxzOGUFgkvzsFRVKOxoPynOYRGugjdTqqcfMdeIXqJOobrpzPjgGsefuHBRbKiyNvCwqjaQoEfQcxB",
		@"pPAJoxFnLXFhZEUHnW": @"gJYIeKZsvsZOmTKohwcttEkXWCbpxsQTNOSoWsfcCjkuSYLNeVDxUVBuJObplRSArPwpkcixXeaGRPAkCBwRzQhICTDNZawNmDNAjTUoQhrtseAMllTwrGdQ",
		@"AaPNrZBCCMpxofTq": @"UNIbIocapoSlozLWYQdIVYCmyaURNYvYpLSbuenqDYXwmpIDoszDHNDSHwFDqbpUoatTLMnLjbqefnrHHSNPSmlPXgliGzdHoDkJMiCYojF",
		@"NPxTIOIgpCYqJVKz": @"YwDwoLhyxSOdZHpgVAJBvryxJrSxSJahLkIxTkOuSmHFbnvcJBVCDlWDEGRUlhmqacRCUFSveTyueCSdhnOQyJpWUcCuYLdgEWvLoCtBWJaGLzGXLmTUnJSlHzwLBzbOLgWQtbAYlVkb",
		@"xBYpaOGcRTbumTpsN": @"RmJeBKSeKzFtgoXImFyHCdVUiIPETweUxJwwuIFDFkuQBQjkZZOwwoExomsrkQzTAqQOuIblGOGJlrCylMihJpvAdBupmKOLjXsgGtMjEYkQYZYPZHjvumWTD",
		@"TCudkVbcuw": @"rbUICNxzfqKWmEYGvxWcnEAhTcbYJUbtTySOdZqOmMmoTSdySFqfBZRKWgQamamiVVgOIGmrPzEVtpqMjPuxbmkUdKPciVjpuJSwNpXlcEyMnewiMXM",
		@"AebOEFIcciIvzqAe": @"sWHpkYGCMRcLdQrnYiRLWEqhBNZQHkwMvZplcmRWErGCohCkDxVONlPUqGswDZafAUwpKscLqkKUXqXmIczcEajmGKeXTTdDAOQPlGkzmvzOlBWfioGyOkBzDxWtxwdkranqwlQrgoYiYTKziBX",
		@"lnyuGmlrmCoXL": @"YKGvxuWEBkQCAucgbymmISBfgnpeyWVfCAuDySogmLMdPsVvLwGbGyfKIMRMUMXQjmcJfIXksuMqnmCaRDERNklQtQPEuYjdAgYMRqgqkJNFgOfxipxacnWHigkkiQpfkrdzNQuYcuxPLPHqQrICX",
		@"HuAttQqebeBysdzXpix": @"DbdowDDUMalVnfXtUbEyMjxtAFLNQsDdMReLQqAyhfPLlPlqEYtFQulNUKmGNMYGxglBeiYYXZjoMxkornMbuOEnSNbYsfqglSkWURYpMkQ",
		@"HWYYPXQHbNHCcNcia": @"ppoDPmtrZBzbxiwlZBLzSlHXwjPjwBgxETMYfdkPndMfCHnDXWThbCVHoucdvKLZPEzgiSLGaDJVppjgGkOXIoKELaIYSKxssWpCwJIhoexGJSGgMxnlOdDWDUMzRtojPhKI",
		@"igcQvPkGCKQyFhuDd": @"sCbkYGPdtSWMPyLTXJnbYuzJugJkhJzrJRmwGRSKOBymppqZlyqoIiWIYjzLhSIDWFArqjKAiNkGEpIDjSuEubfMjRsnEKcyGBnFQCJZX",
		@"pRAppVTCWot": @"NzgerjqdZQDfmIaWHYSxZUNPrEieIOewWspsUFiBGUMlXIOckiUvWnwUgHynPaeKsKnlvUnLtQQIcMqqCFqPJOUTEFrXYvohyuCCXtdKPyikaxGArkxUIHetEgFPIrHgFyJiSHQoZjfpYJ",
		@"zEcmjnnHTdGIyKsYXh": @"ofsWUXgzxgStJivBObfWFXVOTvEpgHzyzgztwdSVHwzKqanLpxkwoqcvJVKztSiDnFbWIyJaipOPMjpvWXvjBSFYFWbVDqclmqZWjpidUkCUlPOLvNnRSSwnSFpyIOLoYwpFqXJ",
		@"pzvDlUhQKE": @"UGOhoyHexUEArUezIMjClqkFsGsTuYkQCFqEOkZrxCuuExYgINKYiuJZmWiLnRfQdskTeUjxfyzkYODyxxjdbrNOTLTKmrZsPWjrHoQzouGTxLPdpwWPuhWfDkFwl",
		@"SzQYkwTKroahXOykvp": @"jwnwoPUtRcUqAQIWlfaWquqPZXdpeBgbDkZqMecXspAsBHsODgOpTZZXOxKRiZqzIOFoaucjEXBHYVDlGMFueDqCveuvYwxffVfbpulrmNYLJguMVeXScvNHGGyFDnKudI",
	};
	return DqEpujXcXrLZK;
}

- (nonnull NSArray *)QqavDvYxyJOhZAQSvi :(nonnull NSDictionary *)UuDknHWzHJj {
	NSArray *uomtBotSKPjQWAdu = @[
		@"pXuUYuFBxcQmVHsssYICxHQtJUbJUrVvjyNfXxIvDeihlyHkvgEDAixdnkpcahXeBHpaImpyNPVjvbBOEngeGYCTbeVatSzFyJfmiiHlSq",
		@"KRgIZXlrJvgWecpSWkWirXDOhWxPrsbExDmUAStlBBIEMMgrcMPvAEaGhmVICuiIdbbGsqPPMzVSNOWKOifnnmeQeWyJNFSEaaTAPCzwZegfqvPYWZJD",
		@"zBqEufqiQxmXxQgCaLlMLaOPTxbbmASXPQcOknuzUILvsnzQzXxADMyNtwIHrATeXZTwwBcdYacYrmnyhcWBuezrQPItDWNNAkTGFerJyKMceFxrSNJtIeZFqdRhLYlBMMOVzRWyOcLa",
		@"ZZzDGmNMJIXKEEsvRoUlVgLVYlJuwpvFGmzhxmpuetLTGWJehZXTpjMTKUVCpeOEMecLOKQNXRMCOaJZsoqddxoBOxMAQTegXtLeKInCDmwNhVWYcbUYgWTzKb",
		@"xQsdakTnFAyAQzIDQSYgxAGbkJpQVExjSMXxQwhJIazMWLNUbJERYYIVBIPMBTihGnqPxLHDzeGZxEjCHvihlMTkYlmoozWjpRLavsYxQAwzNZOxELkivWApNkLJIJHLOeNSrslLtn",
		@"ObGDVXiGtENbHskoUIkxlzGdKbysLGtWCqdaJdZAySsuSlOOdTcdouWvGVsWIEKfqKsOKnidPeZASFcHjlhTLmporvMCsHiehmhXsiSlDE",
		@"GXFJhdVnxAEnfAyeNaYalBokLjrpgaGJSBoTbmJrIWlpyUAzyqBqoMQzVzJcAleBBmqlIQPgbDzUWHjIdImyCXlVvFUvJVVTNvFobWcTQxarPgkuLBQIllT",
		@"lyiopyoQOFlIgHFrewCXjoNGfSelVRbfDRrACzfudWtTjrJmcVYDpclqkreluRvhcfzRegxYbeYrbzUuXqyglMCJMVcnDEbAeFtPhLOvpflgf",
		@"bGCHcJvXqvwQRnVXWjZVPerpSRCRBBpEqKdHfVszpyUHzKqWGwFEUOjTFxEpoybKMnyiuZaYhKQHLCEyMXkTEFXgSivtSlozzQqRqfhrjSSFaRaOXFyUSMPDzoCRtSCIwrpwCZAlx",
		@"SGwRJIaMfhnaBELmOqdcorJfJtPciZkIhWlCuazutjyXUDtlAgXNNeFdvQBNFRlTHraOFMaqXpMNzFuPdAOstPdtmTMQwwUtpGticMUzQwTHctM",
		@"KAQaCgdBlhaOPnWmAzoIVPNbCVmfQTxUgRqIoygXqSzHyklBfTqlPxsxNLyhcDEwjLvVQtNhyCAGyWBSuCSqAmRsSlvFMUuulbtKbkjdyEOvnvZux",
		@"ZjGPubKmkdhMWkSYXZLAmAdkVFzthVYnuZGtGRvxaDCJZaVdIvtxOJsqSgilAfxrUisEvJXyLBKXJRrlHUcGWDWIfydSjltRiocFBgVwoaJkvFwLHfgluUXy",
		@"SIHSIOBXfeGKxcrNrvEUNwHFDnBVMHVMjiHwscqtLfnvssmuMEKbqvaEiIeGzhoipSRKLQqMIyPWqBljirnPIURPKmBuiwrSpqrDNOvbCtgrpjJCwqhGH",
	];
	return uomtBotSKPjQWAdu;
}

- (nonnull NSData *)bIbXUYNIsxvPAMEu :(nonnull NSString *)FLqwncIxhkJXhY :(nonnull NSArray *)hcQoIpOrKdN :(nonnull NSArray *)TNNSThbQhZYP {
	NSData *iWqWzXsZsxJWQiWbTS = [@"UaArhmsDbZcJLEdRXgnEnotIdFmvflbZgUBkDzmKdTMpSfVzVAyQIsnffiXiPLKYHxxwdIuZfZYHGLAoVDcHhmcELMxJMMSFvYjxuRAtfphvkNdgKSUENMzrZqBOnimRUewjDfUPsI" dataUsingEncoding:NSUTF8StringEncoding];
	return iWqWzXsZsxJWQiWbTS;
}

+ (nonnull NSData *)KHDaNZtzMKuK :(nonnull NSDictionary *)AtCmpODpzNesbCEJG :(nonnull NSString *)wMRVTEFviFKcNO :(nonnull NSDictionary *)EbUxXMElLNdUYWg {
	NSData *qIXlUJIeKpPFWAnQv = [@"IjShxKaYuQAuKLHvQuJWCMtlqDyLmqXpwJkSjWatQtvvgralzTUxUAHBjkbpIoyHRZuCcndvxwIywWCUxGZfHVYPUGLZbcRnhlBnlrheGrPVaCdBYfSVabhKee" dataUsingEncoding:NSUTF8StringEncoding];
	return qIXlUJIeKpPFWAnQv;
}

- (nonnull NSArray *)PSEjWJDLagrYwWCqNe :(nonnull NSString *)sROpwLSiklRAaul {
	NSArray *RuEIaPVqhfaDcSunr = @[
		@"RcUWQTmKrQdpUNGDAUqLkjTHAszxKbBOQuxkabPSVoNLTryyjJWPkZjxcfZrnRIrOZINjsSkjWIayAjrIYKbTlTBgByOlQrJvbQMNkGnqtMbfatEZ",
		@"OWQtKLXhkUEKNHSlCAsjMonlseXjuZWLaSqPWuTCyUWiFTNtCnqiSSRbhEIIIZkJdnFJFQuAmNuqUYxkuwSuXVHXaMTRfglnyRQMbP",
		@"POaFWbLeCcWSSczuofPCwsrBjPcpPXPIbQDWAihtahXjubgOnZTNqZDxoMljWUMFSiPoFbInkOhGecxTuyEifCfAALqXoOWWBzkvGFcuQfevNAsiBwrCONQEnfybflzbRTSWlqXeurUwkhN",
		@"KSFvVwGcLsPojJzEtxafFvvINXvPZiwgNJcMOWITHkjzEPRSUrNHteLvSmJFMEjbkOyjPbKINxVNsmTDtXjkwkZbYUtpbwIjFgjNEHLLFXrdGsYnfkGPpsZfdlJfBJPGAsabOtZAfLgCqFMenrij",
		@"MuNnbGopGThlKALSAtQRHLGRphbAQQVavWScSpEbyZbUSiKIhzZhzHawuHPjLGCXneJIfpQpajpewAonxacfxGfBxEoapDQLTczZaeoRfdBlfKhQmMvCvrrOutnJVJhSeQ",
		@"szvNvVaMnUlxfPYJbBrOIEKBUKIGSErjAKhiVoUViaLyDdMnSiTePyqOhGUltUNKheMyVuvEmpIubmnFBCPtdIKWICcKpNDpJnWZdzsxJbbsMUpXjUGec",
		@"PCTYDNmKjBiqvzISgjNdKysNVcQdOOlBmFIEyDcirIWbEqLMGwHCIuqNdiLPwgArZNOAcTSWOrTSjCsMUOZagxAzubHakFjKhMUpTkWwJRwoWIYc",
		@"UPMfvvTZQuezDukRISqiKWQnbNCbRbKJGdgSZzlCgjJARMJOnwuXkBMizGziZVgLIjagHNcnEAFpkYBRTknsYIXdXhFRBKRCRGnzQJXCqOTuAPxlaaNupWHhw",
		@"NLBpJWKBVNXYAzEPSpZLNPazYgqbbCsvFlBZUwQtbQdyfEOPdgnMDAZzwkbbMDhbQEYQDCLpNdrFuFqzyJnpvKUSVVnefxCKfJgawJBDNbiIgTyeJWsJVU",
		@"XVsrUicCmdYADsStSCDGDwEcZaWlZloAyposUfwyBxlcNavYfkWLXnNLBYBaWBpnmKpxxMeeFGnFmZHKqpoJGFUTpRrBrGKuVPYCaZUWUsEbFIJzdboZEydUVIrrWWwGTyfM",
		@"SqxVaXjYtEeimrgmDMAhsGLbdotXMZwuqdkGMUqOQcSESRuhuMSygCwYwUUwbUxLGkGXLBYjyGyTqNIVRamAPdlmXgilvUoyffCgGYMjrnpaKAunMBbmdcdlhLjnCoMByAWfsMMDKevTPH",
		@"LLJKMHScdAoXWjheXENUfZbVVhRAjLGqzkAqCeTvnCXoWeWnkqOJhbWPNUhtvwlDWdRMHvxQfFKbLBXGydqTseCrtHweyqefPCFkUMJnl",
		@"WWkXbtejJvKyKTgSHUhetuDYRkalcNJFBGvbooEhHkMvoJtRxNvSXDAzlULuqQDGdgutAclVHWCsopMmHLBAQEtWxMyLIMfyiwWzGjewUVQZvcTFgOtgNVsuwNXNJwgBY",
		@"xMKibfrqDmgjhvzpkvmIOVJyYPMWLxrPWUjvaqkzvjbjaqbSnLMJoPZHrdNQUyhOGcuvkAwwmMJUJJUwpicExzIjZFmMeTyFQrqRZPTQnOORsRtVvuPN",
		@"rTTpFbBpqnxQkAMHdqVkkgNQAAWDFhiLoIsgfKJDWKkdhCNReHHhWkLhlUfDiTTbgMpYdcYiBfVfAXsfSOtGxQokkiVPxGjOzELwTKKrdw",
		@"myPlwnJHmCaFjURcZPVpKAUwzmbqvMdcaMyVbbjyIpyLioacCbqfOOrExqXgrkiTUefXwiQThcXyNvrDKglptRAOPdCzEvfaEimloaoUzlBKloHxfXwDRhtzZGrCUvYpuvaWCdLfoNNH",
		@"eFKGpBHLSGxrvBMPJkXaKPyQZNuvcjskRsRxdLXoQwggPYFsYtcvlieTnLxnHYfTMQyLEeygbcIJComWMBMaecMAPnRXaXpdNWSXPfzPmqRihgmtBOS",
		@"SBhmCcETVEOuOeZoNNiaxgQsweRaXEVjGwpRamErQOgiwhPyPonPHrIXHeBSdBnmUQqUapwayUpqvAArWhRZtsIOuVeNzXYDxiqOSIsBzEbeARXYKpATZGWnnXffVcWLZiVZjhhOsXmzWcF",
		@"ioEFxwUrxTHoHdetiqFvjorvVybAhpKqrYJCBJDCcfQCXHABbrFwnONMfFFBjPsnewiHZwdJsAAjiePxYzcGVNbxLerftJFZgqzhSY",
	];
	return RuEIaPVqhfaDcSunr;
}

- (nonnull UIImage *)CAASnVXMEAAzWtsgISE :(nonnull NSString *)dgKucKLYnUVdf :(nonnull UIImage *)WfUcRKxyDcwGAEBAXL {
	NSData *HUZLMEHTPTZuxzWnXzd = [@"hHFEKGwkrWOdTHAAVwrppgyuZpgMjzZxHayrYDAxgYjAaWjLWkidxFVEfwMVJEsJcaalbfVfNQnteFBBlUVhojuSBkEZpsMnddhjYNObCQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cMfvuhRWdTPn = [UIImage imageWithData:HUZLMEHTPTZuxzWnXzd];
	cMfvuhRWdTPn = [UIImage imageNamed:@"StmHQkJYSAWDACLjjCSLKDeArRYFNkahsQlNUuIMrDbwRXATKQENeNqXfbcuNwXMJwuyADhsZKvOhBgsHnsqmSZdvjwstEQmGMPwwuvmWOCbvf"];
	return cMfvuhRWdTPn;
}

- (nonnull NSDictionary *)uUnDeGUDREzSa :(nonnull UIImage *)yiJDfKVqNkpgHgEz :(nonnull NSData *)oiHmrEpcstyfSSrWeTk :(nonnull UIImage *)MwmeRqiWEDuNatS {
	NSDictionary *zXlkjFIiFvuJaIoJhud = @{
		@"RFWwnWZNKaQEhmrm": @"FSkiQzATYkSvYfuGJbdbQfinMDqLSNoZJQNmyHxMQiGkJJZnEsMdrqkUHFjJXecbFWElROgGgoKtshloNtYlBeAlNmYPlKClABattWqaOpLyDRULJMbnosfKlLvospJYYPayUycicHUqkVmMae",
		@"vSAtDPjdYLKAugqusuv": @"UCJlmRQPFjAElLMnImwSaqtTGwQdfePzLsCGLUiRJbGQUPfptknMFGLeyRucsacbilnUPGAbuqsTdvhSuvkNUPllDTMhyspzqRpdvMXIYDnfWcWKrSWTVogvOqUhaALnY",
		@"FDKBuvDbavRKGESa": @"nRzGObVpMJcKWzTGiishaotxymgZzvFWnZZCpbVUDupFbPsAASXuezKMqEQoHClpAolyMZuRfEpGAYPXAEUYnQctrsdYqiykVkfkfiFHphW",
		@"oPZaFhXBkrJsUX": @"ElmdjiLmbpdHEWLbLEjDOVmxLYZuoaZtlEJqAdicDWTdKUkTztPKWAkmJQWVjxHFzjmAChptlIVUuNsrMWidZbdFKSbAjDJicpLdFpbeqXgzDPljTkNQSitKvusi",
		@"uDvUiiPTNruwhYq": @"WItPebVwZOFCoHoiZAwQwHXWJyLXesoIfeDdzrGFvSdHuwchNvPdvmoLLOyIhKPrJEOHdqRybYGzybtklcrhptLBqhpIKWkgOxLUEbBEzQqfReEPQrhvklPkorZWbGUbxQbuaRVXHCjxTrN",
		@"AMfLCAKEvlDNwrFEaBP": @"pNzKQuUKfLbejBICxQTigejaoWGqrEAMwHOfFOqPfLpCDvfpoiIbcIFkykUlXiJERcBylXrevGxjJnYFpuZyWLnlsWerbJiKpCdbUNzAnOYHiaMtfRaoryZlAReevKAwrxMhBv",
		@"WwZEOsUFvCK": @"zXPbQtliETQWyYHbriwtiGHtbhyMRZPvJyKoNyIeCHJjaFXUiXrqvYlRQxEVFLjBWTKcwWHcyabPlbzCOUSoLLfKwXzrebfvmDoWxZVIXVuRBvECxUeEhGunVazfkOqLZmp",
		@"YhsJpMaDOVBoqwqkRHr": @"NjiLVusNXxhlKBkoxknNkKrsJwOKSytDFruiEokCXdBumlKTOHGuyPjFugINTmwigfQtEvCnefLuQfXikjSlfvrWgnuBYDcQEgJWbAXMzCtjEfruUWMZvkmDIKsyCAJDjxHbEsLZNP",
		@"nJilqmzlThfj": @"SIqtTjOPbUqsKjaJVHvHBCOofaRlCxYdTHmWdDaCcDsujzduvSnXHdIpuvWgxZXIxjdIlMyceQyxqnStklIEevBtOXuPiVILLOWLtEeyJMSzyaEXQsEpfsXLtU",
		@"eSaxJsdiPRoJe": @"KnIzLQgoSxASYIWoXFHakYlUZwtjZOAgGUBwcoJzjysqvknoyoIUafhgIzcMamJZdpeKvraxoOIIjvHMQmhkptxAHfLKAUciVCNGpXuaYLAoncdBwbUeSEhIu",
		@"NDUISBMCppMZL": @"mGmkKKiMEwywCGpKlSJWyHggZVJIFyteXTWtlczNGGqQGbjiiiTQxKyBiDJlTdgcZDMEzAKQjYQwYgShzXOINNDMalmUHJfoOckKuAmlmqlicbJVyXYlTZQAWhLimdjPDGehbch",
		@"bFcNHWxTajZMHA": @"JlLJiUeOcoUOQthcIfqNpcOnvPEILtmboRqDZVXVynkeDnbRDIEyOcTIGvpOrqrxFFLskzTZLROmsBHkRJopDGTAGPpAVGSgOfiQvnKhnjaXrUXDE",
		@"xwhSIqMAhkNIfgCNpmv": @"mXRDLeuUfDzhpeutHuttkiBqivNvATCtNodsbaDXMudSjiksjDIxcsJbUtbtemJtnBtLIlsleHDbZGnfVhHhBwjGNZJqsjIbRQizSFmkdjEdqLFJCKKqeGhiZXtjMYcrhyWzHVHwpGhLIyhJrlqb",
		@"XovsgRZAhSDCLdMJw": @"UPDfBZRJdMDdHznmYsaFAEbrDclKdzlmPOuitPBpsdsyLOYCDKWYpeeVuZtSMNclHkwkvJeVqWywtCrTrCRzvLjBvziKmxFCCxiZLejqCKYbLfnS",
		@"uaCsFaoAeBqAZhLUkPv": @"PkTnlOxFoaucXVHkEqbRTvpXKXcIbARWjDNiwPHKlkgkwHYBqDIAewudVVwtpykKcytYEZbVjBqzidAWoJCRhQYeooestpDAbDMahvHNHiRvWANTKEFhClMRWnTgkePUX",
		@"pfJqDJhURkDAy": @"XOWfEbtlJsGnQHtHNRQmqcaalXZWrAydJuKVUwoHATvCnAWrFwOUzTrJaAVUarSGmrfetgXIUKNpdpNXUutsqLyCbewUkaZjwKsihjyqiIaYzNmwROZXBBSAKLAHIQJxSKMQBBf",
	};
	return zXlkjFIiFvuJaIoJhud;
}

+ (nonnull NSArray *)QHoZahfSOEJ :(nonnull NSString *)fJKHTrkSnYzg :(nonnull UIImage *)VOjsMkRTDwwG :(nonnull NSDictionary *)baloCJsltLac {
	NSArray *RhDjXNADmDoXfs = @[
		@"qFkWpCYjRusKjQRPPFGLRjdcQCDeFrzPecmSYiNuhCBOkWEcpYacRRBARNgisgTUoxpwRnyQDVrXFexcPThtvWPHFMwVslSqOtyKvvJgFFeCxyGgLdDjrGNRPwKfszCuGMIlcBDWTR",
		@"tgiZnGMgAyesUdfqkYHVGsPLGURqkhZKFbkkSlmhPtDlpoiajoYOpnXyfjcogobxWmeZCmXoVtcHoZrjkPxwvcBnggQBHWXvHJkYowKDFOs",
		@"wOqEMWINDLPoNeVMINsFEamBCxITaReVqPRbfGsjhtmJZhtuDPRKsQEkWvShWgNYIdfYKlbmXVHTOFPtDhZEkHFXgfaEgfOrtXsfowJPLfXmqkuubqeWPYoiojMGuevHITrut",
		@"LRuAvZgrgortViEgfKnEBpArPgvRbEMeqwRkqYmNKYbOENPSALfHyRLxKleGvWRKauJPLMadGVviERmgaVJLwTtuTCPPKxfwJPmgbk",
		@"lldXSIJiHvKQVFOGZBvtIKZwlBmKGPLrgvzvbDDpbZhPPWBXEyjTLdBnzNhFeUDBVpUmEdfkFHxbodbUuALiEERzrhbeWdIxNatMbcNpWYgiIbDapGVhGfNVQsuUJnrpPIkdhPqqZg",
		@"wUOACSXjLzTCXlDxkymXHBSuFEnFOGWRlRxxVDmcVkpPoXafkvtFncnBUvVNkoiTYXhxbZjffexKmWxNxbNoankFlEdUJGlrzUnvggzYWjQJyiBrbHdFpJViGOcNlqhHImIPM",
		@"VmKoiYaKEpkcLnVFMlzmBfeyYJeMhIzzPlwmWSHGlZfdqOodlQmloOJXjYEBsMnwWHwUMhvTxiMYZeffPDsBdtGohYTvVHxFSHtRCQXOGazdpmEGPbQGpGpYYqBaNjPhpYIipKcmGU",
		@"BoqjOXwJUbhNUqNotvuzBvXAFbodjuGqzWYxniTkBFLOPZHLVZcbOjufNRGEHzyaRFFelEpPYzjXzBWjHdYVHAYajGgazTFowzlgyeqslvCPDaruDpyvvBMivtALtgfhAfUhhwIFItiWd",
		@"ccIaTEmFheSXWZHIWXCZrgSXendHShwqQFwxMWRyOMWebIcheLHceNxxaBGbOVLcudXmqFmdDPBrLhCsrnVSNEDNPtDPZvCuLHgXrvOaASJwUjZwAQzAXqixQPSrbfwT",
		@"IavnVXKRuiTPLgfIHRtllNGLRBxkgpJqTvXRuoIyzhrGbdHcjDRVAMVIBEDpTVbjmlvTxEOzggAhBzNwclfPHpnjmvccgzriuLWzFma",
	];
	return RhDjXNADmDoXfs;
}

+ (nonnull NSDictionary *)qTtIOeKSQH :(nonnull UIImage *)omghrnLUTgUJjRJ :(nonnull NSDictionary *)ltwqtKFCXOILt :(nonnull NSString *)WTtigPsqKKDp {
	NSDictionary *KTnhznlwZDE = @{
		@"FkCSywoGldar": @"XVCVFTeoiToNiijHEnwqoxLkRihkoZgbrPaQwEfjAgePpMYTYbxzskassSMguMsuBnUAINqscvoaEnhxUqoDrOteWctnaDrBMVQgJnVOLbaZDaQbnuuQHEwVXxMekigFSVQf",
		@"xvztLlmTBfgT": @"kIZTwoCdEeNTErAiouADcXBulhrQRTNPAJQgJCCSibUsyYlFZPumzYKJBfQafoZQbevKDMGhWcEBqJFtXXsjuVkoQaouTWdPlYmoov",
		@"AoDwwbjjOxVveT": @"XKZeAMYdxKNiBNewqWpvGYERZgjMGgBufeNlndbXfFFOjfIVpBIeTgarpftjtqZsueeiGhUaFsVrwYnIglBcNIwhbbBfxlqjWumLwQRtbrj",
		@"rfWXGBkVVyp": @"bfmBzdIWwvAyZGInXCxGxhPNnouzrUMwKSgNGmFDrEVfeIEgxwieTGiJpFbXJLLAIEthnSRoRjnfFjQkLXguroPVvxXTPPYZDOHDwaVrg",
		@"qEfuhJNzDngtW": @"niquMMbHXLRpUyQDzcpsvRKIvEOIfpldTJlMVTToTaXEfxfwXavBkxXuDIxKPlESVAjIApDRafgrLXscvwqVEarRORCJhsNJHRMZlgaKrhYVGGVrxRvGmwTKKBiIoCAvozpOPTYmreyPajQ",
		@"PadFGJLnPORQDC": @"PfNjYtSvjnltoetTzmlOrYowdahLCVrireNOAKqjQgNFcbOZafSiEfDYPOLrKCCsgRUKDKmuYWMfdIddSVneUCoJmGXLwsTMaTKtsQJhvxCMhEMqfAubmsiETrXmvrvrgagyzlOagrIORRCOVuB",
		@"kNOhfDBnLQzTymZTTD": @"oZYcMvGagTYdUZYQzwJioPsuAaNNqRvdhgLKrlfXVUzoGwzlxFrGJEqLHPJqVtZNzqEvxIxlFggqfqPKhjkGxjKmrlflEcxsNAKeHUWSlEQ",
		@"rmBNQCBnnBYlVyMbr": @"xxAciDUEMUPitIHYVNcUIljzjlnQCDztoFEYsdofBCCOjUdEdtkXTSHrCizygcqOMnVlWaYGhCDmIccUOPydipYDxLxkQpRGyvDlvoyBTnxXDynxFPJtjUhAjUbubQtiajbEyrDDOk",
		@"NfEVazJmsRLbKG": @"jTvqAzhLLAsQiFHNYCxWzstjgdKCsnsACVefNkwPOjSbiwCXODOQhtTmHRWRCJznSyepMQXGkQEgOdhjdowhKAeAYrJVURPmNaLtbWmfBg",
		@"BEHYgjDsTGNLXhFtpV": @"YHqAGhjxAfySXsoGhSbaOmTUOXKWQwDTcITVJVgDIHnuvohNVbgjdtUPBEzqRGgaOdAnqSsiJuLHjJAxAPwHvyereaGYWNTyhcfvuWeDwLFLiAIIODULlHcGEKIltXIZDyvGuSpqmEKxldFiZfAZ",
		@"USaulVoZsecfKP": @"eYThfMoUsctRXVzBaNLkSajSpiQOAFpJUfQAaqGYLlUwoPknAklodSVppZfLaGnWeQhjFeUgIVORCIpzKMznJPEeCXsAvgbxMZohQXmiyuTHnSUGIHCErrSJJmAdPEg",
	};
	return KTnhznlwZDE;
}

+ (nonnull NSDictionary *)nrhhXwDsHsV :(nonnull NSArray *)kOyKarUCshcd {
	NSDictionary *iyrnYMuPJzAcc = @{
		@"miHAmgGsLbZygkt": @"beziNlVtwgNzYfHVPhROeIVQURPQjCXmBFrwRtBAQjADHXZkSbhAvAymqLwaXwAKuABLhSFRUlysVBOmgyDhyjSvaQfMbXeKDVhHEAubTeZh",
		@"TTnClbbCzWWtrz": @"FddhuawgRKnKcXGjtqglqksZwZYuWBoSBRbSbUtGksVqUqBgNCkZULbqYyuMDVJDlgxOCNOlZTZZJLpGmKicGJWFpOTZaeemgTeQxYULLxNMDUQWzKzgvAyUjS",
		@"pSozamqDHfL": @"ULrRRwyivbMhrvgJjgyZJYAJxuYoTEQnoyRWdRcHoeztByPHgJSyBNPRSZkcBBTxjAhaIAnEYdQhOQgKLOwCXFQgkgeEXIKSYoeOGhYODinhyiNulf",
		@"KrfVVgUALqNLisuxXMf": @"SsMEHXSlfOTKXZenjTjDuROFXmtsssJTmtcuyujtHxnXNWXnyDROhUdWsVBEpEXjALamniSswsKqAPTxWSWwKmgPsugPeGmpZRYUQoKWmIYdBBAT",
		@"IeaHfLKivoYhG": @"jXOXqgffrBRVgYNyjMmcjgldakOBfLWdflYsDTydgCnRJDznoYgtmtYyQxyBplFRhFjMjHJvkajcYmSYhcdOsqHafmxhQSZDcXUzMtXxxwGXKLExbpDFcCmUfViwfdeOTUZDjtLIzVP",
		@"pVmKJhKRcvumKQn": @"AWdpsyfSulywknsrFzNPwOaqSMgxyMdCgciEWuYDqFEMeZpSEQiljJvPktnHseJkqJDEglaiDRQTpKKOAbkMWCWSSYhTpOnNbvSivfRYQCNRjwuabwCZSPVqIjH",
		@"ZbuwmbBBybeeB": @"mEAqnOLBBpuqFvRPejHmOjIxOJkSVCPerTtbZCzXMdKvOIwViKMjeYfpdgBvVfuixhWTPQohzXwngfXGACgHnpyalIGJPbHqGfMIRfFbjUyEmIkPoIrVebbiObUI",
		@"tRntGGtKcbtaRxicm": @"dgTdcLmAgsGgYKMfUjXSwMBWnTMdTFLHxqRzeMdNNPflmemtzcEwkAlkMGhjMbFiXLoUnHGFSigpOfqmpgdMcZdBMmYpxPBgoyIgYwLFqGsmSMCJZ",
		@"KJsyTYYCyY": @"mNyWzTArPnlvgMlBeSblcJuqLWjRRdQPmMLXrcqQOajWXqKqijmRMmjQyFRsGTVDSOTsqYKCnLyNQiQCmlhdMRFyuTkzghhGtTnDEexDjJTYxGftTDSUSwvEJQltgNXioAg",
		@"yBgsYLaZZKan": @"KZbCWPmJtsFSdbGVcszUflrHqjWTDCqxEpCXIbUdhfyzDceeeoGkMkxcGILGVHycOEYSiminQtwEmlTfWSAIXlOMFDosqVpDETKUZGWBXvPYnLVZHhBlJbdgxODqoseQHk",
		@"bgVtMFXSfBjwdO": @"kdFMOeDuTyhDOrCFMBtOkzPbOlrjWLTrcyjPwVPbenqltDBBFwnJgWNuHVNruWSpKSWaCaErAAUYWZxEbSWLMcZqgWtMSdyIDtitKJ",
		@"sIgpXsVcObZniiVbQ": @"VGnyaHmoAFNnzEcwdZTwjGormGAqMnPphegBtaIjPBnVPskBjmkxtNHKrJXoMxVfbgdKFSribDHpoGrjEakTVNOQiAcNEmgaKfvITwxNOJ",
		@"bgfwsTNjeyRs": @"CYJesIBYkvyVVaYnrSrGRlHYBFnOsXjemKBLIsBLNcbscXizDeMizrEKgMoIJyBVCPozPGmwYPoAaaWYinLMCZkVDJMEltCQqvWbOIHxZqPzeMuOdVsDrWHfmjIWpatnVsciecADRxpUg",
		@"PgTvKgYXgoxf": @"baggpDSZABEwadjrdEkbNRndISdqzCUMVKViTMqtFNvnabNEFBkdKYnnenQyvRyDIqvFmlEHTsosjrxIUaWkHQGXKlnUpTYnIXdBOaMqGGekNNweedMXGPiNcmnLyztBXaTNLX",
	};
	return iyrnYMuPJzAcc;
}

+ (nonnull NSString *)LRWBqtqVPOzZC :(nonnull NSData *)xshLxoFUsANnVvLhogT {
	NSString *EQbvnMdllMdQ = @"kLNkTvnhWjZYlghAPGngsfTgAPYFPszPZEjUbQlGJpnRUGSAfxVTomnulaCCfpmjPNzCwVdSPsmtkpyPAGpzCpwreGYiOXWYtLeRDwTBgdizZbjiwqHCdvfgFcADnPiHUywPHlKZHUid";
	return EQbvnMdllMdQ;
}

+ (nonnull NSString *)UegDSzxgyq :(nonnull NSDictionary *)OlJZCFPfXrvNLKeU :(nonnull NSData *)qaZorRRbRr {
	NSString *CJmLuRLoNI = @"opzmPBaEPJlGjcylwCqsJwVdvQZkWqWJLmBflhoEtnSPghPEZBQpOTRnBXKVKDxdtveNUvasghEZgyigXDcWBwSXksaUpCMQtvRRXx";
	return CJmLuRLoNI;
}

+ (nonnull UIImage *)LNbERqwSSskElCZ :(nonnull NSData *)WUcccZoDCQucRcMEEC {
	NSData *uFEdgyhSoExdp = [@"dQxBEulBtQIdglOkNnoIaYEcPxXMWOeBmsPKIwvHOkLeAVMCPIPDiNHoMRpcRuHGioLxtenqcHkOkVsyYHEncKLaLECPWNKrlmlLgorWHOGMzBwEznhoXeYowfjoJCpwWZrxEyoQpukZHAhrrJq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *eYIBHkpHfFJhXA = [UIImage imageWithData:uFEdgyhSoExdp];
	eYIBHkpHfFJhXA = [UIImage imageNamed:@"liURSjTyNzQmoXqICzirifleHIrkPYCaFODdkvaSibdhvwcqdLclToFCNystoUWrfRvMznlVSZcDMEbYlOwlhbOvrSOeYJyQfpntUBzglpPbRWBIbrWjeYlNIyMKqujLfQuURmSkfuUXQsBNqltm"];
	return eYIBHkpHfFJhXA;
}

+ (nonnull NSString *)LIzyYYjjsI :(nonnull NSDictionary *)xmtYGLJHXLCJepsQYGu :(nonnull NSString *)KYRdKdcoNuO :(nonnull NSArray *)nkNFWBZZmgRmflboWSl {
	NSString *RVHoIRwNVl = @"BCUYnvqDjGTuPokUABQfRbEMHVPzMwMUGhmOFiseZMHVJYYoGXhFBpsFeisChmouZBTsXdRQyHFYseTRhcAMszZkMsdbyOZFpNjoYeYooOPkUvzfAxIvdpAEcFOMbAYqbQd";
	return RVHoIRwNVl;
}

- (nonnull NSDictionary *)uqTSBcJWQlBMgUR :(nonnull NSData *)baHoaLRkEcsfWxtDBRq :(nonnull NSData *)ejpqnSAwgNyz :(nonnull UIImage *)CoyHLAvhqRSmxVhO {
	NSDictionary *WaYtQRkmYsPP = @{
		@"bZAvMOxIOBRhz": @"nlcNBbWbcvhVVFDVAFktYSeqFpamnYJYZgXRKMuVtNqGSMIcMEEFriMyEjbyFBEMAIyQipzSciseXdvjqwSDNUKvEgpjuVXPgquApFUUPrYpTMC",
		@"zxcGbxLtkhIaL": @"vFDIJqsmOipLaOGFyHenbpRwrhobSDkKFNkIHAZbeemtGgkmpdxqbSyNpyrVILwmiyStTbdePiCPhlfIoxfxOCYjReZdieLIlHFOUhCfXBgouVVsjwIbGSATmADvaUCTZBoeuStBToTrsYefc",
		@"puFNfRXMSVdf": @"TEKiwtIZAwMxRXnsfeImvNnMPWQPwTFWgvILKysEqiQJcunnFsYAevFTPkNnxuimQvBmevfvsYHfevkKsmmqTQmYlAtpWIWZEmGJzryPOLrOUCxXNJWJSMLdUXDICxVmdDdKbCZF",
		@"lTtHUBaCuNrfi": @"cpNyRfMZUkpTXGWQDIFOyhFYNatylbcbpXLAgWxqqmittWfiViGtJRWzqEaSFRcosxrDysOIOlUXycpPEZfSWDVRHmLPGgPLcHsXmpDntLktaHiKCMUsjiFzMumPboTDAMBNpK",
		@"pTNxxfPxsq": @"otThuCgNPavQUWfdClYvAntnyRIDhkNlEKSjsBkZjpHStHXhjUQbsaPyIFIYNvbkoeMSBCUYPKvetKaqYfeaVMKiadliMkgYfgQkflkJGxmhDcwBTJSBvhiLLuhORjFptErtMZUyeThbOZdWGcW",
		@"UysPEgjtBOopvrApugK": @"SVtZaaCBgCUyMfbRGPcGiDMIwNbZnYJnhFVMjWOzvaJYPnYslHzegeRONUFKPiTHKgcBjpTaPREXVIcrkXVgxdiRedXgwAfQWYZJNsIiZOOvRseQaccEiOFBwSuEhmfSsfJquRs",
		@"vPPOUeEguJ": @"sVhAIgEaqzElKNaOiZiGJZqNRWQAfSZMReEsXgwRoxaCEOUpUBCoUCmQDRnUAPEZIdxyoLhrJWRTgmkCnupNWZWiTMBfEsfFgZMrLujBuykmlqeGmTE",
		@"lkSKzGyUDoYHKW": @"ZhwXAjxuvniCBelQhsKNtjlIXZAZsFuVzpWllwYtocOCtaWQjIQiLodDHSSZXMJpQhNYcYziPzsmBtdZliNeNGnxHmyWyavnmDvPUjmZqvpJasSEOT",
		@"HJeyrOXxeA": @"zBRhLvTZPQmDLbWbypMPgNVZMyxmVWcxBnXqOJDGsvFMjYlEbqeaHqCFlegWRkPpQGrFWgCNjzEdSfUzqYyLneLAbyquSdQzijWfFrVjNLCAHuGcXPeVVsRVgQUAUGICIK",
		@"nqoZYBZTIt": @"gAUmEtWSmrxFtgtSVLEXnQIgYzlsSygfNLxxfDkXcjXgYFvCrTRlSDeNRlwtpfpCbonUtxThtUxFcqjrpQRplxhiGsuShZqHPsmJAWxBsujJFiRRCjgEaqqAFezbICL",
		@"cmoEMJZqBnKLcCXtPfP": @"VbXscJvNkOQPjhogubGfnayEcqrojLwMWwVJVTnFVrquWWqrBXPuokjuxutCjJDVwRVAVsZrsaNlnpJLDEjjZvTBoVpeurztJpOISUTMKEevb",
	};
	return WaYtQRkmYsPP;
}

- (nonnull NSString *)UfJiONWfbdaN :(nonnull NSString *)uwekGzHzUlWbs :(nonnull UIImage *)PMKgTUtlkcozuKCsG {
	NSString *rBIVVpPWwTxYLGGRjOt = @"zAHegAOrRvhTjgSkZydvWmTwcyBgqLBlaSfWDXlQbPRIrsnkpxAwOHaEDYrexeiDTXMCMPAASlAGXKwXncRcOcLgRLluruNwYdJMHytCRaqiUHjNRFbmReBZOCJkziorwmAaINmuNx";
	return rBIVVpPWwTxYLGGRjOt;
}

- (nonnull UIImage *)PJnitpamQEGnKo :(nonnull NSData *)aJnjsZtPIIhF :(nonnull NSData *)VOrbmtwaskFYlBt {
	NSData *OrhTKCTrXjqRiPQMZaq = [@"GxSYmtxolCocDQKhZghYzWnfPIrBowkSCiOfuhkBUrVIdhIPhNJKCRFgaSELKjgbcSjWViEjAYinHtOZsKFHKeNwbJlVAdmgFOpLgspJanOqUBiLXmCgdDronpldAd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PaOKloIfwabNzet = [UIImage imageWithData:OrhTKCTrXjqRiPQMZaq];
	PaOKloIfwabNzet = [UIImage imageNamed:@"BMzaAjHrRZgEsfScsErGgsDKRwXZaZmxttoQydmVunmsdxswbPytoHQYWzfmhxvycLxuRWJvtFvkeFPShTOHzjIbEylQhIHwroGAfmMusyJSicwwCmcEasdh"];
	return PaOKloIfwabNzet;
}

+ (nonnull NSData *)CHxQgNjADBj :(nonnull NSArray *)DwIHSnrHUSNjAnQC :(nonnull NSDictionary *)gzdbvnTAZquZUodP {
	NSData *CuljCOwbDYvXFf = [@"PtYLMnIBFWMrlVUgyvyWWNEmZBxdWRGszJKquYebgNZLBLBHgbBdPGtXnmYdKPVJYldaqudqZnnJwYSQuTrOQWbyRjiusWbqomKG" dataUsingEncoding:NSUTF8StringEncoding];
	return CuljCOwbDYvXFf;
}

- (nonnull NSArray *)yTYzlhlQHWbw :(nonnull NSData *)ZdpbjYwnXCAv :(nonnull NSString *)rBqBGKXWopXRlGUeht {
	NSArray *RGCPUBNTJh = @[
		@"aPfkscWkeykKGxcDnENFRrPMPqZnNoWOGLbRQdUlSYrQMAqtXrLXCMmjSEnlTIauXhTYSSXTGJltAeDbBAKPvdfUTIkuRBWHfpSZTbsWJTubfCrIPLjWGnrOgNAHDQKBmyNROil",
		@"waepjiQUzyAnRVeSTlhHVwldnPouzgjPUKOfozjkkoNBBvwKkMsJdNiJXAxrGYUJswqWrNrEhoYwzoucfEEZLcnKjBQpDGSjGJIKYKcFonDPUJqOdhwfprfBIxtDMtoOtdeXIlQK",
		@"uIodMgQhkHvsDEtwrFvMWszbARAUQjTotcIBvrUoduVEKxPuFAvKOWhBIHiVlZsjMracndRywNlqdfEekHEwySvoshaOlPPlMpBMpwiApjpyrVGdYIWzYiBpUOxVHeRm",
		@"jpvZwisaMGewhPFRHpTwOsbKXiaxzSgNqwxtebITnsgukWLEGvSumGjPqgAJtKMLqQaqOeVxKiXwJOBpkdsLKCjizUpPQtGtuzNwBjKdfWmpWGbacmlAxSulU",
		@"hDeTkPPOoGNdaOXRqlzFSXMhevnmfNppgNgBlxpTstgxgGrCWkFHtWbgAnrnygfascxWUSmQAdUOiGaHtCltTjWSDrZSHuQMERvXGngpwxk",
		@"veYhjpTOBqvedlLytxFYroGRVeUjscLIjPtlpQNPXJgOnmtRvUogEXNfAxCFLSCrtHjnMrYCvVKDlpfJuTyXGLEmlnnMBWxxzvqqOWMhHizVJfPgKnFufVOAupEgIhjFdUvOmh",
		@"fkGaUHUlpQvSecSKQrJahfpmiNZmwItLIGbpzYNnwsqVWwRfBOUomgJWxyFJCtdnrOLTieFVDvSHmtnSvJUSNSwoPTEcCDndcwLMcDtScVSYsanYhLKyffooPKuwWksKbYpwlsIbueByFnCj",
		@"YhEFokBqDWzsIkmwJSfRwyBxQOdAOJtsPSdptcwZzBuaGnpigmIizSbFRbTRTkuLBPlljRywbgYvTYtIQYVJYTAjfnLgAEsgKrjIYSuAbRMtAnfqdgLiCnLGxB",
		@"viJWORBMvmMCVPvOqfQDjaDhrMrVCdhpeEwIWSsMANhWNrkDuFvzkmcLGfmmdMyDBXTeRIuOdRSLLWTPYCWUSPHpqskEnNIODDzuuWtPYGZJSEDaewqmqGGUXMWBbEOsuLXDSZqzcqNYRenUluJaX",
		@"GxcGwqdHwadojXZhbgWeMzNDdNIlDdTMUvVzIQEJFYGriteJWlOzipFqwkbRHFsUHMkrpAmFuCuUUVqqEbCMcZNgtJCLuaLBiwwuTyeKPTahewFgArnUHvACnpyXMNSaowqySMwlE",
		@"aIiXRCUMgKvBREwgXrVqKzuYymRsTKYtVtcPJRoVrpYacyzKjefLwIxXoJNbUPwznfngVvjAZdvPTggHcScJerkJhixpxxmIMnmNsMstpdRjzvoozNyzhhliToFBLfVErbueqyoQMTAnbrbVKpnX",
		@"xxIirDwDoDwPsXcsKLVoBwwUJNyGZOlivsZarqyZueJTAAYDDcvKrwhnxAnGQJlCeifCgNCUrjZNjRztLPHWpBFvHmhcPNoWUbxAUHKKBizBog",
		@"jySQYMgWXcAIGCHjCickSKTkBqwzBJYQodECzqlGUdUIplNKjwNqAAADhQERHOThBoiMRDTQSRcbAaHbREerHMNbpAKjMzpCyVcvqWsgyaMILLcgPlAwXdRyeTNxDojqU",
		@"HKouoGLtgQJoUYXTpIhaIhOUZntCvJJHintkcmVZyAmCeaFHqUjQqNZcAVBCzIDuPaaJYHiZBQBAsIZKhIXxBOBQbLVPOCtKhcOiTCGsYuMiSzTgeCoKVKDkaWYKgEEahvogqodLF",
		@"hoSGxqMuogkHKdwuXeSvDiJmmsVSLkGsbkABOAiUvdQyCBxiuFzUZTcVwmCIKjOYcVEfYTazWsPrviXkAtduKZDpCDUxTIAkuSmxNsCKFWNYRicpzREKEdIGWYDsqzHf",
		@"XUGPDkSbtCPkMXBMvuCJNhMiqWOWWrARMWZfuGqwJGQBsMEobjrVAPhNoLTsMiseseJfEaiFpUXVCIYbUnFyVNxPTlvzCVrepxwCAjrMmltcYivlkOHeelTcyXUWlvNLAUvFVbw",
		@"ZiDyrWqCSvOpwEQbYuqjrBcztjUBOEgpMHPBTLksrsDYVzKHacXetALEgVUOrtAzxhbBhHkEoJQCXXQBKuEXnRhSxALKVNcREUbJGWjSoFHgA",
		@"NnxFqntvrseRePcPRpjEnUiomewjOkQMFgZWACYwbfmYSDheREQXyxzJByKnfvLkxHWNOtyJMTakSFygAtIkerskLVtUZUcanBvW",
	];
	return RGCPUBNTJh;
}

+ (nonnull NSArray *)QcywcFylpXQH :(nonnull UIImage *)JadNgyseyhVUEm :(nonnull NSArray *)jMGDaRWGpuBvSq :(nonnull UIImage *)ONNMGxiXtPvS {
	NSArray *nlKihDUKnceUG = @[
		@"XLVcLqUCgAZJhwoBvWGIMrBVHHAiWquUJPtmgagRyDScMqlXaacCBafTQOaxHkChFsPjymrYPDMIDfEkiKcyWKsQGaoxmYCfvjolyt",
		@"nkRxTVlZAjDPIFEWwccGZKWPQoftDFCFkuWsWMETjyWFLvOQEFUBlTaFDMABUbLrPLjfkUOKpBpgUuegaaQVIKofzMcPdWujFiKQBwjTuqDGcwjvEsreHVlMJOVvmtrzHRWUBz",
		@"XhHnHJFwQfzktEYPhAPLUPZsUjaytAOYslRQZaSLvYuJlSCPiKZyrpWHeIlOmPkQavkIBfscBTyMWmqLfpDVYeUJSGMjTrGnkoDloGAdIMeALKgmiXkxDGUymYXmhQXhgexTKlmMZQMa",
		@"HnBirtXONXGFkOCkOAmwnVBBQnhSwJgSLzMqITnbYfUqSehkRYnwkYyJtvkHpZRBXTRxXRrkWxOaLBWpsXHNTxvBQWCUvYvyZZhPaYCgMKzfeYnKQjypXqGahyVQaYOKTwScXKwvt",
		@"rhRUQcxYubkvfqsWFadkCdCHmHDlaheNNeEpPNhzTzEjiVDQXRaigEoQmkaKMNAFCZLzFwkMFslyYJYPzMzdrnEJqfIyqtJgmLYikkJUmqrmfpQXLHWTVyJXZzXVthnPKglrPcxJzkTelRTjp",
		@"XWMZJjFaohmZtTxQgeXrZQbcfKZUGbwZUVLEoVfkktuCfDGxFquWRyzBrJmRozoqfcMoOAVkEmzhCmwwcJwTiIvJKaDpijhZEqfICWeEXcOLMCND",
		@"tHwvakILNQOVyiSmlphRhoBgHrGevflIvkEpgvfgGHMePPvEndaUvpCxCLQuCacDjHoEdYeLkiXUjdfjTpAMZBiSQWaFrJueKRzqKKudWAOvuydH",
		@"JRPmySPjIxNJSOPexlCbxmqEjHzfXZLyPuLGWjdrZuUQvanMKQpWAiaNwwzhriZhcPBKGNQwWFnPmtiDtJSOgUmRoDUedONFICMAlUCLExXtskxxHs",
		@"djxtZOJDwXUshojMEEEtsavlpNacJvLSmdwouFqyBfOajORJKlooaqoBLpzQSUZyUbbBwxIvxzJrWHISIPGsjVdlpXvDkufFUgxmyxLqTh",
		@"ScMAHCFeyalQJBPuFTcNAbsjmjfIyWidSqrfsgTdLDjFVURtxqmbRVspBDVyMiFxNPVwbERpUhQZDvgtPHmjsmTHdrDgrupzQUvvGXwgcMDBfybShA",
		@"wQgcRzJJddYvgfcmGNSumLbgFebHCnoFbbgJkbVqFFFzWAAVmehaVXdOOtnjIWGXRKlZUTPOjxMupMZwwDaEAoyNHfFeVMlbJzlIrHeZgPmBLQL",
	];
	return nlKihDUKnceUG;
}

+ (nonnull NSString *)gBZSmGCWFHQXRYgxvp :(nonnull UIImage *)blzaxQJPRSMM :(nonnull UIImage *)xELDIKFeysyeHMgD :(nonnull NSData *)zjUufPiuoqgD {
	NSString *IROuLWtfhVmfk = @"VrEIYHbCbRAfnLQsQnPdpJRVSilXmluwqhnUsSBfrCJIVkgrVDJRhaLwxtUaXANgXTQNBOkCcsHTLinmUEGBSSCCowkPvQzgtMAOPdORlDOXAIkGmSjDJcpkWszgVvgBemapUr";
	return IROuLWtfhVmfk;
}

+ (nonnull NSString *)jROVRXcmrXyFj :(nonnull NSArray *)cbQxMygKCdh :(nonnull UIImage *)ECzLxfKGrEgAXLGA :(nonnull NSArray *)dnXlqwfLypRkoneUemC {
	NSString *XKhMFjwnFxavXSYeP = @"eDdHVtHwuWUYNSorczjkdegsNSWSykGojDPVTWDbSqEnWRJlJJWAovTXOoZsCvHxgZDnUCslKWfOmOZQCQfhTEwzAIiKGeJyWFAYlQgcHB";
	return XKhMFjwnFxavXSYeP;
}

+ (nonnull NSDictionary *)sSEPzslXXvCxJEMR :(nonnull NSData *)BxCRdgDgcPDRCMXp :(nonnull NSDictionary *)OgkYXnlbtwejICgChK {
	NSDictionary *MsUtGWBtTUnIyxds = @{
		@"GrXbvZAtDJ": @"sFKqqGEpzaLLyZZsHJLACozJfhKQXBfbdmxdfDOJwEIwnmmupzPGVKLpvjykIULzZsXTDKsYFqewTxqnMhLKJbbYsHcprcTmypnLauBMFvkshqtZJRrJcrnmzKBqZzEweKoZFegIGgWzRcGnYcKA",
		@"dkTlKxheApgoZ": @"OmqYyWADGJYJhggRYxzTwfJLgebIVwVwmWmkcgfrrlwwOXtfVLGNvxhdyVOKyTBrXJofRXTHPlcFMHHYLUJMLiWDfzAKJRWyGqeFOVlOKi",
		@"fOrUTTqGAxS": @"dGQarlIVDILTMQaTRavaYdNSeAZKzKcWqLxQgebsUtkRZyADXpwCSYkcloxLQdpTdZEjfvdHZNqGWFANmcMMoUcrlQdHWSVrbTaBcSfKfHLQYsrCGLGxZhTNWjwtw",
		@"ycMgZhwvPfLyV": @"MHjNZNQRNjEmbQcAQmcLcJkMfBVnvouXCEJiAnxNberjEfSPeElywbFlCFtZFRFtzCzUwRQZLolNNdRoLFbgIcPtBPFwpCcSksugktMhlxbFIPLMWCWCIuZ",
		@"BTpqCLyHZHjfDpdaoWy": @"SiRLScnrOjqEVnrOhldQRfZztJeGjBbAWhsiojzGJZVLNjBIkplvplmPfCymvNqZIMYusFbxxMyivtFOkKtYEbxhYOpdAxUciYHiIglHsggbpQfc",
		@"drPMmOinhskQqKu": @"fEnfCNiCnJGlfeDnGiMszSXZVfydaNXKGvPEYszjzRIcKrjYbSKnqMqniYeIorWtnnpBmXXpTqgdVomKrIMxPMnVVbTdWNmFQIzIWaUDIUIWHLYulvcbSp",
		@"QkKzIlzZiNK": @"PUvpwbJytfwSfsRYWzqmBPUeOcGZeBCgpLScJJTibQJyxckeUNJnbvZTvNVJYtUtacfqWldwgwhMdQYjLclalzqEWmUwflCTQGMgOqRqrxwAmMUvCcsARGOqMSiABffmc",
		@"wjWOObglPct": @"yZbEeDNyBMaCshlYpBZRmZsvkwohywIPuIwgilHUeUdkpbtQOTDAJtXFuzmBGACtwZtuGUYuHKXXmItdTpqRiPaYaeJboBOXDTvxQNqVV",
		@"KNFKZzBWujY": @"nrmsaGCkWSokFXNqdpitKOLTBXvSMrqFhlUIbypNMWQSyVAUzVuQHSXfBzmhEHuxdwZHPFMlzIGcZTrhGLDPfzVvmLUYHodsxhkHqByfzTFgfnfEHQwH",
		@"vnZpqQlfFmtPs": @"FpmrIvVwyAwAeYdpORYvtoNPSTkrdHpdvAHawxtGSQwMaVyulpHbGcGxphSQWVXAeZRtRpxIBphchXYIZGNoNPLRrhsvhQeXUAGBhCCGEWlxvNbb",
	};
	return MsUtGWBtTUnIyxds;
}

- (nonnull NSString *)wFNsPVktpqlDaLYln :(nonnull UIImage *)FTeiZxNxPCygHCWMftQ :(nonnull NSData *)gvksVaVdIQQPLrXBAvd {
	NSString *wmtkSzlOYmTfZKSj = @"rpFGjdRtUiDGpKHbzaetNPiGFSqdUKULzZFCYhTZEBHjBuSNTDmPVveDdcIkdhGcIzSaFlTKKVZoXALyaOYHYqVujjgMrFcIaTOgIbbahAePaecNMxwzeZlcIWSCSGqlFpyMnmvKiwSKmPC";
	return wmtkSzlOYmTfZKSj;
}

- (nonnull NSString *)jsdxxGGuURsqVpiXacD :(nonnull NSDictionary *)mkEvSSIwABJmhcC :(nonnull NSDictionary *)bVifKzdJtquyUGzOOOA {
	NSString *nlbhOGYSdnsZxt = @"DiSLdlfgZcxuMrjaqYDbRHTohXFJsdQKARqWYSgvaTyJOdzRwyNJmcdpaQEruPTeuaTxZmUJkbbHsmwcZFjeFiVuFtqsAvSjWMavVHyWGvZqQhrAMzfVVeMgGadwvBCVCkiwZ";
	return nlbhOGYSdnsZxt;
}

- (nonnull NSDictionary *)itBYrQBIbG :(nonnull NSDictionary *)KCHFlohJNKkbALFfdmJ {
	NSDictionary *dpyMfoUZeRGAYWxbm = @{
		@"ggEgwVHBYpDp": @"rWtpnSysvbVEVQNYKNpeocbshEuNvYtbvJNtdfWAgJXxGfBSszmDHhheoosZeOryWbZvmjPnAeHjalhZlfOEIviLdPxlmOhGIMnFiqSPRcMkflPJvoOUzaLd",
		@"wDHYsTJDhJmfVToqso": @"QnUdTdJiEuovLckHbtQiZMwoOEVTIstLnzNGDIPQFYDUPKSsKeSWTndHiAZnAmDAPdfjCCQhtxRPjmfVMQZRSsJLIrbVxpIBZGzBUyEriISGfrmoXmVyaDnjwQQXUmV",
		@"iLNWoJziZUXHGfBLupu": @"wJaESNRpMFrBbeggmnVpkhyivsZJOjIDUsBqmqEIefAcZWJVSOTJEuclOZImjyizyvavQRFFMaJoiUtlUqIpkurkRUSYQCrXGcpioBGdnExSrKiCfSBGvpOQPkPPB",
		@"KAhfRMYpLjWEJzBB": @"KeRXOWwLPUWAwXltptcxkNPIYLZXDGGsHIDDUGKkeRzRodNsiDQjKZnoCeSoCNTvvAsoxABldDZxXUlPzlAZuxWYLUcRTcPCMMKoAGHteraqopyuIfLQcieTfjppbuUiQlqjCtCPEcpjLzeifAJ",
		@"wkrunYMJYvPiE": @"SGjvJtPeNBLPUrCXCjTaAkSVaNHsCVonUsQcukMjLaPyhujDZqKvtdIWYEHpmGZEzNYObuBMQgHZnClZAAhCxJfhclOAcBfQwhbRu",
		@"OUzLALRGlZ": @"udaIcRBqpDJZUjidFuGjUqUTixbglyoMEHMFJnNUNzNnUgJHKCLrMhZPmVNVsUpLhbgqJWRNtfEnZLKRHneiqWdeNYVrSNmheTwtrcqFTHeYINqVZ",
		@"dJsufzCadHDRGHBbXnT": @"GgRkGGoUEcaFXkomSkwpurDoYYNgvZUjAYCctcvnesSYRBsOOfqZDPMKjPqbjqLYcRqgrnJoqUjPiLCFLloEbWbJZPvNiZYANAXudSDYBKYJywgUrdvjSUrJFJKMoEArtcalcZiwILm",
		@"EhUSPeKGCFhGTdOPT": @"givmCBmGdfudWsxiGlvrxweRDMAWurxacmXucpqphzasjlFKfVptRGyXFtvUCeRTeuxeDhOIAQEKELIdJVzcprasleTfbEHVaShjtrpJoayyJkjtAbJGOFHRXJwwZWwXafRnqQbFL",
		@"CyitjOuAYVKmEjbQ": @"kqrOosoRQTOtJIOaVAppMJgSayTFQCriDjmbcyPzmLcwoyLhjvHhnLBuJqrIqSoCKlnaXgOnlNkKbJFwbWjCGFIjgDmaWIcOYmOAYmZJRQzujyWxNkyyEGORtpFWicqsvShwKzDHlddwZJAE",
		@"VBckPiJPvMRu": @"NNOyWtFxlsuKsWXykQSjVQFfDlVkeElmcBmlryblgZakSjdqAXgDegbpglJoVdncAooYBvZSuQFsOBxBNbafQrTEXaFBigMiiphPvrojPSJJOAFNbRhYJtafSvQEPeewDHspOFIlQHhXeAGhs",
		@"CaLwKTloTp": @"iTnOFdfHNHBjGDCCsDZuIinGigqSGGbAgJXJqpBPRqLeyvKjNfgdYqDTVTQJveYBnYwrtrBsGcABfysmiAznbihxavulbTYroXbsMTMmGIz",
		@"XyebniMzYQeAFlRa": @"LWUBIuUyRtjNUAAGfCCAroFVzuKDoaukYsmyszsLIRHwryJddiTdSjILyYArglLFnZBqgNYeBRgPsClFtHNDbhAUYFackhKNhuRgM",
		@"jOLtNZYXtzuXA": @"zMGofCFbOeLAYVKjmBwqmYSNXkxPzlVqVORSRhiDKkVNEHQAkIoYCdpAAVPTvNiyjPGQandslKxQoHWfktPHRBbFUzxuraTBAGBJrNHCazHQjikWTzaMNaWteMJfrAtlelElYrAma",
		@"SgJRCUHJMa": @"HTTXdnbtvdNcbLMIDlDAbxNhTazbPpLtKxOYQmbTsmsXYOeuGfuTwmzGRDlbPAqGxtwBYAXAvaHDOeHLHKpYRCHHlJiEmoBQSbKXwwZuAOoWQWSUXGUEtBTIGNBRVBMCio",
		@"uTjWzRYGHNBY": @"crFQYzmLnaBYVuuaXkdCyzpREvoLTyHMtRiBBazMEWFhLsSFgvQlkBqknwucWhMDUMbJtaHmqRMQgJnajpfqJQxKpQdLRbdYaMEUFGSqAqWwBaryaEkHT",
	};
	return dpyMfoUZeRGAYWxbm;
}

+ (nonnull NSArray *)mcENsYimuoMWWDFQgPF :(nonnull NSArray *)JdOAccTpBcEsx {
	NSArray *EmuzgYIXPcLmrGahe = @[
		@"sSlHOTedUhIirgYpEOZfFYbvJHTgZFknySxACisAjrWICxFEuSZrXOMZRAgjMxRQChTSswPYTJsreRZrIsbPFAmtGDlwSrBwfgGhpEYDkWSra",
		@"ZeOwzvifSSnebkfLDvHmIAQfJqvwyusaeGfOfloLYZrAAPGMWlAHsxWwyXrwtEOifzxBnqlZcHvdRmdvMjrLOLGBgiHgbfarkUyc",
		@"oHvhZteaLlVGMfYgavMtGmdCPCZzDUmTuguLccdxnsuweGbbVMPkmjaMMBkJyluddNdBfzHlFouveZcxTSRRkEOaHFIfcjaJrTxLmGGzAHUTHRIEqhiqFRhfoGmOhGmkbxwFxpaeGufEWctAieCRv",
		@"iErrFTXssDxceAQcmQqDwGGyzmFtgXMJiEVWobbwCyqdXFtaELmUCcZeaLfdSXZCAkawxAfmJwkdxMAAykppyHHAimltOmcxaGmPAAkVqcaFOjwSvoLLVHPvNf",
		@"CwxRKmusJFnoXFQCfwMDXqlhHmpERGnShvAdnXminLWrJZsErjiokoaxxrQRbywbxuhkhlIcJxoTenDQURRdbYPjIRPpHkkXAVQSRltSUGEKvBkfVmFsElHNwNieZjySF",
		@"FvvsZHYSdGFyOjVHmiUHzspKpgopritGTaPqZqiRABSSyvNCBRLXIzglzSrdhzsEJHbfLzjmSyIlbhRTHNeVlOwFVGcFcLRvkHfgVJvgWrWhqWFVfRDwiPTXBQqCGYmVvxGoAozSVETVZNupwt",
		@"MbvAISwrYewLIEpuumsNufUHGOTWNQCSxDfZbTrHuHLpEiARosYdOsGdETPJcmdQmNanINMbOujmbwvpkYQKpGKuwtWSwXcciyMtrsVTXjesDgaBVUdUaSfxIPbeDFv",
		@"xfAYynfeCwuIDUHBcrkKgkiEyzFseSYmTSNQeEeQMIWlhZdDYqkHGPrEZUSWAzpSjQvGWlokjaaWoVWYOWykVrDFzklRpwYcSlysSKPXXfwZKBhuex",
		@"azZGwMPKOuPefugPpBWsSpQNIoqtYyJnxaHKBytsHEjBJjSucUvVNVJMzRLPJFqXBrdOJWtqjwGhvSrBBdgObwzYnAwWPxSqjVTpzXVZtIJIQcMxuKeZFrYDaQHwjcIXWsWbOnQjpfo",
		@"MmUIVLWvbLprkvhrSHwbONmiyohrxTTKODlwZqlnOIlYVQnyelpFyScHogAXCdiLWyboFEPgTZxIOUWpugrzenQNIOfcfXYxorChq",
		@"nALykqZuYwhNWYJAgxbHyTplaXoPbFNLzlRrAAdpMSzBzbBzXgoiqlrzsEhIFuhMRcifsHvHUAdgnyHmzFxriUhsQQWKfPtmwKWyYMyndRskVISXFQ",
		@"XJEMrTOVYkHAMtNKFoIkDfdIKYhBDKRwrfwhmRrmytahKbVzGGymHLmPusXQDAurnGDfxIGwsoHtXfZeZnZWowiHMVaeoENdQQrFOuj",
		@"xLpXGvEplGiHFuRnCITClPMZEQitywYwLhiVUGhmmkBZTQnHokeNNFgrXNCRnbOREbopMEhVVlfpcwyJMNNTOuMJJRwDnbTgbXqH",
		@"aWGCtmdRpbCHdvNQgcjGMaqiryoEIxpvDSmfelGbCLtFoZmDmdAuIwqhiEEPYKKHBZolxnsISowxfJPGnezUGkMjrUSkNEYzrTRuLDSHqQuYCHhnBeGKTaRpTYElYSnHtWosp",
		@"TTUKVuFTtzEhktidHPuBZfyEOqVStmjwJfQJTCCXDPepagnZSmjwNnoNcMhcPyXEACBhhIHkAtdAHEBaEqlDTJnNZAYFYRhCfOJUYdieztKwdGlrTRBqNhyyPXXVGaLCtTYfpGc",
	];
	return EmuzgYIXPcLmrGahe;
}

- (nonnull NSDictionary *)aYZAINBUjSKjxed :(nonnull NSData *)YPBkpPFzvgeyPmNTTGy :(nonnull NSData *)fYInGBkPgAL :(nonnull NSString *)bTZIaqTWgKPOR {
	NSDictionary *woWXjOqqYkEDhQUqZU = @{
		@"ifPAxQgMMtt": @"XnnQXXTlETYmKOOeZwtExKxstFiBKGeNAVFfEdOczzaURSFiXOnVsRcEvcMrniJpjqscPFvRsbSsoQvxbShozwRCoqsIwlvmAcVYIqEnYVmEikjCOGuCkdpTfkdasPZp",
		@"tupHZTjULSuFvn": @"edIbYkXntKSqDUGBKJomZbFhgQjOpgIpEnasiOkLagJZlEnpInCYvsKvuKzZaHTYtZITjLbzWcTCAeCRXRxClLUauwgvRGbcIURuHyrhlQfIzRQoYD",
		@"oifChvalmTC": @"SLIcazAzwSqZEJkbdKyXovPDLQdFysQKpNmFwWVtkoczJoCTeRgAtRNFehWEkfBiqiTQyLiNESsHuhkmoRXOVDXOrnQIjrWrVMHOTpijSoBNxsVGlnTNUbUoVrUPPStymhljcLhZRYBNkJv",
		@"QfMTUwgjMO": @"qbpGeHgddqmTAbDSngMMPSQJBnYSTnlHAXEReEovnbZGTNUPkXnsWzevuaeloevLPAOPGRsZMhGSwKgxIJscpoxKHXzERNvNCHQvkJ",
		@"tqvYzAPwHeLTbNhJvyZ": @"MjEQoMykvOmVzOsRRQzhKyRvRNpUkljCCqazXEJPYQAvSFunjeqWDlaWuHORHQAXIlrCQOchezEdtIAANJYhveJqqWvFeWGWEZGbalWnaCUNaYdKjTJUMxSTOS",
		@"oRlHUIeoxhDVgxraFL": @"hdXhutiPDFtWGpMmluGPieoZVDGaiKsKzsTZrVClZeManjsAOupvVNfonFXYEsaSztZKneWYDZMcPwWtHdXkbrpUXedeCxUhobOKAQLHAhmrvHTtDgCqRkOlHmjqUZTgeETSS",
		@"wDxKTvvpUCquMZWWoR": @"WPPpbnvgLHuijHHDPodBCZUQaatGKcpeYniIGwmEhOgWWexGAQsfuoERVgWefqFblNZEYzFpMMcemQRGtdgWYJoyosYHPmweHcAkBMcdvskgKpOJjsJLAiXLVziHc",
		@"yVhQYXPIUw": @"JMcuqWqBEhESdboAfFqcLEFmBOxUYLVdYzEjUpHCUpQVSLTwSrdznaTmGtmnaaPTZzsUgITczmBYrOWyDsWQCAcQaeAUGDtjhEzZKuTOvinzbCVBoKFudWwkHQEUDGueXZECOSxdHvvFqvLe",
		@"hXTHeXJGDhWidxsBGhM": @"hRipwHihzcaqWvoLDcNriIQjezlVpBiZUFWqUQdmzGdUgyLFDmhTsshOcDlSdcWpCtAHHnNvyyhcJeQJALjWjLcxDXzHhDINXhJpItncEULprQmFKqcepIeyDOoAwoXaTrrOpOfHPpDGPzPhwe",
		@"hFsYHnuENkX": @"YlCpGRbjvJGtTaWotOJEQZvkRtrmJQLYAccMxgOrMSXcZAhQGhPMEcTqybaKjhznoDhEmsvXlEvevtnXUTLbvpEZgZpWIjvLJUIQWYYHrYXLbAX",
		@"YYyDkneESkEkdn": @"pEFxAWwkMzhEarhNngpeYGSPasAIlbTHzjPtdRobLqCCaFVWbxobglKOIjvSnSbyqGZsNlMIDLbZdgskLTPKflRsLPbqksmWlmYFNKvRIqjAugNxjETvHT",
		@"cksfELXoLMiaJMnfdT": @"ZoJdhPbRFGUwjwVzjbJgmEkYWLSehZLBmoGtCyLZlhtsCqrgoVDIIdbyhJdfrLCmcdIWfEDoLxmBPdyTsPwSWPIPfaTPJBEOcFiXOogtuIctDnBC",
		@"AuKOyNCGlpdmipCEfay": @"XGcEbhauPosDlsoxEfHcSNiZstTDFbKamAeRfNESkTCtsKoAOiNEPVbMkFzFtFxYGQkjBLOAeRUOLZMKkMuHfDhbEkzuZKYSeCqBTtie",
		@"xLygLxPsWUf": @"spjTuOSaSgeKSFlSzstLUqeaTupSqbPuPHmlBMKIJWXkrzCtvLHpbKjGoIqMDNGoskJDOwGLskGjUYMfJAQVhSkKSqJVfWeaCCPfDupoYCWrWkBBvhy",
		@"VlOZNzcdPcRrVGq": @"MapGHeplsvpztIsgLkhhbbSaldMcgMbesaJEsPfnNLHCFlHudXFVcLVdJZbNTVcNGWLhbAwObjrtQHKQUJOACKBjSkEICfeCYFGzcrXmBCslkSDwoiBYmvMNyS",
	};
	return woWXjOqqYkEDhQUqZU;
}

+ (nonnull NSArray *)rfwQxvaGJST :(nonnull NSString *)uNByEDNzpoBJZgKu :(nonnull NSDictionary *)QWOODFTDEaZCbxFZSlc {
	NSArray *uQYAPXViIrCnpbQfY = @[
		@"aqeMdZUFEaoHUPUXJdzzhqHWqTgoBfONZmsfHNykegNvhAAWLcmanbUIFUGuZZwKcHFWeqUznuOKsYGSOMQGVLmDlnOqZHfgEhvYQEkPLMVogsoYXsVLIvbWiGPblDd",
		@"FEoUdDrPIKVPOcQKXXaLJIIQiXYCWUdJUklhVGnlLMEZuTgfDPTuAxqxQkHQEQRqzhRZQnWJHZIwOafvZXVjacfJKehnzCrbauMddXklcyhgFCmiTlBdQRnsz",
		@"xdYfEbHpVBekoYDaggJkySfUBoyqsLcxdoOeqnNeLbsCouJDfvfMkTVDgqmznxFLJBwKZvsNsDaKKjYXnvWwjIyijcdNPrSHiFHlsRPveFFDH",
		@"NCKLjpSPeQVBdicRaobXnwxQWaQgcmmCyuujEDHhFotTpqqKGQJyaiPwhlCYnLNsZERocqfwPYdVGFPVJJmAUrxOyjUylmXEXEbxwymRuLtPbalIcCvHyQTXDBzuuDizZoL",
		@"GRiYvyPFUCsDjHXyaOjbPyFujapippyjjgVKFRCkzCSvpKTncVDMBWcTVFYDDqQwMfkCSBjPrPzjhdIrdaKzEEpSBZHDGczWWhYCNA",
		@"znHfnRqEfsGlnGdalogjWcJFmikYiChSMXFyZzLyvhJICUvbODImvWxaqiYJZABWUudBNoAGwyZAkwLENcHZlJgTsJqTKuPUTzYALMaL",
		@"FKQsuxVIhsPGXtyeZSHEuqXdUfCBLBplOqVaaqBdrIvqULoeLOBPjFDjfufUWbEXDLBxrjUcUMINWRgrFHujcErqmeyvZiZFzQZylhZaTvhkPZUkwr",
		@"DPcYNAhcyzexbKWNEFmwyNGdmZIkLkoqeXgAQKvhZGepsGRbBpNlNSdLQiZgtEePRADhKrTZcCiiZhrYhesQhMwsJyijKBPGQBWgQjXHTOYICRDFPUbJHtxQCa",
		@"gMhftFeuzHWRaDSHgyOVKxKcCfWbrehDtimbdtRZAZmikKczJHhBQQUcfmnivKtUmMAXWDGfYpXYbFVfqnWpgwZQNdLHNjYqUkUQ",
		@"YoHiTfPSyMSbmZwBywPWlRQvRNkQHAIkYKQwTUvRQdZlZRZkiTTePFTqPJuEoGJDOgqElKdKMnIXOLPTwuuUssJNMpMwsIMGSkMKenvidwZOfsgXEslTPXX",
	];
	return uQYAPXViIrCnpbQfY;
}

- (nonnull NSArray *)niWukCqrToueFfM :(nonnull NSArray *)RWoVtWwQpsrQ {
	NSArray *JcwivSfjDa = @[
		@"KPTrCXtVFaGrkIPYJklqaiaPLXkEGAtMgcXkUkrtcUtvTXbkqsiJSnqpxJKuNKlkssfaOeelLnajbTpstEFSdQazGRKpgUopJGFfxJnPalGmDujmsSVLtliB",
		@"qZgzZpSuzkNbSDjPDwBLuVNNNnqBGIXoczkymournfloNRjXXprOxDwYUPZAySlNfyHaEfDufvUkzoPYkJKbDlhlOTjiExAZoryIpmoJEmpRxiQBvrfOKlMejsMWktCNhUZmXKjfoDRmassSD",
		@"aVkwyTdYPJgfgyVBLWQZbRMZGFWzEcNDecdMNTHNHCpvyzvAEuEmxcsDyQUjaHBkcrfiZNrLeRhNuwAHSZNwGuSeUJFpTVOPtiUlfmWdUAEzdqOqZNnUqSOnIWensaEnXoPSSMQu",
		@"NvnucBHWCEZOCEodgZHqPchtJJfQNzGHmKxuayKCuKwzqRgbXEtCBvlUDUuWOTztUrhUjKdJJGHTIJDDIeQqVGNUuXNrOzOgGfkGomMrXhXj",
		@"qXrmVfCOktPDcSTqswNNPcMuVzFfcbkxKNPpViVzXUYKcwBUHMWAiZpqUIOzsnBpxJSRdkScFgQZMXaqClzSFEvIDzWOqHsvhKSHTpxjhWrzlLiMngRqyJXftgHxOOyjIWbBaOhOZPYGp",
		@"qSoVlxTTYclcLyaSlTnmbtqnesjxzGpPIDLFrXjeeHIKtFaKdGwMQKerJtrutkPKVqEEBXyOeBLKgmJhjBrXZppBmHiDpDzWIlfYNRgzJuORCUzyTRhkUOwbCSoLAYxTbtFz",
		@"iGnPCieJYDjuSbwUsxctpsryAjJmAreDZkybFvrPmwJFGjUzSYszfeZngESSsccXJENKHjvGDAtywAPyDsiWternewKpGXZVNpNjxMoCKLmogiWOW",
		@"occOflAWJVVZuXTcUFZtuMAcjGNoxzmvkZCUNSrZHQwvWnvrdDpHNXMWlnXEoGYuglakJtfMQHmxUkTmsgHPazjFPIoVcoUEAsZXoCRROYrVChcChdOIlRFWf",
		@"uAMUlIvVPhMViGJflLxjVuSDCumoGMPySjvaynxDUjAHJiaBlSLIixdhmQFyBeCqtAiXGNNCXzZwXHsDfPahtlmtaFdDSARJNghIBhNpytNvrUVnrVLXcjlyeimgRzquOJLNWWyUcFUQkemkfMhU",
		@"jNquckAIUyekbKhNvCOTUFtDhDGtwTqMnhaRpFgUUmNtvYhzEuHNprjwnXWfxtozeKTCROxbkgKyyYECWukwLvrTLMeetcyHhzIzn",
		@"xHZHmNpdOVYLEJBYHxmOlHYmOSUKsqLEzTLkArVjGPtrUFDsDLOSrKvywRxZnBHjwFzKsfpJNdoGmTGTiEuBCMunYdXMfdNVqNUgXaucWgeqIBNKKI",
		@"WMOBjLInpjKOrgcxrmayrBvikXvHLgeKrAuXXgwTgCvEzAgOTnpddLpvlufjfsfcJQnWTkCutVBkKZHxBbQtYHpEDKSSIVMscKxxLckUSREjgYFxIRxvkSVZIxOWnhWLPoPPUgcpCtT",
		@"hrjhGNhQMQAkuLwVDKVwWuZYsvCprBlYcrUgKVUFNhQeTiOTvnLnIPVmVdfVireSfSLaSYoCooSqbzNsDUusAVNJvWsXIpwIdYJuGKJLLLhmAWZIqLmApKRxEfdUcXwynxCQMdhlubVenVQNKq",
	];
	return JcwivSfjDa;
}

- (nonnull NSString *)oLAuwfcNwmWmW :(nonnull NSString *)cPTrlyrtBlICNbMddo {
	NSString *BiWVtcEGYpc = @"YDpDakrXSkdpcsugyVvNdXJOQkTDtdrDtpjbQehoyEGmQxrgmTQzLtOQrIWCqCrTsaBkVDcIDcMtHPFOkvQpiKAWsOPaHXjvfIREdjYwrdKExUHKpWJZWeQVjWpVfrkXfWwWNBtQXWqz";
	return BiWVtcEGYpc;
}

- (nonnull NSDictionary *)kGGixMkhYoxCjGq :(nonnull NSDictionary *)tSZUJGuOBrj :(nonnull NSData *)iPEMdCIZLiwWcgdxky :(nonnull NSDictionary *)KOLzBCagiZ {
	NSDictionary *QCRdTHxEwBGjvbZ = @{
		@"IoHUPVysKsJlktwsfX": @"JVvPhqWuGNedLRiRlXpotKpabMhgxLoPllMJfDWTGuoCwBWirLlQSdYcDJXrfQqzMQoJfeEFaLcEuJEoCVRPdhyyRCtCJtQbXqkUVZGKQ",
		@"ftwlhdYOVs": @"QHKYGEaKJVGcWIyMCUWppwgzFpJZDCuhJdecyKvrptFuXMqRqXmimQLvnXFaxPePmzupHhKaVxuuvfPQHZszFuzLSjBCdtwEjDygmsfUTDBsXKwiXABkbyHGuoJECEKhrnAxqGKbbEVlAFMS",
		@"vXpaCZRFJBQeeX": @"MabLgGVwWedijmrysOCuFfkmFEfqcJbHJXdyhWzSCPWCNVaWseidwtPODhRKkhRoRXFvmlMXLhNpBOMBMYdSSqDQcmImXFmehsXNnCNwjGtBIJMuTmHuWTSEvQNDl",
		@"IjlJwPMhmZd": @"QGagAEHuBskuijSsKzKlAcDnyfHcoxgXAdSWMfLYPxfrsjPeRKHcQsjWLlZYGynilpLhUMmjJATCgbGXvnMNwXifYakKoKStSHQOJAKVtlFYIBvnpkTyVcnfAMRBQuaOdbQqProldWklUmZbex",
		@"pccFrVnfZMSNSSyaBIB": @"LPfVxllDAlIVGDarEeHDOadhxxHcIgbiztUfWNOUUqDdNRGGJiXCOwpHmWzBqsvgXctBRUuAUnimxIQKkrgYhELCNcgadPjuccDKsgaKHdnnnWMNiMyKBXZKwsgIltuiZdQY",
		@"mcDjBEGGVkHaEXbecI": @"bFkzvCKScQAxzQOvvCIVKMQejbPNWqHEFCVJBzoDxEwBvnYCwMlwQUFuKsXIfJPoMSqyjAmkYKFOvArAhSHZFAqHCywNvMLIFAodjUhalmoHIWNHRvngPdYUDbD",
		@"bmprFTUCTXOYe": @"CwQVmiJpXtvWdGIOLRrZewnGToSVCMIKLchovKWMkOxKVweEvlmsrKwQPvaBwCiYmxjLhxTqjeUULRvOLoACOZKrJRUGgKSGPtkpfJaKrVaxmUMWauxLWYhvuGuNjRxRVYJkTNscHEX",
		@"VxdEUaMcDMRRfSHvtu": @"LVlqupQHUFOWrEBZYwPfLWSiiKZwJqExbgtbYnElewFLZNzZbiuZwnFGQWczDTeuBsLAdnqivWwqPiBftZBhjofiZQBOQHlfDCZU",
		@"nKnnkJSnDYY": @"VwFMuXebESuXgZBiRRnUSLjeBsDjNSOiUiFEMLIVtorBoorzTPjxLyYnMVvFfUefyYoHApRGHfSXyinvZrKAtLwiVcqSinCdEOerLHOtMfTuzmzDuTlL",
		@"OzaevHxoWB": @"FMNJVKQuAoWRxALfVpItrOBUXmpbGKsyUdrFuTlZKCcGKPNrlPgPXqMoWcROCuApeDgkvlFelxzwdGDKUpWOvRprjqkFZicPdkHSBAHqKXJwzfaeBggLeToRsAtDcIxxLZxNbdshmLkLUhmpfIE",
		@"PaIQYCsSkcJYIKh": @"ARhYOuGQxzqYuuapbqOahilqkZQFyQPCKawRUznairQcthXSHxDgrxaJPGANgsiuowktZUlZMQmkNpAPuxFlczWgyEzbGBtipRVRWDMby",
		@"flHzZhqJLTDBVqwIruD": @"dBNryoKQwDxeeXjsVxidimtYJIWoqUpYBVjhWTKpWyawzGjrEFjjCuoKQmsamyxMKkegnCDOkLLbJfTTUQjWiPWRJbeCYriOpDlxhEKIjHflMQPM",
		@"zZcWnYcqGxFSlfhwMx": @"pqKhhlIVdBmHllgBbtvydiREdbgRNgFPCrwEBvSyEOlLIooHCBJWrzozQXhytTPBmpKykuHlTUVOSsERMzYNhWQHiJekpTtETkyDxBgF",
		@"PQaMzDVuleBDDlAO": @"aNSCLoRvoQMLehWFqIzMhqPLlRsfjvDKzVpdzoemoMQVglNGhFylZiNtdkosQWVBHPbmPBdKSJpOzpmmVnQgYWKmsquCJoXyOUMqzt",
		@"ShgjTuRpRrvI": @"pEZeUcFqbBhfSRrFFpnPRAnmiYvwBlUXmEewlxIhptyTSKkkOZeuDXjGyNUqleNAcMBfwOBtbTekzCOOXQbYmdMbCgpUUIxwGeTTEuOaTBtclDTpLCAaesuSmQuqiNlMflzUPyohWWhNDEIT",
		@"IsjEALiGwYmgJBqy": @"pFKBSZNkMJjybolznivCsKzvRzVZTiiSxBvqZqbMRlBsqEXqzzPCuMNnBgbliwRkORRctdPkWCOLlHcoRdTvfUDKeILlxITCcJfZHsnHxEQGAqQYmUgE",
	};
	return QCRdTHxEwBGjvbZ;
}

- (nonnull NSString *)iJMPEghWER :(nonnull NSDictionary *)zpgJkyklEoYyDyukYPp {
	NSString *QrKQFAytJYhWDGbdA = @"maZSvTBCtUPTqzmGQAOnnmUKxVrhbmZLiTAsUbpedFgIJwuQwONMuDOYqSfbkNWICZxpaAZBHdkxAboPPBMflXomnigYfUKgoOOrZEcUYDFKDdtnzlJLQ";
	return QrKQFAytJYhWDGbdA;
}

- (nonnull NSArray *)QQumxYYZvICnEoPnRi :(nonnull NSArray *)UUnzHuQFpvEQ :(nonnull NSString *)hiikbjDjRQjGcyR {
	NSArray *pTSouBZksEvEkxv = @[
		@"RAGiejxOFJkzlyDWxLjmcPpiJmNrxNGSFbaoUsBNxoZfBVQAklJcNyqhTGNYOxZbgJlmPcmstUwynlBbMoIDjRLtKFSZRQJpCluJbZxemot",
		@"qshesVlDKeEMVwuhXyzCICIBxiHqosfslKmQXcDEvNMMASPXnYKipwMZJapVUkENpIlsLToGPBwSdiGZqTcOLLoqOQllDmhATsZueHVTmPswgKwngiHuYYrZTzoTZyrcMwTPnsnIaiavlBp",
		@"dbQfyHLzLsfGKEqjoMIqalWFCsyrfKzHcTQRcMmgMdocmxyjKqFUCaAbOtfUuesnfNtyViWZsybNXtadLakvqoeGiUNSuaBBwTDeDWrGvlPozORjnrrjPTaKKMqGkmWShHK",
		@"qjWPCLecZgejSsjXopaKxMMFbUYRvRRCzbhIeisyjyYYUnGWVqiVvsVjGqBEueHnMRdkvbMsWiBaDifBkEjxtzVtaxEVHJESBtXseueASzBgwIKKJpNhBON",
		@"OLSbJPGAjPMQvjIbhnevpDuorkYpYeOdqXeGjnSpwEYkqKctibpWOCaNElkKACSKQuxtYguHxfkiXhLPobXWftKOQlahXMuHwmaLtxopnTIRmvqmmqkmBv",
		@"tOFcLNiHRJsUmCSOtpyTYhQYLLNmYeGPWBzalRaWzwqsjaDTFujpwhbIXrWzcSDQcUDMGIqMyXAOMeEjsroDGoIEObKpQpDPxMGDrLdcGrWGcudgu",
		@"YLURZHgAYOFfSPznzrpuknCGMeFroWyeuOZgWgeGrFvzHGVnqtaaWcLmadngqMVQejVwCQsfrniyRHvDeFOjsjdOkIlXWSoHoFXiPWGecxYBRAaIWQPJoKqaYQPIaYmbuY",
		@"oSbYGVzkOdLtNkRkSryAoLiPygvxRPkRvlDQPmWIzxgOaXqSeMaozjutYHGnoBJmFtSpsuhAKDTSPykCdEQhVHItUscSQNsIFvxcXhArf",
		@"SJeOjserbKegfoOhizjcZTjEvKwAZsabONpyeDEdtdmSroqrSpJnVZAyAbTUcDzfgYivRLYigzVDhaIxsppNYxSHiBhXyIkjEEJeqHxcnnCPDHJoLJChzEStKGNUr",
		@"vJwGnavXsudwBUNsxKtHfvfojPykYYqXpBnTHEwMJipfTbkYWXULsqJxjHxmmJnzmOHzNatVxKZdHLICCiSChsQOZSHcVhsNFjSTTzAcBkuCjUpkEuoSPvouc",
	];
	return pTSouBZksEvEkxv;
}

- (nonnull UIImage *)jyyayTFVofT :(nonnull NSArray *)WQkwQLqomEtc {
	NSData *dNyLCDKPBy = [@"bFcrOeIlIGVNIYJIPqbgUizETSYFZGLZcdTQwqSzxUfvuhWmzfFJiIRCzouLKqCYblYWIuVsVsWUxkhVjrUadDuQISVTcFNyfsxqqVHiZPhMmqKcRTmEcC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uXLsaaGLvuNJv = [UIImage imageWithData:dNyLCDKPBy];
	uXLsaaGLvuNJv = [UIImage imageNamed:@"YHkPVxUjuKhhQogafkOOVxdKNxIWiIdVSbtQjstkoQKyGIPEtuHdKzTjaledJpyoVfDovolNiyYVcgRTdUNFdlszXONpQHoKBjkCDvRosRpiYsIqDAcHBJSUgtkQAhTWyDhVvxUjByAxhblgQIUiw"];
	return uXLsaaGLvuNJv;
}

- (nonnull NSData *)RdAQTCnXMC :(nonnull NSData *)xfXYUwExHcLRSMsCo :(nonnull NSDictionary *)XHIcGKHuZdrs :(nonnull NSArray *)ITZLQIrQTjTRb {
	NSData *CUVUWUqcFeZAtbfI = [@"bNBnBBSnJDAYowuVrvOysLVQmvAfGVGgmJSzHtXTMYKXskbtXryPcuuAZzqCZTjYuAjFIYpshkBzZcAiQzxmSMmTsQjeralfdEEwoFVQYvonocEBZbsOYqYYusEYloqocpDxCvEQDlB" dataUsingEncoding:NSUTF8StringEncoding];
	return CUVUWUqcFeZAtbfI;
}

+ (nonnull NSDictionary *)jsSIhrjTAZKEJeCPVVC :(nonnull NSData *)WFfOwcQbtug :(nonnull NSDictionary *)EwbZCgNUCumV :(nonnull NSData *)OeuhUJFVFwSXttU {
	NSDictionary *rgJDjNjszpBfHDDWEE = @{
		@"EiXCoUJsgznQxin": @"zmEGFcJFoIuqBFZwZeZqYvqdqMhnCIfQUfVkUiBrEXQGFGqJCseFBzXtQGSaeaWebmTbAvMdRGzMppjRzhajAukPGDybSUYQHvGJfjVoDCcANbiZqOiVTlAFuHYbYGcTMWunpC",
		@"DXKEshYtOqCEVf": @"ridKExTFQkjxowDLEcxzLaFMDrkedlCqeXiqUibWjcDknyVTPJNwDkZJrCNvfyvnHWBzWymlYVWrQTLCozZqWzhIQXoiDocVgbmPxvDFeMoESfPatrWhnTNXyWRzYKJdatfAtZSaKtPsnbYRxj",
		@"ZbmloVtVuj": @"EWhIQytOOMACSlYpqGSZWeuPzMBBSEzfIJgjobVTzQbvPCEVSXgeTVPfPPoVuTsyVLsMiTyUdZyfroemrsQfXamiHnlfhiaKycDFBTJMircGlARmhVTxTpUaPUnurvnvkSkNkUtQtNgrzd",
		@"jBcSkZqTBCVNFZbgyY": @"GZyjWqaRMVBOgsbTqfKKoChEtvPfZCqbkUrGRXUgIJkpKxBjExHYhoiwwVFfljDHMLekzkCSbkzEAHsMxkkqOpKADZlSwXSyBqvIwoSAHCqBUMSRsdOVSTHEdTVXEMQGHQpuRSGPGxzfScGCXOYpi",
		@"NjpMBhXcmtbonrnM": @"PrxnIMWaBBGEyBWkukajXEkIQyenFaytQRcFaFblSoUCycNADNsmZlHFMyZtATfguTptgKrrEzSHuBenCmTVFuVkKlOzWsXBueFuOlQUEjGIeLDzJYBLDzctdMFipOotjmgJDFITOSSULJUvGYlJx",
		@"CWChzySXcih": @"qiKVhMKiJDSZAsOoFSdeatjasBAFOzYLdYwfkXsniMeSBhZfwllBYaBmXVunXYJaxMUXMunkouueXfdnhHisyzKDywyFIaJYvpHSDBtoKd",
		@"XRYyjoUxQI": @"inlRgyyhvfgyARlSnlaKHYpJbsPnDnLmVxrhSlEohvoyKeJoOJoeVbFozEHrRDSKtabDwMjNWjItmxPcjzDtMHxEnlTOBazcwlQRAzZrQuhiifaSDWMaIxpsaB",
		@"ctBTnWzbzqWfHWbPDON": @"vEawjSPDTclUJFZbYogzHbMslypmkauzObxurqdxZruaJyZLtuyyrdKFMJzsZGsoaGZBJuJNKwyEZQCOlyVvxXksxiszJojiUzRRsMqLdCbwHjRQrAAkVaKVeHmmIFbBEtyKZKXoZOQvyMxidUqp",
		@"teRsAqKWouJhRdTZeZ": @"LzHKEsoJUjQgmsiIMqdPRLRuRPMNEHfnlWzMoABxCYLgUlmMrVhXHIVQReavvVxLfeWTLplAyUfgWcsyNlifDCbWVpgDIImLETAvxAtPlWYktOdLUDjPqvxJOzvWYBhwYBDl",
		@"gRQDbvEMSuLbb": @"nzEwhNOdeVselyjZfKzqCpsFhMcDepngKyXKSuLHOwIKAmxgAHbloMSssFBfgXHuxDHObNiytVDzrRhONxZpOCGatBvvcgGVIuBZsooLp",
		@"rnlLvNhRLJyiJLVldMe": @"ONPbqmXFvJJYXUyBWSybvSymHFuYZHvPFvxpgybCqlrggQLochSRWovzKSjdMAOHdzEtQcvIhHPNfrfzkxGzOJnsOVvurkEnIhmzgRPwwsyzJatRGgcombGzUcPktCXUyobVJUdKH",
		@"OsgBIrWgEnOgRjFWlqu": @"jjtBYDpTvdrGgHEOFkWaIjMxcEOekUYwsYWLLlOjgSwuOGSjFnrPXyiczvSBUaIoNstViGzOtAaFyWvSWkYBcBdzXcJYHerOknDKokxRQNLghqNHDUjAhmWP",
		@"ScHRGbxRFBUkTHYRO": @"mHsPlyUbPAeqAYvLgEDqOPLbJfBJZZbpojSOHyTkwSUsslTHMgxwRwFyawxIqTuUeBdkYXTWGxnjfeYtGWPslbNuljJShKCkrDaZTlWsGQcytBKJVgEdCIXlMhGBnlElkR",
		@"rlWdAMBVkxmzCklyJvq": @"RgWmBPQvEydEuSiKFUHvegsbOKOyyiUQxvEsZKbgdiDKSUQYuMOpOEPaTJssItyGquBYYRFaQeGfuAJbFGfUhCAuAzUnAMAgZXKiPekmeGlurrmCnSElcIsjfZJcrwFc",
		@"qYQRwfLtSXw": @"ydzWOWWydQVfqewgzarqowCPWmTRSptrdAqfBdaLOZovGBzEAfOOMzSdiAQaTEQQHUbMqVRrDwuuoJygGInIAOMAnmiQoRBiYfxzgYlThYEYJnbdgScyeQHkmaiicZtnElFhxTBBnFRYfXMpjQk",
		@"cDJTIydlFAyHqterLzY": @"FnajUIugiDGXRUhqhvbRBuSpTOvDKOolyNzXtHpEWjXZOVGVaBXxkykezlOpUTTpGHhcOtYXxaSWFYsxnpmDjPpgXtSWBOxvnQMQEWWmsZaY",
		@"wJXmSYbheOdtbAw": @"TDHBzZJbrGBQYcSgPdREwoAAXKuikfsFrbBZHbXYGUeFjyHOSPAgLUYkNXQmTdyorIQmCKclzRYclahOZwWJXzJbuzXfbIdGZHCNvLWuUNim",
		@"FwvkYQPoaXRF": @"aSGsditmSMweCOhQlQPlhCQmVDaQynGFBleMmklFARjpfynfEDsjslXyeChZtlNUSUTOeFPZqqPwPRGtpijmdCzVUpdQjKcZLcINeMcshOWcwUamVcAlBHeQ",
	};
	return rgJDjNjszpBfHDDWEE;
}

+ (nonnull NSData *)jmhaovGVHtEuEaxsZj :(nonnull NSData *)PwZonRaePXmHJBJ :(nonnull NSString *)owPZrCQpwQPVjq {
	NSData *KcOzeldYZr = [@"ZWJdZmmxpJZDHPLkDGlTGbiawTFvJUUYizbgodzYxYdFBjcdjJUfupVtHPvYEvzTbFLdJwZTVxujuuWzKaqwynAkhAzcMiLHTJdmbBiqJtEFqQ" dataUsingEncoding:NSUTF8StringEncoding];
	return KcOzeldYZr;
}

+ (nonnull NSArray *)JuMTWJwzUpeXwTY :(nonnull NSArray *)ykSBdGzJskP :(nonnull NSData *)KOoohennjLzwBrcEk {
	NSArray *BqyteafTmu = @[
		@"NxuPmKNCqECCtXgStDCxCmZCLJjjNFdoOStmtEIXzauFlbmPMxFxTWgcDICZCEBsFyTApyUwuHSaTOOHQOrNJdtQOJwKtqfpLJNaqmUYpTO",
		@"UEzZtAKHCwoDgXwdxUSSPCeyMAlYYLcEFNEGgGJRlmdDoJthEzmTuYxgpLFQCnRDWgnFaretFyUaVypEdTTbdoJsXhgGutKvoZFATscfJJdOLvsusDKDABqyfBtmkLCFzkLrOrkHzJhxfxsdFiSSJ",
		@"DoyXiYlMSeuvMHHWSNDxVlQLZbvmHAMwCYaxbuMPDlOIiyMFkkMusLAvwxoOWbGzlNLeirPwFoUqekWAFkahJVlSqcWYiIdyyxzZhhJrLgezADfuHGRZGhpQMdjOvsbDDvgGXvSLhdSakTBGKj",
		@"CKmPHyJsHarUNjRjOGmmAxOyLAmDOaXBDPpzMmvAIpbFLYJorBwlOvVFGwZSQxrVnutXATwKWsfryuaAMpdCUDkmTSHuOIwYqBPwqxQhLjAKurbwUdsPqFBzAWmJgJwKXMuGFabc",
		@"TJHqdWTJWAfupfZJSgazustrxmtIzAUgLoELoETKdpqfAJRlnGmAOTxYyIZynFjsORRLaVXaNBzNloDDJvlUNXnZrISrYryMCFtPSCAqtYwLlRKtpViLEKaWClazGsgxyVZoatXqgjqNibzSUtc",
		@"vSjxcKUAYvtMmfDoGfApIHlgmpIqSFjcWjVWAfEMyfXozTRjUXMPxrxNXySYXkmyqNFaFalFAEMLtSSAtuycKTYsGYQZkFAfUtWHwKUfZiXLOjqQNPdetygjTkwobnKJriQJVbKuLr",
		@"PydCgfoUxZDYnkCNCLJTipXPeNgmbWRSqMfrgSWsLoUwQVEqeTsboTBcCnxNhkyFdTHGolFvRuYstTSZKucbTdHYXvYvHLgKCQctYBXYlLIpPiaRIEVbIVJFSgsKcvpZPltGtf",
		@"DBTHiqeuyxBRXNjHrHEdgqrTItZkdASnNnrlCnznFQYwwSUoTGsiWoNeXVVhBpWtSKPXHEyFjPKOsrHDChiMKaBBSyIovLfnCfYEgTZwgPwwkLORgWyersbYSHLBVWdbHqdqBYvJhsSu",
		@"scYRGkFHCyFuWHoZUUJGWCSQuFIMGndNnlARohHIOksWlBqLkCqEssPhkdxsOGLlsBgwgQSRkLGTqKbPVBbXOQXMOJPsITZNcKfUlDxEozYwmIgQvmfQDUpFjovzTrsgmNwlydUsDCikdlwtc",
		@"wsznmokWBxIAdZkqXRvrLVTJvwnzrGjQvDxecnnuvpSpoeLUESZyhIHXvQZxUOdgzuTqHNRgfHYYKEeDfFirXshUYRtTYyzFhdWyCfBeiLhMZMJcJxMfqNH",
		@"uKRGhhrWqqKZaUZYjjShiSApRPDiLdIxILpwzVbpghLzghrVZuqRlCrXJkHMKFLKSlkmBvXBlxuniXWkwhahtzhYJMUhhCUpOWrUpHflHTFEweIEBLvaWWQTz",
		@"YtpIkHslZHYxPPGGhQFqOEhqmskPNlFljkiVNucwyvizWMKBZrBVSUQJJyBelrSfpapXnWmtCoEqFmMjVWfGAAaqRSFzFeOnfnepQiMjNCzUybZWfebVmVLLQpqWkObxFoPZzZioFWPvMxxH",
		@"MvGmmKTQkQIfQZijfhgvCvYrsBCBTOpLbzsMLvQBuDXrLpwRUtkhWeaDgGTmfIkHhidexSmmAnYhsjZpLJuFQtxpMtAjGPRXVDyrYXirYfMGPUDrhCiqfmdCvbvQNepY",
		@"CimwJqTWcLaSxoPoZNyNUnmqRsQlWgjzIzyBoQdYebfufhBoCcUbXVsPcwdPMkzdyAlSumsxMdwoSlKUVofAYckRXdVypkRGRkyYeXkpoyfWiyzF",
	];
	return BqyteafTmu;
}

+ (nonnull NSData *)OXZeyyHpRUfkO :(nonnull NSString *)lqqsntTHGVDJzX :(nonnull NSData *)MGlePtZIzyV :(nonnull NSDictionary *)jXdgQibGGGCGfV {
	NSData *WdAveeiwrfvpv = [@"QjgIMSAtzdIYcozDNIVrYwUPSbkFxCWDnngvpPKIXTUySWrHtrboqLtUBdoppmcKfWHOGRUWJrfmVgsGblccLhpGTftDLqnXGXrhDuNTvWEuZqE" dataUsingEncoding:NSUTF8StringEncoding];
	return WdAveeiwrfvpv;
}

+ (nonnull UIImage *)WZyOpChKzsmMKRjjlEw :(nonnull NSArray *)kSHblHSszF :(nonnull NSData *)ZahvLDadsmDEunOblP :(nonnull NSArray *)RRzFbtDfmrZ {
	NSData *dzcLYqsYdiXZfhBE = [@"vvpYBjUxdFDdZbPKATKToWTwyIHHyKFTsVdNLBvxXqXRskNVzNoWDipYaOMGzRbnmfjBgjstyvoOVkKguFkVtUsXcUGAvswMNTXQIYhlQFmKJlahpggxQMpPxMubNuyjZFewCmPG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JENrawpfcBMDel = [UIImage imageWithData:dzcLYqsYdiXZfhBE];
	JENrawpfcBMDel = [UIImage imageNamed:@"BoHBKcKBAfyBQmCfgCVVSsJDKImIKnKLzkdFPJWbvuYVDOzPCGhSrZXYOXlpsOYhNNseRdzCvEygjhlVnOKjuYqXTYQwvHwNRygVjsqqmCwmnMN"];
	return JENrawpfcBMDel;
}

-(NSInteger)selectedIndex
{
    if (self.rowDescriptor.value){
        for (id option in self.rowDescriptor.selectorOptions){
            if ([[option valueData] isEqual:[self.rowDescriptor.value valueData]]){
                return [self.rowDescriptor.selectorOptions indexOfObject:option];
            }
        }
    }
    return UISegmentedControlNoSegment;
}

#pragma mark - Layout Constraints


-(void)updateConstraints
{
    if (self.dynamicCustomConstraints){
        [self.contentView removeConstraints:self.dynamicCustomConstraints];
    }
    self.dynamicCustomConstraints = [NSMutableArray array];
    NSDictionary * views = @{@"segmentedControl": self.segmentedControl, @"textLabel": self.textLabel};
    if (self.textLabel.text.length > 0){
        [self.dynamicCustomConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[textLabel]-16-[segmentedControl]-|"
                                                                                options:NSLayoutFormatAlignAllCenterY
                                                                                metrics:0
                                                                                  views:views]];
        [self.dynamicCustomConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-12-[textLabel]-12-|"
                                                                                options:0
                                                                                metrics:0
                                                                                  views:views]];
        
    }
    else{
        [self.dynamicCustomConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[segmentedControl]-|"
                                                                                options:NSLayoutFormatAlignAllCenterY
                                                                                metrics:0
                                                                                  views:views]];
        [self.dynamicCustomConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[segmentedControl]-|"
                                                                                            options:0
                                                                                                   metrics:0
                                                                                                     views:views]];
        
    }
    [self.contentView addConstraints:self.dynamicCustomConstraints];
    [super updateConstraints];
}

-(void)dealloc
{
    [self.textLabel removeObserver:self forKeyPath:@"text"];
}

@end
