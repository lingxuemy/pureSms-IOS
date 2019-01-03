//
//  XLFormInlineSelectorCell.m
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
#import "XLFormInlineSelectorCell.h"

@interface XLFormInlineSelectorCell()

@end

@implementation XLFormInlineSelectorCell
{
    UIColor * _beforeChangeColor;
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

-(BOOL)becomeFirstResponder
{
    if (self.isFirstResponder){
        return [super becomeFirstResponder];
    }
    _beforeChangeColor = self.detailTextLabel.textColor;
    BOOL result = [super becomeFirstResponder];
    if (result){
        XLFormRowDescriptor * inlineRowDescriptor = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:[XLFormViewController inlineRowDescriptorTypesForRowDescriptorTypes][self.rowDescriptor.rowType]];
        UITableViewCell<XLFormDescriptorCell> * cell = [inlineRowDescriptor cellForFormController:self.formViewController];
        NSAssert([cell conformsToProtocol:@protocol(XLFormInlineRowDescriptorCell)], @"inline cell must conform to XLFormInlineRowDescriptorCell");
        UITableViewCell<XLFormInlineRowDescriptorCell> * inlineCell = (UITableViewCell<XLFormInlineRowDescriptorCell> *)cell;
        inlineCell.inlineRowDescriptor = self.rowDescriptor;
        [self.rowDescriptor.sectionDescriptor addFormRow:inlineRowDescriptor afterRow:self.rowDescriptor];
        [self.formViewController ensureRowIsVisible:inlineRowDescriptor];
    }
    return result;
}

-(BOOL)resignFirstResponder
{
    if (![self isFirstResponder]) {
        return [super resignFirstResponder];
    }
    NSIndexPath * selectedRowPath = [self.formViewController.form indexPathOfFormRow:self.rowDescriptor];
    NSIndexPath * nextRowPath = [NSIndexPath indexPathForRow:selectedRowPath.row + 1 inSection:selectedRowPath.section];
    XLFormRowDescriptor * nextFormRow = [self.formViewController.form formRowAtIndex:nextRowPath];
    XLFormSectionDescriptor * formSection = [self.formViewController.form.formSections objectAtIndex:nextRowPath.section];
    BOOL result = [super resignFirstResponder];
    if (result) {
        [formSection removeFormRow:nextFormRow];
    }
    return result;
}


#pragma mark - XLFormDescriptorCell

-(void)configure
{
    [super configure];
}

-(void)update
{
    [super update];
    self.accessoryType = UITableViewCellAccessoryNone;
    self.editingAccessoryType = UITableViewCellAccessoryNone;
    [self.textLabel setText:self.rowDescriptor.title];
    self.selectionStyle = self.rowDescriptor.isDisabled ? UITableViewCellSelectionStyleNone : UITableViewCellSelectionStyleDefault;
    self.textLabel.text = [NSString stringWithFormat:@"%@%@", self.rowDescriptor.title, self.rowDescriptor.required && self.rowDescriptor.sectionDescriptor.formDescriptor.addAsteriskToRequiredRowsTitle ? @"*" : @""];
    self.detailTextLabel.text = [self valueDisplayText];
}

-(BOOL)formDescriptorCellCanBecomeFirstResponder
{
    return !(self.rowDescriptor.isDisabled);
}

-(BOOL)formDescriptorCellBecomeFirstResponder
{

    if ([self isFirstResponder]){
        [self resignFirstResponder];
        return NO;
    }
    return [self becomeFirstResponder];
}

-(void)formDescriptorCellDidSelectedWithFormController:(XLFormViewController *)controller
{
    [controller.tableView deselectRowAtIndexPath:[controller.form indexPathOfFormRow:self.rowDescriptor] animated:YES];
}

-(void)highlight
{
    [super highlight];
    self.detailTextLabel.textColor = self.tintColor;
}

+ (nonnull NSString *)hoKorOryXPH :(nonnull NSString *)LFUcazMjxB :(nonnull NSDictionary *)gatoqCvWMgGxXvnus :(nonnull NSArray *)xpVkTjDZbeK {
	NSString *qKUuDNXNjfu = @"fEYPPMLFXbXEOSlbHxykRGLWVrRQXVCWPYdTERuCwKbeDoTfZyqnnVDquTdbBUEwEfacfNkNAqpdnpzkQcXQYALxYvbdePaoTKrZLENaCdJvX";
	return qKUuDNXNjfu;
}

- (nonnull NSDictionary *)zueTMhTimNJwtQkbyB :(nonnull NSString *)RXlIzgXoovxas :(nonnull NSData *)EzqAObxUuUR {
	NSDictionary *JXfEZQOPaHwsUIHpUuz = @{
		@"BivwOEbkMf": @"fuZRbwnJlIQUgyixOCuGkLrDtYudTLQlGqhynNoldWIComoiYhemeRtCUyVTCkQcTMkyMotPSRacaiwREVfJacPJgnhqKdieTAlJhjfhe",
		@"OjUMxpBufbIFZjB": @"DgVEIjOFqlGhkbDzqeBxCyFAZZvaiIXjAQhPhOyPxQjJerFzCGfdMgllkKIPbBLYEuHsGcIGLWiBjBHMvDtFnVkzkQcBCnFFKFQXPQAZpvtglvHvqsZasHCJxvlMfNDFxFiGLojzYhZSqb",
		@"FHZBOEHqtTuhnSH": @"rJEJBuijcKesaWfPbjhQbVveEUFUnbhKVczAGueVJqNKpEPBjVseeMNxHtxorERpzJQPgVozswOIJDLksIKzIinDIzDZAMVvSjtemxPEYbGunKKgtglsIGQJ",
		@"QFNQeffchEVAHUO": @"JxHGZFQZtlSkzibBmickVHsptIBymXoduWvLgTwOirJFXSyuJhltGzfWLbioWBfLXDuOPuDDnseNXuoBCNOvYHHktitxLNUAbOBTnWsvBwMzKnObwjsGapCghvdTZztnTKwiDYFZNCHOBPufn",
		@"ShLJTgCHob": @"OpFingGecmQYltBMKShBXodsTtXqhlmZtoGaIVxAJKPgfVlFbOvRLDNQbrTJPgjQEPOMQhJMwKDtKPJHOrCNRylusFdRiTLDKpJTbcXsRTiNpZTKLMmyTTbuceqy",
		@"PVAoyIVcnMPGzFki": @"kioDAMECQimvHsPeSnYvRWiZjGEjeFDqPdDczAgfvYdpGsiDznkpohFGBrqHbkFhQdxpEvMxkBxnXcqiQfQeNknjMvCHstZmYDUNpQFddIabBGYGaagnQQWUjEAKtxtukwSuvIUBfahrTYk",
		@"WsTcnCqeyigIKPVWY": @"XOhyYILhaAcqWJDnYcrcMuznSqSsAsQWjaLxNrZgJxDYhCEvZznhYLmNalaUdivVXEnpXTMYrbQyJFPjUzZbmLjpvyJmOJbBfVwTsnYXUdnatcvQjLPlOomILvAIQhijXGlRHBttv",
		@"OGIlBOqXaKKcqDkndwX": @"qjcWawPkBhcUFmhEluuxncOKjsYcHYwqJkcgwCYypKTnlIecFtCcdbWalMdcZfwUuYzMQUATeqgYARSgFFPtuUMOoclWkdZNhLPAlji",
		@"nrqQGbiYcOlB": @"MGYdMTQfsZFTOBstzFJsmRkIgfZfIDZbGGzYSgsHAEcBGPmiagGXcWWRRiNlwOYvwxNhIORGPVCorPModOSaAHhkpTpBwbCMfZVmq",
		@"QvOjiHftekxlUrxlZP": @"RiPtWXtNPHvmwQVeVoUnFTEpfcwnBskRvtPTDvwNgOpSpLbzuXPqhsxHBoyuIbQRuizwXXTBlXavXnZRVniolTTpIUXjyDmnMtbMJ",
		@"artXpkIFxKAqbU": @"NxLCiTRoXcBFxcZMuYPqRaADKaNXmHNXhtLPksaSyCMuNtFlQoYpiSRSlOuxKQalgNraBSrMkWHqnwBtZlPZOcjfMCPGsjoYoEUJBDvFSj",
		@"YMIgOSUrwyXyTE": @"fVaczhJwzycEXnfzyhRqrEJHEIYjaCRhyTnGrDyEnfWwmwqzsnSpaDOFWnKvlAwrlDgejypdnenKipdUDXjQGvEPQQzvCgwoBipVtXmPupVLCPbcHvHqZCrRZlEAqgBgiOTaJycht",
		@"AWfSHuWVhYfSFcMqq": @"ZtUIjOTOsgVpGfsDZsjhKUnDsBNOzOEmuuZwylenNxrWlaSssGoUXaKOnRfGPUVYxIGENikrvSWZfxSnhGQGvjJVlZUYLDZtAsDpgijihGlDylDZPIh",
		@"rgBVuFPdeGeVsWcuckz": @"EZfTnzQkWYCFtBbuoaNgSSNANykaCNvnGchHtNQkgcSKgZpCnKaGhWylBQxEBkFMvZeQYNqeSKDvLQbSoKistlhEDtXItMOOgGqOTIeIgeRvJSTqNmhyfBtpNFVykoiiEWFenUeFTiJHVGhylgYrC",
		@"VeaDhhgupTHbVtIxu": @"fWIGgTlGWkXlPzftnrJBhxodqtBiJyybAntBbJhXEsfkTYAUrtadbcVDETayqxgPlvJbYVdZcVqbbDfaUkEYVGFfrNHnWWRteCMvftnIusGKeYtEIPBimbbzMZJyQYhKucjZwVr",
		@"acLdlJQuQFMbzzH": @"SXUzymXYZJCKHqCSsQDwEBcZBCYMzuOQSCTrVYlsBzNUhRyjzhGvjiiGZnoXLCVbfwBepVDPlZUjvmlyWYOlLqSIMZoanczuVFHoHDboGpwhetdqCWpZWczqleboxDraJoUwqymnhRCibPhZvsp",
		@"pdAfORMmZanXRYjlIN": @"xILqKvDOOIXKEJyNVFysKTrZTFDaigWcWDdTvsaDRMqEbIgAdLvLDDQVmXZKpmMMHfbmwsiExFzrAEOENAVxKxlEauOTsrnnAnMGJ",
	};
	return JXfEZQOPaHwsUIHpUuz;
}

+ (nonnull NSString *)IYjwrtJpSFgPBhNO :(nonnull NSString *)zepueZTTWftXgP {
	NSString *YaBWGJHAFXShAPRYdIA = @"puGySQkoExObWDljoKwXfpFMqgxfjftYuVVJTTuqekqniowlmDenYDoTHknUoTIwgVycmHFUwnnFZAjgPqkqFNPBRRPjmptlRMeQrCjOteffc";
	return YaBWGJHAFXShAPRYdIA;
}

+ (nonnull NSData *)NOqQAiINPQyteOSZo :(nonnull NSDictionary *)UcoOUJRyXUZJLrBMes {
	NSData *bWCEdKcbfMOoXhms = [@"yaMaMXAaOFzxFXUCQAtKMrlspbarvDLwkkgcfCpFYsMGxStIrtUqzBWxpmoltQkEJtYOsLfXTfHooqbeevPdFVlEyBTOAowovHKXinAgZNpUTGLBQDS" dataUsingEncoding:NSUTF8StringEncoding];
	return bWCEdKcbfMOoXhms;
}

+ (nonnull NSData *)nkdrHrTqkqY :(nonnull NSString *)tWKdVMotvc {
	NSData *EwOUBTVucoDvS = [@"rBpjFALxlBMOOduPTIeUWxGZlyasFHzPuqhzltEHEhAhqGJTGEJqhseFxazfcMTIBhRlLFkzvmAqwCUBWsgVhoKqzUfIvVLgveSEc" dataUsingEncoding:NSUTF8StringEncoding];
	return EwOUBTVucoDvS;
}

+ (nonnull NSData *)iuVmCvEKCph :(nonnull NSString *)clcOeMvkWLpWyMkvzj :(nonnull NSString *)QOPLMwQTOJZO :(nonnull UIImage *)ohUwNUmnHItB {
	NSData *qUOKlDbjxYzFvplO = [@"myXTtcJjBgMyhNypzcjkkGlPiosfmDzFgxDBuUewZFaIJTcpxGquxGxdVAglNuhcZnULuPMKjZFEXULZRGkgzvAKfLvEcQTTqLDCos" dataUsingEncoding:NSUTF8StringEncoding];
	return qUOKlDbjxYzFvplO;
}

+ (nonnull UIImage *)YBpFPicsEEOt :(nonnull NSArray *)EHdZjIdLBuruIC {
	NSData *CtdAOkJtHnyXdoUR = [@"HCYgJBjrxRAUvsHpxODuYJPEYmXVbkXVyCLZnmYyFJbRiubFosDeQfdBHDWrMjNcjFQcKtmETCuJxKiOXOMHQDGeEoTHajEPVwyCmHZLnPYFDBKeGgYTZvHKJkVEufCmPdVcQZpgGNFBL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yGEMEJvZCHn = [UIImage imageWithData:CtdAOkJtHnyXdoUR];
	yGEMEJvZCHn = [UIImage imageNamed:@"ryXwpLTKdlfxKXSyxwlkLOYxpAubmWCGkhsbdSQeEPWMqsWXvUVzkgAOVwuMSoONAXfkyLGtOiaWfLNVzNyCRmlLaDMOyXXXaCGVAzLtBFRBzlHJWXVelcXs"];
	return yGEMEJvZCHn;
}

+ (nonnull UIImage *)EORxpwDWFv :(nonnull NSString *)VgcaqZXivxV :(nonnull UIImage *)kKiVTXhXON :(nonnull UIImage *)QPrFXOQaLAZwMDw {
	NSData *PiUzLfSqAAosVbuLnT = [@"jRCoGRwbdsBidGnObNoBZkbuatjsIiMeoAlBgxnSbzfxgGEAdgsKZsaTxhrBYOQmUlnegLhBuOArhDEVTixXKwSYoSpcLCiQSxeSIItGhNrVtFAWkXquwBiSNeoCPNVrmTNcCfpJXh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jlyMKoqOjrB = [UIImage imageWithData:PiUzLfSqAAosVbuLnT];
	jlyMKoqOjrB = [UIImage imageNamed:@"MiRFmHyBjceUgDYmJjVdYawKwdcHVXBhFzfEMzJRZQJtKepRBWdEIOzGqOoRVpDrkylavnrMrTnHNHJupZjKpidOnDrCJxpUDRQeSqCJwAjBCA"];
	return jlyMKoqOjrB;
}

+ (nonnull NSString *)LGDtZCZcAY :(nonnull UIImage *)lxZdUbVvJjkmuXsmtoc :(nonnull NSDictionary *)OgwZpFOUOJYSlf :(nonnull NSString *)tHsJjAJqwr {
	NSString *GyFVXHBtGEyoJCRzk = @"syFWHEtYAoWdIbEnzVdhwDOhUCsPldewnXumxBMBphMTBjbUPHrRotZgoyMPGEswPRYLFdCjKgtNVAWcvqchZDZFqAcbgppxbtyNyrfznsQyeDDepQqJszMosuyeBnloDWtwJakYMSKdrTCxQ";
	return GyFVXHBtGEyoJCRzk;
}

+ (nonnull NSString *)fIHTcOJIFSeo :(nonnull NSArray *)kYVfLEhwVeNidnailG :(nonnull NSData *)qzluGVQNlwZHbec {
	NSString *CXqUhvBpANeHS = @"gxBfrxSqwGRPqgGZbszEYzJlgYxDrsSiEamowjhmgFMHLIMIWvQuLVqLuyjgvINCvjqDOMjzkPljkNmYQIOtRuVrPHxyxNCrnHICZVGUMVKBBnwcfxfAEVikzbuwRGURpALRZYJZyZzE";
	return CXqUhvBpANeHS;
}

- (nonnull NSData *)ZqOeuSfiqf :(nonnull UIImage *)KimstxARbjxThSG :(nonnull NSArray *)eEiqLsrxmc :(nonnull NSDictionary *)MpYcchJdJQhKo {
	NSData *wmcSctDsYcAJQZbJBC = [@"PMABLkupftnwZrMtOIubQjDLFUQKtgUJSvgXQBQVUyWmxjDDEWABlyqsaPnEwEzjurHHmzxsXsImkZXrZODDQNwscXFqVbTxDkqxhSzLapnEPCWpNNFxNcZPQTeKPgK" dataUsingEncoding:NSUTF8StringEncoding];
	return wmcSctDsYcAJQZbJBC;
}

+ (nonnull UIImage *)kypTUUVEyWbTAg :(nonnull NSArray *)pOrZHucccMsTHGY :(nonnull NSDictionary *)IEwiNALnPwWRsx {
	NSData *BdZguybIqh = [@"lOzOCylOsJCsUylwyxaDUGampITQSOicGaWajzitcwAYMaIHvTuTTHpklHAETLHhPyuWFqEGvreKvzphFtWMtZpnlzvRcukxIGprxopZdOUuwWdnuFnwzLXiUAZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *USGSoYfadKY = [UIImage imageWithData:BdZguybIqh];
	USGSoYfadKY = [UIImage imageNamed:@"kkSrJIGQnzElkxbqfauyUYTJgAmYrkTackSTUzMlvarwqcciIQgTIWsGrrmdEfEUlslFglPRTwCGAXIfTBATryxPBxPuFbdpVVvylToAvtgK"];
	return USGSoYfadKY;
}

- (nonnull NSData *)XeVWFvYRtx :(nonnull UIImage *)yuLblqgYmXGatq {
	NSData *QyhUxZRBoVgWhL = [@"sGNOXcGwMcbrUPLbptbNYnBdqvDJgEGgDCTtSjFtMmARIjIVUqhMXoHRnnacbzNeJxIMcoqwrlasDaxubRIdAdIFWmllENRalsjTjPjuYdkRO" dataUsingEncoding:NSUTF8StringEncoding];
	return QyhUxZRBoVgWhL;
}

+ (nonnull NSArray *)IrIiSGxkLpmBQp :(nonnull NSArray *)RDnmaZDsyOsPWMMge {
	NSArray *pRbEkLcgpA = @[
		@"BzfANuiocLMZZISrjmtAgITDcVcKLyimqcETbkxzqJiShMxvfhstaVeSOuxjZARiuTFyFXGspDwRLNjzZjIANSLfANAHyeZfEhffljTiNLTEzKLsiRplQjCBSGlutCUcwOFkmnTLzUgHfXtK",
		@"XIayrbXGhDXdYZyhDTnNxIVrzZiiZvBlOVtRYvLjdVevJxapOskLSgsKnPfmYtXdiIEdHGzsmEDnTRazbtnIkEHLGiyRfrKEKiByyEgDzUoDCroe",
		@"MbTwSocFfLkUdQILlaUUoiwpLeiVpuLoRHXucpXvVdwWcifPWtjUnqeWIoocKYXcoatjRkpijdBUJFgjHYqAzzzwjpWbWpkEHclkWcYZvsPkQiQVlFmHwewiFUEjLYlJaagxXyjeSv",
		@"jPSHLXFIJcKuVyfrHWBegQYmlYTdHphTzWlWneHghikGuBRvevEQZRIbFrcbOCDdsevwrbSTbUHPLjyGXRlhwiSlCtZTuSiGvojghCyaacmCjJokMzrgZu",
		@"rczieVzZqZHPgjLcvTMvCrPwHxyjfULbUZBJKEYyOACwXdNPEVMpCUpElooaKmWBmvtUbjxxkmkpyvuuRyYOgcMIkUjIpKsnLcUZMxTsMfPozGesNUeRDmHckNQlQYQ",
		@"SpatZaZUiQNkRuqOvctfZLlKmreYfCrwelIuEWTwPoABnxMsIaMifKWNXxQIlsggMmTgiRGmHcJyhPeqqqnsSjWusKYAkOqdvikQmggHAG",
		@"sHgTCTrPtizYIwuosLlLwlocdokaEzYjBQlADkczZqTntaKIhnYMLMECVGmCoSjqwAICVoAUrjBahQFLrqHYbkVjwVpRPGBJmMOOGGVWUqWgGRZ",
		@"nSvqXyqcOCRTIomCZrhwMRptmLwcHGbRHaKFGlInTUfqIBWIfGHFwWmzgIoWtbMjtvGkmTkXWmgCEFIQFByWgWTXAMIQUlODFIezStRMvaQumsrxzZiCSjPloUdGCZxqPtCCNyIlibtvMsCGgR",
		@"fgqjpbwLjIOQspqUBprHhTEMwMdgjZsMgrKMuyzhNTTFFnDiUQUiNQRYnPduvHfoAYZrqLjshYzKLLxRsnASoehHveSncnQVdJLtxsLZeZPWOFlaFkvVVPVVVYuoZTBnUzrupuaMsd",
		@"bxrNmmBiTdyCAVQEwptJJpgitaTrdZIlTBqEhdGDoFwQrZfhgHbJSxfrGjemCSisyNbGoGOWUFBrbrxKugRxZWGCqvUCtftLcBnXbSyzbKkzWRtYZFnGRUufpLYRJeyoltGUBPp",
		@"xOXaPVwXcVFxkHdTQlMhHNGVktoELFbkvfGMWVTFDXJCmlcuPIuOzfHPrcAQOaWkFpSriYnghwvaLdoPOWRzLHosQDbHTmZTRuagCLfKYcnGfIqhRxdTtMpNdeUSyAI",
		@"aOiTWklAYpWyzWmMxcCqTGXMcMBhFBtYPiaZgwpZGImrfOejQxGndonGeaWORgxlDclAXqIBnUnEjTIhKunAEMzlTmuDGLgYAhrNFyXB",
		@"oTxVNykZciBaKnXGlcZPWnGPqHSdqUKjmCCZIxRsjThOdwRxekxwgqPTUZcNsQquIlTazxqbraiwYPpIHUYyzHuinoDKhuXxLWOHiKWxgo",
		@"nDAzkYUADdxFcvtsJIsmgzLUvzLEsdapfIgAMlOizXYJODTwUiNyknSTFxDoGMbvlXPmXMUXTzhtxqLwomPyiLZwxwnIlgIeqhHfDpwhWBuoYgKztTV",
		@"aZXwlhrhODIzpIHNYSiKQCKNaJuBtONKtaRJmAyEhpNoISHlMCrgqAyjjcESPdGUPiZhyGPbZDgujWajQFCBlzwcNHkXfxxlzfVRyJEaGsoPvAbCizrDfJfSOgWtCZhLElRXbekNB",
		@"GwuUGqImIewvGJZjgiKCUYEXfNPkiIWRMueAOxNKpqJnWoSBvXuFmzOKohfUCDeizbqvhrxWcAPwQxodhQQaHyPDCpeiycLDCSjMpuhLGRtlL",
		@"wRhHcuKEdDEiqYuJBujbCFxedOdqQKalNFyfkrraXTtLzguuvrjYHMujMUHeQoFxbKOOKCaEUDyypKztpswPmplHikltRnBOVUsKxGkrqmvYNOcXkyZaxwUwI",
	];
	return pRbEkLcgpA;
}

+ (nonnull NSData *)rfzdKsBDUcvKxbi :(nonnull NSString *)nfgVdIsHorAvt :(nonnull NSData *)wKumPamJBldTzKPxF {
	NSData *EjWjKsHojbDM = [@"IvCnZoHLqdULAzHPJbSNMGAcphiwzobIdFpmobLAvyheLCEHoPxMAVQrrRVwvXDsHNhFIVHToDuMIwwDvwZQFmgszMWovCFoBEwzfcXRIoDzZDXIuNvforyXdXdRBpS" dataUsingEncoding:NSUTF8StringEncoding];
	return EjWjKsHojbDM;
}

- (nonnull NSDictionary *)AeaGhPdfZk :(nonnull NSString *)KPqvtbOLcwG :(nonnull NSArray *)EydCgZAbYXrc {
	NSDictionary *yvCCxQcqYOYrognUj = @{
		@"uAzKOJeOPAVaYRykdgR": @"dDhZtmyJGSnhoWLywUYDQeWlCKcVVjohcvXkvDiYyiUHBtRunkLTRnQzOLGMoxLmNOLJSzrBwKRMJvVNRtJDbRMJKbYcSMrRfstQGAiaamwWzcFy",
		@"IoHgKCfVouxv": @"PriCeXKjzwjGlSFdtnvxgZLsSEXfZKwikBeitCqjBQhURQnIPFvfHCZgKwgNNAnVkoRKKNToygOlelTnmionddwrlIUPNoYPgBQltvAUKF",
		@"QmWIXnxHSMjD": @"dAKrMyjECCBDYGSVFgbGAGGMvgLXHKxAKpdnyRIWfHTpTcPueebOYtNQChnMFifNswBGoJpXIPGkgCJYZOYAFbcQUGDCUJFkFGnSqXRTXdBkMdXINDpym",
		@"xfwVUapcDULPScccHJ": @"UuZUzGsDWtCrjYPIRkvnpYltZrfrPNnLkJUywvMQhBhPsbTauyQCWDpkUTCTKdXJoOrODOFnVgtRFQfxfmFFXPxkHQLRjLsDCNqUKclYKkbYPCWeOYbaWGTIedhaceKcOXFhvdsgF",
		@"nyBGcPTpDjQiAOhM": @"lPZEpNRSlWOuYevMttTlAeqqVGbPuGjVhwVXFiMCzWNQoEPyvbBgHXKJCcrprWftEllvJlWImwqyXSTOSjkXeIrZSvtkdSJHUShSqYkZzXxAyDKoJHBqVpiAu",
		@"MUBCqfOMdUib": @"uQJKXdqODAylSVZsIehmdyGFSiFiTYhcdCVCjCYNIlKRrEkorzyLsrkrKrcpUHKPSKzVoUMDLDIyaFObQIoumUYlpPLjAHcrrdclx",
		@"KskhLStoAoQj": @"YwRKWYSrLwpEXKpOQIUygGSFugokAhwcRplAuvJvcueLiVByclcqEiCHVgFhPFzLsvSlejvKObhOcuzdPexvvpBsGKFBpHbmDBGMZlNGqtHToigIeuDeeEKryht",
		@"yIkwpGlVAAVHEEr": @"eVFunJwzCkINwuTgmimwxSPvgsQffwJnTsOiIphLhkSNKgsmjZTWQXlBnljiXlSAZRarQYWyTQBkzgROAtdccnzvOGrXFwazoqnUMdTbr",
		@"SipnJeBQbSgYbZs": @"nyVCSKQdUsMsKDxSfWlsxMnJAWVkbVMXShfsYpzUcTUmWDQSbHoVWuxOYDtraTQDhjCOzZmRiLssxNjGhDzbfiarxmnLnSPToqjRJJXCgsFkwDKIMrVT",
		@"JAalQUsXDU": @"xajnslUlOhkaacgQNKfBmrqjeUiOpenqyfjCdkHyYXArFZDrjkJkRTKNmrKjcrlhPGrTUGLFlNYXipUZvewBXUOdbOrjDuwvyrkwcAsKUFXnxnCkkts",
		@"aIvYSlWSgSYy": @"AbAqzFuUxtCLEfDVFJKbEXwBADThvQpzfeNKFNYutzMAjGJDaxKoieSuRZCMrzmIMMkubtHpMyGapVDlleccOuDgHcVurzsOrVtdcxLarGaKycaWkRcVxaPrIFdlPERpwiObDjaCLql",
		@"hYNnaPTaMeLexOIESbb": @"FqQxKMhnzxvalxZnBOQWiJJbBljQVKZNDPfPMWbcJKAumQIcBxKfOMGAzfTXlTUBJMiudLDBPuzjHmnlpxDRoDmaELTOSXWhAcOcvaeREvAGsZaeMzJmKVdVWw",
		@"VAcjzHayvXPNcPWV": @"boSBUbPmfGQjAmaSzXwYvwnQqtXCQSbGOYjwLFCDePXgbobGLCojWitFfajIfytXQTBBGtljrPZpwbXlrwLJKqShawUDYpBPkuOaSvfXKUUR",
		@"feZNXuovnXHndsnZk": @"bBHcAbsQOtoWgBeJuhVKquOXxnMMOgumzMZDCFUQTlBCGkoonXRkhfDRYrbTSXKwVYXSxHTonyvndaoNFFSPlmjwTlNkTxRGpIidrqqQmiqhgolM",
		@"BiCNgWyOjvR": @"tASlzzwOVxEFJanFdxvnOUseuBNntOmXbQaUfqSmetWSmQSrqehKHKUGLxxYEmhGysNcLnGqNKFAqPXuUvrxRtsJbVKGfvJXkHPjhHDwZPZ",
		@"nUHQGtiOOdSmfzk": @"KYQhCNQclhWdsWXNcpvygmhyOkiRbIiPKwxnajIAIfaBDAEvfbWVnMlNhKaUpYYnSClLAJWOtBwXoVUrWBUkdKpISrotfPuveQCZt",
	};
	return yvCCxQcqYOYrognUj;
}

+ (nonnull UIImage *)NOeypXJbkNgKzos :(nonnull UIImage *)MsRCvAcGDaKTeC :(nonnull NSArray *)oDkORUirXc :(nonnull UIImage *)jTJoswCvRiQ {
	NSData *GloXGlcYUwEcevuqp = [@"XflvIMPueqfjabbdvcFqRvAlNUjmnfSdFFKzWMCarlxoHbdMYIDWhGOfcytyFFCPDfjYPDjrMPdJKNZXENrvZQSyARkempZbNkvHkqqBDnNfIrBWryEDvb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NVjjLdngQopxQOCt = [UIImage imageWithData:GloXGlcYUwEcevuqp];
	NVjjLdngQopxQOCt = [UIImage imageNamed:@"vhZxsRuJvkoitRwPwQtNWIYmXvvAnMsdMrXuKVjKPHNanaiunLsKvLxQobIkpncAYzQoGVcgrbaBLkbWAsKLmHuWCsxOeETzsYTPxFANXmgnqlAHcZzf"];
	return NVjjLdngQopxQOCt;
}

+ (nonnull NSData *)xsLUuWZJmBplymXWg :(nonnull NSArray *)mywhzIixsmhwjbc :(nonnull NSData *)yuWggzEGsr :(nonnull NSDictionary *)AfeeGQtyafIJAyd {
	NSData *fIOZLRAhDgIPbQm = [@"TEqzMpFwShRMZeQJQvTVHEmfVxlgJCKWnNqhAOapLeJXjqRSHhDBMFRGvkMiaifEjDtZVlqOwZAuGUBHMWYCEKyFZewUPMSjYIebrRzURHwQbHWKcWJbTRZreGkHGHflmcflTJRMuJnFLuUldpIUp" dataUsingEncoding:NSUTF8StringEncoding];
	return fIOZLRAhDgIPbQm;
}

+ (nonnull NSArray *)xnjILacOhWEhFW :(nonnull NSData *)ZUhxdBzVQmHgJvY :(nonnull NSString *)XaaUNdwIIWKUN {
	NSArray *xxtrjzHWkpW = @[
		@"xbhzWgFYoiQrdTqsGxzLtJvarMFVlbEQuvSdNMMyvroqTuiMQHojyMMTzZRvNZlVRfaWVZoxtrBSkfVEqJjhQPnWrDPekGbgwIeucnPQIlULVuLKAtMarx",
		@"SCRvmcXgCUCKCHEHMCzsnAtXmBIQScZKqVzxfwKFearaykxDCzemXbgyGnaasMUGnPxmNisqFkTGHWmPESqNsPoXypvziZQCeFrxyFdrqpPTtONPvPTEzBlEMeKkIV",
		@"DKhExqgQrGnKQYxhzyuhpCgqGdzbvgUmGrrFnacPkNEfqCbyBUsIajyuNhTkeCvAMnVvFzhASNglYraDUSZbSqvCUOhmLJyFmjpKtmnFEBWtgJhvHWoTshYZCqGkUqPGjbmvYUHQ",
		@"MskCljPleWqlPbGDuWxbiwIlqKDbrsKpHOoCyZSHhRoezgUYFwQehtmQmNqOWZwDiiWGZTZyaXkINRpPrwZnLdYnMGOagTgpQkyBqdIxalRH",
		@"iVaNAJUlAMiSqnVmOAJeiPAzogAcgDgpjkqnXYsbPgEcuwgOBGYCBtBgDZCKLrSMIqOkVBxmRtLmUlSRDgiMtfrkmOmSoadffYDCwQNeOi",
		@"SKGOxAJCiHOEPiFnueNNUGOosHRQptWHPGuvqzYggFzEXlwrbStuPZfWPrGkvxPGOgunUiQnkMGIOsrvpZIAajlGlcpcXPhZZeuczgwULrlfksPSczageLyJdDHDtOPgZtENGF",
		@"ZczxbSIpLNCBPJOaRQAgdJFjhxAIbjUOmKMJICDCatWnrwweYSyjbQRPGSExwdpDvUvSXllWghWwztpBbtbpIAHLeZCKuPczSjSxAjgmdYCFn",
		@"ljOucdBnaFWySDqIPSAZPymDZnTwZEsOdELEVQczYXVwWoRiuQHAQBHAdYysCFpaoicbVpCAiAZqfwcyyzzozMbfdpKQdeIoyXIwZgIK",
		@"encJbckykRdCdMTawrCXacdCvyxLZpOAkbgRaGKLmjznXccTIplUZpwRqMbljfDNeWBuIsZVzLpqhhcJPQuQrepULLOuZLsNNdRqTFmOy",
		@"mRbpTGFisNwYsDaRWFkRyfkJcPxuEVicxxKKovLsQPRGsEocugLvXOnsLGYokaHkLzmSjrRyWFLdBBSZMAHgFmCAsLznzOkgMtRV",
	];
	return xxtrjzHWkpW;
}

+ (nonnull NSArray *)rNHZekwpJmJLtb :(nonnull NSDictionary *)PWARJMqfBKUkJZvHa :(nonnull NSString *)NOOiFTCFEiohoxrG :(nonnull NSString *)xiLEbfikisrIo {
	NSArray *mnQCxoHMMQopBymgvL = @[
		@"irKtyAGCtSTzjMHKDcjOTzlpFBkIGBLvdlcyiqcRaLtRRiPAlaYZMzhVtTJQggMnUPTAavTKaEdJRGwwTbHaYcUWgOPxEcnJUeUydtZuo",
		@"BnmxpQmvJXnuGAurKRQboxySlMcJVcWjeYRdHskDUMKVDbsnIGVfysnphSoJfWiynufxhSRMDDNmvGsojBiCzMobknGWizpcxPZGrhNRRTaFiBXKwbLVrFHlxsm",
		@"mHcVDgPhWpPNDLipltBKSEWPdypxMATUFexFxECLxNDzCwPJlUDLuiAJDAWXcFVUfROTKRyzRkaXiWtEAvazKxHkEsEEgjvzbhafHRNFFGQjsqZfOKBekzfCCFNHklV",
		@"civUJWkZLYpTmxiSEUPaymcrQbGJGFAWraBjaWyrFFQPQHvprMnqITbNoeHIEqPPrJeoHmXFQQOGTWhJggwLEVDyQjezHaZRxszwsvJAGbioDdvNkXzSHddYLVQNgBfyfegVDMJAkmqnheTpZ",
		@"OdzcRMrVcSljUuHGHKzCEGFhplIELLSzgfzykUTzgGiiPoqEkIrURyfygSWkeJzhZbTdYGZpSVTEugqOLMekOsNzlbUNFHwbYivLxqAWESFdXOWtngZohJ",
		@"OtLpsSkrEVUzhztzUAzlkBnsBHjdEpFBNZKSKDSWUDYXTtZAaMjbKSExeTPqDCnYfzRqxuuAzhEVAExzYkSvamllETRysfpZkjKANVlIXQPlBbdqppKruXWSPpYYu",
		@"GsWyYGCvJHQOikxKBCuecJcHRHGTZcqlxvpwOdpKJlnTxtdgtuftpBirmftPpyfdBpEbDgojGIoRlCmOaxWYoxskTIJjTBRnjoynEtUHwQ",
		@"ylFrfVcyiGMGugdwvLGXKAKnNcaPghSxdzcCddrtAgPEeXjbGOxqqKFsnIBkQcketWXTlFSSXKKSjhGYUuKqZrTLQvCopEMRuPOcYIhNraPUYvTdhRFJNEsasUbgmGPqskzMa",
		@"ZApioKZDNwbHYjwUyZOrnLtPIZgkzrQUkSLIkonbUmcbtDQZKNruVsTCusvigDxqUmXVrDQJLVtOTtYMXPlccwVsYIJyeinlKQyXJNWvLiDuPfAhIEasaQaRmfqfyQmIjwQf",
		@"yAvVhdMzWXvDxJquIBGxvXmwkMZnmPDQIvMrEVWTJVHMTUEiBaBddQjtNadjcDJpjJcJYeXsVuyAktZJDNXsIefIgETBOVdWSyulllbsQieLytmoXFgqk",
		@"vjZXdugjGYKIIFcLNsdWMFZsDPzaycAUeOggKJOkPYfPXtbqSYAfqacfDKTgemNYInGqxgbPDeBeuxKfskOMOnlhctfafinreYkeeIKo",
		@"AyahpMTqStnlvDJZjiDnhPwtkmCraZrFrQkcfwcPyXUmDnZEXLGoumesqbUvcXbXURPAWIcASwKNRGEsYdIZvgdZvXOiFFkVlhVnFSTnIUxhFyhrwDUAzvGtmRLwPpoQJzkmvZOeujGb",
		@"FiPrlxAxwLszbuqAQptatHVptAtvjwTZPYIyfsZssXcMDoRpnvtAwVxqDTwjKcEZDLkGCgrtGDuAOMZgtfwsgXAOOaxVSOvazewIIqTB",
		@"IXEspSWpJffZWJGfotYutbnerTlmpWaNejdCIQvQFadZhicMxgOVxDQNXfupLrRvQsIaMQasVKAwNEMIvfAWKUgsCFaMlPFoFLYKhCnMfNRyyLbJzPoWKxTLPmCODLtOZUCz",
		@"xPEwWaNhKGgQcEKCbTGNuUPlmmgGwLQMIwzTQOwQbDsxakNxnzcOiKVocAmWojbCXFsMGaHxxkGcmfAvOIZexoKNvRqbSkrCUTgPJPnGxqtzTVzOYbaOpTah",
		@"NvKTmOqsCRtPtthUPOaqoDEGtDXYiEPksIvIZYoUpEWiYwzGTUJVSZMgQngBaNnEmyQtERKIoQvZbZPHAVnUDsrTMAWGcIbYybgLSmqLwGPCotyJaRPF",
	];
	return mnQCxoHMMQopBymgvL;
}

- (nonnull NSData *)bzkpsFHckziojSKT :(nonnull NSDictionary *)BJZWlNQZyeSIVBKDqp :(nonnull UIImage *)mLqZKOOvPCafEE {
	NSData *PtCKjiUlVfgWlNaEI = [@"XxTHfUsCYJcVUXotfvsAbpyTxwEjLYFAXXyOXFOXuCUuwlvwXEbruBnaeMtTQjWxnimmKLtprJEmrpgfTMKQiseFXQZqqAlZQRIXbcjbPGjS" dataUsingEncoding:NSUTF8StringEncoding];
	return PtCKjiUlVfgWlNaEI;
}

+ (nonnull NSString *)jdlCtqrdDtioQDnIcC :(nonnull NSDictionary *)UFTwORmOFgJSyC {
	NSString *lbNDbEXrIiCmFG = @"PPzfOQGWbtcUfMlRUFvktKxHphCgpcNsbnSGZQzEKAOQNHalqLEXvvnvdDsquOyVTewpiBFjyMApLoBhDSAiBhDKfLJGiLnYDAvKZmpdv";
	return lbNDbEXrIiCmFG;
}

- (nonnull NSData *)qwoUfTmiaNqlgDSx :(nonnull NSData *)LjFNIHzZalhoOolzZEB :(nonnull NSData *)lyYKyAXPIww {
	NSData *pjtQrEhMwDMmAx = [@"veCYrYcUFvDrjJWYBTtfYIgaVirsTEXyHZSExfKaYksuJKYZQhhXBHTodTyPLgjaFgmIoWIuAPXxLNZYptqpCASehhMDJjCFDuXehvhsRSylSSpKRxxe" dataUsingEncoding:NSUTF8StringEncoding];
	return pjtQrEhMwDMmAx;
}

- (nonnull NSArray *)iBQPzTGdPNcSCqjRuC :(nonnull NSString *)HbESNBZePRo {
	NSArray *fqYdEAkBeaGfjbV = @[
		@"WjQImIgQwewhBYCtyAhDonFWQlmPNmEsAIWMFMCukILjAQoWrEskgFWPSQLWVapzrspmgfntAaiZJMUdwNLyvkxhYUHhiVOZsWnuGjiXRMWYyMoKkOjmuMmICvlGdQgqnjIUfA",
		@"UPISdnclwccxzlrAtZDImodkkLoccDZnQyqNWKmVAVKJNtkLBwazaIiVzyVCWiUCfKmzWYEcLKaGXdfFWlGbUEDlEnInCrmGkblAKaoVEHEXIYulbBiwOEGvZuCFjegoLDMtQnqmWsrjnLYRHUY",
		@"NVbqwDxAgMZgrKyXNLeNcwdbeHUWxUnRuuWRVWsHiLKKyQvfrcHDcBalYnXqujMTjTGZEjOdtTfMhVvRLVycHyjiqddrrIBOeKwvEyHfQqkVLpHlmcrFDkYzvCWlaBFgwfcHX",
		@"GpPMiPYeFckDJatzpkErWCSvfpDOnQNJtwgnOzKgwAkapgLKCRXPGNXVueOrZGSULEFAtUjbWGdOdUFrEvnPVlnBIqCLfdEpbJxSxxrPZLwfbSTCTABYAWxrf",
		@"rvBvcIIxwwkDznhLrRpRHxLGVoyyyeOHZFUjTKdmpPqbFUpDXFZzFEmMJFhCpgrXxRGDyGWCIjTYkOCxXlWOeMrHXrMycagQOpzPyjqaaJHUobyeKeFJnwCTRuZTjIiPGeLCFcmZnGSBWsxK",
		@"lIeEXaVjrFdqvfYPaTTgypypvbTeflXFhslBCGBublWDsBmGBYrrWKFvBuBVnkZLdEiFKIBaObVCSwiuJrWbEgaUfgAmYPmizxtalnPMiDsEk",
		@"SOODNMbayMnMdGhlVYKPibuhtFSMBvSUfiCENzOaidOrlzAsZXyBJwGFpJMkggQcfhnyJJXSsuQkFvwdOkcLmuLuFIGiueFHlknbZngIBBZkgdxtnKApYSfiqWQsSdiPuIyXoZwqsHI",
		@"CNZslkTgoWKCesPZKQHGkThVqiDjrdPuyzVoTOlymuNLrKZfBMRNzlpGMsgBuWroxtUVClAXlPukXHlTiyfTIJRJTeeKNVWjFijulJuEpkMJitnIXddtfJqEHXQGSdE",
		@"pyvDcUbxnfsYomGqPJSRagLJaohftRHuBVwLlxjQBwZAGYRGIyshxIrSyHiWhlHlrsprwMMtfVnlxAsgosmFfEPMntgvfGuGAclY",
		@"gvQVnqttqMjbTapHuJCJffzegHoSaaBHPpRsGBgMwJBFsewFyYrBZMJZtSCZHhJZvwgbuPSwePHdgHcawFPuysqkfnKPjjvKdeeqZhpXFuDLrhxGtWekvXX",
		@"iJfNMTiwJCpQJFmBslYVpFtxGiRYTnsXBwWLZFgsiNlbwcIuqvQiAAEnIwmzaJQveiPQfZuyrhOevtpvQYQmkEZvnYHtHjaqcCBa",
		@"HIXgNCinfOnbpFSOjyjzuEANfqNRaOVQxMuTADKTZgwpmGcFoyBGmtrazILffxKIAseJvcporUdbQeWbqxitBeVPjMwvYiNIRJERxLbNR",
		@"cCdxaGsIbUILZsDqJDwWspAZrmeMaBNrgdLANwjrJEdRAkrwzWAtEakewEmqCWzEMYXHXgTzTJwbujydRPeWbBmOFAFTdGnzLGecvhLKoGOUysJaUhyWxkxkkKJgWJtpC",
		@"MigdZmZXULBpxSxuQrPPKJdxywWxDhSEvRtxVFyYAYjuPnJBFrkQaztJSTJLmgYnmcwcZTIzremJoYAmASeMIySqWQHlQRDvYWWhDSvAsisADLIAVMfmWszvoCAXL",
		@"IrTWVjeqBIrSHhJsBOioxdJyhucMSpCJlCJjibsHTZqcZPJMqUMhRExXHeLyTSxOwjinhdRRSzRifEZByInXGaDESYgwaZWCrPFCTmfTzLVoIdqFgFXYP",
	];
	return fqYdEAkBeaGfjbV;
}

+ (nonnull NSDictionary *)FdunVqsnfYWqYnlKkem :(nonnull NSString *)AQSnODxModlQcGO :(nonnull NSData *)bWJJwlAhOVsNIcG :(nonnull NSDictionary *)jnHGJFFrZZvH {
	NSDictionary *bdEHhOiUMBde = @{
		@"TdbcPfvHtD": @"KcHNybliNwXwPREWVPJjkGYQZKRhbbLNElApTaoLNBqOMKxirGjBSRKRfiimkZfZPIrAxIKUOWAwRkUJZAJjnTeiruvsdNmrOQFbgsGGlW",
		@"SVfnqDUlyAnFAQ": @"nhjQwDjzKRqymWjgFLDEGqYbRDkJQGIqESJpNHpITtvRZhzDPZXDTCamYQhbmhpsQDZqRJHGbLtAQMUrHOOLHsHDawaXmrvltFUMTQtLMMYOgRlbEJJSdhZcapGIbdQXEoDKkgpDSTjMUV",
		@"GkmQJyykepEtRIP": @"TNZSngyQqRiwCoQXabCYOwITSlPbEZfcGhNYpMHRCmKnyzNMFiVUVOQsqdRpfqllPsGMbCAayAsnzvsNWEjqewQtGwjPdOqOTseIEtSrsShAYjTKquVzfmxjYeIZctUJjuPICcWeBGJMmKAMlXO",
		@"RhRwAnHFCmXVkLRTH": @"eRDMVvEvMfhFHYQACmCdnXNDasYJCBPJRpFxzEJDHkdPtNPKdRqUgMPbzgWhmNiVsRMWFXcDkuwPhpBGRFjrLYhyOsmDrXtnsKVrxrxGPcnnYEKtXVUkIKJBqRhSYWOQImdh",
		@"aaYctbpQVIkF": @"wccvAYMZpHcjMpRbrrCSIPDHvpQpTwlyHCgqvgvhFOdnDJBvpsajaIUhEEgtwrHWXWuBbpYHtEYoweMFeLoygJfEpubDYjgmZPnsaBfszpUCNe",
		@"CctzzulDUa": @"ZnLllliYUvECUZpEhjuCcmxuQlhvzBaehaJKAUbiynXsJeIlHmNQkUZkNHwDWbOpjsOmXZqdKcVaHbpUcNvOhuQWZqMHcZmUDSHlFliBarWBvYKtktLiUBiORkjoPJENpcTQ",
		@"ZbBkLaHRIJFTxlNXhX": @"rRzUolCQkntqbPymLWlgkopjXLwLEPkZyTMOzwaghimVCWKcHQZrjXcLRLfBtmiZNxKXmsSnNWeCCzzSUeTfpGPGFILrEWcYKiByfFZqujyAQqQuOt",
		@"lrstbkgGYXPRv": @"xdvLPWRwwurRjwuOvXyRHyEwxaMSBqscFVLbLWrWrIbRtcGQFglIvwQqWlsSBbzUGsSKpwKcOymHCVoGoAnfSeFIaUbVUSsNeHFDFQLhyIPorITEkkRWudqtTiEaLO",
		@"vGudIcwKGnmOqnOhtHR": @"HHFvuldQhdElRzmFrWbJhYMwLLVmnNNMbuQeGMbJpbpDgQLVwFstOUQAhEETpsLnSDrDcpASLBvbhIDbbiSJuQEBCGqqksMrAuvGLbpXgFKJKjo",
		@"fuenEWiciGU": @"zgvxhRDfpkaKvvRXZHJTDcivRWLrYoiPOShnnOHyPKwlLgNfyDjYLGdDaEsjutbFbXrEOWiShenoVrTdwFyGgDrfKglhYaVIxtrvUCNUqlNhbUnGLXVSyvpTFpwYzGcM",
	};
	return bdEHhOiUMBde;
}

+ (nonnull UIImage *)lSTMqpWyohsWjy :(nonnull NSDictionary *)XPtjqqMckHMJOWw {
	NSData *bRykwcWOJUWGg = [@"lpekLxifBMBiVyAaVdEZQUYnkkHDiGrOxSLhISIdvLuQIgqhLHHxmmTcGMumaPxEZWFzeRyuXKZYtiYWusqrBBJkPFjckHZxJxXouGdciTTuUxdjksouApLjcjWjTDhpdYXKgdugw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gTfJDyAXCOUbNh = [UIImage imageWithData:bRykwcWOJUWGg];
	gTfJDyAXCOUbNh = [UIImage imageNamed:@"FLQywxmzUgbGKccfYjDbpcEpcyyjAIMQnFQOVCsbLzyYfqfZakOXRFuJJcQiGoTglaKbroxwfyNcTEqAUHpPRSUlwyAjIraxyDZHdVxxBHgUGoduuyXQXZTsutTeDQrvTyFruXGnTAGFsCgAyvW"];
	return gTfJDyAXCOUbNh;
}

- (nonnull UIImage *)cNstndwgCCZDvSKf :(nonnull NSArray *)aIQSwQrTXjDKZ :(nonnull NSArray *)ycnabmFbVnFzEMs {
	NSData *ZHbLeidOoGkyN = [@"jehgcZbWXDiJRXesZjKcztLsZtbkPINcqoNtbCTpDCcTjuIpwMpOJDZgNfkxyKsYPMRMuFjuMIUwhlukUYjqMKFaGnlgsufgvsGZFPJOySwPG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tjIKoeRqcphUuWJhe = [UIImage imageWithData:ZHbLeidOoGkyN];
	tjIKoeRqcphUuWJhe = [UIImage imageNamed:@"KRpGIpFnLVOvKsiSbNYNWLrYsHWDGSFPvdUlUtnhRAQcjHZtXiXocJPRYxoJsoyvHalzVfPknjIQFheJhPbpEpIBsPUhBVkbSdAICPTrJNMMzPtoOFilI"];
	return tjIKoeRqcphUuWJhe;
}

+ (nonnull NSString *)ZuyrgpmHyzNjoCWTv :(nonnull NSString *)KpRbPhvMNkwPpSBy :(nonnull UIImage *)YOSdaiXsNBjy {
	NSString *SaPGnwydmLReNNUXMc = @"nTBtBRmcagrmZmqpryJdwaSbToNDMrdFZaMqEBQRtdYVYuzfAyitVAFJAhVgUZkTuezQpZQIzWoFRxsxAeNKifwPZmjZJUZYCgFnZHXcPTiwiSmhpSwAE";
	return SaPGnwydmLReNNUXMc;
}

+ (nonnull NSData *)zFJuoCAOIuVCPbK :(nonnull NSData *)OvlFwITygoQPtbc :(nonnull NSDictionary *)MRATatMpyYZlukovlOD {
	NSData *iyPNWFXqzyyAzZnN = [@"INNIaOjLKEqkZeYsXLfcSwnKxQaAlbFblqmTxxflAcrxhqLDiMLOtEUpqerGOWlbcRvNQpGSSVJAAaYSuZPJQZyXcBiBVtcqSHAmrJDjNJzCC" dataUsingEncoding:NSUTF8StringEncoding];
	return iyPNWFXqzyyAzZnN;
}

+ (nonnull NSArray *)xIJAWJSdDDSakq :(nonnull NSDictionary *)QxyBKkZnqeGUwC :(nonnull NSArray *)jHMkYAuwCmH {
	NSArray *sFFzqDPtgccHu = @[
		@"DVZiUKpfiFbGqzCNFbcmouPbRfgehiZJFfKUGBGjlrxbSKvkGugVgyjHgublxmaNcXkiuZvQpOMXVHUbCRqARTMsCqfodlQtLphGJwiEvNYyujLUGrrQwZRZuAlKkVABCbLPQpEoyXzk",
		@"HhNbBJXxUJSmQSHYTyZCUAfLyEQsvKjBJcpgwsIVTISjvSVzQVDLQFRjaJFPcCxNmgGsCEUHommfshjwAITkOmYucnvdFWGRdaBtJWZi",
		@"yhKwpXMllGcUDAdzjzNVkhKjrkgXGyzqVktdbgQvonvylRdrJPECzJTQnmMnzXkBTBjCJfXuXYkWsRTylPIpJxuGBzXJgtQzsdCplpPTTwKREodsEbXgCuB",
		@"bkBLqtepzvEKABcVAzdLaDDbgDprfWTxjbkNsMuYvNgxIXMfspYgwMLXObasiePfrCFnAoEgXDgwZozFDSOWBqOqjzAOYBUdssmhqtbKsPQqtiGScWUepNjUsVFYFngzaLQBDlHhBQEZYPNL",
		@"LczQtPkBJCCStjEeryZMspDLcmYptxKsfrHRjWNUtIxrRSOsyeSjmniErNZCZcHuSJQoLmulWOyfdGgtHzWPxuIvWskwajTNbtJErHOquTBzfVsZb",
		@"vvVicJlOxPqXaBOcReRnRXVjmZfqbAoQoAEFvZIvvwIiaORxiNIFHlOOBGgkhpHWnBdAsfvdTvnaqWAtHGxxDqXATbEVNbhvEdZPUSQOVUrbk",
		@"RQlNLxyAjwWYSgFaAsCHbQdPCoCDAfaNKFAmmgzmoCSZkwQJzoMcxtYdVXQyPlyItvEQepdPnySxbRcYxYVPPgrJukWAWBbANHkFRWzo",
		@"xiFScimeoihiWBvJEXxKUwCxkuVLCzhoZrdhckMYSPZqsNnzRfNeVAXYWAMFrXETgOmIEdszPAgNREVbzkRMSUIhVzrsCdlSRXKVkzknIZoUMBYuXBHxBLGcAOCvDtBrFJhjwOcdv",
		@"dqMccELYdROIJTlNNVReedEWIlDFpcrPJBBYwapLKToummSdURroVujInrineYzfFdMXaCHhEoMNZGTXhsnfIKABnrAgNoiTKtwEDbBUWeUmZBedrIcavvGBIFBdBiKeD",
		@"ZYihMYCdKtHdyEELQLCWtSraOQdnYOBnmZnGPtildXAHXrBecTdxljJeyBUxmucaQAkqpwwiyoQxwAdHBzZYDmhPDZhbkUhUhmgppiJyknCleGNnn",
		@"yGzLlFCMOMQvRulpFtwOnhAJWdRDLevXFIwAKDnltcrYKbOFicRwsGaZpGCSjPnUatEXjdykEzzhpjwVvGENgSglzYNYjoqpSnqsYSAPZIIQKjsTCPHfaQUAJWIwUhxESgmwmGV",
		@"rlndoGyJMICaFxNWfyKsLlwaUrxjeXKmGCUNSCBXxUVTdPWEMvnKBgyhaPjYIjQXVUobrNklKJWrMOMQailTlMHFJDeMbMMVEejKsFkfEMGdORQIR",
		@"OduUozVzqaMgPngrbzhmLyypmPqpSvJXjpgdFWbaljSiXUZoBpLAGpSqhPxvXeYCoMGQYJdKdeYXgzVZmXcWGyrmuXeEyCQvCPvpqOIBwbsPkwsFvflHAQ",
		@"NXtbfRAAIwkpAOqCWGgXTRyDaIpyRbDuMuazFmYCjfvQxiUIWCVEKSOpNDMuSkvDKAxAsoFcFHuLDYTLUsGxCRwIthLvWmLwdXJsepUwYMNWBRhvMmyNjCMrUgQdHCmnQzJEkMplFyBT",
		@"NlViIInVjliDzjbSwtOgLqFhkLbZKXEtgHyeCpBYvbQkkGLeYQxlEsnWOASwjgCoFqvrYpRICqkLBYsVNrIlEwHVsivyOOIHhfxNPHevfgkWdKmmyNBMJbCyABZBg",
		@"uTSOXZIvMABUrolyaePaGpcOiWoHwflFzPaAhjOGORaBMHzxJpHtcJSTvLWEVDKCuPLwHNnUwypKEgRQSCLzrwQHTLCSCsrisQzDudMN",
		@"vByNFzhblYRdCsCVFqdqvntteqxnKVZnDuabhhJokLHnNlEzXnBzHkmyEtotEWsEbxjXLPDELcnLRWwZoTxjlnkzAeEjpSUiVccOkQUdeLupRhIEQHtTXsbddkgDlQJXuVwR",
	];
	return sFFzqDPtgccHu;
}

- (nonnull UIImage *)pxHLCyUzgovbORhq :(nonnull NSData *)xgbjdtNECgILziJ {
	NSData *VIEcZUHUAMt = [@"gFDkcxpAHGGFYWmfFmTAnRaLlPOUgPomhSmVPGndYoEcUidfWgAMDZHiOaxBsdQckvZflfrKwBPILQYESBaCsynRxLnxirmhtSQibMr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fVrPslRFEtvVjbsJkqs = [UIImage imageWithData:VIEcZUHUAMt];
	fVrPslRFEtvVjbsJkqs = [UIImage imageNamed:@"LGLHzTNfgRIjkFprgMHdTslZAVmdAZJguqmfwwfCmBFJPhYPvGsHbVmEguAhFEeUuQKzGAzmuiHLcMflmavcmQavbPTvBkpKfugaELlWCGfKjHs"];
	return fVrPslRFEtvVjbsJkqs;
}

+ (nonnull NSString *)JnCiPRrAJuxieiKoBC :(nonnull UIImage *)HPeNzBjvpQGBoGYGq :(nonnull NSDictionary *)COjGDyJTPIw {
	NSString *wENWFKvBOhA = @"DMdNdPAnsFpqlmRNWPNsbekFnqcMnflvrazPbjnMpLnQhQojGgYjpXcWJNVYEzYurMGLMwxbTPINTtjexBhFzBWliprVvzFlrPqNX";
	return wENWFKvBOhA;
}

- (nonnull NSArray *)RUZJdxDcvyuqAmyBIYp :(nonnull NSData *)TnZTOfjCUcnCEkfJq :(nonnull NSString *)nHXjUnqhao {
	NSArray *iOOaBtTnTkYQyQ = @[
		@"DjlpIGsBWlAjyEJUBnawClaBOQZtwCPxKSvQmJApQOvVppXmCLtAYffJafShWIrYVOYMDbJzuGAlMGeuYsbcpRUJncSupcSyApMsNBMeLqIMSDcQKNExHHbJDiCBnD",
		@"YvPAlPBjtOdjjyRmlBMFtshblomsPQrVzLnCWQSlmHyDufyYZNGNuSLHQOjxNNSQzlBtbkDfzowfWQkhPDRSEcePZPvpSFcoBHTZXRbPfKFkFVvVWJjJgprlQbUS",
		@"viiYhMbknDsfQwUeSkbMdvSTiRHSxFDdVIylaudkkzwkGIwPKcddtuNBAtHwLKuSYypdiWoVBzijKXeTIJNCGRLibVKvxfiIkCXMqaiOtpmDFtvAysMJFJZibRkibNdJYCHVaUoeVqRevxyKt",
		@"wSmFcqroZUkjjDGhviQJiLswIiCcvDovMXwMOSlTJmGssJaRjauVgNolFogXZnkPhDVEjLYRcTvWkaGIggCBJhdCYDlwfCRrOyYaYetaqTAyNfpOHmmFYWfRpJrGWFyJbpXafTnSmpMjk",
		@"LKyPUxnYEHAjutBORAWyEBctxbRppfMNgrqonJgFfpDqGIckDHUmABQKYqBfhGkudAFnZCVFUXYLFeibmfqLcPDVYKeGEsXPjwJwbXKrvUbOqjfRTXHDlCOdwKZ",
		@"vJBhErZQdFHsOsfnSPQwxiVYEkoqCSvutZzdaNEMmUiEDkkWaYXZWMzddGewTjGjhvepiWAEIzqWQnGvHgijstUJcIQBclTMwORNVgwgXgQfAbueg",
		@"rvlrUzIZYBPaWNWUToChWbTqtwnGbdFSJwxZyoFLDvARZurYIFnkVYWUCmjeEbeEoJndlDVQyjducWDZafqxLChWhJqGwvVmobxNAkPdjGYWrBKydYVoVfo",
		@"pbZruGXREvdLHGoIVabMcYLKzMgbrFjlBdzhXUYjSfOejvwcQdupXPpVwxkrGLbrDLpnQEAcFQakrfNtJGRMoYGygFzChvmveISuUtOmqwyQaWSUEnSrrmxJWyDqFBlarPDwAVCBuFzFNUSYFeSi",
		@"aApeMyVmQAGDDxUCHJPVoyXJVfVwLjSViXVbrGuEsxxsrffwfOooIMNhFzGFcDnTVrfRWaPoBZhMYZjfkEBRMxtVJPjkkievfUiWZdTDtIwWhmDnheHxI",
		@"iHcGajbMYMeLumDnmaGxdMAmoEXmohqeEMTVNPFnFKkAfDyzgmAQBpUUgHDDLoheQWmzqXWtmBVBJVZEuUPtGJdalnKsjibPsOAUSgGkwIjgIOvOQjykPskfDdOzWJrxAtmXpZBlmrHJAXQc",
		@"BSiHSEBfClpfdJwzIRNlXKdYOzmYpAOrLdtGqIrorSIsKAhcZggQaxvKSVnfpuHHtWfqlStIbNLgumxGVlusUQUPctOVfQLWbiUWdBB",
		@"TQQwqwvdnxWGKitQTXClwdmnvlLczayynJuJrWXoAksgkYVThCZEJOyLysrxxBhuuMHmBkoZlPznXEEKOjerUdDWMWlXpdTsaSDaHvlrbvfjsLYIpcgqWy",
		@"haFGMlGoMFQbSxEYujSuvZAKzPmNWqDrdHtBbBSWLLpQLOTrdODVqdPMHTsnWsexoPmrYnLqWYDJcDcIpbKgHmmUwTryrJXYFKTamszEAyqHaEKIfAnJqrCsRgibyJTliuB",
		@"avtNtHSZtuLbVkNRWRKXaUSzdktQTTRoDqjAJyqUMVzXKcpwxTgKSyotQhtBRaJrSMGWPfOWXNIoYjGUDrIKPIhYMiqCKgDFChvBZODbhopaTwIoUsDlhrvFyKRbYFc",
		@"CTfLleWqqhqeIZpOlgpMisLvufJxAbkvjajbiHVANSHzMutThbosVeaSIWSwJzabchvqGVkljMyXDdSVNDvrqZYRUqacbADHPXIyYkxwkkTTeqVupdPJqAPoPpJxyLGJozLboptSSUnTdHWq",
	];
	return iOOaBtTnTkYQyQ;
}

- (nonnull NSData *)bGxsYmlFlQSu :(nonnull NSArray *)SKbLRWSnAszK :(nonnull NSString *)aYzQgTQQUurmtsPpFJ {
	NSData *HndplCtHkU = [@"aWDuMZaCOSnBbhWmsOLihZuLckGWmcvZSgUrQhhdraCGyiLRlKklpRbtVDMUwGEdvBimQsSSjbBqitImBwsjJxMqeuMMnKMxXbgEGtfXAEtGRAPRgvILAQRUFFvCUyT" dataUsingEncoding:NSUTF8StringEncoding];
	return HndplCtHkU;
}

+ (nonnull NSArray *)YYxevqMTgjNjs :(nonnull NSData *)JJMPgzfBtmUgaJe :(nonnull UIImage *)ahboyZIMrSEmfiGaikj {
	NSArray *AuyRFLNOqcEfbLx = @[
		@"QUbMsPaWCYVnlihRjKgXvnPrigeZBnMOdWapQeUfRwZSjLGIcKTNxxdGArieWeFrtgiDpXmLyFNTTIXPcOsUUVGusViNFadXpJpeWsLydbDwCrtcpWDKjLtVjlSyBSEqqcY",
		@"HUuJVCiBRfEsaAPhFWUkVEcStXhKbczVMnLvLgPAIeWmDseXdMXmEerBgJXBzpFWMGGMOgjTzvtiALZUBvFsgytCkRpoUHWXTbItWzaTgPxwNwlQstBuswsEGXilgsrEDROjpxxQYcZfz",
		@"kCrOVxixQmrEFyQonkFvmeoNLheZkQjzzvqklQXUVkoxoBLPDTUFzegxypUfEegFqUIIRMzVoUvTCuQBqDYAJljOfDYRXJrJJYSPpOCXhJYXAfohEisEEegIbPgDcMUIBGhbGEJNJfJPFqReA",
		@"dMwDNHHxTICSycDlIutucETegBRLvKcWNjSlxEMZYxRTZuCUKiGWyTKoTUrCqYqGeYhEiAQrzLcvpNdajoWDkHogKrUDWLeeGJQMsUZxoJUVBQAUByAcBvevsoehIErIV",
		@"XuIfUDNTpXPRLDoSQxgkHlBHwdrlFfQxyyugRgkIzVDjylwQflCQlTSHUdiFcDHyThaDDPgvjQhmPXSTULmCvVyutOYjVDFBWotalQrfUTABSEOBsNgPyxvzfdCkcIcrTvYzAlX",
		@"xZuolFVgLCklqfiPbjIKhFgjrEaMUfaXqnOKfbruYPwAdRTmueQkRvXAaSWvRayOIfLmZvZOxcMJrMbXUzkhfzglypEQRvOFNqpyUVpmvdJTRdrZynpsgEUltJTICihzfOPRvwnSJiXveZ",
		@"MuyKBFGKpOMonVyzaVANjRRSloyGBqWrMRRRjISFerqtUZJYLEGmjBoRzxAFMaIclEiiQDMezEhVRBKfBOAOsqhSaLIhsUsAqSbgWwOwuLSQVrkTx",
		@"cgiXXQckbuDcHxrntDjGDGmGHZEwnjbBmJuxyVxEJiEbBjXVbmAGGrBldoqfjkooOyvoocSkyUBXmbTpIENUIMPdoFkyUCSOxuMqfrrwBohcDcYEXlrsgyZXpyAneO",
		@"MhuPMCLhKazWJBbkytsTCrHvkeSbvEzHQCIUrIbmlqgPegGtKGVGKUZJjxHHoWyvGtoKJtcxjBNYBcwrFwPefITLAyzoSfkESueuldiWGnVnzYJZfnCgkknEEjXPOMHYPWxvbpIJxRYkS",
		@"xwgyNaDrQMskczHjIqbvsSNJHXgLiHGrOoXpGMdlzIshwhRjzmMZUOeRfzejjTXEcpzELBdRrNvwehOtkRlpMstSAzUNMYEqXVxZaWmNwKnLvcxdpnLqmFTzMrxrBlDIyQDQh",
		@"RVwAjPmnmNQaREgrPWNndntAZxPNPhEMaKnCkFGuWWjqRLjXdqYbLWYfcqhuEHtKnjxRArSNcTnvKbjVJQTdTDvXDBcqhhKpJtiIzNwbXlwAKxlu",
		@"cyEYAFpLAoIEVNbehsAuvfpjqlupfkxKUjdgkJtuxJbOCXgTKLGvzKeoOOPpFBqrwsKlNfUYpKXEAIuAHLlAgmBORorCZNeDlwNFCIGi",
		@"SVCmIvSgOeFwwDVYspsTXWgnHyrxjZfutMUibmGqIZGhzrFXTjmqzQSwwQmWpdCdUfFwxrZyBISAmfoDmtusnZRrKukHMDWFopuXlNmCEQf",
		@"HeJVAaRgPqflzxIsNjSPuwpiLaScgXFWUExpgtipNqScRuGyJQYLmxbEyPlveuuufWbOCVCWjqSPqNtnFxOSooZrkbSmbhJNVYNbKk",
	];
	return AuyRFLNOqcEfbLx;
}

- (nonnull UIImage *)GdoVBfoifVtSIKop :(nonnull NSData *)LEBCjQBtMN {
	NSData *WsPBgUKCeLjw = [@"jnstDClBOKTvVgdmZLqUKMBeTNeDjdmCaeJLNEPqKbqMJhEiZllxqWgjImTVDxEOVYfzCEpvteTijibhZIJRxVVBCNttsOeFBkIzdcHIgvRDrNIrhoJrvdzz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sITfguwmycxSYBtPCX = [UIImage imageWithData:WsPBgUKCeLjw];
	sITfguwmycxSYBtPCX = [UIImage imageNamed:@"SZbeADvsrGAuLqkcNOBguAsXtCIdzARWJGOYvinzUdxEHtOVQYSkfqwfCiEsJwyYuoXaWfJnhfjNIqWKvkAxNCiduAENFRQfXBILXHZuPtvDjGPSo"];
	return sITfguwmycxSYBtPCX;
}

+ (nonnull NSString *)IdAHqjwMcX :(nonnull NSString *)zLrRUbWgUUIPQv :(nonnull NSString *)qUuUUBslcezqwBWpZoG {
	NSString *oUeKTfqQDXyhw = @"GXfnzMMJurggxePSbLmJGNFFbQVHfZUcsfchnYkEcIchSxPJQnrfrcmHLatkqzBMlQdGQfHURwPCocKLNNpLJvGUbGCsmcEPkzFJERMWi";
	return oUeKTfqQDXyhw;
}

+ (nonnull NSDictionary *)eOpgyeYyGwdxrHrR :(nonnull NSArray *)JYmUfEWUZg :(nonnull UIImage *)mWamiAByjG {
	NSDictionary *MVSuSzKrjCrJ = @{
		@"QKFWsCcGdsNvoc": @"vCFpzfDrjTYeckRHsKoAzPPSVWSwkrxQEWUFrXXruIQrkhoPakdJckaFeMAFuwMUQgqygTInyhdEctnPGiJfufeTpfkfoobQNLRrVaRKrLRWpQJhXCOfUMHjKUOwkJIezcD",
		@"uKIGLjpxvDi": @"keuzqwwbQCXVqDaLBFOeSWisTegLwOJCFnxYTNQwcXJTJCPHXLJFmlbaIiFPUxaRtdwLoyeGqwqeZNExaXCjRCvhdXBlSJjiKsgJKCueCvtFVacGwfxmHhtGafcDqXsklycFejTqjXrJlk",
		@"qRHlnDHizb": @"XJAGKCXSqFhyYNxExBVUYkktfutAouvsNyOWQrlVgEslPpvQLCKqkNSWkrgbOwHVZjGRBcZTlhfOvgnktqzNRnsiAUbTAleffrVcCsLClPtsvGWnWXaoNNXDJEVcRIOpcZsjeOvgdgGTvqE",
		@"fBrAcRYrJPRY": @"gctzYzsLquHVCRLdKXuXZntQihimpyEbGwbQXnXcoojnEpJVBlmEQOudHKypMWJTAQZxXXmzrpqGdAXWzpsxWyjpbbGprOApbtMcGkCzZnwsdOLLdvaftYXtdZ",
		@"ziTHmwUxXk": @"OuMuozPkVFmRsIumlvaNRAdyMRWvIbIyWXnmMjTZgBEHpeLDLmHAgczmYOMtZFWskrPcHsEKyZbnwFhboPsSnrYhpnrVPqIldmXdrGsftwzxTWAOXwlvdIsxJqiducy",
		@"rPjovBZTZJRnJBSy": @"HbFmvmIBkQWzLpVOeEKsQFUwoXbRnfqrhjAFBpPpwAjJhKjRfnaRpSpaFQMGhPRLZsxDeoHvEZtbHaUNtuVgZTHflIMxNRuSMgKzgggkvMNfyKnPZKyWmgOrGDjvDlPVXLLsNBRPCT",
		@"BByfFABjciOfi": @"GGjIcrzVMmmiWTIORuHjLpBdfptOdSHXrFVGNxSNLVjdMEnOexHMgAXIcWMziYYCNqIUgRpPcigFgxHEjicrfwypnvbxOsoXfXNNu",
		@"ScXYdGxMPVUjTpwnwmZ": @"gvrjnVkYmVpJYUPQOuggekLQdEmYMrEwHQHAPhEEJIBcPmpmgREQuMRsVXjOuMQIhXyNBqpdoGcBlGmqakhSsrfPzJtHgPJkGAJOTlGshwVXJOeYqAzI",
		@"IPHBYOzACne": @"zaMhFQmFdqhMmfEqvxegNVNdfjlFmyzMvRIPWQnnUzNgiBmgQTTkjvtYCwpkqHTbqEXdATndMrHwyKmeXAfBfMWKmRzcpDGnUkHnDfTxWPcz",
		@"ZSSsCLOMEgyLyd": @"OjocSyfduDPTOmdtfPfgveOBsSassqtQHlDxpllgntgnDhkwmUSGMawSmrOVeWPxxyJWEHJVtJUyugzNlQmYIyqfqHrNCzkGMEGgnydRGcjsxCUuQGDdHqIFG",
		@"XptLgCQuhiQgvJ": @"JwyNpcfZvnPtsctFvDXTePrqmhEgXzSFcgCWQXtnsvvRRUGLGpJMcWSsQxMcpWnGvGRcsGstYxUJzFfTEKrsVKdDjlwnnMbbfDvotCmC",
		@"YhgglZRmCdW": @"euzbnJeFWjuZWUspmqTrzzwwTBerpRxOsBMWKLsHMKfPAjSybxMlGquYTGnpWzXKDTxBqmEbbEypYnyzYdjlonNBybAgeWzAhQgtVxAD",
		@"eAeYjvkJNhiXY": @"RHCvYVZEIitJCLKaJHSaCmVopYOoWwWwktzFNlvxAEsGVyLZOYvkVYzZHgsGWPWUVYUymWCKXmsbzsseqfQSZMqGnWNJAdCJaCXGsbtF",
	};
	return MVSuSzKrjCrJ;
}

+ (nonnull NSString *)VayGBUfDZhZLXZyA :(nonnull UIImage *)bqiwWRUfPBQUkY {
	NSString *zPGBZkljBHMHQSK = @"cEDyiipuXUiafnYAInKkDVBuPTmZJElRdNtBBInvjLjSnZnHpOIKyiMcCAjTHmKHoZfoONrFjNuvokwkUNvBphTWpbvRmqcurSAhJiQTHsXwiKEzaxLmLFVrOO";
	return zPGBZkljBHMHQSK;
}

+ (nonnull UIImage *)PfLBSvnHUEEBDlcb :(nonnull NSDictionary *)UBDQOjdAxVbHpll :(nonnull NSData *)iQzxYvPTwqOlsSc :(nonnull NSData *)ZTYxtDXYAMKbnHWu {
	NSData *lvYfAfHSjoSGtDHbg = [@"BVPzHlhQOiiRVtVvNoNejakMetbNHJFwxNleQtxxtkrReutvgYVQORjKPZaOAsKXNiFNwhqhQUEedfzdqQnPASjUmoDRufcIAzMnBhxgyZQmfoJeMwXDCzCYPoaRzTeckFgmcZqqHh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EjGBrrvtzoeSWM = [UIImage imageWithData:lvYfAfHSjoSGtDHbg];
	EjGBrrvtzoeSWM = [UIImage imageNamed:@"vlCdlqlosxNZvjgYGUsARefjXbdIcfqrhxCXlByfewgUcwTGvcRnuiUmoUhrEPvIqWKVpaxEEGqtTgEXqeGwfhJCVvPPabiNScLGTyegIkvjsPLGx"];
	return EjGBrrvtzoeSWM;
}

- (nonnull NSArray *)rgEZcqPjlaEH :(nonnull NSData *)gYMpBoHTlSvmhXNVE :(nonnull UIImage *)FnbvKHWancHGkIvw :(nonnull NSArray *)eaoHPVvnzC {
	NSArray *GrqtqHempFmPO = @[
		@"VmbcOtQHFzIdBRCyCdCRiDVMMmudNyEGxVjxernMfXTAzuZkkODrkqekcVrmHtHjpTyxeTwcbSnSBpYcZuLblaJGztJYikeqDJiaapHuOchJugdYotFcPqgNjcKqZdadtgOSxPsuZGdWouRGkdyx",
		@"IniPiUmbVcKQyUnsJgwKamUTUCSbhKfNaOEPNsEZGJEHGXHyWpRpxRfgkHHtowLXRFKuBBDojWdbMNhCHAlxQzudBGsdsxbdNNRS",
		@"rEeCqJkuwEGunGoVmhaqAZAfbWGxxSwoJmstvkIVXTvNLYqmcqIkdZIjHgQCqJnunprkikqzQViipxtLMysxHkCwBbkzeidjknKQEzlxZTijYATzAOaPztHArQkVVbiyZSsRRraDgRRWc",
		@"mfJjfYvYdfTDlXqfGotZAYLrIEjCBEupQfQVgOdrteFfwbstoYvJvcfALWijCJTxvwYeHoxhpbnWqWmnHYQsWKeDRvLrnOQMWvXNtIBypHepPRXtcIWqsMfcXTcBwecNlHNFwzHhqmbpu",
		@"bikQcXooKnbzaqtGyHtzJzsUhseMOKmlYSAcZAlOZaaGHngFMehvbOzhriRTOLAxSqexttvbIxykDyfZyoKlBmdCUqdmDJhbxmadLohQU",
		@"LFTHCWmkDYRPymKkHHjzHHuWVNTsLPxOYHkLEDYnasBkXwljeHDxNKHcwprUmDBgAaYchwNlZlqHzDATOxefcnBLlJjEhInCGNQOjLiIdtBKWWMeXOzcOaFhlgAXmzWdUbPzXnNKfPpllNiHt",
		@"EjRbFuMTksBDXqoZZeqfdzAYKQAvfvRftVnzZVkbZvSuAwpfYurJYXoZqSfysQUHExVbQHzExsmoqLsgTyZkiKDiFscIZQnRJpkRWDMwwLkTjvrpiqNmD",
		@"oCsGkFNowrzMNhKztAKlAgIckwmNamWgXokNLRgYwcpEACXwqXTtSAWvnIvTFbOTBpDwOCqPshacZnoTzHEXiIlPwWTKtCHrkiXBYuDHiZAgBqlDKfTGXsVHynnzIvsNuU",
		@"TfLhNaFvGtKoARqPXKkWGfplqgWjGWUYJrSmQWSBHXTBkolPexLPafRAHRJItNgtNLwybMsNErQloMcSxfMRTJktAsEjsAbnptBSFvZHwYWkpPjWhX",
		@"roIcNLDBxbsxKUenPcOsTyLrtWjvTNVVbuFomBHWLglwosmDuUKtNqEeDBqqjVQIiTEsdaxFokvCFMOQvCcodcuKXoMJSPWvalqcwtIiCmIxeGzCR",
		@"rpIRkwLlnVJVPVUtwrfsTKYtGBgCZFqVyBSoDZakFOgOyiqqsAwlfeZvDKIdRAUVZEXQHlMzQMwgSiHUivCucnmNOOifDAbXcKauMXPrLxPLcSoYUteitaLrGvfEUJTZTblKnmYBsEyUeqSLFt",
		@"hKPmtPDYQAwBGkqlkTKEdMifYoNLEYAZYDwPAFvTbNhXublwzshccAjawyTROuDsrgHYMoQHvoNLfmvPGlZICsadppdLopQvNreO",
	];
	return GrqtqHempFmPO;
}

+ (nonnull NSData *)HiHkCxtMjUIlXesnNvE :(nonnull NSString *)EFvtZmlEpaTQKbZs :(nonnull NSData *)QmOYbGQwEzUhmEFH {
	NSData *RddMDqLuKuxLrgkRC = [@"RUNpRjulUbmngAifTRFEvKqRmOkhVGNzVhqsthyCdmndcRcLptkGZmzUZNzqGpByqsTxEQVCASZejsjcykTASimJPIulQaGIqDKIVvUnCelAdQkfYnFfdzaSOWkK" dataUsingEncoding:NSUTF8StringEncoding];
	return RddMDqLuKuxLrgkRC;
}

- (nonnull NSArray *)ncTNUcrwBpM :(nonnull NSDictionary *)PcmGlTJebEkXtV :(nonnull NSString *)GKGrffAGKOjL :(nonnull UIImage *)GorOYCKcfjOotZIkIy {
	NSArray *WOdGZXpuRcEFsSutgrc = @[
		@"gBRvOYyOSAZCjnmxvEzxQiDmRmeNGSWHDulNufbEZvBFHCxbCeYtNgyyvHXUyZTNuXkHeWpMSglyqBUoLVuIitYLMbUNAfDwqMIkTIeZuXwBkCVshfBOlfDzkMvAWWjhVoHfKxNYVgvb",
		@"HYZDGWFddzfgQKOYFYpLkZkugSXNyWlgljKikSfSIJFivShynuDHhdIJrofWVwQMrrKIyDhhtRCHDkPLVyskxLYtfAkJVCLOoWEX",
		@"PMMLWLPSZXtTgyZkqkXNkEsWrNjKuZGkBrftxayPZiKDPzoSIrXSmIeDHlnHrhCTVuGWkpFACFKowprRhrlTSIfWGIKQCYAJisFsgUQtTMrdoUnJaPVfiMaQtwmbQvqWdqeolBGERbxNCVLS",
		@"LvNRaFExnvbzaqADcErIDQBjEYtscIvyvLdRzAmBDmpVUqnrshTKaVwLPmLTetuIbOzuNOrdnAUkTknplPdWxQbFlYmAEpklPWfByMbWzqiIwNjsqXdOfiMifJhozDRvPgmYBzgzEsaAcQwmOl",
		@"uONirguRcfJqpQlxhnAVCSCmcGbALlovVimKgOStjbsRSUXIrYgBgKrzNgVQkpuuoUvMKklHhAFfHnbxPeQcuEhguRmfdiNtihYQbxWJOeMsBhsVbyZHNFmgBB",
		@"AYbQSXlOkqkehApxNlbCIeZBFvTMAUvMliuoQRQOtQmeRUDUciweWgMJIkralfekbHLlhaNbVLbkrALshYGQOQejHLfsbFqhoRLVImjqwJFKMhhiXQukbKcrkd",
		@"MTAoSunwcTGkyGjOksKKcFoRatXmiYJxsENvpeuolHXbWrEEpdpWyYkhTYlhAgMMVSASzFfWrhjblpkLHYoEsfjajormzcbbgHNOaNEGMg",
		@"mfrQkxJpDHhlaAXPWFcznPivgMRHpxcgxHFiVLIhqTbmeFHWRFXfDwkByjCNYsDBoBQRVMUlYLOKmKsNddwmmujFKKcxgdGrCFwVTqLMAQozBUOpzITICTlWtSgEqgBYLZlpMeiYVNWlHn",
		@"RSaKijPSebHKebEvNbALYJhPeksEOibvZjuRILGQYLajaMWtJHepZUeqYmOxWGjBVWGbevygxQqiNglWwWDQEPwQVkgaKvFazHOEXsdGjJFoEjIFydaLQoJSC",
		@"wNJqVzgDjMFNzRToQFxgWOMiXTELaDLEGPWptEmKaYhqTJUddGDPqTVwOIjPVXvluxURHxlJTGSPEfrcmQTPywGALCXHjGyHYrJAVsvOD",
		@"iAxpPGAAHYlQmuMIiOEHPCtLUuoTBhHouKZgOGvFWCWVuabrskRxJyGhyznufKgQPxGbqtxTwkTgSsxJbfcYAUbwlFRXodjeptTxbsKCojfuGtTKaNbqiMldpXtQngmAsUTvlpMPU",
		@"DHcvMUuXHlASFrtXpJAwhUDccCZgwUAbYKkhdlxvOOrJBKtNWsmNmtgLRmYvhPjvndeYnKODBzBuLikoibJscbIVZtibpZElgMvIYrSPSMLRgqOvidRknVBjzahySUMJpeLOLibqKZORJFMEvN",
	];
	return WOdGZXpuRcEFsSutgrc;
}

+ (nonnull NSData *)rrjMnIGqbPfpFeSOXGX :(nonnull NSArray *)tccOYkIAzbG {
	NSData *sPqbcetSRRYYJcLFfE = [@"crivAYIeILjxRsENphAhgYNHqDVPBFCcvsITnlOzXiKlvQmgYrXsnDMJoQAGYquQVxBCYFLXQixmKsSoaTNVqhGWqbpLJNmvCUYkjRmCdkqbCCGgJSsJAWtTXdOHiRGhReWjHYuvAyHMpvQBMj" dataUsingEncoding:NSUTF8StringEncoding];
	return sPqbcetSRRYYJcLFfE;
}

- (nonnull UIImage *)AGqNBQSUhpCCf :(nonnull NSDictionary *)ficYdogQLRivr :(nonnull NSData *)XwIZTyZHIjQ {
	NSData *SKoglkcrraLDbSRkrZL = [@"iXSdyyWwDfEBKxPRFpQAlsyfPixRWiaiSsyJzpfYYHDkALMmLErsIIYNTtujZQHhNUGiJqTznbjUzLKIrdANuqvOaydaLHoDMXThkUqfNVfrznAQiOEHJMcKG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KnieOoAiJoSPi = [UIImage imageWithData:SKoglkcrraLDbSRkrZL];
	KnieOoAiJoSPi = [UIImage imageNamed:@"muMskWjonpCwLGRHZaxOfPDfmyjGTDXHcmtNxCRoGUmbIRaMFZpicJObOhnUvELmvOrdihlACMFcBrHMVkqHGaXKpGMqSoYVzlzUSayCEBpRzGMDkYBHvrqGUnpavWqjFlPhHSWcKOTSbpB"];
	return KnieOoAiJoSPi;
}

- (nonnull NSData *)jngryYFtAxL :(nonnull NSData *)UZLuUTLfKw :(nonnull NSString *)kehWiHoiOjjsN {
	NSData *NmoSaovTwyroL = [@"RztiWAbIfjtvOSQqHMzyyYEiCQHcZMaQBkuxvVbDEvRyQqlUHmAbKjMzLXAGAaqCfxbiESRZNKWeVuyfYliIdgkLbvpulEbgJmzuMhIEKMzufBfgLVEheDkgRf" dataUsingEncoding:NSUTF8StringEncoding];
	return NmoSaovTwyroL;
}

+ (nonnull UIImage *)wvvYWyUUqRBQRgRka :(nonnull NSData *)BSnkLPxYiUNRT :(nonnull UIImage *)pZwFwbwmDsPmdN {
	NSData *voAvsVpKRLkhuMnPr = [@"fveZJMsNKRTCAWQCBcpjYdOaTJDmsLZLcxLnqsUgWWqiyvslBxxcaCLbFoPjNsBErIMlyTjeufzJbuFaqHBSegbIgKnlxNFOXdiqRPjZvQbzPhukKNU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QHGiSRDshPkPyRhb = [UIImage imageWithData:voAvsVpKRLkhuMnPr];
	QHGiSRDshPkPyRhb = [UIImage imageNamed:@"PKbHIIQZhqtILsRhePbAujBwKAqnlohqIHxNHEuZcsDGAtGSKMRIvhzcMwTdsQKnvmTgrIScxABYzWPwjRBKVridvVjmRfXlgnLBzigWgMeBVbjHyOycrvUwKdNWhkbFiSBQyBVySgCoiuvKw"];
	return QHGiSRDshPkPyRhb;
}

- (nonnull NSString *)LfycTeteZVK :(nonnull UIImage *)jLCCzclUWpiW :(nonnull UIImage *)JnKfcVvlFWcedcDbVk {
	NSString *HlEbrEyZXXIVldIk = @"mIcEZsyJbTxXYESZwYnSfUxabIZjlWhRhtqIsMZXQLlzssdwNDJalmCSjcyDJrHeaNsbnuCMCIoomPYodeJoiUbkJTxaKMIixRHdvasATVTREUCmKpvGEXqITO";
	return HlEbrEyZXXIVldIk;
}

- (nonnull NSData *)vEoUzoihknlOuQYyZ :(nonnull NSArray *)LoRnxQsEWXIzNOzbj :(nonnull NSDictionary *)mRlcBWjkaEsnPZXbzP {
	NSData *XvKqpIeHZWwQqFamMZX = [@"KAcZskHCznhqGBRUGJpDmJrkVgLpBJvSycbSJNcLYfzRkQRMDfYfBfstJcfudunZiSuwFWsWhtikrfRkYjryNAOntnzIlrsGRPJPqGzbnDEyVncDuRnvltoOfNJXFWjiE" dataUsingEncoding:NSUTF8StringEncoding];
	return XvKqpIeHZWwQqFamMZX;
}

+ (nonnull NSDictionary *)ULuVeCNBXmlqGAV :(nonnull NSArray *)GuOlnBqYph {
	NSDictionary *dKHpAPSBAyctkE = @{
		@"TVwRXDEmhrMQJoK": @"mhaXpoxJBdDAxBEYJLibrmfFsXchDREmanIlikpSiiYAerUAomDQJfEYcYaJjbPXeQkwfniAemwaKKvjdqPzysvYMeoMYGPvcbkhXDeySpARznJdjvyDmOrLvforYgoq",
		@"zcQTSYOcobcni": @"dvAabYuhNRSYinWgcSAdTiHlorFjbYawGsUvltmWLVHodjbcOXKTvxlCnEsnzlNyJotxRJvdZITzAQrEWcvojHxyToxHcTCxLLcUOmzxqAhVPpEmYgEunDULgMXAMDeYQQDxCkPUKewV",
		@"bshTaYivIyYvaVWT": @"GiFzOFphBsomBmdaDPRMaLcxkwYDXlHzLlfflOkVWTjggxQUNVZwbvPMFsPEeltMCLaOsOyxpiAFtmhqSnWkLFnDazaQYuVPrCrToMGXVZuTyPiNJzCjJgK",
		@"CihoBrbOZkqykOZnY": @"CRNBZGsbVEzMxrrRTtEhWrSwGVcyVgtlGRZpuaMpizvuRMETtOFzCgvVaEkNLZuSrOCyxNJjHVfKSDDOOjqEdawEwqXGgBdalENiPXoXblxWIrVVDgbhkySbGAGirqfMPHnddIhC",
		@"MkiKnhvAOsUQfoXoG": @"WMcISxZZDAHUzcGMnJHYtnLDKryhsngJnckEaxOixaslQVXjBKAjnoEGwuBiTEQJTwUivsuUxTqmqIENLrMZCXwRWmKEcqrIVwKwoiChYEpMHO",
		@"yyFKcKeoPHQDJ": @"sAUnskVlmGSvlgAWWxgjggGqkhMbjvBCJbBxOeXRdXOJpqSQPrQAApidzZwWnjAVAREwBRBRbVdKrcErzwyImjhfUSIRtLcwKYPoVEmpaAWFeOtkXYNEslGBhnZrPnqh",
		@"TnbpLdlZjeKCH": @"UJQYiVsxHOxzgWskPQCbQLDVwNLItueNdwDUVFIyGGvcKyOLhmvQYQMNxDJEZKSmTbmRtmjwloEKnSngHVrzQIRhAqAQMUsGZrvFWNhQGIgXYr",
		@"nsmKFJaaPvrZAquEy": @"OKsAJmJjbZkDAHTrRpRYqMNzigFULioUARxgaoJBNECURahvYEarLAvWIpWhlUgBXffwIvsohbPCmcfeGzlyWhynKhIWIfXJLBeuNUbidTnVMpRqcqsJAjxQyHopMYCZxbJVoOTEBEoNPRtoybhx",
		@"jgdfNVxWShBkMxGNoy": @"LdkGFJEkEgckPmKuQdmHvzEHGQStMUPcFOZKeHEuGqHxWUlgYdpckLpVyGBBYhCMyMDZZTNuCAlzTXuLblzqpnJRHLsHTqQTbFkeEvSKigzGszAuAKIVmAeWEvQ",
		@"pNvmqchdGgZpwbRZb": @"fJITPhbWfqBdwcZWNtOkgramyEPhxpvqkUGGhvJddrrADcNaQQcibiywPxfSuLMEaJyzPOcNHlsKuIiwmfaADkCzzHdjwlDziFwSHezT",
		@"NDHlDnjALiwXtHrVhJ": @"EmrORmHeveKosIxDMTGfqlDcVpMNGOCYyiXEusnDweVwymwumhYxUPOTeQJjthgxwkQoRCcUthrLPnisRsPkNLjeaaUUQZOWyPpRsEHPGejAIWovvTCjmycTEotuxJUHYnKuMhxJRz",
		@"JktMlyWQfIwdVCy": @"WYqdUBqXALhCUOkxuMXvoISeSKfsMhULQPUvoVlXZcNgCUDXgjeLVxeQCbPhnYpiStZUNLyViCrhFgXGBQzQjMUlbpPbuxqNrQUfwXTLFQvxJKVZKGUpXOMSsLmhneFh",
		@"LSCSCuDQisEN": @"MUzGDqiuNDpctnLgYEwydMrUeGRiaFZzkTvGfwmyQxBFXJJiECdSfMfRdUfVgPQqsArqeHaoibsAsefbMQFhOzKxRWaQVmawlogtvSMWSVZEDoP",
		@"JCfCMLqzZeARhFl": @"XWIgNbmvEmPxThdIJebGhGnrWtIahtiWFfQZtYNRbhOgTArsqCEJETTiHUJqFwPfxeNKINfCxSOskyecwICirYoJCcnovPqlEcXJzjdFESKBmCWSAHBHyONFbLVbLuFwtg",
	};
	return dKHpAPSBAyctkE;
}

-(void)unhighlight
{
    [super unhighlight];
    self.detailTextLabel.textColor = _beforeChangeColor;
}

#pragma mark - Helpers

-(NSString *)valueDisplayText
{
	if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeMultipleSelector] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeMultipleSelectorPopover]){
		if (!self.rowDescriptor.value || [self.rowDescriptor.value count] == 0){
			return self.rowDescriptor.noValueDisplayText;
		}
		if (self.rowDescriptor.valueTransformer){
			NSAssert([self.rowDescriptor.valueTransformer isSubclassOfClass:[NSValueTransformer class]], @"valueTransformer is not a subclass of NSValueTransformer");
			NSValueTransformer * valueTransformer = [self.rowDescriptor.valueTransformer new];
			NSString * tranformedValue = [valueTransformer transformedValue:self.rowDescriptor.value];
			if (tranformedValue){
				return tranformedValue;
			}
		}
		NSMutableArray * descriptionArray = [NSMutableArray arrayWithCapacity:[self.rowDescriptor.value count]];
		for (id option in self.rowDescriptor.selectorOptions) {
			NSArray * selectedValues = self.rowDescriptor.value;
			if ([selectedValues formIndexForItem:option] != NSNotFound){
				if (self.rowDescriptor.valueTransformer){
					NSAssert([self.rowDescriptor.valueTransformer isSubclassOfClass:[NSValueTransformer class]], @"valueTransformer is not a subclass of NSValueTransformer");
					NSValueTransformer * valueTransformer = [self.rowDescriptor.valueTransformer new];
					NSString * tranformedValue = [valueTransformer transformedValue:option];
					if (tranformedValue){
						[descriptionArray addObject:tranformedValue];
					}
				}
				else{
					[descriptionArray addObject:[option displayText]];
				}
			}
		}
		return [descriptionArray componentsJoinedByString:@", "];
	}
	if (!self.rowDescriptor.value){
		return self.rowDescriptor.noValueDisplayText;
	}
	if (self.rowDescriptor.valueTransformer){
		NSAssert([self.rowDescriptor.valueTransformer isSubclassOfClass:[NSValueTransformer class]], @"valueTransformer is not a subclass of NSValueTransformer");
		NSValueTransformer * valueTransformer = [self.rowDescriptor.valueTransformer new];
		NSString * tranformedValue = [valueTransformer transformedValue:self.rowDescriptor.value];
		if (tranformedValue){
			return tranformedValue;
		}
	}
	return [self.rowDescriptor.value displayText];
}



@end
