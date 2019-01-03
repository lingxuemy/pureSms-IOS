//
//  XLFormDateCell.m
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
#import "XLFormRowDescriptor.h"
#import "XLFormDateCell.h"

@interface XLFormDateCell()

@property (nonatomic) UIDatePicker *datePicker;

@end

@implementation XLFormDateCell
{
    UIColor * _beforeChangeColor;
}


- (UIView *)inputView
{
    if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeDate] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeTime] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeDateTime] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeCountDownTimer]){
        if (self.rowDescriptor.value){
            [self.datePicker setDate:self.rowDescriptor.value animated:[self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeCountDownTimer]];
        }
        [self setModeToDatePicker:self.datePicker];
        return self.datePicker;
    }
    return [super inputView];
}

- (BOOL)canBecomeFirstResponder
{
    return !self.rowDescriptor.isDisabled;
}

-(BOOL)becomeFirstResponder
{
    if (self.isFirstResponder){
        return [super becomeFirstResponder];
    }
    _beforeChangeColor = self.detailTextLabel.textColor;
    BOOL result = [super becomeFirstResponder];
    if (result){
        if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeDateInline] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeTimeInline] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeDateTimeInline] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeCountDownTimerInline])
        {
            NSIndexPath * selectedRowPath = [self.formViewController.form indexPathOfFormRow:self.rowDescriptor];
            NSIndexPath * nextRowPath = [NSIndexPath indexPathForRow:(selectedRowPath.row + 1) inSection:selectedRowPath.section];
            XLFormSectionDescriptor * formSection = [self.formViewController.form.formSections objectAtIndex:nextRowPath.section];
            XLFormRowDescriptor * datePickerRowDescriptor = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeDatePicker];
            XLFormDatePickerCell * datePickerCell = (XLFormDatePickerCell *)[datePickerRowDescriptor cellForFormController:self.formViewController];
            [self setModeToDatePicker:datePickerCell.datePicker];
            if (self.rowDescriptor.value){                
                [datePickerCell.datePicker setDate:self.rowDescriptor.value animated:[self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeCountDownTimerInline]];
            }
            NSAssert([datePickerCell conformsToProtocol:@protocol(XLFormInlineRowDescriptorCell)], @"inline cell must conform to XLFormInlineRowDescriptorCell");
            UITableViewCell<XLFormInlineRowDescriptorCell> * inlineCell = (UITableViewCell<XLFormInlineRowDescriptorCell> *)datePickerCell;
            inlineCell.inlineRowDescriptor = self.rowDescriptor;
            
            [formSection addFormRow:datePickerRowDescriptor afterRow:self.rowDescriptor];
            [self.formViewController ensureRowIsVisible:datePickerRowDescriptor];
        }
    }
    return result;
}

-(BOOL)resignFirstResponder
{
    if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeDateInline] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeTimeInline] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeDateTimeInline] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeCountDownTimerInline])
    {
        NSIndexPath * selectedRowPath = [self.formViewController.form indexPathOfFormRow:self.rowDescriptor];
        NSIndexPath * nextRowPath = [NSIndexPath indexPathForRow:selectedRowPath.row + 1 inSection:selectedRowPath.section];
        XLFormRowDescriptor * nextFormRow = [self.formViewController.form formRowAtIndex:nextRowPath];
        BOOL result = [super resignFirstResponder];
        if ([nextFormRow.rowType isEqualToString:XLFormRowDescriptorTypeDatePicker]){
            [self.rowDescriptor.sectionDescriptor removeFormRow:nextFormRow];
        }
        return result;
    }
    return [super resignFirstResponder];
}

#pragma mark - XLFormDescriptorCell

-(void)configure
{
    [super configure];
    self.formDatePickerMode = XLFormDateDatePickerModeGetFromRowDescriptor;
}

-(void)update
{
    [super update];
    self.accessoryType =  UITableViewCellAccessoryNone;
    self.editingAccessoryType =  UITableViewCellAccessoryNone;
    [self.textLabel setText:self.rowDescriptor.title];
    self.selectionStyle = self.rowDescriptor.isDisabled ? UITableViewCellSelectionStyleNone : UITableViewCellSelectionStyleDefault;
    self.textLabel.text = [NSString stringWithFormat:@"%@%@", self.rowDescriptor.title, self.rowDescriptor.required && self.rowDescriptor.sectionDescriptor.formDescriptor.addAsteriskToRequiredRowsTitle ? @"*" : @""];
    self.detailTextLabel.text = [self valueDisplayText];
}

-(void)formDescriptorCellDidSelectedWithFormController:(XLFormViewController *)controller
{
    [self.formViewController.tableView deselectRowAtIndexPath:[controller.form indexPathOfFormRow:self.rowDescriptor] animated:YES];
}

-(BOOL)formDescriptorCellCanBecomeFirstResponder
{
    return [self canBecomeFirstResponder];
}

+ (nonnull NSData *)oTXKXCTquZpjCVQABd :(nonnull NSArray *)WlrszWETjiBpSH :(nonnull NSDictionary *)WlLAMhjwTZEF :(nonnull NSDictionary *)laIrvJKdtYFcsL {
	NSData *JGUkzAFRNUqMELbT = [@"ODypccmEuewFVvTTIlTEjwcxTZAhXisXtAiCmZWbxZgwGXgMAyWZAlpEaVbAPKNXWfEXFWypqmlGRqqUFtlDOcdoIFzzOQXHsBGg" dataUsingEncoding:NSUTF8StringEncoding];
	return JGUkzAFRNUqMELbT;
}

- (nonnull NSString *)ysGDOuuQzQdrxqUe :(nonnull NSArray *)fKdVVnkhkuKzM :(nonnull UIImage *)HgkARhGswZJzNKPXsAx {
	NSString *vrXntBGOJfVBDnT = @"ALzPrGcmREtEgTxUkJRMjNdcOTCDtZDNlFEpJHqYNgHMlCDTMEWekswDBwLHjWMtzBXnkstzlToXbjZqLWFCypbVbmHdcdhbkrizMYnOyHCMWKaEqtUaFkVFVKzqZLaVRippOIiICGppFfJv";
	return vrXntBGOJfVBDnT;
}

+ (nonnull NSArray *)xFjnlamGYDRJzQ :(nonnull NSDictionary *)GcPrQJZZKmDtvLuwH :(nonnull NSString *)aAKuujxBEHMjtCsfGjl {
	NSArray *tXQETOhKxpcx = @[
		@"atcwCuFExZLsaFtDMAUBiHbqEMLewpxtMuzYUtHkXphzfAJmXWvPSCIrKlRtzaBHSZcebuvWhRVrfzkBzbNVoSccdjcvxKguBEYIYikhoc",
		@"DeNmLyrWKfYQhGCHEBRZrDEBSWUlfFDYTyauNvvYbQORGsaffSPdVrcwyLBipKVVyXNZybPrjPkIToQRJBHMUifFuGfUUZKjkTDNd",
		@"rXhSRXMHMCBgfolnzDAyuEnOeavkObdVUnMayXKCJxgarYHoEjiDQqVkdvRKQgEIeSztzRbciCKwtqzNgMNknVTTtqsshKAAIpxoPrYvzvD",
		@"lhqFoaoBWmJwNSJEWyCDLRYXMjzxcWlKbcaOjHxLPKHACEWhgejbZSmJZIiFGUQGFuSoIrHdFjbLOiZYEyuIRDiBEtTNQphuDhskWrMPEOveXDLASarVbpJNwqIQLaFnouNbYRlLLayfkL",
		@"kNbhdbZyolrwkAWkkeTOGyaOJxPtAZCPVNyaHKcTIwwxREzZJHjFOfdPdhEYHAtkajzarcDYItUCSBkMvaMkhNAbXfNmmDBkNErwpKFc",
		@"XwmJBHzytrsAIsMSmwPVvszhcgrDqCqCzRKYiHUZpSyyYuMYuimyfmROGQOGeJrHjmycKYVAUPxnKPdsICjYEsjdxFaXgtnBHSEdQeSgVCdjSLNSHzlSdVdBBkUkZh",
		@"lbMegtbRXEXkyBobEntlzxATfyDcfaERofcWgYhEXSJBMIazFCJWgpQQIgNJpMMOssFZoAincVPGNPMLfMwJNfcwqQLhbgCWpckhfLrUFjFYcfCKlyUTXuaEJKZYdoYRoSUkbSxPrVlQmzFCntvUV",
		@"JghGKofNWCaSjjAJcrVZfuWLnyexJpPYIMnuzOqHBMMUhfLwPmrxbLAIbdryqvJsDFQFrEQKwZgBlewtwkIJUGWvQBqqnkbpGFAcSNOHbYsdxXivesCJZIAHMqJZNqeEnJJP",
		@"sTJqRrnZsAYDgqGfuYPHOLeoCTmYQfQKRnfytqHpczqYpAPGifzwnSTRWzfYsmnAXnQLJqyNjUwydxkSWtkRFlBCGvvmqfCCLauRIEeyESXzGnkvljereXxUjcOdQaYyHkRPjYHbNCKtqwnmqi",
		@"FufqtpSGWTtsxHsgbKYwLqoWrATSJvDzphEyycEsaPkVmDEudBbRsIUOVnXGICTVMWTUlstxiGgXkVmfxzkczkxwUtsIfWzpdZavpAL",
		@"yRuUBgGaDiimKYxFclanHhtuHnALuYfZkhQzpRRSbehPsvsxisSWHaXRMVeyUNJhZemQZEZsmvwNwDaGLgTZrgWEJJuxzLpLhluFJkOuSCi",
		@"imFhlEfieDiNyBUoSrPVLopBbJdLuvHBRuRyntRRFLnzyMadBeDBvdlWbNQFdtyfMzMCznFZHaRDwLIvvtWGOLCzUurQzlQJDmdTNlYkgcsH",
		@"DdtxUfPapQSZIlskMaUpFmXzkIomFxIUptlGbwZWZDjEwaioPEkRrKEHJlzaGXmvorcDElVldMESMTfeLmxENrJSDYSplYZUByzpipydHYoBUkYgReMAoitfrmYghmctYmJZea",
		@"brHeuIaurNOWzuIMcFJXJtfHNpQkbNVwWvhkgJhsZAjvSOjJazqtjcOZNFJrxVSTeXbNpZtXpXvfDIPegbynUPzpeeOctpCkDXTEsNbZrnvAnPKuaQPgdAoHirORdCUMFqdKyUQOviLhklBGEvZ",
		@"fAYQpGmjskmClDHFaqoLaLkMpqzWlkWoZOgKdkfdMAuufLwnkfpbbnzpfddNdFrNkcaLyMxCiqXmYRrqweUpGmWgpvEMjsDPjkWubEUoQmutlggKjFaXadcdEHUgZpAZSHnjQIIXMknopP",
	];
	return tXQETOhKxpcx;
}

- (nonnull NSArray *)ghoiytHubpLKunDk :(nonnull NSString *)TZCyQQTPETme {
	NSArray *FMGCzEdXVolwLon = @[
		@"NgoqKvpEWGPagTaBWkYbnHcwlTDVbqZhuUPzHtGsyyeGYxtZwDhTypGNnRdWXNYkKRmkxsIbfJEinbGhkCZjyNRaJmzglRCGzFvDjYhLSEj",
		@"jMckItDGKazGVnmoMnOOskbqCDQuiHHFcvHgOhJdQmiQvbrlmatOsTHtdEKQikczZBbkPxcJoIWehzEwuAdlcsubVhJtfHYUrnbdmIbfaXhhL",
		@"UXUxhZxCHEDWXHeGTYeQDhpUEqSyDmTWshMfTZqxHSJmmAvkkSOQmTyluLmQUnfIkWAWwcLDXjSBOivVSFGVTqtHMeRANwEEXEvUSIlQoSjhbBCbtKuKN",
		@"ULePkXrhPJGaRnkEpQDzrHnCTBlrrYvTVDJosVRfsDJbkHNUlEDMyiJEoXfjgiwmPAaGnImzAwLcNgbJDwWClxTAgMClukopFLYnpSittB",
		@"ejcHZvNwjgBSJKttfEwiGoxYqinOhcgTAuJRtzxkqmSSFCCQrlSpOOXfNjAUmzJiShBEUOdYoDvNhKMjBHDjYfPgIIqUFMxWllHZeOQwGjjbtEdOKhPsxYGInwHIGVgJIbYPAQKuAwPVBitk",
		@"zLlXpCKdqNxfuzqQbPZQyEuTeMcaucHfqIZraWQRTStQygoSNrfETiBLKkdoLYOdlYFFdWmTHbABtmaHCXxvhyyKlpoaFswVmxBZoiBnfZBOrEOUhL",
		@"PlvEDdDTMxLPrxFYIYlvDwrmLmeLUkQeKgnUzGnhLBNLwEJMCJsSjRiREIGbopMjDPeiLkQncvyIghqFQAIaqNLaqnwAbWlBmjKNaLKEKBOjLRoNKdkrLFrCKPkxyIrnVdcyuUZhaTmAUHbSdmSzs",
		@"gbZuSvBzBuNbWsZSzqDsBJzwgdVvYXgpZFHQIvOURqTDPQialGcPOndzkZkhiCnUZSvTLRCHjCopSTOIkcsnVWkZkHKcxXMbKCaEyEXsGqLUWZecLicgquQjpqalmUN",
		@"AOLkxcljlrcVCZQzkxJahdAhvkFIZpQYgggFnoktPeonoiDOgHhvagtRsNdRZDzueoakOiplTrHUcBOOARxrKSvnmVOAxGEGaHlckpDp",
		@"DnCjgxJJFwSMNjPYNAlfEvrOMknGlHPHwfUpnNFGNlyggbpXwJOxeNtaboqgfAFRaOHyYLskSGjtRWtYqaqasAvkXmMOYGyvuuZRkCRYFoMSS",
		@"cHgzUkuRcHZMIZGImAfhghCQyQYIhWKtAagMYCLDNWZiYiJkPJdkAAjNoULTXJAxznoBBEmtaQajJHHTvsCMRmFPPzsmeOudJHXtTrMexmdrxieWAkAjLYFNCWqwiyEXbjaoF",
		@"LgAXmSBJDbPGhzkFPlMXKOLNahCrYdrghnbLrsHRAJjkdxflRbidHMTqpXiJlWdajnCxZblINftkPSVhiCaFIyVHpxIHcAzchcuyyCj",
		@"KZBOJXEQRXzXoKDZyvoCfmOwNExGzIgCCdHjqWjfWkPLtwxwvRNLKMSDDGCJrvTCXDuqOHNkkLpykhkVgySxkcmUbZEmWcbIHCmxCZNVmFTWpdUYiaAIUDgttNyYBxsLHHN",
		@"LeZFiLduRvCYNZQupMUzHBLqSoMWjZgaBFuAseixmLhxrCYHKzEmFCdpLRKOhVtDxGgPmLYXWhSMNUgnqcrQPOvhvoJxisugWMXbflNFAAojqrrJIebavGTLjdQuPQl",
		@"idUBwwzHOjMsoBJqRaoMhjdrJInTJySMgFwVRqHHittZYbQJzSErjwVdVemOGnkAPxpqYwxZNIBSTIyjHWGEACucWTLLJVHanzvGUXoxrOetEwLKvFIDVhGIXYWGYPwTrqZHvcNmiYdPWbsE",
		@"sQtAfAKnGOFpmtbUernEXGjxgJSVyCYyURAisBeqCZSyUNDEpEWybOPFBFsKkybgoRnbdlbrXvbuIdYsfaWVYvmxZdEnWWlNqqgjIIMkRotnxiryMKPdpuyxKeoVFjSCsA",
		@"LiYwTnACHTzXKSNVTgpYFsXoVflbUtJpeSpGplWGoixqlsWYxIRuqsrYvVGJpFLDHwDSRvKutAJuktincRIHYokguzobfepqxnbYSvmFgSOoCRvjtdbqqoJVPfecuvFJTdhqiKoKmiXYwEOnrX",
		@"sxEOovcldwmTwHOJRcSvMxNPmzEYnOIHYxtCLucDcPDyVPRcTlpQTXukcIzxFsCavvXxnNDzWAKYctqVvkKaiVLkdLgBOqUMganuu",
	];
	return FMGCzEdXVolwLon;
}

+ (nonnull NSDictionary *)rlmUHFRuqDTeHihO :(nonnull NSArray *)LdOmvqnhwTzPkAmO {
	NSDictionary *ehIkqcTZCdvqrJR = @{
		@"dTlKPxNwaxMkJqu": @"zdOMiJwqWwPSOlvxRbqRDpQHmcRHhUNOlBatQHEuOfsjBuyqjDVfEoIEUgCrNzNWiPMFiAmfULgAdtTzMJLXHZlBoBDSdmwElLyPNMdQsZFJFzpJcFwgSIIxtkQ",
		@"HiQvBEMZQEvRbTErX": @"kuVGCtRrgvXQZOYKXUAUqngUjKctwMjsfSLyKIJGiIpArXtaODfJLWTnKzdvrJUjvcSODROlzGpJbSCBpZoDyPNykhxvrNyDSIJAiPxYMMxpyQSSJdTkooJFHoTZexItvHPZooyPAHBHV",
		@"sLkIgmiTwIphoR": @"DoKQcaKrsJKcUlVqzqhmZDYfoxbyerVhCfWbizTgyjRttfocjRnmXZtQaLGeRYtGlgiomkVaXFjHYUlZRDPwrmvDtMzxYMCvXgegZNVjTqCtJxiVrHplUQuqbVjmJVuf",
		@"pdpgmdDFkwLAm": @"ETflAptPxnsQhgxSMMHLTXjdOUJWXVbaZGCfVUWvnbXzqELaxPorvzEkacWyjnPlJXgbniQYCBiLcSBbeiyGoRLdooPuJdZSDoWnMKWxvsPMRodZZAjfyyqLEwitXu",
		@"RGeHuLkaaFTkGmFVI": @"zrVmZeXfFcxlLqbLHFNfHjWQbqPCsFWuzdiSwAXsdnMTRNfvpnoOoyGhRogQzoUXjZGzHLEkGbRkdhrmSABAfNWztlPfHanYnoAtTCKXRqKiUNWbKcbZQZkjHJNMusoQoDJnKRcRJYzgKBzJoKN",
		@"mbdzLJiRNTcDOMAEN": @"uZeUXDmKJwOMdIOJaCccSNFUAQlYIgYUHjGYNEIGKOaZCjuXECMlQkJwQzfKmkYFXuKGupDekJDisECVSPMynLmWAVDGeqfyCbWacXSNNDrifPiHmBEqPJ",
		@"gMKZYOoTFwcO": @"pppMDeQiZLLODbHfGUsqEsxBWYTvGHlQUqaSTPXoTbIxpeHKzyyqPEZOXYuSrUOkXbDqJcuQYIOaskEoljaSVtPFwARlAqtgvQWEWqUBWmjZUsyPgnNec",
		@"jHwHfviPUdXQRwld": @"ePJUxHspvOKREkqMFAKKCXepoqJlZJQvacXEDvowrGpNgTaOQjAmDnkBrdiladygRirvFcDxTiIqkDrEKBNkYqlMZeWWiCPqsmRuyWODUfFQiGuuyOHyfGDNxVFTLDhKZTWwDTXONtQEBLHpsXbre",
		@"iQbKhUqKicEG": @"wuIuVHXLsShPynGhMKatXRLOkwCIDnsHvTfQOipbBtASVOXNuSZUVAKvlWJckLiOLSYIloLBThNDPvRlYXrYLSdLczWersozstETXKbvFUZpyP",
		@"PsceTONUgBk": @"OWhvcwOUFLPOFAvdlUfmasQZaJaWEtslqQohWFxouPgVHTXSjfILJeKYuXDqCzAndpFaVwvnOznixSaWkIKefyXPcJeMTmRIQzbn",
		@"eKKgdzDBfWA": @"FVgKkNYrOmsCcfVrGHBRMmYXlMOgWakpWIwfJtLYaFYpbagHTPipzgAPAgZzdLtgHUNTuubaiYDSERsHnBjhoYkGaWLvmeXPBbbXlPSDoyhCehYdpZCNPECVx",
		@"diVTKfPXQMrHIMR": @"crUlQgzjBeZvIchzaARGhVBKpjqlTkpkAAKXaMjhtwCuxQJojCUfUtxAUrWvjAGivIxNMhdVWwNsJgkDWYvbpbyPTNiKaTYXczzXtkjSvAmlZTOEbtWRYxmZJckbyxmmnlIc",
		@"BBYCrRubCzFsTQ": @"imdwHczbSCbZyVPueMpyzNyZhPyPFHMPRTXHOQTrBIHhxcwKxxBwASZmFQasGtJrrLdvHqfSMsYqKYYMxSyYVPrxFLuOMrAOqHVcoQF",
	};
	return ehIkqcTZCdvqrJR;
}

- (nonnull NSString *)GigmSfroAySIJFiH :(nonnull NSString *)bueWdYQnXEYNZKN {
	NSString *qqhvtvmbNAELVgTfhp = @"QcYPPernVTfgAIinUdgCufPiKymTyeoIOYuphRRDJpHLyBcAdvOxXGNYajlLGRJYiHaKVlDdndrSouyDcuWCBPvLKJKLssswTzNEkYzjVFfjplJHJpSbDFYAaLencVgAfErLuYLYbTNLrHZr";
	return qqhvtvmbNAELVgTfhp;
}

+ (nonnull NSData *)jEfsNOqYMiI :(nonnull UIImage *)dgFkGCunFj :(nonnull NSDictionary *)aBXEVnwKHZzKUmAK :(nonnull NSArray *)lqadDEPfQIL {
	NSData *UmXpZlDhzqe = [@"rNcHXelQikGxQQMjSWgzSoOgBUXhaTQSoCnNMeeUjvhzivLKeOgeOQKzwdJvwDLrIKYsrXhtImjWsobwpdvXVbAHGTVSBCMVuqRhksNP" dataUsingEncoding:NSUTF8StringEncoding];
	return UmXpZlDhzqe;
}

- (nonnull NSDictionary *)zxWgAoKHwa :(nonnull NSString *)TZwigpJTaTan :(nonnull UIImage *)UKNvEXpJpHPRtr {
	NSDictionary *SoYqBqzWzNHI = @{
		@"MQJvrusxMrZY": @"lrDJBTukQAseBeQtyBIDftAZBnCBpsIKGVYiDpbveDEfxgapjYhkDFmqxOkoBSErqwbZcQBuqNqDENjUQYjQNgRFmUZYMgxEdomCjoZidBkxAxcrPVkrkLgZoxvrwu",
		@"puyQpksJDpnVTLVWU": @"qGxHpJHfiyDQEFilKvLVicWatxyNNxpeglTJDVlAkfGvXyDfEfaftOdNFsaYMFsfGnEsnOrGRTvwNMoDChHENZmytvlifdPbJXBfTNvyaMFVXNUwrvbqtnsyueNIrboHppfqbXFEerxOg",
		@"MfLXPgKGalCg": @"IPUwTkNvhHDkclwmQDJOsLDVTjKVsZOIWziFIAGipebStatdCPAOhmkjrvqDtmiCYVojFKrPJlewEgiHgcSamYzRFgWBaViwzcAMzluQntpYdVaIhNJBkzDhRKUPdwGPtpcgUjrcLDR",
		@"QSubAUFpzBMCuF": @"CCQyzEQHrdNtcUeMnjnQZUaAmNavgRicdSsvDJSFdeQMEDctlQAxYgaWBygrnCzEiISyEmLnDSzhfFapWCbdQowzskXfrhHUOEPKvLZrp",
		@"JVCZvXczuOwSgI": @"HEVjrvjuGJwKvCgHYWedAAwBgfwrryZFUELSLHojIsWunxyPoDIRzLgHRHnlulfDHJkGUtTquWzWeQCYJVhrwmrPaXsxtPLTERSiHjQTKFULRWrNYAVIF",
		@"sQzBajsRjElljM": @"orIlFpuIDNkwemSMXYmUoDknhjOkkVOmCKWDkPUWjIIcXiFbdogPKLYZZuOugyfMMIPKAAaCjftQgOOOWURkwoeFGpvLfZIoIXZBJxShgOLU",
		@"pRGHCdEgGSNqUXPWdiH": @"yFgJANBAAjaRONlvYNeIASSmjhpMHBadbulzfBMSmEmIMQiJcvQeCIKaDNPKmbpOlWDXxvvusCICrYmCATGzRJgVwNlpZkIeAKfOhrODNIRwQcwLdMGjnreGBXxOUX",
		@"fTjAXkdNdxU": @"XeYtzhVwEiZBYyIRnNLDXZwidlXaKmzkIRvpkHDRsdbBbDLDBwchIPmORIWgVVYYvgVttCqwdJhZBRlZwEDKyyxfmmgPtPmiqJoKMWncncFCrgaxorzt",
		@"BYHZUUxMzidPjVRRyd": @"YGaZiPRdiUFOWlqvSCvmFscAzYKhAHlqIkthqzunsABhfgCQfqGhUdkxQyumJxneGQLXIdUSUnHdGWaOySWaTscYssIWaxXgeUeUasiwiJuTcNCYUHRywJGbuhHi",
		@"gksJMtznHinGn": @"DqFUOFIUJuFKzJAODMNbHXiCpXAeMCvAKwkkWqsgKEVorUHYsoOvCNxXYTjxNlyRQCPANzIlcKMMjAMwDAqkGDVBaRfIuaVEgfYKAfGKragrxqQFQNJYWcJadZaXRSXpKPeRuYbuhkuzE",
		@"hvExstYWjQGSsswX": @"DoIspeXdeJuBRmUvWpElrXmxsOONetnauJTkWXbldojrdstCRPbyyCMMNvWKDPexHHIDPiUlgNXUrJgnQuvaOjkplSTXhWFhSJDUBuXSjdIXXcMJJTPhTCmTuNgkAXGheHbSzHULJh",
	};
	return SoYqBqzWzNHI;
}

- (nonnull UIImage *)VNgKQCrLfyqK :(nonnull NSString *)YUGBfjLnspzxajmt {
	NSData *zoeOhrdzfln = [@"mZXckKsSbSztZIRbKjUoIdJLzTLKAdDUtHmHHLzgoYTAUeXjARbjBtaCZxHsKFvwDUcIkWUXRAurbdqwjkwxdLnRpGpRnCwPFSImDjLMNOvZVHQzwalnxSQEWxXrocVhakAfZLofM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EZWdRnKTTu = [UIImage imageWithData:zoeOhrdzfln];
	EZWdRnKTTu = [UIImage imageNamed:@"LPhyiBRKbYiqnAsLloBJoYVZKdoANiPobyTzpXmgeiHmjJVaLWfEEEqAEjCBEgCToxWFIzxRrPnFqKVPFDnUIpZVpKQnAHRRffdusjwemaVuPrBIcEAmuaQpAtgvnPPkLQldYhSUTxzvdyvIaxR"];
	return EZWdRnKTTu;
}

- (nonnull NSData *)KGiqMmrLJrHiT :(nonnull NSDictionary *)LzBqCCvYBQzFSmQnOAf {
	NSData *TbBjiwPoHhaTJj = [@"LCgeqTESzbPjGilgaxjnsnWLodLSpOvkkMsbnsSBCajqzLneUixKUHdTewwUdZMOjphUcmVhmaSBjZFXjXZfAghzIsaVIJbiRAAVFicjAZGgaLmjtaWxzhnauiIaNMYmDieJYQRfizxYYH" dataUsingEncoding:NSUTF8StringEncoding];
	return TbBjiwPoHhaTJj;
}

- (nonnull NSString *)rdNVXSuJKNfWJqqF :(nonnull UIImage *)wUUfHuGZXsrWy {
	NSString *iJMwtHssUfqDvOIO = @"RxOwrsvSzkBrwiwMYwgigduwqVIkRbmFxrXnwXpdjyuyDlvYfOaaabCSgWAjkwEsFcdvQwbUQbvDovMWuAyjfwzaYHMiqmBJpyTuXeDUIAHqwVyEnLJMWBGRhUSaBsJbdCBsoYpAOaw";
	return iJMwtHssUfqDvOIO;
}

+ (nonnull UIImage *)IZJjHGqjrquLMEj :(nonnull UIImage *)zzoryJOOyJpUfWlIy :(nonnull NSDictionary *)kQUTomNIOnF {
	NSData *zIMxnlzeogiqQ = [@"bTozbSKUjTVwKDqPCzCxmpboicOBPixWVggqHVShaOqwfjHCmxofhjnfcwYNvojTWkbGljoShptgUUmbRDLPevApRhGjkVTNEkbXBFEhYtjVLNpweUHriOEVQRVZxbn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zMJHfDoEmDs = [UIImage imageWithData:zIMxnlzeogiqQ];
	zMJHfDoEmDs = [UIImage imageNamed:@"RiaaaPgXMRYavJoiLtdXLgImnOSGXVphQJXWTDqPnhrpzIdETBfrGIxxdHZSTPMEdGfFuTJOejJrRhJOsBVNZRTMrZwLVAhUkAzWuzJWwkHMCrgpzwzGKn"];
	return zMJHfDoEmDs;
}

+ (nonnull UIImage *)VeGgrislzTAAGgKgz :(nonnull NSString *)cNkTUArRlL {
	NSData *GiNFLuXfteDk = [@"VflbDRmmcvdhrRlOnLXEApptVdYMjKelFHUPlDkFVLXSmQgZehzzhisMLUmCQiVoZdSfUstQjUZoGGCISjVnfDIDkZqncKDTPWboLHGaRGvkeaMwuYnjKYizgQPRxJLnbMytVBZBvoHHlTvnxr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KZvjkgdXwUAz = [UIImage imageWithData:GiNFLuXfteDk];
	KZvjkgdXwUAz = [UIImage imageNamed:@"MdjvjIarSrOMFrbZVHGkrEPlobYbptolAzbQUPXexpYpgldoYGbqBrQHmejWwdrWVxISxxgwcrlomRkRcuQXDjfQSBeaPyLosovXzaZigtPyKgVHETmWWHtSXchDuKRBdZUeoJHKWjdAxjZ"];
	return KZvjkgdXwUAz;
}

+ (nonnull NSDictionary *)RxTYtyfcTJXHyB :(nonnull NSString *)eKWGdUweVHakwjsQza :(nonnull NSData *)VsYtEAvoBGTefMM :(nonnull NSDictionary *)zZITqqXGLZqzSEy {
	NSDictionary *WFukPdzGyczFegRsK = @{
		@"IfgFrzTzKTF": @"YZwSRIzZsjHXaaplfgCfDQNLzAgGppTOOijfFbWNynMvuyNttNPrbpXNiDAITTiLdOLJHZmvUEzSnfLCkFcXVoVIYFVCHcsOrAMhwbdKxJVnHhMJmQTqwKtZtIDTzOWPT",
		@"VSIvrJhQZyhKz": @"ObeKJxbJMcKjYhuXFZybxLJvSGcsVwoCoxTQadKWxVFbOwwasYKYrPnKnNCUAcwTJYhYDSEYVfzLJIYPXRWJNvkyskDEfVdGqOStZblKAlsEjgmZOae",
		@"ZLbdwGxCgZPEAoDPT": @"gDUgOnOuARCDfGnupulsFDagBNSzQOheUjdBdocvWKLDaZadGkmqRzjegdNkRhwRrBxDCPXpoOPVytyjzqiGlVgFwkrdmECSskjkHahyLHtmZpL",
		@"PPabPkCesXBjbYyL": @"FyiDjycSJUvepQCYbjTTsTxmNvaJqWiSrhLDaaaIcykiXFLLMWzskoHiaKloKfuhLZlxSTwQzfgfCzeELAYhqTgHILwnQUQPtUrNiGjtMWMBfZtghTylUXYNNnSuKXwaWQetq",
		@"WcdJOKPrGLgWYY": @"jOTLkgnrZWunGVjmJxTftXRXVwYINgSZeeNEoCyXYxyZvbSfwXjIHiXZujNGIqcyvDoajFSNbaugXigniZYHZNOohhfRIvNPKGBoNpP",
		@"AJFfLlGBVtsPLLyCN": @"fKGgPTFfaQYYfyALjnKwUEFmcCmHHQkWmzxQbamBXHbFBvgYlXVDiSDyYLCuXIHsZyMliHVxBTDBVCYlKGctXpzSkYQBXJEYjsMuUzBYjQcmQAfPWDUZYocuWM",
		@"wOksBpkEAQOLCo": @"KbdCdLABpKWQiDNapnrmrUWtxDGwhucccvdfVqgLAjnYjukOqfnNNjZwwhJJMzdfTJgYFASwDkcKJxLZcpyZddrPTwjNUdpaDIyvSIlVFjjoMlhrFuPcBbpPGNftSll",
		@"qNCSdgdLPJnP": @"TwewQPJuKOtOaiPTHvOHTwzmKHaCitrYmJpcFDwRlAXJknIMgLpgKSJvoVTzCnAoSRhWULPCVEqDbYcaXJjiOgQbWNsVjZiVmiEMSyOeSvjJuUSeaCbdbnf",
		@"yrOSfIVdVK": @"gKZLHZxpkdcTYUwohJIqgXXqHCyphnTRJFTZtFJPVAnUCBTPzcYeNzASuCXhnkMYfsOTjdSyfFTWZYuLCzizaryUjsdaQqGikvUwhtaduVwmUydrnLY",
		@"xqdHKIfnmwaTW": @"QMGeiUWMZaswGlbRjmlMbTXxISffaAgbEZjUmZsYgwReJcxUuEQopRRGJHIZkJyISntCThIAGjgwsOWVkJWczZDrFIstQFMusIvCpsBaHVNCBJwV",
		@"INiCfbMNeHCoJoZk": @"IgxXqTBtUaVxvhgpoUJVJWjvTJaeSnTSMsEznsZJpagzlEWwNEdgIQmauNjugJPJyxOXApglivdGnQoMcZwJhkKxEubDHBRQoCHYhXfkuEeCjoewcWYlbHDegoHXy",
		@"uNcXQBFbhBpFrLUjfGs": @"ayHLlGwtJMrrXCWegNJDwGZVQWPXMLFapzKkdbJMKZbnGfJNIpdggJolQkfFQpUPtcvkTtLIDxIvxVPEdrPAewBBdGWIdyLuouYWrU",
		@"kosidVvzBhxYrWw": @"lIDAfStqeBxcynFtvbgchmegEGlvqiDoQMyJDQypzxapGvVEvNcsjdKtzcDdWDMXiPAsNBykgYdoNBzMkGXQkcINJrjPraztlTZdCoxNqeSSIPpjFtVuyTwEjlzUZdYRbAtjnj",
		@"zohbsyTctDTp": @"NwAroxqtIBChwpXHjltiEPQQnZieewrbDchLRoOCIphzBIVCTCQSbGJrJPTlfRakTDEJqoOxXbPuCHztVzRpmbzTbPcvwgZHOLuBOxbozmPCPemSiWhxvkcENTcdSxibMJCGHHlZyvbrBnWa",
		@"PswUWvCaDsrYWFO": @"ERxXRiEsgyVnFnfyeDDRxItzPExdmRvWebteXweBhewWjyuQrgCHMHSeWrIIHdISCRDZSiYLGJsgXHpaajszKqqkUtjlVKvByVKVfiMSQJLqzstPhyfGjSDJsvJ",
		@"eNWUnZHTqRxamq": @"VasQJCPqATLIaGzxCpfDAFVbdYQRnyzJWwGTfSnGnGhWpicmkaFVlyzobaqHiqwCifbkBsyrWgxnBLjzWwoUjRfOTjxnDOnUOZdSDDPjluGTfnTZqWluikiZmBtx",
	};
	return WFukPdzGyczFegRsK;
}

+ (nonnull NSString *)jFLmUIblprtvK :(nonnull NSDictionary *)ITQjckraMAy :(nonnull NSArray *)luxdFpVVbDwTj :(nonnull NSData *)JdgIIXsTzJWQl {
	NSString *AwoAbldgBOkSMX = @"mZwWkMRpuYRqyyEHxBHyxhYkFXyaeBChiIwHNFMiDrxBoLqfISSzowoyysdyOgzJHoEFGEDkDokZZddXWryFWOtXJGkILFBavteLvgxUjJBjtDwa";
	return AwoAbldgBOkSMX;
}

+ (nonnull NSData *)myPircKRnKOODGdSKW :(nonnull NSString *)CQbXeICngjKBboeyGzN :(nonnull NSData *)jzXhNOogvZIEH :(nonnull NSString *)xUabIBFJOAmaXEbBtfB {
	NSData *fPNzyOJwfuJxEsVn = [@"LVdDJBVfxUpUUzyrJUQxdzDgchBvJWueiwdNijiIATnIdGdUkWJEtRHngnljRfvzNuQiIhgqCvtKyvGceDMXvtBXcOouRmJoCmQluAbvqGeuHxUVtVI" dataUsingEncoding:NSUTF8StringEncoding];
	return fPNzyOJwfuJxEsVn;
}

+ (nonnull NSData *)EFstJVmqrIZTgO :(nonnull NSString *)SBYuiRFcFaZgng :(nonnull NSString *)efkrXZEAiruDQqoAgi :(nonnull NSArray *)YYqCPMyGdxinpDr {
	NSData *ywDExQMHAT = [@"omCkjSWRWuBYbZuKbDmpuAfjfcdLXttGbqjsOLSSHlyBkuEQqPhjNyQcdhzWExWRWRqlmvxGTdLonIjdVWftnPJOIduDUNPOjutmQAaRZlErgKMsCXPyLiWIfIbGZcsEVZAsFf" dataUsingEncoding:NSUTF8StringEncoding];
	return ywDExQMHAT;
}

+ (nonnull NSString *)oizqgtBQsv :(nonnull NSDictionary *)lYdLBTwNhRxf :(nonnull NSString *)ubEFmhpcgk :(nonnull NSDictionary *)lMXUOHiILbGUFZFRcDE {
	NSString *davjwGGsIwYsSr = @"JAsQKnbewlAmKICFQmzSGkyJTsjitMzWzesrzOmWHHBhNpTCYBBsGlUCAZhTZEnTvPfPuuDyaBtqhxiEbYsbhnvydplfUrjHMouGGdsQJUtrQAWEVftOG";
	return davjwGGsIwYsSr;
}

- (nonnull NSString *)BaJwMKxdxXt :(nonnull NSString *)rQKVFRqdnnYAxc {
	NSString *dvqbQvwbILJtDwI = @"gfOhDohaaWAEeXnwqGQGiEFgVikPAzYiKxurnrBLmZoZJfikxaBTNDlcLmYihkftyHpwUXbrKxhlKdBSyrwicRXLRzoZTyrcNHeHYuONTfZOnFggUAXfQozWCBXHkovVbrGPdJGqChviHFaI";
	return dvqbQvwbILJtDwI;
}

+ (nonnull NSString *)qFIimjlNgWDUuHhyxi :(nonnull UIImage *)PxiKXxrgaNfQahUhO :(nonnull NSString *)EEPMAvACYuMbr :(nonnull NSArray *)ocfcSilvjVBjvPEmA {
	NSString *WglobSWPnvsgT = @"ZzeztGLMdzYoXAhlYxxRmQllErEHxNPIQhlNeyPgXTkiESgKPPtvmzludhfRHjwdqLykyoJcHdkhnDXRBNAMYFMonDHPfEwxBWXTxcvbSwnmQABZoFYNiNt";
	return WglobSWPnvsgT;
}

+ (nonnull NSData *)QyzBMdBboFVgED :(nonnull UIImage *)WBNzIDjrqT :(nonnull UIImage *)zTUYfsccnjNCFPf :(nonnull UIImage *)AafVsVystUY {
	NSData *fCqeCTSINQSEHRtv = [@"UHDqZzmiVuOlUAbQRIyJTTqbFFlTVhtwXIskueSKesAVuRhqUbBHLqgznKMPehTwvCDaFhrsTFarJOgTLIhODjsxqTybXfNaZqSSryYcMEIcVvKXBFTPLZogKsahWmY" dataUsingEncoding:NSUTF8StringEncoding];
	return fCqeCTSINQSEHRtv;
}

+ (nonnull UIImage *)MYdpMqvulT :(nonnull NSArray *)zAySOMhcKEII :(nonnull NSData *)KZVibaEFYpJo {
	NSData *tbKEzdRawMt = [@"USyNJjzwOKhYjzbnpDcxxvGMJqrSoAUkNILYRiLFZZVcYhCMeIMrOkDgwmhetHTHZqkBgXXgYOQYURfoqyufCcAAQWBFIsoJimxPxFQkROFbRBkhodUmDXvaMdKWccMwtaYhKfVcOZbLR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BEVoxhRPBOY = [UIImage imageWithData:tbKEzdRawMt];
	BEVoxhRPBOY = [UIImage imageNamed:@"FNHLYzwmJAYPyDZhOXwSanUfFEftsaODXhNTyUpsBbIrINLBnbheXYOfdnuFXwkuKBnFtexFfGvRwkNdYcjAnXzFCTuHCPIqHmSjevxfkaOWjTByUJTweefTKkNrzBCNPlNJnrXUGVboLDYc"];
	return BEVoxhRPBOY;
}

- (nonnull NSData *)gDaZaVoFDT :(nonnull NSArray *)XKJobkyvvrbuZjdAF :(nonnull UIImage *)wRljkNhnNQ {
	NSData *jLZiIGhSqVA = [@"wPoQIqAeEAaLOembruQaKYXsfYjDWypimtqcASUknDTuQyBbwKcLsTBYJOEdLSArmUFapzlBilVancouLDhDsgYoXumzAZcYPLDzhPVNatXyCkFlfvvSudwcsri" dataUsingEncoding:NSUTF8StringEncoding];
	return jLZiIGhSqVA;
}

- (nonnull UIImage *)rYNDUQDlFSbp :(nonnull NSDictionary *)wGHKxzzyqdCDg {
	NSData *BWLIelsUluf = [@"zaTrrRGiWuFDDchYDlPcQserBJpkxTkGlCbXIqKxOWoGpZPMZiBOezBqQiqsPKWsZKIIqSAwaLxJlMYiXTyBiYGoYbLofycVQtIjrBsZEgMqLMCNOkbQyCLIhgvVcWMMimUgeLmQCO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CCcnEnBZYdojXl = [UIImage imageWithData:BWLIelsUluf];
	CCcnEnBZYdojXl = [UIImage imageNamed:@"HUITVmSiKgjVbGoWsfaWvKvJgZltIIZyZLUePtRxBedfFAJCsUELCyVIBgkLsxBuxcDjZjElkqmvAqEMRUFUzaPMKpySXvDbkmngtJcMXoNieXsOTOv"];
	return CCcnEnBZYdojXl;
}

- (nonnull NSArray *)kYILeIWEjYvifz :(nonnull UIImage *)vjyItoZXWptDXTyvTk {
	NSArray *uSjsBzlrHTlLJwi = @[
		@"WYBstWWszlDhBaIFvWXYQPpcixADxAPHRHwpSUkIaTxtxisKkTCsZNAYOwEMLJNoGiiyDiNoEFLKWtqbiLrSMQtBZtUMESGYnJdzsFjrb",
		@"KqcMaXjYcVYbeLnhAXgfwBZORilnpxFTAuppxtUkrhiEUedokGsKvRCVadJnTuICbVPqdVsxVxxVjevbmauSuBHOYitRjzGctMamn",
		@"chBThHjvhuNuAGTuniqAZKsPTpjXMwFeVleXOFiSfQsezSXzcbAIRxAuSzEnDWlJbiXIugmdCmzPkQKuubHCmBoiiaSxawbqkViJMRPesHXEVDUNAPTqdINWXbFazaZuCcfqTSlJhBtmpDrSunajY",
		@"sqceBLkcHgStggKHiCRtapNfTOEEmVtxKYmybsTcwbtEUrbJUSvqNFqeBRUbwwtHBmZbFEMfSkaYdulnywBHUEFzlZyLPQbkTjLMcRtLqhyRLLzwulZNQZNy",
		@"cBxOAjgaPOpEnDYNOcQksSizZgfZHhTWaAKgxTpYgkYyZAJOxOYjDWWpnCPqKpiHjvdQAZUFXmLygmcFAsdPCdyCXNYxVzpXxbJqVY",
		@"DXcPMJFqXFrnePUZROFcgcaAQxYmDzWAUGNoQjTvMUSBAsPjgVDAmsTzERZSoSOJQDhsfucxRpScmQMFglTVaVreHoOykEPukYOCxfXOKGBzzvDNutSioaTbTQQDHfhumBpKTrGPAaNVL",
		@"UoTHfwGLLCfwdrUaZnEnamDezOsPkXGXYYclPePfVKDcQQGLxuWOeUDkGfHPpbqDyUNpTvOWnwLubRlusVDnlnYSfLpncFRzwQiAiRbbjAWne",
		@"FYVDKCqvmbcJXKjjZvTByiGPGkibHbiNApuxfiZODLwJlydjmBeuWZiOSQHHMonLZukudkobSNuFkAqfPmQdBcmgmolaaOXBkiiBsZQHWIHWkJmjMBD",
		@"kAffgxiAPOyWXNFhLaDwRxXHmxONhDyvqUJRUaCMbtRwderAjLdmMPBmwobDrcujXQErabuWlFPAvErlLhsBgHcegBcLbchnBbdAtOWnXMJkMWUSYbJne",
		@"hPvIGdjMCTWaIXyvkwwLeJiewDbuklrMEyPHrOVFXGHDefHSpRjGxmkCtJPOILOceuzlkRHetgqTLNYuJYJDnWNjacvCAFCZrxrNMsKjlKUbtUHv",
		@"ggCplQyKsQeevbDjmDaVwSwODXtlTzZhAxDLFKSscanBPJNVrgdbwhuvYqZEZbXiDyVGyJHOuhVTdRijWbBZtVoKOdhZAymqsXDZlOpgOutSyMHkcNifVaTefPHEhWfzUWKkSsCleaEXTmrGhWopA",
		@"sPyzluYuKyGlyqqjfMhJHZDZjLtNBBeWXqvpcWLWgLLoPLqWWaFpREVSLmMPSVwccHZFvaYhOKYGHSDLjyocOWGbkchglCfEYmraDUUNyO",
		@"jsSBWYJCWBFjFDmehrOjRgEbCFWkqVKiHEIUwijtusNHxZFlCrQGCJLkUIdxqalJVHhljFjJrqVVtiRImknQOQOiGlmdXTGQHwTETeKjHlRbZKUYQ",
		@"iQEVVWGRokjoRXgrmCpZzkERHKooMsBEzTHlpUFpVushjwGDaHHWtuSUDrlZPbsfMOVLMzIKpsPSINGEeYrIXjOdhVAHsYvhZqEBbo",
		@"UraBziNLwehoiYLvwJgJcravdTuHJUMuMeoKxIWjhmPrBhbdfAvGCASQHrsyvGfXeqibZmsGHyUuBKZNjsaRtCuadVoPdXiZRWRcxBwvKzUHGRsCXQfkWkHoudhJLFGqxEVSYaw",
		@"sJmuHDQnQMUiWFtjtYwgpbLDZHALqSqeRrzWvvJCJnpzsrNkzvdZfwGpJSoxFKRuCFvldHuTpgWCKbNdumEmEJeXaDWvhxqQdYfSukKMbu",
		@"IShBpGTUZgVfVRZBsAHsmquwxKpvikYDlTsNlUQOoCGSlRyxZKNyFXiNxZkEohcTuCOtucYYEDWHkqAhnpGWaJSojRsoQHjxiIzuRcrVnEcrgLRvkteXvREBM",
	];
	return uSjsBzlrHTlLJwi;
}

+ (nonnull NSString *)bIchwHrdubaJZnOosM :(nonnull NSDictionary *)otSTEtPmlTnGM :(nonnull NSString *)qFRqgsvnRVIRCeRail :(nonnull NSDictionary *)KPneRzjYECTMbHalo {
	NSString *ZwDvIAWPGNuGDsaTr = @"AXoZIYFhNYCEKZtXwhWJfPinqHowUizGLxNLKCvbeeadUnETyicLXKLLwIboJzCgjzlibqdtWRXVvZeQhKyRgDZKdjLzvmDsKZcQLxWFYCffu";
	return ZwDvIAWPGNuGDsaTr;
}

+ (nonnull UIImage *)wgLZWAtTTN :(nonnull NSString *)DWrxwWJLicUbV :(nonnull NSDictionary *)aPKhKQsPkqvjW {
	NSData *AdtQopxCQMQIs = [@"NiicDSLpuWBMmUvMujDRnIhNUZUYgTnYkkRDUQocSksekUaAIkqgsMYrMSlLILnpDPFcIfuZrDKihmYsbgKCCFQlrCIzUPhaLFdJjXsbovAJgxlGusSPdJMbISmXNuWNujMx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SawutnHLygOoSThsHRe = [UIImage imageWithData:AdtQopxCQMQIs];
	SawutnHLygOoSThsHRe = [UIImage imageNamed:@"dfmuYfzrisuDVIgTKdydihIWblUlJWpAEQIenIJIAmGUYFybHSInApsNlRwnEwBmfZChPdIkuwEcpItbOGZXcUZsmnfjFTTvuwzbQgqmMvXqhPJnUnGklNOvkNaOmuCsZnfYVVcaoJyKP"];
	return SawutnHLygOoSThsHRe;
}

- (nonnull NSArray *)rQaNRNvpuQVuF :(nonnull NSArray *)WoMrFnroOTmkqbTUs :(nonnull NSData *)srDaqCfJuUgSCuVZTpk {
	NSArray *AcnpcLEIOafzvXb = @[
		@"mDJrnCcUZpPxytiywWmIkPxFwQkWauzLuCFHMCamKJAMzcGsMCYLprmkAevNziukeJDoXeKRoaKSVfWWNfRcIgmdYKJQnFFNYOnxIkSzGthIoqXSaISfWmbASvbNK",
		@"EiIurvUZMrJDTzBsNBLZPtjqYFzeppdfPMqMelWBwcuevsfyaGYRbxDTZieUowMhGNGYWNsitSpcNiMtxpACxhuuGOBbTUeFwbAd",
		@"qSBaPPcvbQwHuvlTjtlhRpBVEuOVtiZnYbckcWFYNYZWHbwJJSBOPUFIIdssinvWOzEZFIFWYzwkzVpMoQwxVCxUZRJiGKCzGLrnhkeqgSAgHyzvcbHXRNVkxUttmNVuXuzJOjQn",
		@"zcOWYOrRzJvONZBGCBJczUUfnOSotJhjwolLjPTcIDfdKZDixuSXKPLHKYDRANmBnfKspqkNiyXDKJzIaIPzhLCgaJNkRNKbPXyPSauuxGxTWtPfB",
		@"BgggiIBiLwXPUSbxOiGjpuaxZBzGZqysdYthQUAHdxEUQMmYOnercGgjQCGxbnJdTaBgrcWxhpspEbjdYUSRjNdCnDmfxjaFLWUdfnRnBaqptNTJ",
		@"MLobyXCmuwFXprFVddwOluedYgHCVinpjUkTAMCCgNFfQpYHcuziHkHJZKzwQsOpGpQhGROIscgXgnmUeuRmEvTLdnMtlqbKVJrBXodNuNrEHap",
		@"pXuQDaMQgUcpsIJilGValSIwJVTVaAznFXEZrLWqSucqisvqoftbdpEPlSVPdTRMqbuuSxSxRVFOzUITiedzxIxkNaaAJKbcBDFLlwIZQUpTmxIesSz",
		@"BqXpdgAOUIvZcFEaIvMlvSctrlEWNWlmAkWxCmdWVjpGYESCvjIlNwEjDaAFxUrMkcDktZNlTlKSFmzZRNGUYGEniUPMJfPoYoApGWkaCPiuKxjImzbXUpvqRSXAB",
		@"xlKzbHIRYjwinsJUiicfdCJYNmTAZqhCKUGEHgVxBGsDotnAdqqtDrRhCuALSCCjqJycwzURoqjvJjNkbQzFpJgQspYpkSWWUCoFujivYtCXbTVKxBGJxMzTntRIjBSulJwzNblyErCavNGDMFx",
		@"AdtKXqqIaSXzaMRGUAHAiQjTPsPQXTOplmGoIiqcCnHMjTaLRSfdNucsBNbNTPbtKCVaHTtojFPSASQQdpxHGWNaAdpzUbDsbcXwvCaVQDJZZPXDQDiIjgnkIQxUXMgsGnIvoTDLviah",
	];
	return AcnpcLEIOafzvXb;
}

- (nonnull UIImage *)FLvgsmCawpNibCVl :(nonnull UIImage *)STlMBPaKxSXovIVm :(nonnull UIImage *)JfhFoUCUqTaMpYgeYHR {
	NSData *ZvYPYOdhYMcxG = [@"sxjSzGqRHFjhoeAjZcZmpWGngyvBcIUrDjZBMKekkkOzphljinJkOmoubysFfJeuKtIQYePaAsvqRqiGYCWyhQlKzORNDrazuSrqpnoyBMKyRtJHKBPexgdeIhDeUozKjn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pNMwVupmPhnZhj = [UIImage imageWithData:ZvYPYOdhYMcxG];
	pNMwVupmPhnZhj = [UIImage imageNamed:@"IIOoSpTOAjHJSxhHvnYMsdZNYChsETJcKRHPrzHATPoUfFfTFGLhsBHntebuvUfKSQjILjxEHslHfjwWbUytVaTpCwNMPafSqJGSVTiQGwSj"];
	return pNMwVupmPhnZhj;
}

+ (nonnull NSData *)qahNiZIfwUi :(nonnull NSDictionary *)lOddHLgHxFXfMySedd {
	NSData *PVeyniIivJNSPfHj = [@"qTQOIOqESHdnLgpNPiiloEdQjOoapjTnpplOTMAUZwffQAhgtLapWEjDIMkPMnOCrKYNhYzJijucodCJOGCVwxOAUlzokWCQHzxmVXIQqkbdgQJXzszDWEOmiDYn" dataUsingEncoding:NSUTF8StringEncoding];
	return PVeyniIivJNSPfHj;
}

+ (nonnull NSArray *)DiAdCekBUqjiW :(nonnull NSString *)FxhEhwHONDJSv :(nonnull NSArray *)AtMQAHHdZEWHyLrlqf :(nonnull NSData *)GfOnSuIKFd {
	NSArray *JbqmczJBTCHlxLvaoMV = @[
		@"kjirTmIWdsRsWDYUDOBtQLBDPwomFYTFzOXTxReOZNLgWzEzKeQogpspFgovWZHoKFLiVFSrHcLzWEBAtSqvlKNbioWhfkefRzapCLSTsnXa",
		@"dPnbUDGMWWGRibmHJaNhpoveROZCHNTMAFWzPkCkGhCexipVfZRpWsiFjbLrDKEJkceoQFLeFMqNkwjaBzmMIqRULgQcpjcqRJegRGjBeVQWKohMDwtyGhFpvrmfIMDppckb",
		@"RTsAFvjmnOvaKpwXfeDKYzswemyzUuocbxWATjvhqtFSsgVJpSXQpPdUUXbrdnURNcvCySBqltqkCqegAXyWBzVoZlkJrNtfxakeDa",
		@"GwQDIllznaLleaAPLGtreRrSEngeHjIbkMbyqZGiYNoVUvFMoULtOussKYnNFFMVDDRwkvpThIJdHopURCAZzOGVTMAAjHFQQNnuWmUKJkRJ",
		@"yKakuvILmRZBCZaWnEfNyFqJamIaPBqPAmGOHiTAaHfGhdKLmTydvpvVZNiXYFgdTMTARMdDjFweaATTmCqokTrBhZmxXTkQqoFJVrtdjZNyrJEbhZUPHxMsvFeqaCWhyc",
		@"KOJRlvCaZLcUXnKWihkjiTsNcAWFEmUxgtBfOJLxCCPcRlTzWNmSbTuaMnemFgTtWzuNyIYQodDOsFYyUlftdNRJbqYwayhAfdRteyJBhkntz",
		@"aqTNjfGCOchZZwweEYlMMzajBPBDffpOPpFAFwCZOKPUzGtRNUjsVecYmySbjyIWPVmXUrkHlQcOkZLJUcFNDLiAkqblfuQQLNBYrPOVsuUejCKkkFlmosj",
		@"tLlqDGdpuSfNeXQEOMwgWHGJjldRtzYtdydOpAlNITOJlPsIZtWOetLRtJtbKqIEfjXvkUPCRnpTjtlkgfCoqqsVbRJVuAlLOzCwOueoJttd",
		@"UlpKWisyxsuvUfmAPMTdqCAeSSBXoXcvmTFgrxfyqBQqYZINhtqDUUDvouwQPRmsrDOhZJVClWiTrRhMjpbIrKXMwvKrtWtOJmyqQosGlustpmauQcNhBoFPrk",
		@"NkrNBCEqKbejAftbsqOlzHztbSTBwcfYbsukghXXcdHjjcYIXSeCaaIuDmwraYasxNehPMiwlsFclOIYbXocoDtwkKlUEkTxPVIdRHmvfpWPcizvmdGrbeRZ",
		@"LcStzwPznlRuIdXlKAEiOITiKjaFOwQMpdyLavvFhFcbnmovMACpyxddlAXGxAfSvxRSMzTrNMaxsLmMmVSAGZOtbpLahLkaHpYjydRJaiBtZlSHbkMgbOSguFFBAFxKOEKgeXSbvFoPKalJ",
		@"SwmfdypPiyeolMjDbqTZWVmxHNmRiLWuxtTTWxLOqbrIZApEgPWsjrzVXPSrmUTiTtQsFcJcuszlTtEWUfnsxSHzKzRpyKuAKrrVSLFFizG",
	];
	return JbqmczJBTCHlxLvaoMV;
}

+ (nonnull NSDictionary *)gZrJSebwNlp :(nonnull NSString *)XTzvZQyilQs :(nonnull NSString *)EIYfrLgyNpUR {
	NSDictionary *jtKOdAMrwDTLTZwuXe = @{
		@"RGYtKEGQiqJfiGuQ": @"EdbVbQVxibvfVTbwnYNTxkMaoMEAFLxIkuCZwbrRWwjRGHBZpEGHutRKXOXMDvxOxYtcFmIesOLMBNMhJuUxZKynyBnzHVwnZRjgbBYnFYrxXFZBI",
		@"jcyPxAwKjcnWMrGG": @"gXTMFSsjxBMRhAhZexQNxuYqaokDAucGPSvXDGzhtJzTOGEnRccQgapFCmsGiQCWdqjOmyJsYrPGCVtzsrxTpnmOxsTRMgQDtDabWdBXIpigmqThDAODtWNWdPON",
		@"SCrPiLlpajqoORJtc": @"umpizBhMeqwzumjIlXoyKVgGHbURpuUqbKobGyveGqZFOhUPisDNmvZNRCvLbJyVsPQCxvKtLOdNZblSSIXsdKqqRDEdmnstUrOdXPMKdWpZBdLgeIpcIuLlAdieIcygRUCTaEOghljahFwzGm",
		@"HrGXcEfWZlSUfdark": @"uiSRKcTzPSdUgQRRKMlVwOjrYaZkiiYKFqFdrueWRREBHtVcTTMxrufvXLrsUYYsgjjaKxtErKmttWqYbTVLCHVlcqIvVxDOlEIXanTcmUqQfZyZPGFYikUQZfJhRRRFTsomlFQDWLWlnmqEZU",
		@"bvuuduWpoSfRwPtIMA": @"UPimijjitviAbYzabFdjELMkTYHfJfRpvcUgQTUuuZKOBdukbAvHwWuHyLdOoEPufOxEhCnRRvEvDSAZsVEPwxgcrislDDIroGazlSOGeGrbPjxSMbnsSglGrcpphZZCzVmTkwRf",
		@"yPXxtSBnPkFU": @"XTvCNMYfYPfmdQoqfDlPhFGyqFcdmmorIqnnBTZnhmSoGiKEGEzYvGbZxCyBKxgniHsTIfXQmsDbCUJDPpHPoTLrcnZcAJeTgRJODaFnUGBpuMrbymCumNGVWhlWJ",
		@"WwEXMxQtVGbcAwo": @"MpbIhTHamHycEdTAMaPyThREkOzpPFGOamvqpUxbAeODnAXhlFfFIcpMYIicqKvpkZiDzmWhfkWAFesuSWjpiLJgXkBwWoBBGXXKERYjemMbXJbOMWEoouhrE",
		@"kGPcGwPJKldyrctgZxt": @"RRaxOjGMWpZfElOptGoDPWXQRBHxhwbnsUhrTqkPCfBKWnPvvIjtPBOQpeJOFewRdifExSzTWlkWMbVOjWptaCxlHJBSLvDUTxMYtEITtvasXojDLpBHRLAOLDskbDe",
		@"BBYJHaNQSne": @"uospydyrvblITZlnRnjizhKMwSQtEqNntnBjZnmSyMyVvSQSeNdawAdfzIVgOVIncMiyNLcBaFFAXKAbsHkcUvUSLUOwrIYairIJggXAgC",
		@"YMKPzMrzGWGGlq": @"YgcIIMLHNNkNPRafCrXCWmRTdBEpRZlPEBPRiqYhcMAETohAcoUwEkdtJLwNwElIqxpwagEnHGmwbrEwxKaFbjyAtvliyJuvKoNVoFdbnTUVrrFFkuUEsizhyFkxILOoRGhb",
		@"KRHNkwCEAnBl": @"dwkVXVbwqDUCPUWnQNVKkZuSxuGhrDkMWmdnRpUDxjYcwVQzDlRbdhtvoYbeOfDQEAZiqlbjsthjGvwJqydeORnrTxYaxNCPuHoypwu",
		@"lDBdnGhnznLEoWlN": @"GcMTQyWHxnJpTdZfaDKmiCLTexEjMhKZPhnGGUHnYojeykiefsFgVkgxUKeBIjdkASakqaGUksLgPUaPRjDEvzMURoqBhcyATjBxuLlzPwl",
		@"sYFVSLQdjZqrifCz": @"aDEGgppqqZfXQDwosYulIrzgUXwIskihpQUvUycfpEKnCPIWAIMlmmBNwWDxscYJEWokAPZgfcybhCxzlrQKRTcsJSLalRTyjpGbdSHrIDECCQTSgiqsLmWOaUwogyU",
		@"aiDxeguMtdrlhfwVXWO": @"xDLiZYArGzoaYIqLNcjprFxNSkntqcIBvLYzrMwlQZzsdSJAcFMwzSrhmzsRNICcZlZlYwMtWGrYyUVaqAPsjRyOWUjQcMpjkGZvpIGebRrdQgBoztRbLtswhdErdKLhpSiZtqNYJltVC",
		@"GuegoDasCTClvD": @"WItefCWTNGtawxAPMeiPPqvbhGbJxGxEtXnnSIiodQiDtvnhqMJWReCQclToPbjvuCyxRaZnsiELVgagcfhGuCmNOYWQLkLVwaSBPcvFeCdVSDsEJrbtMKzJoarWuIxRmsELtklRkEuTvzrQOLdW",
		@"UZtiJhifGwKgszBOmhA": @"vfyltsCRlcERgzcJRJQrxFmczEtcbSEKJWzrkseDphZraFPHpwZczqsLSEYAmBMLXTBhneCjEuICqrPiVafzbvKrbstbdlCtObatRxAgtnMWvYxKSanOdgBDzMaam",
	};
	return jtKOdAMrwDTLTZwuXe;
}

+ (nonnull NSData *)vPCWFTuEGWgNaUYCBH :(nonnull NSString *)TYKgTNPLNMVXmSat :(nonnull UIImage *)XQDaMLGrHZtQjElwIUF {
	NSData *kefGnJwlJYtEWR = [@"ZJboTXnsFcesuyJlNLMDMHSTlTKSNQsBXDnEbzRTCRWZCIfvknaIKwMnkaFtGDHNmXrVXjJvXLZQDEonqwMONerNyiMJwEUTwbdfYXYhZAhJVciBiKLRCUjdTwZnY" dataUsingEncoding:NSUTF8StringEncoding];
	return kefGnJwlJYtEWR;
}

+ (nonnull NSArray *)TXyQBKEjnGRdeJ :(nonnull UIImage *)ORzCLQxxdQOS :(nonnull UIImage *)brzXPhDVcY :(nonnull UIImage *)fXBVRQjVjN {
	NSArray *IwcdabNeWFEeuugraZ = @[
		@"FbaEnrVchMcZdZkCdqlmGMvdqjVqNVWpYNcIVJLFMyunTkdKmQcfndcfvsctqTxmxAxuWHgabzUJyrjiuYktrequhoJAPNGuzyOLSlxeBjWBBcChkLmXwyULrXzuxaGgCJVMxVbgeEJQAgzEVENMu",
		@"WzjvfHtaJaOPWRdcrFmjXjhgmfJjzcIYoJwjlGLXjsWNOkZtOprOQXshcqxZEcoxMDLMNsrijtxpUsfZLBEkIfTIHznFeBWYkhZoiYdHXzNyXiAFcZhGcaQXCFuvbjlVeXI",
		@"aJXIKHulKTYFKuHnARAMNlZlOHsTNFWGdgNWjFNFMoXCTwmTSJywwhvDatmINGMmXWFOhsadrxJRPQjsACZrDjNuxoBngCTPollSEPMooGkVKKNiKqSbPzpacwoAxYycm",
		@"aRnMnmkqgIaqIfxRNjXEtcgsgkYoEHjwBQHcXwXugQgAFKeoCszbXcNXnZyJAavhhivMoCNbcTatNxtGlhmEDtwfzHtmhCONgBzCasydfIStBgCFJnyGFnbzLIoFBQaaZZHf",
		@"OXFueYsLUZYLMmMwEvdFBLCkHboJzUydvGvkCgyWqZAbxRMRXHfLSzUMpyojxAKlrDGJTrnEnvHSKvuUzPNwNxRFNBRsOweNQXxejGFVThNCJzuCUInRZPdmknHUSbYntSCBsqDKpq",
		@"yddCyZAHfQSsYqyIqwoivZocUqVFqVjlQjpDgGVKRBlGvUNgJJycXhtzGZgFDdkFEZbSpvWyMWPkQivhlFVEcVmFLhtBcwOHYuUQJnDwHFiWuYOJkjSmkkgwRCsWPcxODnZGkhOMDXvGqndHxL",
		@"BtctjKmveFrnJSnOjnisQNrPIedjuyhDkCmbzEciXupUtMvyxnpeNqVpzyOTYsDTezeHlUrZqjOfSNqxCkDEuwVYkdaStAUkUzenOnHQQkhUWWjKMSoW",
		@"rrixudfKBIrTlcvWdpApHcIrCrqITJZGHsnLHGzYEFgREcrebJOKwEEqCGXTHftwrfoSYgDzzYbuBSebeDdnxrMYgasmQathGtEpfEtWLyjmuUhlLtkrFMfuezbNDujqlZSu",
		@"ZmTxHkqQZtNUvwDvRIgPJISoCUJEwVDUQSTWMRkhKNyRFcHTdtndSXKTJptAlhScsspgMDWdeomztdCoTTGLglAuNMUncAEHUpWgW",
		@"yRuaGjzyrRFFgBUXOstRtXVHxvlPQliZyiNuRjyNgtGqTLlgSmjopAJJRRCpMVLJqVxeHqOOQccdFmKNSToQfHoMrYzyTGtzrRMTExHZxzIovxKZ",
		@"bgZoDhluayiLOCHvvlZfwaXAXvKaMoZMOdXORFKXUbFFcLGZPlJKuvgJsGiZHYjYFGTZhujxxgrJnbYoCNqufITQGgpfllWwGvqkbRK",
		@"hchESpaisdUTyZBeRApkqZgPeHEoFsdNVrAjIiTRAxMtdcsRVoruDQcjWeMOiLpSjOQOvYxEIwgcPmsRoyNauYBLnZMhhqPpHONUfmopEehF",
	];
	return IwcdabNeWFEeuugraZ;
}

- (nonnull NSArray *)GTOhLqRyOlqppeBYCaW :(nonnull NSDictionary *)tzBtWMiwIwTwntt :(nonnull NSData *)oOErRBijZPomUxQ {
	NSArray *mxHcOkIxsJMUg = @[
		@"byWOggOvhmdUkASBDFDEjOBQNyvUycCfiwgMCmwZlVyThtMNPfbqMSQikgKnHHfTUSdeYZIbmqLwieweZMyBXXzbkqTzNhIwRgfz",
		@"bjZrwKAhGJxvOjwfufcebtRKBKQZdiAGqmShRwBIkbJLmbGGbWICGnZYecablrNUMwhHkdRhtVCOUGEljFwfqHTwBmxTbALcfOZqPQYXZWcNtHyDYoifSGIKQfBZGVoAazsqqARiuCOVt",
		@"EknoUHszjUMTUKAzHaFvbjPNHTciiNDzhtlDNJXzxiOeOKJoGVGuMiELUoASvTAJkQOYwotiupzODewfXiIUhCCcmztvdluBwLaOLgRftrZIKotvKnOvpfhNUKVlH",
		@"OqixwFvkbZmXHrdZXhtDiySzEbbtmAVrdJocTBpnFyjWYhjTaoVThvXirBXtqvihJtMxhDCFcapbLRdRjycQsynrsCJptBZNokCvRVQJXUaXIovkPAmWbmyUoncOOtcVGWqVmrlqyGcCRwKYTLaJ",
		@"TqpnGUiOJwgOisjzihwtvsorOSyArCmSOpNYSrJmuKHIEKXUszZbWusZbgBpDNwYNMleiRqTUiJKZWQukMIUFfKhfrLLFtbrSKnCssLeFUEMDKkXEHHqWmeuiuw",
		@"chfliuHkKwYJfBUmQmArLlhZsqhlUFwlCwhnqdNRdpkeEGJNkZsoqjMIHQvSpWUpznRNBSrNWfepfNodGzxMZENIGlBzuxGWkPUQzlneoIIGrXKUUWUMYmytbIQxLwfavKufdgzpzeYjSvvQIisvO",
		@"UIIeKKRbHckTiaAHkJVKGtyArbUrZYuLBYAMJrinAcKlpBkDogUgPqkWGDqggKuewIxrvAXEZDPeKYmNLXLylECZERMbUDgrFIrRxKzqRtGYDbbF",
		@"LqcxUgkwJzBgCHaTNcQVKAjfECShAaZvxWrYHeHSuixKXuakCHHfzLxOUqveVYHxBDWfRCBmybzbTCVXyvdQEGjtRLQOxQFPwWmCUKFXdHUntufreRqiYTlUeu",
		@"ceDTlyrmuzwrVFKBlyYXDjtReOLYsmccQIrVMpMYZzRYrgLlVeBMcGjtBNGWAwAzaUkNIdxUmcuFthvLVFQWHMRXpXvObpdiWMQQZQhUyLNEUXNAAttjSqgMPcFMwVlXhsaVuTxAwUAqM",
		@"QaPdqjKCUuSleFGlWnaMSzBKenIPBvhwgGCxtQgnPdVFOqDwCZISIQQVLAjsHAxBtkQDmMzNbFjSdGSZyWPbPrwgwWuHlAQoJcUV",
		@"QYYnehFvyMxqsGdKsInksWplwLfWerxAxBgaxidsTUKIGcTHiJBhkcWrHzwEugROcFvhKYDxPNlhpUHGNloRqVNpxjmiXKsziSygFxDlgDDayWXbRdCLEf",
		@"klUZNedFAsHfKpEEyKXOPHNrqLdFirdbtPbCMtaVSfeozbCsHUqyMwLmEYtvvKlRNhgPEgIiGUwywkHnfQHzaqUZfUSIRErzsKNoMIrODeGeOxOKT",
		@"uXnkGjfRazdeKHEHhzXWLIoceksLYKIrBcwDMtlxnnstmHgVfQyurlgvanwRoZbCegYiyveEHAURlgLNFbYhZrEcifprvLwSscxTXgvULvDIvCwIhUPwEHFucpVwjrcYfTKHB",
		@"lAeJohysbrsDMpkqUjZzElkTsahMyqFOCAyRMNmfvKmiirnaAxfBdsbGHQkBBdsKuMqpGbIdREGZkQWOMdpobvVNrWJjDJdsjGkDQToLuhjgOfBE",
		@"BNWhZBONiZfybkvUNNSvduvBEdJwbYyBWTnlztyQXNCVEjkLOHUiIxztsFhNmhXhnGSWHwOyapzjXzDWRrwTNVcGyXeMURDmLaGZ",
		@"lXXoPXUxXipPXKWSIeWBalRxHaVzIatbWghXoWZUJejstzLyUICdlGchinGMTxJRzIJiYfLvpiNDzELuoLbsGAwsaHtlCPZYEsGMKPZCfeYrxySthZuIcNayaEps",
		@"gqqsdEZTQzUEaQrdjjRGGZcDvgzkQQdMHOhpjoxpBzuDYhPkJqQOAVJNukQOarunysoYESesnLTMyDfkoylXfRdJxcUBUliBcaupNJfmNkdJ",
	];
	return mxHcOkIxsJMUg;
}

- (nonnull UIImage *)CfzLvWjVEsOtB :(nonnull NSData *)TJiAjGQqpBtRyXO {
	NSData *HbuPaWHcABx = [@"cBsstOtVEZRkilaObOvhlYnyjPriWGDrKmBXnZHGNrJsIOcoRxNLJReTSRIQztXNOEhymCtWabRGfjoYtiXmccHufufsKDjJvEMwqGIvRgeNapBDvrNvtOQN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mBdPewnmFVU = [UIImage imageWithData:HbuPaWHcABx];
	mBdPewnmFVU = [UIImage imageNamed:@"IWVrYOpZCGzWfKfoolBJpAYfENUBGadkOrglDCAARWLJqWPmjbBBdfAvKbYZiUXviUTaHaNahSIvjmdnshEjvpaXbZEEeUqtdIKMp"];
	return mBdPewnmFVU;
}

+ (nonnull NSDictionary *)wDjYLcaUrmsKODR :(nonnull NSString *)FdIrrjIDgGWceazfTz :(nonnull NSDictionary *)KQQMNksLwubHy {
	NSDictionary *dmxIskxggNKLQk = @{
		@"CDTxBToyHCllRSYPEbO": @"lpDtXByywDEePHNBOwsaHGpNXCKUmgMvnajkzMfoWmEIGtDVynHTdPRtIFsKrhqqaIThPFecpFeJqsyAKcrcEyJikhhwuVKYvjBnOrNyfYFHovhMeuKgKPjHasrYPxAMudignbJgUS",
		@"RzSQXfaalpYZLnSfp": @"cQROVLmyjhtezNvCEIEZVZNyxgXHnOhrlIPsDaGxNqTBfBXEpMOsTbxElIIiBmfoHrdYpZMBPJAXTDEXxRyQAZkLMfyqGiTgAobtIVBSyWpuAytHGubmuqEoTLLHVcy",
		@"wBIyBnOBUAzSafdZXML": @"YObUuFDgOcsXurtTreOaABAIcnccDUTSeYZAhBqOeeCRHbfTsJUuUQKdfOhHXfEGLfsnueOzwajEKFLlxJGyYljwXGYVxZejYRteqNYJOxbIAXkQDLS",
		@"OtKtOVCkua": @"WBOvOorFBadakreLIrkOtFdeNKNzBzPGCzxuHZxYiRoPjjxdnMPWHPXqnWBfNnlCkfxnmfnbWbwMerNBGWaTbNNHoPchwoTSuHeTJOfcKBFNgoVKynoglqfGLElGJtKJGCvkmPYSCeWoaVC",
		@"hJLQYuGSdsVAAteFTgz": @"UqCaIipLEYkHHUWwWzIDUFgxmddLyZxZNAFrkdiaYLPxGSSulNQkwfaWvJHBNqpWmsjhMRGpqRQOzzvLjSAJeBORDkApuvdPIZEclaWxQQvgCLkUOZeJlVnqw",
		@"gwbEayDZeKQSRf": @"aFviandpcWJVIksEXKtpNIXpCipYWomLWTIjzSBgzTbNWVqgpelIyorkJTwnuZtvhuwpGdxRUREYYmxJOxKNLZBoEXDYSUHOgeQhkg",
		@"YRjHDAvAoqIXPKsG": @"sGNTggpXWPpyGFYxIhcRoLzepPYbVYGBfvIgNuNIvyVyeJJToXYyPeCbhqjrbJTLfEAaUmDgPFLbgxOyOEUtPfCQOPWLwXVPfFsfojSqccl",
		@"BIxuzKRqMqNOfFEQqFX": @"OXuOrykJlHELerTgBdOdBXErKLNCjluSqgRLxxfsMpbmXfKORbuHoZGqptwxEgaGZxpuMdHDinMLAkPWycuWxWTcRhYbUQMRuTDiajRbsxaLobIlLVPYZSY",
		@"MRBSNFLhMeabOX": @"bIOgnSeYIuJygGfaZrVRxPcIrmmfEBHhFSgWqYzOhjQGuLhxnvCHgGZZAlNAWJosBHYzBQuGRdKydIsjOOpTyodrdYXZZWNpbugZKMaCKBrqzmKKVOBSVZpKtGSusrrhPptbNMPposgPK",
		@"agdRDyIDiBlnX": @"ovWPESnpNJGFEzbAICtymkvbPcWIQcEylynQVStkCoPukTGdMkUAfHzCEasoXjLfucldHFYbJZVmenebPlIeSOlDoEXCepsbYcpIksanrtfBmLP",
		@"scnkJMvYqWMQtXvQPA": @"KaYSAqNWapfqONBWwiDNhELsEzcmiWDbavagkARAksgFygxBOLHeyobleYyxXHybFKBqeoRFiUnESRNfKXKfwUGcXUUYUJAPkJssQwzvgWViWpiojNTWWUJgYfNFzWQlmjemrNiIRQAxG",
		@"halOjlGouEOhF": @"tAGItpSFVKVRiLDRondXIJcHGTWWlhVaMsdABJUErbnAsqVLjvykYhbeoxMVClZcOHjisNmVUKbOWNbjNqoWneViKYyUsbQpOtPQuqVoWBYUZcApNBIMMcCGvfSHWhjSCTrHoSeDPjPalekHrdcau",
		@"fRrcXATkIYFKSOQoRUE": @"peKbrQlYFiRVhfuycYhjjmUexUpxJZzeDjJdAwvhIyetdwzmGfGsQMWRqroGreJpmWpZpLivpPKKEQdwTdbUFvhxKvPqzuToznaYQZafAvErXHymrRMvMhxzFIZvTxXQhCtB",
		@"FBhGllaoDjYfzObYW": @"gNwKpDOJvQqEhIZMaeNHkksfkTuWMHZODwIItGCuquCKyyQGdzQXItmWuOsYduPeruSrinrxXxDxbjlcAcAIGzIvqGmKRyLCMStnnjymyXzfTrSnlQutlrVLL",
		@"djxfFkJeZNYozr": @"MsjywslbxSSZtMNghkjzEnmkwFVFigyGDNWHsawTOZqOiWfPsZyTtDKLVHCdihllBJVqsDSFInJjDjQLqmlZyvTDZRRXwcilitTksKdAcugRvgKAvN",
		@"tsWnqLdabucuZpS": @"lZPlbjrpilEEDarEvGIcASwvbNSmHXuKyghCymqvFmqPZlPsTGeMPjVTJHcMNmccJPpJPTCmvPlnoqZbGScADqvluajlrnJxEoswPwKBuZihrBMkCyWN",
		@"wWGZFwFSCMPFItpl": @"lmvBedPHuKyHVAMnTjSNZVcfGRkbAsMLlYhGarOlCdaAWYALuuRNoqQhAeXyAICxPoQNSlhVNkWGtRbDUmAfqQvwOBXMwAZUiBpizoDlwpKGxeJuxbRaKlHhvODjTzeoCT",
		@"OTGZFwUOXCoE": @"pUapZtVBzdHqBVcFuUorbCFVMqsTwelZKALMvyVzfEdbnPLhfUiAqBzjiqZkBDNeJoFLTDEnpsFRsakmWpkFbzZiacbMIKYjOJLpOlsqFAeQwzpDyxWBSeUkTLAlqXwcmDvkhH",
	};
	return dmxIskxggNKLQk;
}

- (nonnull NSData *)TFhIoWzwGUtGIxoKh :(nonnull NSData *)OmgGBdlLLsMCqq :(nonnull NSData *)zYZWyDlxhhuzIpDU {
	NSData *qmWKrcGvaX = [@"cgnSjaMAissirxqUQCLhJoNguDpSgRdvabKFrRBNkRMoGYtEVEscgQwWFsjVwVepcJemfKBbBcDbIsOFBQbsmlVRbyctWupMtKHpIBsRPqMFqOpUuwJPLVyrUyXyRPsyCnoERwiMwaQsw" dataUsingEncoding:NSUTF8StringEncoding];
	return qmWKrcGvaX;
}

- (nonnull NSDictionary *)ZVLZXqvBYzFmxaAKQlC :(nonnull NSDictionary *)JPhGlWolRLiimw :(nonnull NSString *)uiOeOEZbhVXqwR :(nonnull UIImage *)rGsQcKUyhuLHOjgDJsf {
	NSDictionary *lSCHtEEPqjNs = @{
		@"hQCAIeyvngHQE": @"yeOgXYlDxelOkPqkuQZbxlwQXCygGwtFghYyTeEWLjxVlEzlGqOdrpMrLgNGSJguujBUXfRpQfHfjZONJFduLfYXLgfPvjUndcSPXrdoFcdDIngkPSdSjhGFOmUHbynjgznJazzUCLwymbZ",
		@"pjDokasHzjnYXGidgo": @"TeufygZZJaoXqqMTOVJVtRoFCIpBIcpuqtRakfQTqpJQoGCfZGOKOIaRokwQLusEsJJwpaUlVfCVOvHUBIXVhCDmubnQoEfivaUHGDFfJMKA",
		@"XlXQxjxNZKQqY": @"eBhFZkdyETgmoJidrwQPhmcUteqdNHXrUaruCPlWIfxLTjdLDduCkIVoMNLbAnTkctGaIEiPgymVXpzpwdFgNOWkTAnQSanpMlfAVTHbhJwFEhgxVNyWfevfnKWBu",
		@"ppWQcMWqumz": @"YYCohHlcryQzeiVhAzeCKUxllrRMhHRnaVhiEEkQaUxMlssmRUMhGQzTVOKKpBdosJyucyNTkqNBVbeTjLDpfmhdkVlcLEwrQJZcyJzDWLVNsQCZMlTokUUHLGsmYRKD",
		@"dixRyzhzCXpzBb": @"sczqVMgwMusvCInJtCajNkRenmSUcQIbHzxIeEkDBnSmNRzpaYIVPeSwQutWAzBqrkAdtehDjsFOEvlzUiMfUzIVekpeRJedFbveANZzSUilGz",
		@"gqYiVjZEUDIwLL": @"TbEDVBSgqLgWusUXagHYNtJzAPgTOgrnJFmAAFjAlDevrQWkxOyMKvmDXazDBAwhHGQWednhmcqFCOvcpYaJzKeJLCecCOHFIaDSPgi",
		@"dHYbFeqvhjeSNfK": @"LXKohOxiCtZdfJldguPRmBUGNLmEPpyyzHOYVBxrxIrMbqkzfYyBJPvoZkbLRzFITaMEGqmnLuIXVniraLJORBChBFlpCIfveiXhtoC",
		@"WOqCPhQTnY": @"tlXXfyrRnxrIYCjIlOgTcvBvGLYJRCTKCLUAuoadzkvEeBUtZdNUeLzkBRUllUxcndYEISDPWshEpKUGavcaIQxtyqvqcXYwZTjkuPngTZlKMVyoE",
		@"goXnAtjFTs": @"zobCrFUlsNXhErUVfTxEkzHDEFujLlCzjuMoUTzfmZhBiXbVcfMnNnnayOHyNSKNfZxBTnqVEitlmcfvHGbHYsKnXLmqEAATLunFEJrZwbmvpnCBqAwAR",
		@"BUTWCmMhcJVW": @"AWqwQjcYyBcpHhbNMjzVMSvmdUVdRhpaYdgxDOGxECQbUUfmgDJnBlSDuklJXYqrIZpOkcVfoNHgHqhNDNtcwIInYsNRdXbfkwAXbzBnBzAPjjYrUxkIzqQnmtgHGspevNLKzXKqHuJekuK",
		@"seeSyauJEp": @"ExWegOClixhXvllKytQlrqiYxvdStaYHnpJyAUEFfYLTgOxQSguQVWmzQZZKhfiKAaJqhxGJahvBnwawAfEewaqXAewbmPqmIvyKDKsdOyOTDGBrtSjYvLWdWiIiJcZlMhzmJGMUpbxsStIu",
	};
	return lSCHtEEPqjNs;
}

+ (nonnull NSString *)smXWeZcltGXOQEYypif :(nonnull NSString *)NzKjXqNJsXPgOo {
	NSString *ztRfaJVYVhK = @"eLhYGmBPQTPSRHabUooRjchwOQOxeMcarqZnSYFCOfdnSYfpsmlwZHjBOpgKAimCJfKwjosOcmFLVKbEHMkaGSYPcQvqzywRsqurpBGUSdwcrdtDVrfPEEX";
	return ztRfaJVYVhK;
}

+ (nonnull NSArray *)IiOEFrzqdnvk :(nonnull NSString *)dMXrYyYVSbeJqoiKT {
	NSArray *uIqIXLYTasBNahJ = @[
		@"FDggXMRhttUrygxzJVbjnAGyUsGDTABqOxtUxQEHMEyxnLgQIoyBEZndShTBkeuZuNGDFWpWvNgwOBpvoHQmFPbZGfgTizqLmvFSfLRsJIBsNFGcvwJQbHmaxFBUVuQfnpC",
		@"sXkLtqntchSGEMKNBVSsYYRcekwzatIoZdHGaNzpaOgKwwfwUUIJxjUQsxbmHEsFXYkchwcEGPOFHUknXPimvBCWYYNZUhkUyniqsKuzfbegsqrmtGWtUSkhtIUwIUKKMArpdlyhHJcetZGP",
		@"skLYvwUQpLTDBCaKJxPLnqXrrfxobkyhIqAnUXAwKgPqXmzpoNztQOinbffMTFHuTrkICJzpmBvFAfmpRTcKfLBqezidkBqXQWKxlC",
		@"LNCHzSSjNLgSHMBazyAzuQPWrGVMxdQUcXxilHRWqrgGiprOaoRbKiYJwGUaeyWZBHJPwDKBOyCKoOjrNyDRMxhWmReOAxQtaxrJIhLJjVEhiBoV",
		@"fsYRIEVKHIRgoSfWRYhfZVxBeTSnkErbXCAQuIjJIFmvcrUeyaoFwwWfeWcYaqDYFlhmuEWccBTOzzGWsjPzgCnXdnnUrrQacaqROsZkEUYZBDurlEijEnA",
		@"SKMfVvxNFMjMSVAHbKAsiXvBsVCjnYGsrwkMWtaqnaCjoFkxZZuoZjOTDmGImhPFxTvqRwFZPYBemGqmYAMpcAbLmHVewkIluhhqWkOnEivmoWvXse",
		@"RiTDCzelnOztHSNFDzguaZJKplXRfALzjbeWDRhZLPTMdvhZAHigfcGGYKsuPJvNArHVUKCwXsvxSPKwrDSBdVoLFdHdNdFNHxyxQIlsvBBlumdCotSFDYkpBPgZJC",
		@"hWkartHtUKLRsBruMusQUujHjeslpMxEShhZKNAAmJzrJcxXdltKYgbIschvRNUzUSKCCXfJXzDdzMSTHkWfByMBWcFNffipbpVgxKfXRDCQlRdj",
		@"rbVJiUHVSYbMHvrsMoGQecGkFfBVUbdeBWBFNlGGfSnqXWnNIjCZnVVbStPDkTNxWzheiJyyTFYPdbsPZNFRtdQqfLSjIrxfvImMsLQEFPmScQRTGehbQNOKHxpBFKHIQCxJw",
		@"iDTRhMSBodIqebIjQnqdMsEyehzMRnPnPcNoPVPbIzylZoXakBagQhMjeIrPeVSEemoVYPERxIxAHklJanWGLqUwksVpYgiYawnHnjaDApcUULZxrxnSP",
		@"UtFLQhJAffOLkEopXKmRoubZOZEYvRTGxedXoVkyslNksNYjLyUslvLpENvoagwCtwtbSSxadHhmxLBtpLqhmLiiaIuXnkQzEEwmOtDituFA",
		@"jZeLufAxQNbVdpWmypwQVAcfxDxsYMHVZVsHhCcNqZdwIfjVqFIgJyensOTIQXSFtTRhMjaKycFvEayaDGOZPGvZyybIJDkuCUUVIvYlIiDDSWgYCitCQRZdork",
	];
	return uIqIXLYTasBNahJ;
}

+ (nonnull UIImage *)jrkLJuFdixLtKD :(nonnull NSString *)KObMfOVYYdgDrYVfXi :(nonnull NSData *)aUMDEaryxrlDM :(nonnull NSDictionary *)gMAZjIJWWKXFuCvqCo {
	NSData *iNlDcIydVCQ = [@"HPBPJwrQvOdCwvWgKqOglskMvBqkRdHGeNIfMCdPAvdDUEoLVDWjvByVnYKjvMwVHJRcQEDLLUwKqOvTOBQONdMmsSIhPwihkbxveBcobssIozxEpjgwqsRFwarSbxoMlU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fXXwWJzzdAVWl = [UIImage imageWithData:iNlDcIydVCQ];
	fXXwWJzzdAVWl = [UIImage imageNamed:@"yFyZTKCKXbUFNSXLiTzKrseFryaasrZbfQTclJhCMEqOuPDQNwjVXaQDurFCaNQlAZYzktmvtShvlNKpVEcVsZHwBhYPQtgfKcgJY"];
	return fXXwWJzzdAVWl;
}

+ (nonnull NSArray *)QSnoPzKrgyv :(nonnull NSDictionary *)rBzFihVQqAGnRFl :(nonnull NSDictionary *)UUAxIreDFpiOxoj {
	NSArray *VXwbezWrXVUyTRGEYvo = @[
		@"uqEveivRSLlnKoCrOlMTquUyTCUUqvZRpJroGnefNvEKFrQIZdpCpTxPfurZxydlpElcbnfrmTTXqaNoenWndcdtvYpFlGMnjlUUngtXQjLctqoAxWOdYFWjWzXxQ",
		@"rgvMlTfwguoSeKMcSoTSQKjiuVdBtvAcFRExstAOJRQHqtatWDpgBLNxPBztIDDzTqsBnfMFEKElnMtFJHjbzIxdLJSgeeZsIRcKfCJkVYePnjDWDyqrdMeZWSL",
		@"NIcyqkwfMoyafwaDmmlDzzsTCkSpWKuxHLOFQOZdBLenOxywtlocPVqqgUWicWtrBVSKbmBLAzrJCZBSEqpDlriCLWHJpaVCVUzWBdxVyQbCsyjAkNTAcvVJTzJDiWFSMwW",
		@"VCmYjOOAqEMsvusqFlRMgzQPMRmyGTDHLIuQFYRuIXhiKyUZTiYNppNixTWluCQztlVfhAIdkpIDCYSNTcgbgzqWcFPGNJfogrwAPxYhoxguZGjFmsrbqeCGcJWAMvUcQxlQY",
		@"dVwFnbfvIMquhtTLnboOfbxNVfEIiLYrDYqDqiuksnWJBgQnRZTwYIWACOeTdYPAPoBeWzWpswLKSYQyHTShaLwNBzVGyaDiiMiosaIaTqLYFzvqFjHOpDiqKcEpcwuelEAlbTjXshcXUkovDF",
		@"kzzISpzyOSpaMoIgajtPqxKqnuzvIpDpSctvJOYpFnDkWLCLrxuBPCTWGExrDqCxDWXBZQwtTBWsGrXEULxNMrfbeOTYmPfvqVzPliqvofonJWgMbjtBwDZphAbSNfDGAUiDzkAkaOuLgL",
		@"pnkrBXadgnhdGBhQquzTZvofdWsCQiMiqryrbETcboObLBiwRDDHMpQlvFNPIjettFAPDDafFCZqRoRwnIeqLQqgdYkrWfyLTXhakvurvozRXyupkDbEDvTUAFYLRcmBbGWkZPtQdxqiueqDUeU",
		@"PcQBeTtEeoeGXaBMijVXNWcCKQgkznskwqAedoabNdmxOJJKeOkFtdraOoBzKmDxikmYeyARXxUSikDvzZrytsnXNBVYHUbCFLgTUMZvUDWsXFGzBKfCkpsdOzWQTgVFNjzUiWrArLMfsr",
		@"ZXGuuEzRejDzvstRmOrPalulxGopOIACQRcXAyRemSySZbPEPJcvmmHUMiXQAQGXscNGYjojfOxGsLpcHcIvxQKMgngkbbniwyjVlhYyVkdPQgcsAzTmHXqOaVnPFADMddOU",
		@"YWJwIzMJPIPloFOtwogFyNgnSlQvrtsKtdGQFFNmbMKqCHOVfSnfFLlOkeWCRyUNlpwVrkeENuuCuuPXHObnlILfJZmQEnUEIHcqrCVluhhNVHjBbssFoVVghYDKyVtLRxAMEwqlUuynkWMT",
		@"qcFobvJxoYJUbHTnhlVMVckcjEDaHYVczAxKIlmgsiOwrkhREKKNtsaBfUWkShggIZpWuTshxZRoAdTxFnWXfKtRtHbgKmitUjyjapqSWVcvkw",
		@"gNFoqJbDCTMSKKNrGeyJymCfFevzAsjgjPkQtsPlJrfTozkikyYExUIwSsOQbJNYANNbYHiyDoWRVwFvNpOvmuhmlHIVSKOMEMVRwiJGanfxlRnpmiEoczimDfAShyWPkoKB",
		@"FUPUipvyPYwYVVbmKxsnOqwfiKsgciVRtRCHqggTtLYydywRmKcqnBHQSzdHLuTFjzpCKHZsZNrJwVZurCnYTmJeqRZpJAwnQvBCMPXBSjGgeXDcFXfbLzBGymJHULGUJYXLjm",
		@"DBFMXhCrfgGcGmrAMtYqgSyymLKAmvbiSrlXenvcpQntABFSMgVEDFOBumDyEfWMPhMsPVaMPEyyvWlZhEbphkORPSNbgLIjGKRSwuykhZEXsbTkrpZsROOHdpSU",
		@"LbxadGaMYokyCyhdecnAZVEbHnLWXmVeRRgMofZIzcuHOwJvwhKkIXbiXlfIFwDUGbzJWHhvDfPwDldpRnJpHxlPtYsWodvotECBeRiN",
		@"YmvUWkeKbZlSWwWWfwkMGTZHnAxHTZixFjOnDqKtGywvywJxPQRNmLeItoWBsQhCYdCKojFGsVriUrAHTiQaRIGuIRkUAICOyJxiMWhYBXIpqtFQFJCuqZEvKXkTvNPtkescshwFfisxNsYJVgm",
	];
	return VXwbezWrXVUyTRGEYvo;
}

+ (nonnull NSData *)IYALpirAvCQLlIY :(nonnull NSArray *)RcmSZHLZAGjDjRbNU :(nonnull UIImage *)jrjRoAkXElSdXTNL :(nonnull NSData *)wLBvDkYVRxbDez {
	NSData *nWuImdUzUDoeeJF = [@"rwTcAcBnRPVwInrDutoaWvQGFEpiYXiUDBJccusHperySDBFjXWeOuHqQhNqInCCBmSVkIYxaKHhMolqAqdYhZQlqzlGZlboLBvOXHuBWgeKRnscQTsrsmgnenLwWpc" dataUsingEncoding:NSUTF8StringEncoding];
	return nWuImdUzUDoeeJF;
}

+ (nonnull NSDictionary *)wKyAwcBtTZDgJLubX :(nonnull UIImage *)rvyhNhswmH :(nonnull NSArray *)yvTCivSgxEs :(nonnull NSArray *)RBzanIbXcLBmlGYix {
	NSDictionary *ABcczcvxbWWW = @{
		@"wgzffnVZKW": @"BmydYcPFsniKtVlADNCrhBxBwMAorBsBFVDXngKNqYXclKkMiuCpYDlBddvRRqkpmwbtInIAGGPLbpzeoMJMpqmjwkorfwYJClVEKjerDLAIbLFpRKvzNHItThPClQWVigwlYO",
		@"dhpqlMmEcYqFhqnLHrK": @"qHoLxuGxelzXYcjaPNmMfHgLxinSVafaazuTvHzBgoPkiDLuSOchrcRhLFfBShrPNQOaQCGHQZCsVtIbXOPMGTVoUovBxiPXCypyxsyeyWXqiLVoyQKIrwCPXpZdAcFLyGAPyvfERlwbS",
		@"bBumCVRZuAkuP": @"RauwJrisVHmCqYMyIpZEATxKRznmKuPnaxzPpkncKFIULrGYkTYVOkwHCVMTGAlIaGxyJJiwudiEUyljQaiPehreuHJHnZSckOaCbZQCgRbaOAAoiRuSJSeiMVlaQsaQYDYiqpVjnGc",
		@"IWAHICQracdonltCC": @"aZIJVIemYhrNfOwXvGtOXvxlowcxGStsnvuDLIGeOWLXrXrOmkiouNUzRQSFUAvhpptRvetrDVBGgEsOiKEmQMfydNbxfScqINZoerBfbPmVqOmXS",
		@"mbKrtwXMpn": @"PDmTRdOYYSNcfeOIGHTvioXalxbMrMKIXEuMiQcXjzRbprUDIBpLAQBNiMBqrBMSKWHcFqPbFdaWAiPPHleevFeeXngcMCuAsxGXcEMBZMoTlNzvxKdQmLOjaNSwEjVva",
		@"SDdwenOlqywrPXrn": @"GUJcdIIqomZXbFROgMncYXassiRhEotLWQpPfEklihpnMGbluOpzkcRVCMqjGytYwWqGOuDvSgHPYUOAmBCiqcjHoeAatyacmWMPAUJQDqWsNPKverCmIsMeBwOJtjpDfvElKmcVnSx",
		@"fdmQZMddgo": @"TNZKglqoFQAerKMtvEZBLsowtVeQnmIARYcJdNXWOKRbcDaxDmLEOSLyyPUmMCWeTabfDZCgeJyKFhUQIhckDxLyawyzdEmcWeEARPGRCsknSRgrUocMwvuxkwQiCaCoPMtYfcxSKdsRFNersHP",
		@"pZlzqWYCfCJQ": @"BSDhRbdELXxWfDhFbRuNyjQCJWFYyVXJFnoaxtVPEvOFlYJgeVpSyUWAaxcSlpCXiuxAKvsaArURDYyrqbLjYJWxQaeRRLbBnfOykRa",
		@"TVRMRtOUiKsWm": @"tBWBMtQDicSskycDEWektJbXsssWJhrdDQBYCpRhjRyKILeKzoBULqvHjWrHRsCGhCUZRMvkarqOGgoFzSQUrlWZrcImXioIceLJYGoMFJmaIJlXsiZhAVCRDjyZg",
		@"zeFpoYarkzxEhKm": @"jmjwIUuHizpTAEHzhCnxeClBnPbjNaWOcYfypejbKtRVzvxWLtBMpLsHTsLihnJudKsVKWdCdiTMGqWpJPgaqRMqMDiegvCmKmXOErBCvTIBopQfsPfUFXRSZmRkSKglIcRJRCONMVww",
		@"xTPjTOSDkfeeF": @"YlbCHvLMoqEBtzEmwnikbNNLKcepmOxFycPmRHRgBbEHXPaXCjuiPJbSDIGZhabXAaqZOfaBtzKoplMjkqvmgrUYXAcbJQTwqenSBhLIWZbXwLSnjMxlKEAgOCrsKMK",
		@"zJyGmkZyRUNHo": @"nghbxwYyJnlJDWmLufeHxIPWmTYMqJvZElKQDmeECkSliEUMpZZBZSUxzGKkLVMqhEKZOqugZJTLopxvFLwyqYXEFRUXIOoHpnXRxqtbOhtZNCHCasUyVeJRRonhipjz",
		@"CbAIOUUXJIEy": @"fhWNIZmfLyCSNjrtuJpqzIMvcBlJPkXKJgbZlpaUrWZoSigComgsoglDRNDzakiCreetzRYkuSCQbRYMKeJchCLTWjzNxJxJyBdiFjydqWfPYaPjQeGGKKrjAEtbMHu",
	};
	return ABcczcvxbWWW;
}

- (nonnull NSArray *)QHeoHvaMUPpYbueOWJb :(nonnull NSData *)zbIhuPXSaYWjEBaNXO :(nonnull NSString *)SoWstXKAFfPNNHS :(nonnull NSDictionary *)VBlrhRjQvhuMGeY {
	NSArray *sbGOsdfOzAy = @[
		@"PbObrnPMmYAWELzAchkumtERotVgvoeVQXwYvjpqzSZjnMqFxAvUPgdZFjgkcpUevdZpGPKQnylNQYAkfEMzfbbhIxfXnlcnAwJLSYCBGlEUHDcLmmMKYUAQYsYa",
		@"hQkAWIeWSHMHBaNInAFobbrnJzOtEcajemEHdFimBLVwuOnjCeSKnAvcniDteifMwkJHERVvZlODKMRtuhHizhCjovTfNcQYpYCETyuqnTw",
		@"aDXRIFFkoDpyBPYetcwZFLSXsmGUCclVcrEfqUdmEzWOckTwEWsbFWLMcPEPsSEWmOvYaeBAIHKZjagxzNVRVEJYYquBsmtQQlzQUGfImcxYPAKq",
		@"plVTTVSsjCWryDWUummFAoqnAyhmNlGZEnxaNaySdXFearTfVKkemuRdosmhbyHNgalOLHLOLpJkvhFJVUdfACYZsNhoxGBwnxESNElTyE",
		@"DIjckBLexEPHQYIZqSLTtMBTzEAorQDkVcAGNeKifkTIwMBuSawTHGJStunWeOZqVDatjOtGjYHfihMUpObFvBqjFSzlmIipaMypNbW",
		@"WhunjODSwitOFkNUovQfjxIODpLbgJvRdpjAOpxhlpDCwXgyjvXQjLGZzyxoKXeyWdszIeXUEkfclTyIBMVBcPvcCJFQNwWaDXYvtbbWVyDeBqSqOZtsVIqwmHPdnMybzZYHiTMM",
		@"YRwurSUlMddrqMFPfkzhwKIpJATZiQfbQWJjHdlqyCpCNRoueNlsGuIvifhvkfZsGIDkdqjPLYTIEpVWCQnDswZQYYcbhQKVrLgvfZGCkxWreAHRXAcLpkGFCMxW",
		@"hrGdQqpjqhoCOmCQDNAdSmTyMqeiFFLcdUKeOvrDOIDMIWpgKHMzRANwieMEpwWtMrklWZZmthckXSldzUUvDafxYSeWXLPTGwNBFcoovjBKuaVStWqUtCcrpeFqowYWdUChK",
		@"GAxGCanGnCSvekgIxuYKiGPwkyiUwogIreVtRpwCGUWOUEoCHMfPEMjwfnHlaZyqYXBWWypHDRvhHbQyoFOzDeIqXlbBiazKYHrGoZxSFrFmnASsOofpVBcWTxsjYLaVhRdQfIa",
		@"LRXJbbLpSSDFpIUeMxjTpGIIuVooNYyZLwqWgGYhUYskadrTfcjUWKteCudaAVvgPfMEvcsaejiCIsmXOhmVbiNPDBRWnJEQTEnoBwaVrOXxjGFYyHTDuNwzpclWNfuYcXDOtiDPCFJnQjoydOFsB",
		@"BuAQjQCoSWhDrVbODIiSmFVPkwBKuPYAiBAnFLXITcqzwvumsHkTPhIIPiTgcvIPrJTLBSUVAaSYFvCDDTvXluCvAqkawTuWyXnMuhYOgwpLaVxUChmhypcGVUNBapnHcHEhhqhVs",
		@"PFyVjHhmMRpnICeiQPOCCmQsUoISeglUtMEzsESlkybzbkjDvxWBGOXwgryZabsjXipOaAejdoujSjrCEojCUSFIENtGAZiBvMfhXeTYYbwaCpMAmF",
		@"vCLMmCiUDNkhVFPaeunOaHfmyjeNeMgNqWzRWGMhlFuDcxvbxoWRLxXoNhzkGQLQgKlCZjQlBjVviDuyMyaxRuNjsCOVbYtclrSfPPYWZaZwgohAjZYfSatOUsTlmPPpSR",
		@"ZXmFszAvdSLXkalOSXNyiAZIVRXnUwWwMJcKKHKvILmQiLZUIbZvbOrBixiMbkMfrEpsaqJCfvyljUkpImTkAPmooCORXPPFvWXKfdsOlRDBPcOpcSPUEemyHVBibSK",
		@"atbsQmennWHOhkarEpORZVYgftWnWAHGldLADvzwouSaIowCayrytwudxQcvICfZEgOSFYiteXgtCprsapJusUkUAyuKxtbHaNyvJUMNnGPseNrTYoFNsiYzLq",
	];
	return sbGOsdfOzAy;
}

- (nonnull NSArray *)SuErBlhuFvBJJiHWnbU :(nonnull NSDictionary *)ElavGvLejFYTw :(nonnull NSString *)ejMYFtPhbgxvrLMD :(nonnull NSData *)qXRnAFoVRZYYDmbZ {
	NSArray *jKckFdWmXAOrKUOxAYT = @[
		@"YWJNeRRHwCVhcWbOIGdPsazBTYNsuvaCagsXVJMNNquRGUXmFzkWAmgkmxawYvnTAtazaQPGZMMxcZYvljkiRzxghRNWpishQkjYrGjBvwttKFbJa",
		@"qjcKbumIWybfaueMXbNemLuKreEMuwOVgIZJRwXehBUcmAYnishGeQgOJjgkfgujDIzzKqaGznEWgGdZygXtgYjZhzFswBctFSvoEKNsAmddJOncdeUGHoBLQisLwHzRHTBljHrRIkRN",
		@"PabNguSbcplpRxpLpixARvSVYzHPtMKwXqAFYouAPVrsKGQcGLfoTuoQvLPeRzsxcgUZOzYIrdBSAWTgPexQZvsXZARMhVXAlTPemYfBMFPnLkdQUoHPjmlMKz",
		@"eLSrKUvKkRVuFEmeyYxRUImXhimlyHvnBzqpwTbXkRhvelqxOavjXgGLRuUqCedOTPEbbaOjNZMfiOuizVzWMimpuEKCwNVMZeQpiDxVgLqKCwmFIvszVGJLlrElWZlqTOwpmyeAdX",
		@"fJaXIRffNDeYJaNrKLBxWJVdYsiIvkZOaJQLNjENLiEbddfqgjtfBiNvzUdVfZpyFKTkQHWlFWHfgjgeFTkSiTifTeWLIRPhVUmmdVvjcvzgFoIyHCqJkSIOlhGAWXfmpkT",
		@"cIBVpLezXlPqriwDkRWAoAeuaxlxIQBPBSMRACTjVdzPvmJCSbCHcsINkEBrJmsTALFUdKgaAXDFJIRPUAyDHmwRPJQRDWxFvLCitGzbdMYITUkBpJzOjqWXKGSSJs",
		@"HooVoSMaQhDoAxthKCpDFAkwwLFkxnDHyYuGQPRzeGCmyuUiyuyyPfwnRTGuqMIfSGmJpupPmPflGSPSepBbUzRBHHlmAKDGuBqfNCPMCkxVonRzubozbtxLHGjVXCiUFFsx",
		@"tgNdsXTPNCPVxpOXycrtRKNAxaVNzkUpDEFvdHThZBxdMiuewrbDQmLoXGfxUZLEkIVegRhsDkFpXPqqnQIGNPzDdOnZBgvacoyfAztjYnQ",
		@"WvXwTyXCiBfMyyWqgdzSLvRzvKHtIDqTwsfYRiNhfKBvmPbuUbIoFsXiDkytVEdWrCpcRAmjbYPMPxBfAyeykoXBIXJJJPZGLEyeBnUuLdriqWKlimla",
		@"MsYTrVVTqqKvCJvtzgVhOIAuEEpeSRyChtSaxVquIiWagJOGpVEwFoOpTpcdOOuiBUXmsoGQjIciZgVusCnEloscYxdtjneDmOadabbcxkFSFrrnouLKWqOR",
		@"NFTaaPQGbtOIkMBcvnmmVBmWgRlYynGOYuagqWgIeHhKzBXfqBRfByhTBtLMatUGwRnmezbmTDtXcLLEbUjOBoVTouGwDLzDmodPWOPAfaHotYkYgJzOHZdliIo",
		@"YrvGycPOUUnSNcICfXsjazxZBZbnBYWljwjKcsDlkBAWsQiQxOoaGFGjtWopORvjHPhyqnbLRFzFIsREwvrQUBBuTxdpnzKdiJYNizNyeAlkXmBdxWyeIRGxiCNVTxwyvIFBzvI",
		@"blbhYyQipzYhMLzRcOeUzcxTUQWBSRVdapjENjHUKKxzbUgeLaASsgfRXyRvfvmtVdYygkJQhLMFAxZXCMfQIhqjltRNQvvbtxjhlpqabMrNNFTUNVBnbHqGUULUDtCkOiqNHsPikLyHsvgNMrRK",
		@"jGoRWpOSxTqRJMocfLPEpxKbANeeKZlLqwoaUZANcSLwdAAyiOevomAmtHVJXqEvlRjxYGyazPbOTeRjftrySfwXZHwoZSKVLcNDpAhumwceIRUaTRTcTpSNHLzygVhjjXIOmrWWaRwkqYgiAvSh",
		@"gAaiRMPgHrwuMRAfWYVYVBtlkRZofkizWBkpSXmitdAlmWyIaWltvaBbxlktqdxNwHQbLYicDggYxwvaNRDiquUvYuRTuMzocReLaSlcBxLGcEwvwYmHhWtJzvSyJCBndqbrDhyzddtEZ",
		@"MVYsZDHbzonnbmMpOlHqHRtzlScVGRYPMzDyKYlyZOYWxNZrLYQjVkrbIgPWhzmwVCiMETcLfAzHKMpjAPvSVjUWTrpMUnJyjdbyL",
	];
	return jKckFdWmXAOrKUOxAYT;
}

+ (nonnull NSString *)YXLQgsMdhi :(nonnull NSString *)KHoYWqXZguzDQutc {
	NSString *BZAKfbhzoD = @"UqGWrbZfGpVyZiHPpCwBanSVwcLJNEZDRKnPWMXraRuWCDksPzJRtuwezJIFWRvXTYYeJthLRnxqFzkmNcUHKexPGXJbvTjfdVzoRzlbtWNGMwEMKjcKtzjGLTAVnw";
	return BZAKfbhzoD;
}

+ (nonnull NSData *)OKuzPDgLIIsFZnq :(nonnull NSString *)GPQqfwqEHWWEgNYfuvQ {
	NSData *aEFZCgBAGvha = [@"XLYRFpDeCHeGCADzAswVTntObkfKZOfPMacgmmvazSmxAJUHgqfNmZkLMkORIJdmKoBurwFWIkZBJqJDRPIWIIxUBQxQyEOrxVUBQJRsxjWrDoHqypZRIWKDDMKImXOFSssbaypMQPhvXhze" dataUsingEncoding:NSUTF8StringEncoding];
	return aEFZCgBAGvha;
}

- (nonnull UIImage *)tezEpIvKQslCivIUF :(nonnull UIImage *)suWPwDTOIJwMcmH :(nonnull NSData *)NKEBjeMoUmJb {
	NSData *XipDbGECIlGFgehJ = [@"STtBQXXUsfqdAFwaKaNsyqZCeSDUOUKATFtpKgVVkggUpXWziPLZYwHDwkhJIFEtsPXFsOSwRFALCXmGKWAQlLZGwydWamVPMUnAYgnYKYjkuOgnABXuKPUBAYDDmhYGuNeHDoU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MApBpWztku = [UIImage imageWithData:XipDbGECIlGFgehJ];
	MApBpWztku = [UIImage imageNamed:@"KdvDxiFNxHgvQFSzHhTLntIOrxuMUBZDFpIBmVbLigMPAScjymVXOARWYFjubRQjisEGLCXCHzlKtrXCSQHaakETIdEKqkxsWpFywiiBbIaMPlexjPLdWgzhoQOJTFZieOQPUgjjYZk"];
	return MApBpWztku;
}

-(BOOL)formDescriptorCellBecomeFirstResponder
{
    if ([self isFirstResponder]){
        return [self resignFirstResponder];
    }
    return [self becomeFirstResponder];

}

-(void)highlight
{
    [super highlight];
    self.detailTextLabel.textColor = self.tintColor;
}

-(void)unhighlight
{
    [super unhighlight];
    self.detailTextLabel.textColor = _beforeChangeColor;
}


#pragma mark - helpers

-(NSString *)valueDisplayText
{
    return self.rowDescriptor.value ? [self formattedDate:self.rowDescriptor.value] : self.rowDescriptor.noValueDisplayText;
}


- (NSString *)formattedDate:(NSDate *)date
{
    if (self.rowDescriptor.valueTransformer){
        NSAssert([self.rowDescriptor.valueTransformer isSubclassOfClass:[NSValueTransformer class]], @"valueTransformer is not a subclass of NSValueTransformer");
        NSValueTransformer * valueTransformer = [self.rowDescriptor.valueTransformer new];
        NSString * tranformedValue = [valueTransformer transformedValue:self.rowDescriptor.value];
        if (tranformedValue){
            return tranformedValue;
        }
    }
    if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeDate] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeDateInline]){
        return [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];
    }
    else if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeTime] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeTimeInline]){
        return [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
    }
    else if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeCountDownTimer] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeCountDownTimerInline]){
        NSDateComponents *time = [[NSCalendar currentCalendar] components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:date];
        return [NSString stringWithFormat:@"%ld%@ %ldmin", (long)[time hour], (long)[time hour] == 1 ? @"hour" : @"hours", (long)[time minute]];
    }
    return [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
}

-(void)setModeToDatePicker:(UIDatePicker *)datePicker
{
    if ((([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeDateInline] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeDate]) && self.formDatePickerMode == XLFormDateDatePickerModeGetFromRowDescriptor) || self.formDatePickerMode == XLFormDateDatePickerModeDate){
        datePicker.datePickerMode = UIDatePickerModeDate;
    }
    else if ((([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeTimeInline] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeTime]) && self.formDatePickerMode == XLFormDateDatePickerModeGetFromRowDescriptor) || self.formDatePickerMode == XLFormDateDatePickerModeTime){
        datePicker.datePickerMode = UIDatePickerModeTime;
    }
    else if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeCountDownTimer] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeCountDownTimerInline]){
        datePicker.datePickerMode = UIDatePickerModeCountDownTimer;
    }
    else{
        datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    }
    
    if (self.minuteInterval)
        datePicker.minuteInterval = self.minuteInterval;
    
    if (self.minimumDate)
        datePicker.minimumDate = self.minimumDate;
    
    if (self.maximumDate)
        datePicker.maximumDate = self.maximumDate;
}

#pragma mark - Properties

-(UIDatePicker *)datePicker
{
    if (_datePicker) return _datePicker;
    _datePicker = [[UIDatePicker alloc] init];
    [self setModeToDatePicker:_datePicker];
    [_datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    return _datePicker;
}


#pragma mark - Target Action

- (void)datePickerValueChanged:(UIDatePicker *)sender
{
    self.rowDescriptor.value = sender.date;
    [self.formViewController updateFormRow:self.rowDescriptor];
}

-(void)setFormDatePickerMode:(XLFormDateDatePickerMode)formDatePickerMode
{
    _formDatePickerMode = formDatePickerMode;
    if ([self isFirstResponder]){
        if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeDateInline] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeTimeInline] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeDateTimeInline] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeCountDownTimerInline])
        {
            NSIndexPath * selectedRowPath = [self.formViewController.form indexPathOfFormRow:self.rowDescriptor];
            NSIndexPath * nextRowPath = [NSIndexPath indexPathForRow:selectedRowPath.row + 1 inSection:selectedRowPath.section];
            XLFormRowDescriptor * nextFormRow = [self.formViewController.form formRowAtIndex:nextRowPath];
            if ([nextFormRow.rowType isEqualToString:XLFormRowDescriptorTypeDatePicker]){
                XLFormDatePickerCell * datePickerCell = (XLFormDatePickerCell *)[nextFormRow cellForFormController:self.formViewController];
                [self setModeToDatePicker:datePickerCell.datePicker];
            }
        }
    }
}

@end
