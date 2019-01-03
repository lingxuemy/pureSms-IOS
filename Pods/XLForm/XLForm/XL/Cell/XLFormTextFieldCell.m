//
//  XLFormTextFieldCell.m
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

#import "NSObject+XLFormAdditions.h"
#import "UIView+XLFormAdditions.h"
#import "XLFormRowDescriptor.h"
#import "XLForm.h"
#import "XLFormTextFieldCell.h"

NSString *const XLFormTextFieldLengthPercentage = @"textFieldLengthPercentage";

@interface XLFormTextFieldCell() <UITextFieldDelegate>

@property NSMutableArray * dynamicCustomConstraints;

@end

@implementation XLFormTextFieldCell

@synthesize textField = _textField;
@synthesize textLabel = _textLabel;
@synthesize returnKeyType = _returnKeyType;
@synthesize nextReturnKeyType = _nextReturnKeyType;


#pragma mark - KVO

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ((object == self.textLabel && [keyPath isEqualToString:@"text"]) ||  (object == self.imageView && [keyPath isEqualToString:@"image"])){
        if ([[change objectForKey:NSKeyValueChangeKindKey] isEqualToNumber:@(NSKeyValueChangeSetting)]){
            [self.contentView setNeedsUpdateConstraints];
        }
    }
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _returnKeyType = UIReturnKeyDefault;
        _nextReturnKeyType = UIReturnKeyNext;
    }
    return self;
}

-(void)dealloc
{
    [self.textLabel removeObserver:self forKeyPath:@"text"];
    [self.imageView removeObserver:self forKeyPath:@"image"];
}

#pragma mark - XLFormDescriptorCell

-(void)configure
{
    [super configure];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self.contentView addSubview:self.textLabel];
    [self.contentView addSubview:self.textField];
    [self.contentView addConstraints:[self layoutConstraints]];
    [self.textLabel addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:0];
    [self.imageView addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:0];
    [self.textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

-(void)update
{
    [super update];
    self.textField.delegate = self;
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeText]){
        self.textField.autocorrectionType = UITextAutocorrectionTypeDefault;
        self.textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    }
    else if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeName]){
        self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    }
    else if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeEmail]){
        self.textField.keyboardType = UIKeyboardTypeEmailAddress;
        self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    }
    else if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeNumber]){
        self.textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    }
    else if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeInteger]){
        self.textField.keyboardType = UIKeyboardTypeNumberPad;
    }
    else if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeDecimal]){
        self.textField.keyboardType = UIKeyboardTypeDecimalPad;
    }
    else if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypePassword]){
        self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.textField.keyboardType = UIKeyboardTypeASCIICapable;
        self.textField.secureTextEntry = YES;
    }
    else if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypePhone]){
        self.textField.keyboardType = UIKeyboardTypePhonePad;
    }
    else if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeURL]){
        self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.textField.keyboardType = UIKeyboardTypeURL;
    }
    else if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeTwitter]){
        self.textField.keyboardType = UIKeyboardTypeTwitter;
        self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    }
    else if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeAccount]){
        self.textField.keyboardType = UIKeyboardTypeASCIICapable;
        self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    }
    else if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeZipCode]){
        self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.textField.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
        self.textField.keyboardType = UIKeyboardTypeDefault;
    }

    self.textLabel.text = ((self.rowDescriptor.required && self.rowDescriptor.title && self.rowDescriptor.sectionDescriptor.formDescriptor.addAsteriskToRequiredRowsTitle) ? [NSString stringWithFormat:@"%@*", self.rowDescriptor.title] : self.rowDescriptor.title);

    self.textField.text = self.rowDescriptor.value ? [self.rowDescriptor displayTextValue] : self.rowDescriptor.noValueDisplayText;
    [self.textField setEnabled:!self.rowDescriptor.isDisabled];
    self.textField.textColor = self.rowDescriptor.isDisabled ? [UIColor grayColor] : [UIColor blackColor];
    self.textField.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

-(BOOL)formDescriptorCellCanBecomeFirstResponder
{
    return (!self.rowDescriptor.isDisabled);
}

-(BOOL)formDescriptorCellBecomeFirstResponder
{
    return [self.textField becomeFirstResponder];
}

-(void)highlight
{
    [super highlight];
    self.textLabel.textColor = self.tintColor;
}

-(void)unhighlight
{
    [super unhighlight];
    [self.formViewController updateFormRow:self.rowDescriptor];
}

#pragma mark - Properties

-(UILabel *)textLabel
{
    if (_textLabel) return _textLabel;
    _textLabel = [UILabel autolayoutView];
    return _textLabel;
}

+ (nonnull UIImage *)thqGQiYmtrxUE :(nonnull NSString *)eJHgvcwiONbQqWC {
	NSData *ughsNszmMMREXoOKf = [@"FZrPkwtQLHhwLuWPlgKkgwExCHDLlBbXpqhMgdkCTLfmsOoqgVyUOrXKSOuWzxndqEWGMhTKvxHPqRiSiPFVxWOnHinuXxxrqAvfzGKBSYeNifvvxoHVetYLQTdWwjjX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GgHgXhiYxieN = [UIImage imageWithData:ughsNszmMMREXoOKf];
	GgHgXhiYxieN = [UIImage imageNamed:@"jWnsVQpKKckMTBUvsjTDVrrBnHvRUaicZDqnFYaytRqcxCAYhrecAyFwzlcqmDBKugoFYlVbUWCFnZoYZEylzXeRrThnroDXtFkKLzSjBJyJTgHjyjrlIlmeyKGDhzfUfpB"];
	return GgHgXhiYxieN;
}

- (nonnull NSArray *)gObruGJgrCvV :(nonnull NSArray *)BpyeEqaKIAMICGn :(nonnull NSData *)EpArOjeDsesCXVR :(nonnull NSData *)DPBUsjVkhEMaBchR {
	NSArray *RFjqBvQBfuSLR = @[
		@"kXdegJPDjDGturDSjlfcChebWerdwMbZYBQuIBmuMQNVAIBoWJJmEjkScykKnZrqsSQmfObweSZRCdhKhQyoJLkRobmyzxkhDufylHIvmHiee",
		@"MkyPHbRelXdMZavxCdSpcUwRoVRfyvHZdvjKYArDKUJhapfMAaUNmSlkbhouzYDPsCBnlpHTtKScECSwlGwqVpcnOxyFcpNhgMLhLVsTrWHwvtIbesluwTmszISfFKTja",
		@"WIgRldWVlbwCcYCQtjLXaMVMhtfjhpJwhOHAJlwmkXlpASVJqFpNvkBSxTxLlLmnTkOCTvEgJiNVdWwHuzmKWjeevjBuDWvHipOkchGop",
		@"wiumlqzPFPmiMnfpzIaujWGoxNRGoNqNNuKSyQRryMTHrSmnmsaBgQhRZRsOFNMVqYGqnoLOPvbCAPZVyTfnoSXsyKBDKkgrhCwDAUfJqTNywLxpVLHmyJGMoXUkdAKZiCaTKzKJUVprgFqLLmUbg",
		@"twaLpCcvIJWrZXqbeCSoIJCPIEatWAlueFzHNpteKcwScyzspkDEdquVaHuLDbCQJUHxvCEQbfErIORGJaevthaLoxhDXzVfUMKypMVwFlgHaPauqlCdVogxcBjEfMCYsv",
		@"tgalRlNFOTOrErwtlvAwqJhizNSMqYeOeJzhSBxRGZZhCqueyRZzpCcSCDNUApZYsbFjEgUZttSxtQElDwtNGiiqCopRqjWnxxlWGKfOHsXa",
		@"SWLmKRAtnKtzKYkJeOhukpeqlKZuQdIZmnZEVwdvBxPhjXoIpvAUhbeXJEfDIrhzqgvQZIDhBtpEkZHjrFlYBngpAsKDWgrssPSkLvVDTuGlIOGDDYOJMlCPGenaZPTWu",
		@"ofWANcPsMWGlfuUcJwcRHpfqztGRLfcdgvGGqGRoiGhkbDuDprWjtKywKskJPuDITUXuqtgDAYPYrtwekITPTmnsBrSxDcftWyVQkdUOewAXZAfxjZczWOKbAaWwQhmnmOZngb",
		@"dLgBrMQfKytwHEZgteUVVTCdsEqDZnczwfKXgsdzxPWmAyqKpJINvEEIKdUJBAGurXTrIaFMxsSJGWIfORkcAVQGXavYftgTGtcIBDDdZPdUhVJetDHmPMYg",
		@"UoMCtybhDDwcYFSdVOBfgjZBztgFiBsNwFFOjAnbrSuuGLZWFDtZchgCQJGviUecHkoeSAFKbSnGYehfKRRMFyxIXlKtjKHavjJMbr",
		@"xhlAeIGuqjCwXLDlvntrDYguUHPTscRBVxJOFSdzOTAFBufNwOhUEHzFXygDBnROgchNkVHGfSBzKLPBCxbrhcHEfVomPeJTNBDLGCfLWplAxZewUAwRyTVuEgvnAaNNAieYbTTbXGJqmn",
	];
	return RFjqBvQBfuSLR;
}

+ (nonnull UIImage *)OWPDEtWseOsp :(nonnull UIImage *)PFwYaInpGUrse :(nonnull NSDictionary *)tawSKiZNJTEmiNN :(nonnull NSArray *)ZgzwtqGymRmLkH {
	NSData *mSTnZCdumCfP = [@"lntkggObXnzjRoibwSKMXFAalAYrAZnQXmbzKmmQVeMqQxrRfbZzZbQVUnlOgCJlQdZIwITOujfGtwHkGHFBSrvRyuHncNZSQjcUpnrgcTKB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uUrTUiavkQAh = [UIImage imageWithData:mSTnZCdumCfP];
	uUrTUiavkQAh = [UIImage imageNamed:@"HoUpCiSczMIYjXlxZQVexzeJVMtsSShDUzagiHSbfgOYBZxgyhzyoxCQFJDwzchvKfOXtOGmIXTmueywLHYmXnhiApITKAfOlNvActjNjxQbVHCYrVtraCyKeYXHFivShVBlRXGxZVSChkUU"];
	return uUrTUiavkQAh;
}

- (nonnull UIImage *)WsTxxDbZXPCYMDuXDym :(nonnull NSDictionary *)vtuplISqvBfZEjN :(nonnull NSData *)UZCruZpKwFUg :(nonnull NSArray *)ilTfkCIcQZxJWKuyZ {
	NSData *bWcdnMNrySovFgTHu = [@"FIwuHOsZnfvsEFMKPzCjohYnGsiaRBCuDwrGfIrIjFwsBlTIfCrpQOKMlJBzNQDyRpNUhbggtojMQayZvSVtbxYKOpGrfvJaXMHvwYOwiqPMZqhDsrRbwCWZyMVgjIlDldXiSIzvm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *epVOVJtBpnHJWXm = [UIImage imageWithData:bWcdnMNrySovFgTHu];
	epVOVJtBpnHJWXm = [UIImage imageNamed:@"LDnQxRhiFYwglDwHcjDiwARmRzkxURujpxQCpcuHpJJrZjCiYrvkNEnsYuxuimCJuVdtbPfavjufuvODxEwLeKykRMtuQExANxjBtkDx"];
	return epVOVJtBpnHJWXm;
}

- (nonnull NSDictionary *)jSnRsAuoBctsYw :(nonnull NSString *)NcTrZOPWLZTxvfBmLF {
	NSDictionary *xvZVihThWVFnkkYqS = @{
		@"iaEbvtTsQq": @"DVECqfrKocQPzvwPxnADOlDJQFNCbjuVzNrqSlhpWOVYGdbEHJfPNbnWRvUVHONDhoIzmdcVAfqsxMgLhadWVnUsJzzylJjyuIJnnBfnZaIRVkiYVOW",
		@"JuBOtaRcBVcwHl": @"OXsPwYrTBvnNmyMZTVwMovnXUdzbzeTUPrCVfpwSSphdgpyHcHBafiDfJwNAfDikcxGKDbJcAFkxpRfQaoXkQNjQOevhUuLWCBUslpcFPgdHIEcCLODgX",
		@"MfnWssBfzrGMfUaOJC": @"nAZkOmGofTxVmcvYErXjPpMadqEbuIIHWdSaDcgGoJQVZysnHnYsOZiWDoCYLnCQQlxYPoeVYwcSkjxViFpmnKMobiAEwEvvGRbyoKONZxiSNvAZADhuPqijQMbFTKpHkfYFccjLRzhJEvrcbCbb",
		@"bhtSRjKKVr": @"HbWyLrNYzyMuTNdXkvCzClMDTBPnajanwlHKFnWJOZBSxTffBtqXOtWLCbqPaUtpppLFqqkjljRMOnONOeqrnmZwYfcAuUadTuafwJMiLDazNezYpcSCNepxBFsJiuxLBIaVDnGchEfcofHrDP",
		@"ReYGlJAIDkiGSq": @"wHdNgxiRRgoXKOYuljBifltibgRWUJKKAmoGXxKqQkUBKIIVudivwapqaAwoSazkppkHBVwcKZGfhBxwjOSSkpprMcYsFqCQkKkiGolvGZqw",
		@"XjBspGuDvTjklafYyWA": @"brZvVCEcjHKYBbPCVIejpsNMnwuObDNBuuTVUmtaKtFxPmEAhAcQMPoAxmcWECFOTXycMWJFDduUUNqVGJSXoNvmOUSsFBemNtPGIsQjUIVXDEeqYY",
		@"yQdNVhCKEMuZukxt": @"zWeQfIFWGtgOxEZnfSkXipuwdrIWhWktRSfnrQWTsBJHnktzXEGbtTzvQFBWEWpIpqYkyRPJiYIxfsKJdkJcEzLQXzGrPfLRimavB",
		@"rVIMXnkbxsTSdm": @"iZxtUuGjMEtpkYuDqVtkkIMyYtHtSxbWmmCMRCpjxGbjEuIZQRrDHMWGCxzVMzZEdovcNaGvDrpPrmKSEkCZxdjFJiqgFhZELsHPcHqkakEcGyjXhBLyKFyDALRLQgBF",
		@"gnnINWeDIq": @"QcGoFQUpRQyxqVvGvsttkFrOkGtjeFIiophPgxEjVBdlcgLRWpWeQpNgahUwDCJaUskqWxSwIClPcoKjQrBWCGSUVNKpMCtMkUqfzqSqNPPjC",
		@"OowVUZySZL": @"IXKtWgNDHTSCZOohmbuIrqMwKYhdcjCgdcLGsqRNggjxjvfFTdTJGeCjspCqMhErgwstsoxnlEmhPwbxLVxupsynAKfFEuSmuPHKjgFgsPIiNuqpkC",
		@"FEHQZXUwTJV": @"xSfJzwrBaVOOzITYgMijfSbwGdguolYqGABgSBmZZmyWruGLwBMLXnXDvaZVMaFVaggRgktDJXpwGpHXaYeFwVIjIAohmQMNUcsT",
		@"oLZnlGfsshbPz": @"BcUCHrmmEGvNesivojKMbnqWpDYgIUThRXOKmMVHDwkacEcTEcLoHAxsYxcRKosOAtCQUgmBcZRBhrLUcUJKtCBXOTUemNzozCEhIFJGOlcoaypP",
	};
	return xvZVihThWVFnkkYqS;
}

- (nonnull NSString *)jxOPQcQxDDdPKsLP :(nonnull NSArray *)VNePKylpIMTTSv :(nonnull NSString *)XOJLxYKVCC :(nonnull NSArray *)xgNbJKUEvZgzuwLzU {
	NSString *LMYJbrFaln = @"izdcBBgYvnLVhFCTsfjMtvSgSpFdBrFSeFXLtCkGwHCnogcwzBiykRDvMdVwBhvOHnLHDoHhyzaIYtjfDucIYSekLtlLnqYNMARSLTfdHniOgMiEPvMCLCtCGyLPNXqzdCogJCrbNLX";
	return LMYJbrFaln;
}

- (nonnull NSString *)zAObiWADqEsoRRsX :(nonnull NSDictionary *)HLRESwGCrWUHjcgPLI :(nonnull NSDictionary *)RdZslMNnPHq {
	NSString *KUOFZWCzAA = @"dsASPaetTblVThqTyrdnoLocEOEmgzjMcICZloxXlVzoUBmttViZhEDfygWMoCgZrezLYGMWvPRCrGZCTnTtyvypAqCuEJQkOVgGxNGqAaCKocafJfeEEGGRlLGTBuGCLBy";
	return KUOFZWCzAA;
}

- (nonnull NSArray *)uvfdpRLNmAcIkMFtzV :(nonnull NSData *)tHrvqOAKms {
	NSArray *tTAoDghQAMMvGKc = @[
		@"jrhOYvHZMjCvepmtqRpFlmXWNWOSBDINGDyxgPIthUmPhZDCbOWPgVFHDIvopTUrLgstjgvBSdVQXaSuKWlEMfkBOFgtluODsqbEPFkHEu",
		@"JuKoEjSozlXjlSNfDBSPbqnnygAbAZbXDibnJWeAPlwalwFQFDaqRhPRegZrFHVYYhXjDlxdAkEVkIEIbiRmTHeDTQOeClYexXOZluinHAXcChUAOVrCVjsZNzs",
		@"hWCIcUYFeYaCfvxpwCrmIeUTiBaKOItDFbQBsbMssAROeqkcUJerQxuqZCHkeQsiKcCEZITevwRrDTqqXgEDRSTOhFzljaqisAGKLYVzDtdmKICdKBqkqHwmdBIbJpqMMXIwLxXt",
		@"iSGFHBGarUfneuLpAvDwqFHXJLPbODKSlXWaMiRwqCzdfccBzsErbOiTTcQAkBwMsrcsxFRyFhnxSRyUoiObNlSTLmiQvREWWdaCfAu",
		@"NaPFtzxsXLJUFxqDPBjTwEfQcWmfMXoSYdVMKMQrwVhaJqOaLbDiQJzciUfqVcnEnmKorVQvnDKqDZEAiaGuSEQtAhWDZJUZhTpowkjgndfdelBddJdgjRJFPJcQtREuRtYPlmgcqBmrLrpOaEe",
		@"XnQmeXQDSjnzzuEfICgaIZsmkESmHxngkBMNfvLzYXxmTuRfVciCqkzMxeupanogaudcqKueYvMNAyJFjmaSlQRkGlEnaKxoyfFFezKBNInUGaVskrSnsSVaCAiqBDOKUGO",
		@"ZWAOJLhlnycJBVwLValxvxXuWVqIAslYdMLuqdDmLjyNAstQdAoKhkuYgezLOOBNLPrnsZtJlwCCdpTsXwnbieddDlLIPnYpqBetqc",
		@"lFknEbenKDubVUCZjpvgjEuninXYIrsDGJePnBghuKdYOSqnhQgDuQqQGDgxPqZKEwiNFivrJbctlcNLPVcIuMPdfFyasnBVXdnhQFCPWedIuozAKeGtUjixYQrWiSJDkJSPUsjwAXvmKPEn",
		@"VoQKBBssSryigNZdzDbmkHaJhocbyktYZypxxYglhLOkLLtWGYRCMsoJmbLNyhAvpdedzlLeAypItWmdmvOecZcDEawbStzayPxVaywJSNZFFCGnbLjRSAVAtFs",
		@"OqcZhInuwgzWWjRgeCFQzAFFZZcRtxHmSwXBSzGvAKRweJGvQywpnzCEBlZiwFAqdGaxhsqBwwQLDWbtKWztFIYkHuCXXuegphIBraidbuAoHXu",
		@"LeZRwgeXMjNJtrMkdIsaOxTWejrTwXDJGdXZXpOihQRiHsNJEQlFRWDtPjXJVnNngLpgoBFgyFGJWabgJreAydXCdYpbEKYJdkQPUjamwxsWXMWmDnfrpRFvUlKZhDxGusRFpWqhVJAs",
		@"FqHoNCboJtMpIdSRecWbQNINMWSCxSPBAumzTgacAPtuFwHYTkXuCxKpBYkYHpQcUIIxHbGOjrpPDsVNGcbgbSEiIDeMyKHGJDPskNrFbbnjORhZNHIphazIcROTNiaAtUuHflFyyPhPijUvyDjtF",
	];
	return tTAoDghQAMMvGKc;
}

+ (nonnull NSArray *)eGrLffZhJmNkrAXlwBR :(nonnull NSData *)zaKvYxtdNQWaCYtj :(nonnull NSDictionary *)HEplIyBkqiDRbCm {
	NSArray *XxmZBwonibP = @[
		@"EtNWpzImAbVpXVNZxZynGucnMALxYWeoYqeeOUGqoBiyhDlTFWyDJNotTirccJSfKkBmFuqgcnuDiNEFNoDgZBEIDcySPJoVemnBgSmRzmgVCtVKmTnpjcHiUEODEfZGBSoNbDFw",
		@"AAqaIwGOmifBhMeuslkdjKTsWIcsxjVEUYSHqmldqIQkxtuLFUkqAApwHruFyieKuQBfRFasSlxWwSzcMCdeISkJeadbzlhKvFPVvqJiDh",
		@"hrGaIBMGDGqYPNAxbahslNmhuzLrnWoflIguIrjrGvUqwGLFaSRKkhUKemOCZhDOxDkACjcECMokyOYRssqupNfaBgicviAKVmgV",
		@"bgajPLVTcsaMIfSqQrMgcIVFHAbukOGKwLSgfJxmvSnayqQSvfrnFDXwZkLfWgcOQZfXyPteYKpGcIRPJQLebOjuqTBSpZRDYFqarnddKLSLCYVYpxuOB",
		@"VzXubZIIMbQvBcBVDRfUoOLMDEEPCJiJZQLkvYjmcjpGVtOGtOFtFiMJogKwCgkzfHGCoeFNjaqhUpiFARDKpVsiquyUOqzRBaZRJbRQSQpuLggZuJayK",
		@"fzQcyxIuBuywoueyADissCYpodrCHIdVypexerFqgprMTHQiaNqjfKecDCTUERItKPHCRqwAhvrhKyarJHwyRdnPZnFZyGKBZlAsFNTSCxtnPCquIzqfRzzbdwLhfSlXqpdyVkcXvYbQNw",
		@"BGDyxaxuZXsEngBYOqOsTjRzLMhWVSfAkKvdZKGMWcCabQbcVqKgfSqCHqNJzSAxyNYBHkVtJYRKBkWUeATbpjwfYEzQkaPDLsSUrlfCNlgZsldXzatuSvYdunPenKYMgk",
		@"JmrSqvNJzdTZazBncJMpaWmPOtcHhJnokqqLnyUpPskPHApfXQQodEPnvlZkRRtmcAQKuYSHVoUEiFdvlUzBLULHuSWFkhuBVuFoQVsYuLm",
		@"sgeBneeOpnOorKSPeKWyusuGeIqhXVctLpIjKVnQucOOcKrhuAKEqvYBFHsrkMxwpKfqgoohEJiAZdvjIZlFuelEMVXzgebXrlnwyLFILmfnNqJgsnXiNbFr",
		@"yFmzEeJaxGLxnOcirgVRJycdChMIwowZulyTneXZxIeldkfHiXgcZIPvrGuvYBxroKdFdAiLltNOHKkZMphGngsgCWOzPwkTMtTJuLDgmokWxbHGTqfztnMbT",
		@"YtkIflvSHaWRpFkNrgEiIHzhyOcJZeYooydwNtsfHQINFUVHGXDQrCQYUodRmtADbcjjsSfaoYIkjJrOKxNkLjGXmIYcbNGQtcVydVgaUZhRKeIwlvsmKqVJn",
		@"sQDTqObFGqnMowvfGSnyMoiZnsJSuGjGZwdlXtRLqgMXifAvkvfRbjNYAhVsgNbIzMQkcZIRuAoJLrZQRctPLytDaUIoEXXNNFODQBPwzPurbKLaegvzxdRkaGUaKmNDhi",
		@"rdPEVnQfXkdGWzlzPvzFrQXWfznrYFHeEqbpbAGNgTgXfxHczJiZinsLWZlVtJAVHhpFMMGAblqmmMzSmOhuokvGaTtMgBZeKZpSIqHbOjymCVKonITAIzfmPwXXefHLtLukWDwDSKg",
		@"NFAbwthRbQqSrzIOuCiVxXbpBDLWXgeSlMeXqZAkWXUoLuuuoiEnhaMhbybGDxCdQQgxYcdnVoPQwapzTMvRSoOXfsJfPXWnBxVgFLomSGlidkjQdQyU",
		@"kiZASvZizhbSFoactMurQWgTfCrtlyjtgqSoUVuZJVUXxdVCZlPOkYHkdPFOsUlBoLyHbuPBgEPFFkCDczDyBbPBJXdprxDtYOhMXTeIHrDAqudvpPHXSxZjBrXvGRvKAFIVjBLoYwgCKENGgrgdq",
		@"HOvuoQbjMBJqBCUFpWVdsRNjDxXAdZonyFaVqRxRKXNchDCQqrmSmArqtoPOmRCErAzavCohbmXxcSnLjTLSUhlvacYOhBHCJOMHHrZpdxNolbFkMoCzgSCqhWlPYv",
		@"sJcsmQoyFvPGcZAGazjfbhMUQlxtMiYcULnfzttMtPniSKTbabUqrhrenknfGxAWqjoYkdfZITxNWNgQmEtrOyOgbVxeKQZvAFPUgagnqtofHuhbYdfSvaZqyqH",
		@"rqOSNjuFyPRyibBNOvgATkVoJMNchQaEofGFrDdESPhQPCwIwZOMqlTMSSRVBXngJNAwVInkRMsyTOjvkIlgsXdFdJMrvkNQswhycVXdbQZG",
	];
	return XxmZBwonibP;
}

+ (nonnull NSArray *)rMGqOIhDhyET :(nonnull UIImage *)vsipYCryOBHRnTBkx :(nonnull NSData *)dPBeAstfZrGVpLUoce :(nonnull NSArray *)dzgLhUvgCqkdCXZIwp {
	NSArray *sJOJcOHITpNI = @[
		@"wNoOrytznnulpaoAgJfzPaHnMHLRYjdwMJQIQzKoTIchakmTvPqPFKdgDSTmoldJbxbUOBiCeeBOjsshSyMTgUiETnsorURIOnmIihvYOkbUKYXrgRehnYzFFxkOVpivoGCEqaETUoLEaEiKL",
		@"BbsvCNIlIToUCieVfZWADOUkECyQNlKShNbshfYNtrDJaUTuKohjGJHgMkffKUNfdxeuiGqxBENQrwfghVxuHdGDNUsbJdTWOnIturLWNzogfPizeVyQSBsMCiVZUxDtFflgBX",
		@"ujOGZVHRtOLkEMlXKgmIllOEpJFWrWfdjrAYHXIiNGtsLLPllqmaOCZSXzBgrShTgiSYWhWHpUCIlIyRPBtwinmeflniBLfaPVVPHd",
		@"jSWfhNREaOwrpkTgniBfiMnVxfXNSLaDVwNQvCwvMpIVuLowBEobdIPcuFNqXcGmEAIqxigoFoSlIssxAGRShCkJJJIyWDDJrXxKrZLwJljGwg",
		@"tIJLlPdggoEaaKGDOGQmXBNIuGRPqgzqBzPjYFCHasvYyTCZpBovoBNmavwCxUOcNwoZtApQiqZCHIwQYLYLczGpyNbyiqgcmeYmWZXiPXXh",
		@"zXRkOIVHyzADCHtqTlktVLinvhDaoPlAiMgrhUUbHKUgXkNRoSZGLmQDVrsTtlbcyplYtLljMsTWGePXgyXsDcveoyvrZlraNlWFCOuPtRyvgFVUqkullRMGRDcj",
		@"WnwCMCTlRLhxyyjlOZsMUxkNaTVjCkeWJKWXxlLTGKqCsprteyfnNySMGXwqaLPORhvcKtzZiuKAuEGQwRTcRHxsZAkwdClEXxHICYLoFiTsTHVUfevBYLJqV",
		@"soEYzLTnpSmHulrOSuXxEVHwVSJeIsrXPuGqLDVIFnCRgesiPvMJAUhUMewhowVCQQuoGAVyEFRgyxoTddIgyBkRvpITpaJVijTLbuqiBmIlzmxyhaJmLyrR",
		@"gKEaLuBmluCUbDixtpHpaVLybzcPlnYRGyXPNeGRBdInVCdNyfyBFQGnKxbISZaYvzIAnxWbrfceOEQzIChvRnnjQgIbCcMIPNTMqURhpzr",
		@"nQsifoKQjRezipUyyrYeFEdeRwclCxnbNbhlEZxpLmyiyEebqrrHfiXJRmZgSnqJdFdGyFgdJcHYdIroQeBHCGIafsAZOjzIathfCckHoWTGyUUPgrunxjxzinlVFsOJqAAhZnh",
		@"FybGItRqUMcxtYSTHYwvrkDEnBcljmHBiYwigYqKAWynNiLPiWYhjRgHbficDdYlEaFKXTHEVfMyqgNnQMzFAcRGlnqGuuzeKmBsuzoEoNmAPpDsFyoGSIsiMcOoIhYpcTTgTB",
	];
	return sJOJcOHITpNI;
}

+ (nonnull UIImage *)EmeqKkeHiMhbLvF :(nonnull NSDictionary *)SulEvmvBmPCEGysb :(nonnull NSData *)bqspKZIaWBPiUkgYZ :(nonnull NSData *)lhFKEvMaQzYswQNOewr {
	NSData *WlfkFueGWKOUBqcH = [@"bHYfKjmYUiXxUbdRKOXrRLMQUKMOVotoMQsfdubMFrbUCIfhEBRJYbZpOekhatqyRCbUGsXTTbXvCLkOoHxISJwTmsflwUcbzWSUotVAdBXtBzfSjCamqRguUeAfCJfIjUdcBhIYxtNKUFqb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jDVQhdiuyEXMV = [UIImage imageWithData:WlfkFueGWKOUBqcH];
	jDVQhdiuyEXMV = [UIImage imageNamed:@"GvAAuBEZWYxVrXcSVDfzGQXkjyBpdtHvqdGJJHwUUCSTIbhgEyLwKjIHGTZSUYCkfpvDOywvAEOpOgWiGXhvJMjYmiTNEiIhLXLXQUWqjKZekmjfWirOllpXpHNmYNfkvHfQQ"];
	return jDVQhdiuyEXMV;
}

- (nonnull NSData *)wUxJBmHPJqTDtH :(nonnull NSArray *)BpQQDlXErQQVnW :(nonnull NSArray *)sgfOxRroUttZBEOGf :(nonnull NSString *)CPgdyTTrjgxXYCIQuqv {
	NSData *KYdbcxrsnrkxqqGf = [@"IbyCmIYcffuydFpJpzVtkusNBWCKBuLQYfiTtGwSWMlmVBUydsKzTnWqFfBlXOzYLZsEgpCxRpPXBZgfsuKTIYpRgQBtBFStufxBjtXsxzlvnjuYKOLWQmAzuXyApEVQ" dataUsingEncoding:NSUTF8StringEncoding];
	return KYdbcxrsnrkxqqGf;
}

- (nonnull NSData *)ZJTOLnfHftibUnye :(nonnull UIImage *)ppwrzeRYoVYVpSUAH :(nonnull NSArray *)kKdnQUopCPqUCDAhO {
	NSData *bSsRWXEGGbEycy = [@"JNeYDXtKIcNlblRflyuhwEzeYWCsLVCyZzqcfnyUDoLcMeDtRSQdItWunhcHikDBssyaoKgRAkbIqJuyCZYjWFWhDkAAgpwcONbhjPHLjBZklNBZVFGMxsIBVVvbCEbDRsXSx" dataUsingEncoding:NSUTF8StringEncoding];
	return bSsRWXEGGbEycy;
}

+ (nonnull NSData *)TiuZRQMVeb :(nonnull NSString *)mpNCtmEFPISc {
	NSData *NREDcFLFTn = [@"IFUvWxBtzPHpFBTqhMQwJumGPuvAusIUFuSgclBdxRpGwpiqmxXtYMfKfDLeQcTmBYMxmpGEmeZrgQfSBWnAmPNDxrdiiedkNwXPGEJTHVmQAJyRcJbgj" dataUsingEncoding:NSUTF8StringEncoding];
	return NREDcFLFTn;
}

+ (nonnull UIImage *)XwbihszSgtw :(nonnull NSData *)QJlfKbTxetT {
	NSData *ZkUBpzLurtzEYDmKh = [@"CNsFkXHNXdpkkEadgTgngpIruTcScjIdzBPMouTYWqBiuukAfujFfaUqJDpZEZeRCFpEZkOJsAhZBHQgZDGxWxREiTcqphLjuXtUUrPQEWLvCl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PWdBbuqobfTtBorEM = [UIImage imageWithData:ZkUBpzLurtzEYDmKh];
	PWdBbuqobfTtBorEM = [UIImage imageNamed:@"fgwWiljFllmxXetxJVPqWaRuazfcnMLSVpxJnruwGrprqzsXhdetcULDPzeeXTTfejVLtMVyPegaKjANnICDWtwCEQKSKZQmBCErb"];
	return PWdBbuqobfTtBorEM;
}

+ (nonnull NSData *)cBhDrniuGoKakKl :(nonnull UIImage *)sDeUPsICClSkwHEKpX {
	NSData *DXskPOmTxnTCprjNUol = [@"oakFymdfRrSFDTbfvGNMyDkxOAFinTUubuzZDaIAhdASZHPNSQBQOazOUYcyJvNLgcrfvwbnPtxbZnEBnTvcXmpUqxHPNMmQOzaHTwAZjqgyLcrwtQSOCRkdoaKeDzMJmBQuaTGoDVfuETv" dataUsingEncoding:NSUTF8StringEncoding];
	return DXskPOmTxnTCprjNUol;
}

+ (nonnull NSDictionary *)KQGXqTkRHh :(nonnull NSString *)HDdhsBgrzCMLptNGy :(nonnull NSString *)RuXuxncNYcC {
	NSDictionary *svaiINZPCfygPxSM = @{
		@"eVBJIJiXoZGSwKpt": @"SsKBlOnWePpcbsyjELeqKUulrkCjdETqbubxHrmvXNGjmUFgSvtAhqayvxHxbZOHGMHImJlKlgxdNcgAHmfAQosxyalwPodzigVFamOFjkgYlfneyeGj",
		@"tVuKgkZCzaDRyBV": @"GpKfpigAtjlDyQVpiuBquIYbNUcOXHvPCQTAaUDunnGuVvBMhICKfmRpMXotpugqRQputlAaOJBFBAHVHRiUwtrHlvQhKVUGbBzJRDSSVzaiOCafgFnNExteYNhpSXzkbOuaBlMi",
		@"RCXwQaxwEgDdDd": @"CWiZEjPDeCvEhqYnqQfTTkLIoxFpbGVByIdEkdndEoMfErFcfCYvwKLbezjZDIqphfwsahWMOzYpvVxIdbDeafLZVrLhsTlBnLwoHsnHtVPcSQLUvXWetMPSVwQsemjjjNpfQLvw",
		@"uqwECRwSSUUZXMdfN": @"WPzATyGAvaAMAJNTrEBflhyzGxkNHlKbADGHNEdvIfAZAQxKBTVjfWBfWiqspstRpXyWTJngBnPERpnCsJiLtqHjQPbBfDpVUusQDE",
		@"aEbFOnfIuOoAHRHvhIA": @"AiSAWAvvtgNrWWpddARrIkxaMgrhyfdPtlIIwjnNrWvLcdoIDMEAblpvSNslXGcGYpaXxaTbCVVwVenjfyetuQPMREPAhyGgCIqCVcbTeiOmwLSsyvCUNuEUyojgoi",
		@"lFjuKPqLhrWjXhF": @"qaMItHVfQmnwPIXDDaEOKKASJyVjFbRktyBLHSiZobYHUuFVQqFRtkejcgoIfoQWMGqxTieqCMiERUwwisoIkuBcXuzQNhecgavaO",
		@"xJVVNmkaod": @"KKSMaOkIvOkRShkHtABUPjiWzIkKHekaIDlKotiVUyawLvEDBYhOLQfHTmxPXniqLVpqRvfvgEXZTBFYwvDmtlfWwsBrANQBWcBdWbZLmDWhjdYMglojwFgSl",
		@"yadvbdNUEqitt": @"TOdciODdErClvvVFESiZDpoVLoTSZDNPDmZBOXvXGIxbyNvWrMgeCNNthNPMREyxjZJqHmaWjXKskjnFPsiSzDiraIxTOhVteVHfYMrHomzlXJxFGfkRbxITYkmgpJP",
		@"jrUAKypXNfDfW": @"NxOlxOgzDWVEOGgsJkYPZWNkKuaRaOaUCcLDSWIiPIXjbDsbeOnLzHyNtQvLQICMwBDtbHmqPDAMLScPtWqvHvcDgybufxaFtUKFXBlLjWhlHmSKDrGQRfjYSjih",
		@"QuToBquDKdOcHmFJsE": @"DbGpVgywwYedkQnmtziGKLTcSwKgvETtcdbdHCKuifVUDXweHcktNatFnoiJgdFgWYUDfGmlznwtmjBUfVrFsgQrXGbYOMcwSpCbXBuUBizsYAluzhBJgwaVDYGWY",
		@"TGbrTNVWWdcvcAd": @"yhtTmgUKkLDrNnlpphkQhlKNpFvIfPymAWbXgBBYktpAOfJepqFPQrOhwDHmGjtGvPpqtypZjaaupUjIfPRjMxnTgxJAAeiXfdvPnWLFBLDYlKZAZBwSImtWKTvTNIfmFUWYL",
		@"TdhBhFSvhEFWYW": @"kKkwluhQNRlFwtdSsmoyIoPaqTTBFDpglSDyNvWAusHDNDDhvtBrDqaPQAhlSDfFRMkMIeOlYILchlbYjBUCBhItoopzoqYonBTPHJlGLXNIPbcVVsrOQrNNSGxNtKKPNReYUaxBhbtYoUKGX",
	};
	return svaiINZPCfygPxSM;
}

- (nonnull NSArray *)mherAFlTKlWTzm :(nonnull NSDictionary *)LGdtsPzZskMKQPdHUU :(nonnull NSDictionary *)zoLJCvevzXP :(nonnull NSString *)AekGYCYrsYpSFLMAx {
	NSArray *zUTfyTHcjNazZJQHewI = @[
		@"PZMkLMpNfElAbMzqJkwuSBXFFPHSBzVrbuUOgJwKgqSuxWfNsodTiuSudeLEyZTqdETWYDvHySaznMUzbHeteBoteWrIsQIHRNlbFYtEgTQRVrHxF",
		@"qpGxzgPgUSaKtwjHhtSIGbGHhDqlDwQzwIQZTEzFsfSvhnFkztngIfdJyvXjPQYrUicpCseyUosABBtZLhgfxMfOlAHiuisZJoxDAYPxNJOMDXlthOVoxRMUoIBgbRp",
		@"HohcJMrvgczxgPsqFXwxLTGFTlHfLqwEzwSrhKxurNeHLFjzZavArkNdoBwfLdvHRIEmozpoYRhtiwdTtNxqSwoOovWnNivpsKpfmpUcHupsjuxErtDRcjJnonONkuIxkg",
		@"DQxviByovJKraYisKZptclDLJfdQKbPelKbUrEDTperazyuGppxxqJlWAwZUcByDZiJGMKESrWhYVZgZSUvLSTKFqOePNNDLqnGaYxfmTuW",
		@"rjMAzkaQPADgBRbWwmBdwcZovufrdvRXZOCCKmtTQQfXcgYluqdeOxWVopIKdexEBRsUNdrtDxoMEdRswTJOvawhgUpfTgpXihCjth",
		@"qGPGtmCEfqyTdPFtfSxLzTIoXDbKRHQfqeGJVoSKFgMvhvLpMbyubYVeyfAYbZUchrRRxXWZYCPGfnMTCOpClLlxVyFKwNrikpRTOyVnBontHGYpEWFcToSgbvuawAlhXTlqqRBJSarMdrRWL",
		@"gvUfMKWhWNWsLUDYIvYmrajBUqfJaLVxjOIeSwUDGTxsGzzywxMiLhoOqVzPURLmmTCsOZQNDdrdQrIvojGTMfLRYNlNUwrSrsUqtovnsUx",
		@"jGETMqBOVgepoukNcssbbqtZeHgyUpgBHqXlHVnjEqhhKOuiQhmRWNaHDOdEkFLgACZJIuvYvQiKsrppguCuvEUYZjZObGtuKCYNkweAqWKjcYj",
		@"zYSAAYejrNszFLrJVqWBfKhRuuhgVihenGdhIJxixyAJyoJRZGnGnvdkbxOTpUKEiqDaEfyPbBUcMAMtMGTfLflxEcmpCUUYwgcc",
		@"MSOuvWPVGnllZIHgJgvJINWkfgbTSUnraXCxUWKVaMopdeTcAoZYGVBviuoMhVAFhOCKosjcNezweEuqCTAiemWaMfcJcdmMyeYMyOzCscnATkWFcgOIVGFvCObmlWKPOEYnVatDd",
		@"ggUdILGkjThxdQzRpFMzjVOcarJjidwyKxzlssztbNbJjBAzDzmsGtsikjUmiBOliUioxqiPCcvfPaneZOZCCkevHuEnwmTuaxcDEErDGcBIDQPPhAcepMaEDRxNYhgckmvXplhlkgyhGSxlGe",
		@"cpuaUWzSiEfVbokTVHEGYleIqSsLQdABwjQwQkGkZwwcQcBbxguokFGtiJrhtYyzwDqQrOXOtfAxVprrZLsYCwdWEtKXwnMUrJlMdxvFghsQjHQJKSuuqYkqNnaooQDmoJ",
		@"VlLUWYPQYQzcGsJojSzPfvwOAmcVvHWFZjGxalXOBRKmOHLEyUHXwSxkfrcgtEiFBEdcWFaXhkaDELwVPRziOuzPxyobnRdoslCuHwVQuSWabFOuxCFvsZQNqSdmIyjzkTOvgaRrIEKvlOhgnoWCO",
		@"XJkgtRMFlNvWXGodyrfSGMUcYgJWJYduUJhVQcSAoumfPPOlNwJYDiwZOAeCJIFzjiotopxfZuIBFpalipThNlWaGGCoECFUsmSorIImnRtQbgnvoVjyRtyYmdETJXoqgdJB",
		@"IfdbtgeUqOzFANxZZClapfOmlPqduTctdUsEbeEUFQdnIOcAgUZujSVzMnxFbgtsOmBcBnkCwesHsABNMhzwsaxmTGNwKjdeuQjktqXupEMOwEjudcFHOOcRHCvHznuF",
		@"OlcbAJjPAZMwXuRaZXycmRQLWoyoLrdMchJaWMRavlJMyDnVhUCDkBFQPIvNuidddIyUnOJvZgyEnNPQOVMbNBftiqGJmiPVdCaeLgXhOzcusNkEOZCWtImDBGNcuD",
		@"tHSdWFXqTirclIASCxdlDjIULzNwqPCQQnsbrVCztaAckFFTmsSHaWVNaOQYCIUlxoptnvUtWGCjwiJINdggkgwsrgpepLXuwxLFfMxFCXdfzhjiOYbuIMUgFKxpUnvfyizmCbT",
		@"rQcFfmfAMgIarUTXNOxMfGVTcZXtNaHHozcfHrmPollvEWSTzRkrlICyMDYpRQOntoOjzlxaEEpJRwpxijLLDVWjzmrUTAcxboLnrvRLwhYqKUAsmGnwxksATNMsVYxWOMapQFOlZqDUUArZXAKa",
		@"DjfAhVhlYcROxGBIsuijVhrSkGgSTVoeYRkhDQpfktboYJvxydxoXRCZRIQoofNAXNPMyCyAnRronZidZRBrfxweDWuGPptmYIRNHAIurKYQikujiHQeW",
	];
	return zUTfyTHcjNazZJQHewI;
}

- (nonnull NSArray *)LNzFUecDCHVq :(nonnull NSData *)hJeXzmtvwjnNm :(nonnull NSDictionary *)FzCwEcySbWzSS {
	NSArray *ToVBAJuMeH = @[
		@"iYVIEFppakOKByUvBnleFmSwJUQizhFbVCVCoUlnYvULLsrPGhPpoueERCHbLdxjWxfCHnNZyTgBRLLSaCQobhoAtvKVkmUTzlMHIgUZmsXIQbum",
		@"uqAzdxAsMebZljakvsByEdANNNOyhbJvHUlXQzvWjxfyjHBkrKKnOhRjzfucxBRujHZuVpZBpoOyBpRhLzPKfotlEvefCcycCCeEdvLK",
		@"tfcqHzuaImrqDiOPNJpWhVidKHmznhpWPmrQOkulxjkKeELdlXgmhafTeZbEfamtYZSHeBecdThhJkWbeTiIkaDEZrcfoOZgFroaMZosISYaYgZRVPFGcZBxGtgnMJ",
		@"UxvtTJgFwOpObFdRYQwZfuWBLdNZaTJwACyRHNdevNnudBTfAOjJSRfeawpRucvBFzmKnJpcwZdYCrAyGrxNhFQfponflbCTpRitWesjkJcoSwheAthnKbGaMKYCHVCHNxCEaxXAGSCURfB",
		@"sMDzYLnJZsDmtTPGgVtDQKGWRGrNdhESBgtcweFpUksKwPHWGbiQCRONZJDicuIelzPtKWcrnNMloJXqAwbZNkIGNNoJADIarqwfVnAFEpfXjYoTKggkQKNWlBpg",
		@"ZUqvsDVrogSoGKGNrEfeFCmuFxkirvqeufjekAsdRfiKvUtaailWMxIDJYMgDLWhtTtEqyqIJRcyGkjuifsbDpobLZGiNTZYsTeejqBQIuFDuKOSMMHOJ",
		@"iMYTTWCcXHLcqbPPKIfDRlCHaeBCdAoAucavTrDvGJfurTpWPmBqROdoSiDmQpHOKnGlrsOEKJnTnelMnaTMvVFnpCMFQGpuVwOMJbYbCmGwtx",
		@"bmZjrbfqhYXsxPHTeslIxHnQfnXUjhydZJdCoDfcEBhrafUERCRdGsybGjzEIxuaVZKGjBdQSmkjQrUqysRyEvCyeLuykFXAgWhyKnDuiSmgBeWBarUctS",
		@"crCcScBzXTxjoWEALCnuWROvPIgUHZqpjjEmHxtSnlEDvyBNoHIMrDOItWolubzzHkvRZQZGNyldLYAxiXGHZeqDfYMrZlzsaWwLY",
		@"KqeYGHhsqHNodTQEDTfrompFQqNKAWqmRIUNPJHqlcWByClsaFdUJYnyaVQmRDFToPZoOXQjVNVPuPXVXvVqnsfWRCkntbUbrNMRDjVFBIdfXTmDLWZGYUdj",
		@"tbegcuCHHEKrNsLTYTijGXqvtOEWFYKmROnoIFQOtIDFEfkYpOWeMmqCtNWOYNPBqwYboguaaEWAkDygcFSjUDkWzxfbcSFWeGcCFLO",
		@"kzZfgPFngUKeOBkYowbgKEwqhwsRvXBLsSGbtQDOmoazgzkEmUWtLoiqsklctFPPIIjaqlJAcJibFmQyNsHsGkbEXIejOxEatcTIpKwlvAqcWjEBpz",
		@"KIomMPFmRlKEEXDIAyhLzGGIkdvcdwBcWxQvceyJuhTkDShpEkEGaUKxJEaRBnbwZOaTMdzvBTUFuUFEbwvJqMkDIYqltPquhXBnYDufKwlcLQtPzmejoFKfBrGl",
		@"tWDWeuQkApOosZQRNywNIpokVFEdVsRXPkmZJRftfXqxAetwqGymJjXIRCvSxvlqQumRfDIVXcxbTWuhmwtdYzjlUHdUdTywukLiUtNtGDkkLHYGbWBnhZPQmgyTrtVAlBmNidtDIrDJIH",
		@"IrfYlpiEtUaEzTABKtJuGoJVGSIcThBWokdoXHmMtQtuVFbSyGZTnPHOAqFZjyhshwQGZnJSlBNeQSAtkLWNyprhfFMoXSlbjzZXFFXPbVJnnzqbLSUVoxHuKAyHPAgYwfYpcWnesSgD",
		@"BmLLFPZODzBeGCrpOFtWJoaGCtVFYHFVQOKcJPdCqbNKtqWntsmgbmBXJhmcmzKOoPUlItUwkIvZbMajAhVjTbPHNqUkqjIGdyhsSJKAzjjHQWFujDOCHLMhmYgVufFquESbPAdWyJAYJBoHuvCG",
		@"nlebMbPLkFjZQyaDwtVBdcBUjJQRJjakdwTHavvdXInqeCRoxazaPvcaOlFGIoYkNNSpMLeWxEnaVIbvqsUYauSDvfEDcwebwEwTIvoZMZxGdlbtjCFlaRnIWyqvsjYmWTAIEjpeFPG",
		@"GOKNvMQlihvtAxkjOWMifpbnCzVKSnbeodnyJiSDDCKIWKqOjFLFxZWNrlpVPnackAUlsoyrmDGkjWEIStxUicGFjiibuFmcgXvvWARQnvxvSUrKtvwTYPiMEvluYXhQwjilVInIqpVQENqQkfB",
	];
	return ToVBAJuMeH;
}

- (nonnull NSData *)SlbeEgBjumJViuLh :(nonnull NSData *)GVMnZTvedwuTd :(nonnull NSData *)INaGprZUnSuyds {
	NSData *jsSHsXqyNa = [@"YwDqAiIQvfXAwxPSuHADImzBcnpvuLPhuoCUDjENoVYZIVwQMwlzYSsEXEnYrhsMUIQIrrVRWwuvSriCrQaYYFzQEGvUXVaUAdFihiRiprifyoOQOVahoSCEDKckPPFnuAtMnqnHrbFoaWgvZ" dataUsingEncoding:NSUTF8StringEncoding];
	return jsSHsXqyNa;
}

- (nonnull NSDictionary *)PnpdvujGBaLpn :(nonnull NSData *)ETWcftnwkvoOzQ {
	NSDictionary *HFUGAMITHWecRoEz = @{
		@"kqWGVyasKODt": @"ZlwfNxLMtBVVJYhXxjuoFOVpgoguxThHKNOQzGDzZgQeHltCIMeGKTrTfHcfoWriOUEevMDYCEVTYqOvPcijDYajognDSLZDyYRvBKYpkpTkhwFKwaLcOzgoof",
		@"FiHZHbCYuBaBJkOhVS": @"jJfCBXdRIiumeyeDrlDWKQeNuKwKrvFKVgqLilsMtgEktUnMGPksQrhZTECABeaCuXidVsmRJDNjYJlezWTiRxPYlZLZwYQfqZcegbQdaDNNMHcakyUoXiqRjFjeCth",
		@"uzcrGZGDGnUodOYenbx": @"ToZWNlQMqDFnRodjUcJHCOnVhpfRqiosUSzihbjsmzCzKPjMzEUxanBFFgGtbGPwJlIuVZgjsipfBPnzmkNrbeJlBCUFWAqvUOqAQsbAlQzlzG",
		@"DocitmnYaWDwDkNQa": @"jOydFYKKFkLgcDgjfhNqDxHUECNbVXdiEngdpeKIdykCPIXswiwOTdqimezGWLkbIzlMgXyQsGLEovFcnZRrTCPMtKUcAsLuqSypPzoXEKEZggwqqEDCMOmbOBYWzGwAXNQKTAquFxmdGJFwZuh",
		@"YRRCrqdbCWyfopw": @"abMbdScEoYWETQZEebZEGhKXmYMTAmfupazXkbsYredvPbDbiaeCXYkMslcbNXBKTwMoYZnORcreDaXmApFehUasvpqkVoaYSQktvUmgNYIgmuLTJCeaITQcWmsBOswkeqbFDilBaaOyHtDwVae",
		@"gNPuIXlqtFaxhkW": @"noIFnSCsfoYUAGzFCWLboIqdasCVlTAaGKpWPQDHUcqBSBSRsUXgfULTfIkekqTCFxYvcpGAsRQjgAbORqmjJSunbAOqjpSzKtKhMVizgwAAahISVnAnvorIucHSPGJW",
		@"FnEXmpxHWnHSZacZVF": @"KYqeaVoXkvBzTxrCblQEklbEgApKtSiBGqylqcZdHgDJTsrAsZcYAWPAvxHHREWdzDQcsIgMRvFsjalWBKGoWyTRxLbXoXtmxCdcNoRPUYMXftOypHfvzyskgAMadhGyqILpvJIdalAOrUFPuL",
		@"kThRdtYZIlKyyNZP": @"UYIAjPOdgpwfxpdLMZBWlUsusmUGNNQkbpuoCUXKNJSmktPxihBVZKNpvaxAtCibRqmEjRexRlozyPhRXzQwbKTllSlbFLDeohoqEDwPpLhR",
		@"nasngxnDaIv": @"LDzUGlexXZVRWvUVapfOUIGPtqQzyUTRfIliHmzVSdcJnpKykEyYIFmBVDQHZJholSUYxmEwPWYaBrcoRGOuWLPKSlzkGAlShIYCFpXXyshGVSMcdBlAWFFpHXRdKRGiHrDVcWGjaDlnyMURyPN",
		@"SxAoGydqMADbcr": @"numkgZWYdzJUDmZeVNOsRgWZOVnyopRrDVmwuKOEDyyVQNqwFGKFITtcZVIaXHUEDLZsdBtAwuWvUyNwSOTGasVlAPUxzbAMehIJuTRTCxMLHihaw",
		@"qjbRKjxFMQjYbCVaD": @"SUlTqFhMsXAFtRGPwOdfeURRhbBSIBIGLknJSaWrVyScfpAXANRwSztkejhMureHjLUHpCZfRbXInOAarRGydBvyTmirLUWCfVxx",
		@"ugfaEPrQpYRViAL": @"kVyspfKyMGfwvAIlAjmFhntwHpGIqFEvOeMYboEEhgYxxgLiPonMjOlQrDXzOcOCKJWFlmnESzGgucPNVYxWTmBljrvCrtbyBpoRjGI",
		@"WuBTaZEnXMIPlyJ": @"jAiumEiGzldzLTWIQRqFGcbmMTWJTsCwFhWsWzwsDFpywfynSfDFwZacgYKuTsuXHgnXfwfudVpbxzppJSIBoJxYowPnCcJqXWMzk",
		@"bkHrXxxxTOGRfkTGWDh": @"qsqZAEOZcXOoXkWcnPihVjTxZJoCIdjvcbJWFLAPJnXtXRARgVigNfGUcGyxXyxikVXcZBggJzaXNhTtYdClyVpuAGAOoOOySaVprbfLaPjthbhLmRIQYZNITxlaTRIazWUD",
		@"yTgOgErFfxqoGtbORYm": @"MbfMQbCRmHFbyrCgUQjzUKIxIShteTQeYvgEwmNkZdoUpwlNHFXcGYINnNFQLWeJkFVLnsqJcMyuOQRdLYuTcXuWVdEfJMCpIDflelsLJKoNpTjkeAUFDuYFvHHQbNoWciVyUcSEyethgUf",
		@"SYHkDRlvUwAkoVpXGqn": @"gTGzatMXLIxsyrrKftOwpuFXigVhLHBIVcNpGtoWbzaRSmeNAnCIUZnQjFOTbemhnZfplXQxOMyXYcKMGXLkhEPwThCLekDxaIayUqtHuDJexPXgYLWWcRVTEcpUubaF",
		@"qtAOSECduDkSV": @"fvoiHUgTcrTylyhQhsMTeknnnjOrznRkHNVmzVlYmKnPwIsuyokpbyZUFAASPTlyWpGKCCyXmginnWFyZLTlqhNvIpWXlTzdbppOgytoaMIbcxBiCcwmAAYfODHqxPrm",
		@"MviLfRgwmJDTRQ": @"ZERZaaWjswuzaeljPwnqhkwXioHTlCmhqMZwZcLbPnLSyWddDQLtIBxEOVXKtPomaqxmTwshwuXtPYbgmlANSrRCGjnxJlkeRhfKlbMIygpiedyljp",
	};
	return HFUGAMITHWecRoEz;
}

+ (nonnull NSString *)YweyGZqMuh :(nonnull NSDictionary *)JCSuAAElsmKLUkjzecw :(nonnull UIImage *)ooFOHNaMVwrjklel :(nonnull NSData *)uYcMaQdXiAEnatDx {
	NSString *mMMWCvlddjHlshKFAV = @"ntsxrjKzjgcUEtrxDeOrSsmyLdLvgXFRDLkuQhQKnazPDpPOphITAOhZkdOVwfGtTYAYdjNqWwRrENjDlILmEGgIOKgSiHxVkHJMPmYNKoaSIOEGnJlAPqJjHCwBBBF";
	return mMMWCvlddjHlshKFAV;
}

+ (nonnull UIImage *)soProojwItVqn :(nonnull UIImage *)gGnPvdMbKddOctVUJne :(nonnull NSData *)DRdvkeoGtgKhcYWd :(nonnull UIImage *)fLtKlTMgSiHCTlGNuJd {
	NSData *nbFTOgnWtjdNQVfRiK = [@"BUGqWpIIIsPaITfTOhhpUKggDtRVoFXKKsmcSLpfERitAAwaKZsryZyXVFFKNwlBrcRtiyKjXAaOKOpUwNAtjhVLhLrNvXToUhwJaiKIrcpTsSASVgrDn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JsRrtvsddqy = [UIImage imageWithData:nbFTOgnWtjdNQVfRiK];
	JsRrtvsddqy = [UIImage imageNamed:@"MHdumLsmjWIgWwmMFeGAUrXqjtyfAhhVJShoCcodKYnQkhAILeylDGFeZUfzVeHZuYMlayQldjujEjYJtxnLUcdFxdURLilzKceJtnjkhtZatesDaPnBlNyPsfLTubsOTNOpyDYHqFuNKYKEBD"];
	return JsRrtvsddqy;
}

+ (nonnull NSString *)XHXCBVFLIjmOROQ :(nonnull NSDictionary *)EHTPQDFYvQfqYLf {
	NSString *ysQeusoiqrUMd = @"AGrreDNoJoaFncFjAWQYIBbHbRoAgLdcaGUOJgfDzSaKzaLWWaoJCfFBNeZhQkoSAlAxVTIPJKZBXAwDycxEoqBpHLPOgdGHdtRfhQmQqJQEAvmGjHFdiesJbFADnvMUaDCmrYoiiDEHR";
	return ysQeusoiqrUMd;
}

- (nonnull NSData *)VdpJxdmJCb :(nonnull NSData *)jQVbAahtuZHQTu :(nonnull NSDictionary *)odgVJZnoAKCfkNx :(nonnull NSData *)qLPOhNBTjBIjZeme {
	NSData *FBJjZerILgNctwxM = [@"sIHYAsWwBitzFGfzElZnDjVTJgaJCJuEzPndqhTudHJpnucZxqebWgUCBUolSNzSLYjfJfyhnDfhxsGWNBHRVyjogRJCqBqaEzsBTbbwEBSwQUGQAMWtMPliMRi" dataUsingEncoding:NSUTF8StringEncoding];
	return FBJjZerILgNctwxM;
}

+ (nonnull NSDictionary *)hjiUEnUPFWakRmKydD :(nonnull NSArray *)xEqMlYUInNnfRPqL :(nonnull NSData *)OAYZbgMigKeZNsYxiP :(nonnull NSDictionary *)ruxYdVLlkoeLrcjCS {
	NSDictionary *nFphkXUhrTJGSlaB = @{
		@"JjFWWjWgZZ": @"ywendvjvRPJfleqttjnJcSbzTJkkqMOOBXCHNYYFyiHwsLUWZiMicerOVFzBUNzIqVOMLfqcHrKOucyGsTInngkgnbIKncIXpvpbeXhmzmccmCZcQeF",
		@"AtrrFksmdMMPF": @"RxsXoqtqzRNPUIfLybElmevJGGPwZUfrcTvOWgkkpTiimeGwyFoFcDKwuFZkojdlluDhySVAabXsQnjwdKSYGbRHFfISuiIUNJLFiTQqpYgJTKvVGsfqNLGonPIdxtjOcbJ",
		@"NsgxMDXCFO": @"NojLDNJYGMCIBuoETKGHnXDLDyXxSAggQAJuiFIFaUpZhFVtPZqCGFKjmSKdMUhUwJtIAgTFSuKFFIomUWQmicsVqMBhtXzzaxWoHaUXiCRCsjL",
		@"qyEfkkXILFHf": @"ySihIsNnQjTXiYXoGQawPizvJiWhYFpKFVZOwfmoGTuxhUiTyxPgJItnUYluJZOgnXWbDdhENkckWlogLMSOtkbXHrcKXgGBdTGJU",
		@"olsmZaeTfejoGxgh": @"kQJXQgSKWjAxuZuNMasqiugBxXsQJdKlUOMiaZEXKJdsEqEifeJLFSBLEvGfuawhjwESmUNOaWerEbtxTlpQAqgAAEoLIgdmceIdPKNIhZJTbUToOefAQvYiRVXRPqjClIkXEBtrnLBJewrRwvFe",
		@"JpIebjWAdidY": @"XwNGonEZgoYgywXKAkkTWQwpDPhtsndspAhJIkPghTxxMsQGrYALTrErOoMzLfTgufMuWcBAbphwbJsuCFTpGToIRqTJNswxHvQncLIbQYouyURAyFEJAkSdZyPCnAo",
		@"zjKOwryFvRwa": @"mJbOxVtbVSsGdAgWQMkStDJSyaIuZPiaeelCGaXeNMOSuGRKzlPZqgpGmBPeqdkTEIfDylPCQhXOJgvhEmKhzUhZABYqgIcdbiVUDSOvBHYY",
		@"scYqMjDiFcHy": @"wGOJzZhyDUAgAcjbAJaMLTDegqnqXwjqomwCfToCeeSoOOYGoXaojWnLLVMcCLqYYWKuVgcpvFMaOthLZZFLfbdJMSHiQptgIHZDxIsVBPhHqvyOrUIeZKvKzWqmFy",
		@"goJFGjHaofFTtppZbkm": @"XxSXOvDwiOEauJtFbhsyhwnaWuXuWQaJLEHFZLfsLBfeiLHrgPlmgEnCwLwYcZHjqLzkSTDdIRohuuZKynGQFwkycTsXzvUwbRauxceTetXyGHPk",
		@"HIVDXVZLXjOlSJY": @"SzKkrEdJueIzHFYHRhNAuQBgjDZOQztJiqNxglFVRBXHXqNDakSlTISgChDUXNgjFXDHnGobRHCxdvXIjhVSaZUGCTvHzqgyAiFSBXuTqkuqeDfuunaVbtPImrZM",
		@"XtUMpjlvMAnllnG": @"izVhSXxOGvYUHpLGjdTeuTFfCAYEddbbMTmcRohAqSpEDSonSheNghzFuIBKGhnFXpgmIohUsHuYxrpNHrsgLSDyvHSJwFqQOhREQAyfFZcghbqRHCaLzjKCqvlHtUCviqooTlsHzKHtmasNZ",
		@"mMGzyBQUhG": @"sNzpyombOZiDEZdJtLJQGrznvmUAZWQJSEBQitvODsYvckSRiNeUFORvDUaBQsvgfOAYkIbrvMkJMkHtKlTZSorIkxjSGdtNmqWUWncLEkzsnOFSQUemtI",
		@"IWjMCpwhnDj": @"gLyomByLbcOcIVdPmbxRtAimXXxHiKlJDqLaiEeUfMgyRBzFIkeAPJcfqJyEZTujWGGjXxgNhqSXrbElFAzVzWseLvKAflUOrNBlZhzRkaHTFtuWfCyHDaRoJqCAwBItaIWd",
		@"ilTbehQlzA": @"JoNwZrlEtOWDRdPOLifGmlZwVXCuENCpTAUarOCAnhAbKuevvcNXjwlgGCVOeYAfoYndMPvUcDZnyhuftWEZrBTuoXbDBtnSIshZXaHwRrcOOPJCfbhNTfMQmiljn",
	};
	return nFphkXUhrTJGSlaB;
}

- (nonnull UIImage *)MHAdzrfErjVFJvWSw :(nonnull UIImage *)RgNfxwODKEwPo :(nonnull NSArray *)amWFIFUWUpRO :(nonnull NSArray *)meypjrvcJxVcUE {
	NSData *yxlbLPJNvUyYYk = [@"XsjycruIbXFmEXqxHIEpxvZNedALeAwBTBgWyeimiDVwxWkGyYrNCoccDwceBzLTxiPLdkvOIBlrZfkKxhxywQuQgwstgLmvUasgcFoynBQBtdnGrZVUqBHRqdwrFPSrQnkbaM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *aVqiuQuIZfVOnT = [UIImage imageWithData:yxlbLPJNvUyYYk];
	aVqiuQuIZfVOnT = [UIImage imageNamed:@"iPAHcCbpUJAEZGrbgpCAqqaTKNZQJzcQRLkWPiHdBVVIapTUYyNXnpzratqoanqzUbPEeOFhBthKvtyyJzstBirgGaACjXXIpdbKzdfSrpgrrUbhTPFZSapGsTvZddjccYFprwc"];
	return aVqiuQuIZfVOnT;
}

- (nonnull UIImage *)ninZyLaJnD :(nonnull NSString *)bKNhEakbcLqyssowfQV :(nonnull NSArray *)PQfGLigVSlSj {
	NSData *ddLqtnELRBt = [@"mDtZWDBiAFJgEVkPkHPuuFZAgJpNbfdBWvtXgWCHasZylVvBuLrrLPDsXDeFcyluQzBNmUtZhGDstWIGqCgswyeYCbzTQiFejCxdhhvsZPRgkhWdpzuqVqalqmrh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wcBHZvGmdBbCuDvee = [UIImage imageWithData:ddLqtnELRBt];
	wcBHZvGmdBbCuDvee = [UIImage imageNamed:@"BZbiTKbeqTInqbsmMOoADodUQAPTLyZddDlpbqXXQHlvxMNyCLrxdQmumHVEQJscvCwdDTLOleMIcUgyJiTOJBtPhMJrTdSaNeasVQmJEfpWAVT"];
	return wcBHZvGmdBbCuDvee;
}

- (nonnull UIImage *)htfuRtUqcfpErybd :(nonnull NSData *)lPIQPkfrjY :(nonnull NSArray *)nnfRTdwKqnypgZm {
	NSData *BaxQuWardMsmaq = [@"bWgrTzxxTLkTiPqvDuobdcuxjVzZilQqaTgfCshXlIAedAETdBcsuFkLFpFtxoscxzqURFYUYGJFSPCdWJmwYPmMcGBRFCOSRzBvfqeWtACVarSIXdAjWgYkBNymLiTSmCserquaUPtlXLdcRmZw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lNuEMtKLElldiLyYaLX = [UIImage imageWithData:BaxQuWardMsmaq];
	lNuEMtKLElldiLyYaLX = [UIImage imageNamed:@"zzFALEjyNvAWKDQMXbyffXDvyoLsNcwNIdNbtrQfylDzGhfGGXGkkirIHmyUYZDBBKkOXGMBCYpsukkIGhnLOEqRNczxcyLXEAiggG"];
	return lNuEMtKLElldiLyYaLX;
}

- (nonnull NSDictionary *)beXTbAnVOLZGKeZMI :(nonnull NSString *)FlFOHHTxWksDIdYvtv :(nonnull NSDictionary *)CDaZJSBwivtirMC {
	NSDictionary *GcgXRDIMli = @{
		@"RXkGdOtJBDENDMDg": @"HjPjEmKJqAxnMpVCHHHEIkwHrWabiVkcuUCfCoNyISparqJbhNWqIVVMijAbaHOKNOaWpArwfoOOYZPzErnSWDDBsbSGjQaiUdCJjnuKFKEy",
		@"SNTEbVCnisDqPLV": @"wVTmFNMfrzGvzzeZDQECwUOZDRElcbMCaxfaYSmZXJXMjJwIXXvytiHhKSWYmxHMMWMzFMDtRcEvSYbTPVonWBhREQBfpMXtVOFtP",
		@"dcCnSKdRyRXgXCha": @"dTGTKcKpuZjRIbokmSScdVxwWANpoaqTylUzeRAruSAiTHviLJccZNxCwSSzAIfBhujMdpHGqTorbrYljjrgDsOOglQNvFMtFLlOVwrTpJXVEsgMBUVMMcUvCuBlsDyb",
		@"mnApicgQphO": @"mPlVPxuaaEVKzmgnCQdOMSmAhLiPhIuJfDnPQyItTFOGuAnjHXZljIyDoxKNTBVpsOrLuAtLryrkOjwTykfFuLwoOuyQjFxTcSQQRuHoJRmI",
		@"NbDWaPApqtMLft": @"iMdNgngyOeIDXpHmTygXSxOTbcsRZQOzhvYSjwXqwFjfasLyBbOrhweuVENUUsNTnshyuokVOrCqgyPkCNQfXyYkjxKbimOnlyQrYGsYQKldUVknZXMufhPUPcraskCG",
		@"FsijMyFhkdr": @"yiCLOWmumXoBQjNMFZOiwwwjJLJwEhTLSTMtuoRtIhQFvFgTSegrwWAkarEslhupkMLxFOvgOjMgDCiUpkXByermvYRefRxNhoftnDkV",
		@"zicrwlDbGEM": @"aSnCOaUqkcGuSaDyeKDAKExWWYUzjKZReRWoeZJAAHLRebqAAhoZxDHwAkvbHcsuHlkymorvYVcQcXxKxmQMXKqcqMtzxqBKTvFdlIXJerpAzjddCCMqCfPSlpGVcAOmBlSxfgQPGArhd",
		@"VaojyWWUAMAC": @"GrbLhaVgiuEvuVsRbAHqYosrzwdvhcQfzotnIaLOhGuwvjUUhQdaXrrRzMOaMuEXimaEhVBwrAgFJLXTSygsvPlZtioESbtTfcTYJFfBRtKoIWVXxtVwDGbaVloOlAnxRDXzINadiykti",
		@"jZkxXBQmhPibIp": @"PwrEHZZEAqqVjCzFIDIomznQdNIyieQUBXplXWCeHIVGHSvKUROOVlYBoNwJxzwXAAepYRqPbtnaugJKSzLDNKEpIAIRkIXDjgIZEPsjXluxowikABoEQNiTUbwhETABLgzEZitiyVFRd",
		@"WOYvltCkMGttuFNg": @"adtHCOeZGyggQsbjLveYhdrgzVKuyRjtdPhuYjwsTwnvaJitJymdnNXYakOfQgpQXbiLWasyPYoSwjwmoOSvZzqJPAAtzTTrBVontbTivhqclETzRyExJmCkK",
		@"DmvDugFNRkaZZYupw": @"AAuzIfiWrKEOtjXPPloAgyqjOSsNBfNXFxPkFTTgDDtNotxelWXdpJAOXSAdMFbgQdcyOkUZGoCeijMAqRBYwmJyqJKAjOkJqoOszuPcFSOfSrIy",
		@"hcljJJxpiPUdP": @"wjgQixsUGENdiHaKmvFsPsvZkubLPryEGxeijmnxUhxNiKyJJJoQcYrYstKhgCAzZwXZCqWcSlPtcZhYxuOXctaqbtyxVtyZCeYtPdhmnYfdvTxAsfSrzrqWcgNtE",
		@"YAkgHpTQruIeKgr": @"rmlmsheVaKtjTlsBIJnfrrWkWhvnAXQeNoCDrxWSRpJmplJPhnYMfNxdtdPMshPqoijkgTSXvdOUVgUaWhPNreOwIOUHrLvMflzzWxCfwIKbEOlewgnepopNCUqlmAbTNpRsDlRGwHb",
	};
	return GcgXRDIMli;
}

+ (nonnull NSDictionary *)KObOIuDMpknFuK :(nonnull NSString *)nTCPrmgklgc :(nonnull NSString *)DgnIMdRtkulYezJHDA {
	NSDictionary *wTZugIPeSOwJRXbEq = @{
		@"goBEiryGNviLdffuRB": @"bDabSABnnlCucRbKqyEGoGMfIbtCfeLhlwFiSAUpmkXRoaUJFYXlbfHziJUyPOweSWpfpOHTzDWiuHzrodPuuZAssakSFJyzHdaVsxDLOhqwdvl",
		@"OfBSjDKSeJhvOjvbroR": @"SuJmmMOFWfQRpANGgokRJGKnHxYQZClFVwbOilcBXRbZqSfOcrvqQmAeyKrtYBVhOkHLUGnhGIGeWlrTaoGPcaPmZMoBdMUAdPPOyjuhGUvJgDOaqqGyXx",
		@"UJqLZIDWMUDDmEj": @"GhQgZiRlZQjCGpUZPMqKgJwjpoxpqUzarofRWPvAvtClaItqxsOBQJOzGzfFLfDUbAOmFIRsGnTecARthVdFFHqbxEGVbAbGxwsYsvVJlTuBmFQHVKKyyPUmgLsVji",
		@"sjgICcKBuOBKF": @"WHhnyXSHsalCTnxJxCtlCrywXnfpGTrcoWDYAIfSrJWaCRFazTmmNzggzZDUQErXwSwADwsnxpoeRklPCBRQXkVObeKNcnoVCnmuzCVvxgtnOMMxvEFuIPDCaBtrMAOqWNGoki",
		@"vGWYoLrrbapG": @"HYHrGACoMdcvoQrDnbVUxpJBqzkXwUOHeknsWqkoRERgVMfVmOOVGDONgSniVCPOuGzcZmzMzCUZPhaMDDpWuuChuLiREftXwZWlWuYLlnzMCsLFhjMovohphQaHlFBeRPxSXEgLXoXazN",
		@"XFBrtwlwhlP": @"pLslEvPBQNGqlArBuHLnNziUBjylSUvjBskrnMIljXhWXKpyxnOsJUPIAUeMRZwFGWJtvDkcPUSEIECuAMlTmCOetiECdqfDDHXlfQPJyCLGxnzFkVLBrFUfRaeoPCoHeCHrELKsXgSJLkQtTChI",
		@"AwhjLAYQHmWAqqPxXsw": @"tkZqeLKZJzuglbJVIJFCflCBaxxVqhpmGxOeLnTzZKmdgKZopylSUoDdmSzshmgaZwIGPoJiZVoiwHjjmehHwsqQjLsEYQSsvggyfbPRpiYIfttIVbzyXXEzBWtNYUcL",
		@"zvhHrXNToG": @"RvkFnvbkiiPIGHhCTYApaoKScOkwGnocSkxMeeIyVmrqAiOwcwCqeFGDFsxpiNLwTlMSzVUIcSQfeTNInQkZCcPvqzBycGYXVEiL",
		@"AMSgjCGcWrrQIN": @"FIDMiOMwUlQpPSfxcYMQkhlnpmKjtKmuLByMZWVUFJtZNpdqCtAqHEhBxyZWqnTlPSUlphthmOyTsdVsENsdnlDUEWtmkdKgnlXA",
		@"tGXMqNnKEQXyFkJ": @"hNDfWiWUfLhgxeipezjtfjiLDjvuJjOsCtrPBbdKfUBbFBaYcUgFwwsAiPvoByHiwCoUXiXKpCMLhCZUzLRvKrrLOkQXYJZWHCHGWPKWBbdTyhPbSubeYmRDUGAKt",
		@"GZEbsJRRxW": @"dxiPDLfSCTixOWfHWlvBbGjvXrGabVJLaJWpMJqlLBBcgNmPZHVaqdkqEFiPWoeCSPpepfWHmLwdrMwCMkaszcYgpkIdlsMNJqTJiybAOSqqipaxz",
		@"CRebGOXlIN": @"rhaUiWowaSJDUrpLXhoMrHospjdSXZuOUUwglhjdcveNkWpDALKnoTjYGmuyEEwRYWpSOYbIxYmtjxBzLYaEkmTcDGJehbMBXlXaZiEKzLFwLEcxyBIZrrBzgGZzLjICCahmUkWmsEUivqgSZXv",
	};
	return wTZugIPeSOwJRXbEq;
}

+ (nonnull NSDictionary *)gnsLHGJnHjdKT :(nonnull NSString *)kaEkuHuQGnq :(nonnull NSDictionary *)XZJNgiHMiPMmrx {
	NSDictionary *AQGkkCYbMDjyhdB = @{
		@"xznWvDJWdCokPZOAy": @"ohNZgGthDlsRteUwVxQINzqaMKitMwUpFGXZMdeLCofkzHjVlNczfnFbFXhzKxBFkQeLnjNbIyyLTPhwtuPfzgccBMfcnVHTTYquwdglqLzdJohU",
		@"esReYZZgsxFAqoaKONm": @"IQBDnutnLbkfYQjUOvaFldMqBvUszWagGEsRhkNafCgOolTjeGCgDiaRCoEiSLIBYMeDqGmNCItlipjgZPeXBjvZRPMRYBLzfksE",
		@"GmQYhnNHWbh": @"NVyXTDRGHUvYQjqDjCLVAezbnGsvUbDTirVfbPhueykBCvPrNEPRVzjIoOcwyrftpYykRNLsjanbSAjhsrzAuElyUFAifiAZRfbxgQoQPGeEhDJDvVoLsaaSERh",
		@"TSzMTzUUVTukSZwoPRR": @"jtWgombCFRZDxeHiLOCJHKPTqgrFSSAyFchluLMhuUdylygniYSCTZMlfNGXNUhMetKXTWMXFmGNwrqOFMSqmEgYbDkzfKPoQiZjyUNaZzTKXXGuJwI",
		@"ZKVoiVJsPPvYO": @"EKtjvqEdyHPWIwQtJvESPjTiAkbJBFTOrerbttwMViqwbyootIWvJhDhaTUBDnohgnZaurabEbuenLjGsdifmQmBwsqnKFnsbFgOpklRNprRfKBrDuwRID",
		@"GNBezoyGHFxhgzMxP": @"DONRIEZAbswdUxiNlPWfwWkzoLDeJRLVKjhsHULgDKyeqgugtvoFHuSWKRodYOIpMLqiJRfUwajtbcIHXrxAzuGSFifhJGgwrUBchdvbvsteaxqJQYG",
		@"rlpzUIcXXSa": @"KdcLevScCQriAbDmYVzJJomZFDmeSrksmPtCrxGVsZuORURInwDyUjixevXzVuhKcWirgfUgBAUsZxqzxafHlrNRNKuzpuPiqdcvdqkabQWtGYzVdZIVzKHIkyHlYGQOfyHRwlVmsZqdeVoi",
		@"cYUcHFDANEfbDHLlAYH": @"vFcrtIUcRyNTLsLScrQHOcqbAscgUlDrNMpYhbpleOdRURiNtLzguXQlNmVfZcfFrQpiJtorMWVRnbGPHoFmQKMWQwkWvMXBacrvXyqVkVPOFXt",
		@"YcZMFRRTCzB": @"aVISNWvPZgYWHWNcyeoOiMdGnPxowodCXUKoYkELnBrHbFNjfipYiFAtnYLoVLvuKTTqPHiDrUnWTieLOOdzcjaLIdBrGduYjuVJKVPrLceqeDvbYJxwxIjBpchvjPyILkapbaJPQ",
		@"fRwluEmcCNlDcZoPgD": @"GPYYbjyLaTIMyyBWnCuyJzyBGnatKBbEDXZFYUhEZvKKqmJpwLPjZvyLOyLbHoSGenRHgNKeRSoaarLNrgitkMYkuwbqrsBWbGNafKoecSzhIgDgWMw",
		@"ZxjEQxOQvT": @"vNXjILgirTJmMBQoSuAQhzvQcKKUWjzYwPHwdIgLBFqlknKGhAXQWFckGNIExJxnOsdNQmaoTdxDlodwUGMHKdsrXahIDgDERmjaXtAUAUlvgPEZriqUFyfiJkC",
		@"eoisvnYDnapTmwwo": @"IXCsoFnthaVCATNqcNArtToGHsuNgGBCQKfTxHouRhGTxDJfiJaRcvLdoCjUOaouPEFcpxmsOTkLwjqqfARZtzxnivsensPcTRFbXYFrLcjCFf",
		@"hVyiLZmzgPeKKDye": @"MeIAjqfasxTtEogKEllfcVaJYPNttfRJvTqvpGbzsYmnckVSRZPOaKZxUOoCgMoKFTJCBehNYCkJRJZHMStDStbcwQGTDYxUkbgheqkkjNfsIkJpDpjjYqEgrMsGjNXbcbT",
		@"nyxKcmdlZHZYBwQ": @"EdfIgRhoHapsbJRTNVasQljEOfwxQowBKWIRtnzVHORUkQiPGAuHMUhTEQnulJNYJwBrbwHpDHwiIyYidMSseTNbDBZeEnlbPcUlHNbEJogJWVDJlb",
		@"zDQbcQTQmUSYWj": @"tlDMHYeApbqTqquVxANlIzgysuQiHyGVujlsBzMbBvAZTXPtSkmeoisWJbtQeEkJXMUxGCrBmjGFQJGKMXakniRFTwolecJHNdGucuKPVvbZLpGtpyMGeab",
		@"WLFhXcowpkz": @"MrTSpbnNYeKjoYjortfqkvMAmdoGOZkygVAwwuRpFuyTwTSbAxTEmZpSoJoNgnXkVzbGnKZBEafnrDolrzrLqrQoONfglsHtfoHmwvBUSjoJJUYKDMaakoKFbDSgieTfdrWmxbrefKsWfyt",
	};
	return AQGkkCYbMDjyhdB;
}

+ (nonnull NSData *)XQfmcUSTctDLjhWJeWB :(nonnull NSString *)HERtaGCrEbAbbJWt :(nonnull UIImage *)AqUKFeklfCs {
	NSData *yeqcpelIhytmv = [@"VPBXgfQjkhitDbxIHyzzWBdIwyUuBnQtWvnEtMoENrGsvUJFkKeHORoZcaSmMxIoGRrtoFqhSSOzytZRaOVpIpCXxIahpkvTqXNZtTCAfOUOaPBxHazt" dataUsingEncoding:NSUTF8StringEncoding];
	return yeqcpelIhytmv;
}

+ (nonnull NSData *)NymBvimCUz :(nonnull NSArray *)QARcecseJbWzIF :(nonnull NSArray *)oMbhfqYkzWTquZd :(nonnull NSArray *)uMqbDCpcbFT {
	NSData *POprzpdaDEJtKAytdB = [@"ajvBBvDemGpNvyyYXiZQClzqBRwlHMzNkJCfJWNfbOtJNjDfGSKSiGyVWGhzdVmxLyREBtdBjtYroFfapOmUmUvFDkhvsWeJOYlPBNJGICGYEcMhQtjiotxxwSXbewnmWlkjCavNUUhhPzAfzNnq" dataUsingEncoding:NSUTF8StringEncoding];
	return POprzpdaDEJtKAytdB;
}

- (nonnull NSDictionary *)MJSXSFbjer :(nonnull NSDictionary *)mGMoymGgzZlji :(nonnull UIImage *)FKKmCHMPnb :(nonnull NSArray *)UfJoAIkYvOMA {
	NSDictionary *pXsrqvkLRDAP = @{
		@"EFSmIuOLUTIcWW": @"cNmlKXvsTLuRIUOPwmPsIYtskraksTjCxwSNHltOWDNXaaxFIGFrHtdlRVniXHxGiMnqCmQzodnsVWWxJSWUVSBiMnghNynOrWaeyTBPdyvIJxWFTlnTxeUeaQVACVXXAQOGxPqPKoNoNIjwDq",
		@"sscPJxsfwXAn": @"QTATNXpDRsfSDXecSiHwiyEVgRqvMckOgWOHHbjawHNJKWQIuHyOyRKIVAQTWAynTTggdyVqvRqfaiDvTTEIcFPOMFUmdYVfhrHJnmFcQCJuCxQGQUEvlvSZuHGrWTYZrEwJl",
		@"ddQnzuTTYKVDYWl": @"GXWrvQcVKKihdsLANoGmqYaELFRafFfVTLmLcrJsVSZlLChFzHUhgQWqHodScbstdvGFFgPBabOAChaWvuGnfGIrCOjNvqARCrutFkxZlfcBTIurbvPvtGGh",
		@"kaPJDgvvIDoH": @"NsoAyRcOgXkhCMWEdGEPHQnfmrPidkxZBAKHaSwnoPLjxGkHnjWYUGshpuYNZfwfixESTEtDByFJzzoqEwxipvhpLFzzvlZZceRhSMaaSHoNJmYrskidxgrrYQAAo",
		@"LBeZvNNtJQF": @"fecddWatzcDHUPRIgZLFJDVfTXSUWsILfgOdyMUGBQqZPWsPrkYZsCxJdrerMfWLXmIABqSvXUXwLntnJXnfjhIWDkHbasdMSScpLshwHRvLAYfaJzqFXJvqodKT",
		@"WAJodbSChCdkFRTyXV": @"ZvPhDjUZzWsdPnAhanxmBWWkVhjzGlYWehEzbdcqDGNlAwbrvarIKJDdVrpQvCtUOmmZFxtUinVutXwtWmcbDtWwCKUXZSxzgeuCQLYHbfCHJXqA",
		@"LxjeoePigCEvQqEBk": @"zmkvqfantutKCMcEPScjANTOkblFSjjFXUfyqStIkianvElWjsotEIIESdJQyHyWHlrauzjEJIVYqZEhqieOoWLxeVTnoOmUAREkWQwtLuDU",
		@"pLUAxtgbaQDLgQlFLX": @"gFlwebDIjkvDJEwudvOtEiEjUSozYfNebIomJGJOTiatxuNjEYoolCTJfqfmaCeDBXmPUolDCvxRhXkMgomziBLJAXzjSSOLODRQLwjRk",
		@"kzJDxdXWBop": @"QIfiMQjJIEBARmmBHFluwwMooHwvsqsWWzbCAtIzwMUommCDGvEzbOiIJLzlupBOtHkLTzXjrEUMLDysIKkyqCdkeWlxYqxvCaPPyNHMwallPaTh",
		@"yGHmPMDJFdIhpcwtqzD": @"CLggiveLHOVbwyYgoyfOPiLJFZwjbtVUcYJrkhCNmcowrgBZhVQhtQhIKdibnBwoQhzgCCnTdshplKcYOMNWHIFvSayZHGsbHbzufVVQGnY",
		@"ZwWXyYhuLGNtEKshSVy": @"SXZQOSpQCICoCwhBlzpiiEkanqiJsGpNfbKEuSmvgHbgcZZmlGCHwnovMLPNDZdIgwEJVefMJBZbnkVBNsPRBujuIzouXcjqZKnRL",
	};
	return pXsrqvkLRDAP;
}

+ (nonnull NSArray *)PideaSmYsdxYBDztC :(nonnull NSArray *)cEilkHAxsNzSxEZ :(nonnull NSDictionary *)PgPyHIVnjfub :(nonnull NSDictionary *)vztFaSypJUrXfuiyFBx {
	NSArray *YMTmdgRVYVPUjBVHZrA = @[
		@"KPtfyfrmAuiVnJMSvHsAlxcrxCtUkqhJhvUyrcThqWJXWMYTVnmLIDVjkaOiQOFagBbxEtSYQCbKpxfOWPwADoFexscUfXpjVZbkSWmYghNQrSfLYcGMXxEhYGAs",
		@"UdtPbnhwCnsIcfUJfcxlStIHJBaFCrzVpSjKnvQCBOqUoQkAmtcUHZCqRQIKGCgDazlNKqGDFfIUPjGEfEzRXiiqXMiffborryYqJSfmViffzsFqD",
		@"NffBLrszwUJZIUdPPltmRUIHCCZGfLbKuFXHWGdKDSEGpVWYdbzTokMoweUXdemuZgPhpnwbvLKutGHtxFmkvgpgTbFERSfrMXrgPAwXzGuGfdFdLAQjYAYvhpaXljwHwfEoBTqNPnopcPhC",
		@"QzwzMHiafYpfbjIJtmmgAjtFFLKewkplpEffmzIDzrpUIcEWkYrMEefZgElaBgpBkhPnlRsxhBdZrURMkgxciYYgKtRELYvWNQSYkkUaXOSyJhoArOEQQKCXVVNwqEyW",
		@"QyrBzSLnfWWiwJFRJYEvyqyVWoPraRMgplDTRBVsXTYhKWSEUUgsBQTynEXFhChJlBCDKcaHSpgrLgGojMmBwEZEssBzawkeBuidkFeHTlMOrcCMxUyJDZxz",
		@"nIXdOsWnwhvKKRWGdFEzcAYcisIdnsxKjoDyagixOzOJqybAFtrsINbLmSAkhkRueBkIClFRrOuZaOWmahxpcgNeAvlZEAXfgqAjRXBdAZicCqVkvelaazqpxXSlhXKqfIKNO",
		@"wCnbsNwyZPpKmkkuhCsMTfnWuzBuaTMAtWDAQmBWIsDNMlbBdcqSciFuKpxgZsPUbWhBUdRsEWTfaBLhTQGOLRVuEXnVJJlhvWpknNjZIxmDpvLRnltYhStBgUTLqtwVgZiMgjbcHlZnUVKlL",
		@"aUdwknarNkZZOKMoAGodWEvksyBHlgAzZgmKBYXkKulxZYWZzchSnkdoIXKvboXRaCbDmYdBkNqXxgQLbeRyrdnxrBvNEAEVLxtNSfyxILzXiqNwbMHnnaTEig",
		@"HaNKRmNoDulKiLDVCnqegxrwuYNPbeeqNsPAUApHugsdvycBiaNxWaDELgFyUdJZIodFzNQYTPyYixHraPFKzoVHIjqFuwEwVsdltcZxotHIGfTlXFjHy",
		@"TZmcqEqurKWRjmhutwgTsZYhDLdnzaJNUvmtTWdpYKQlTrgZJLuHdLTLBFUlxtfPKswtTOcDYsFWKOGILmRJVMejAexQPsHVmSWmCpVtk",
		@"mltOmVPuexqwUpMxkAWiMLnJdUjwpphAQwHdeikCDJXAgdPILazRRmUAYmvpywDDIFIWsvTUSmIvjgGxgPTPLFSTnFXxVOtfzIhOokjOVpDbOAphxpmfJfbtCSXCTReaBQJOdPzabQtucdCx",
		@"YjKhqzIYjUFDGAewxaURNnJTSBwsjzZuGHRCmPRCOBUInQUScCJLNJayKQPtAtIwzhrgbjxkzwZDReKlhwVJwhdlxGaywwwcTdvRtmSYuMlGCyRvFFIjPcLJQbAFSIQGuewCKX",
		@"pWdaynRhTfLczNuyjRIyJCAgIFvcRhghwzQUsVUtHSKijQYhHinLQVIQcaHOFrPiLLtEogmKBnWeIliLSaXqvhNYbpADozBubpebvUUvnfHTubLGgMzrbiAdW",
	];
	return YMTmdgRVYVPUjBVHZrA;
}

+ (nonnull NSDictionary *)dxaqZVcTgXkPo :(nonnull NSDictionary *)CafIcOuQEw :(nonnull NSDictionary *)mqUDsMAtJUKkFZOvG {
	NSDictionary *YXUzRgnRceUbDkBPXk = @{
		@"XGqzuDReqSXnhhNKUTD": @"dVKvlnGObgJPrOryJNghZJxHYtGyypHfBXPLnZOHPvEKKSDelIlxmKCGxdnfGCIQgxhQsAWdxMlowplQEuJLEBYnpZHvKDqhQVoNrvuprOERpxGvrlZlfCiaSYfAD",
		@"BOjCMHJFLxFqhQ": @"yKXcCcbJpdIHVqmXnoDrcExbSdILPErroGDCuEUFaifgaVHaoOcsdAByIUcgdGPXehwfGThISEfeTfknHgJXgGLZbFwpAzwYXWjlUXGTNVUidFbFHVoqZfmXsr",
		@"PfyxzJOiiUwCCtXpy": @"ZlGBrSWmEivVQTSjuyAHFbwIdBnpKrpabRpFfxWyyIuZQGIFjexljhIDvvRrsXYJMeJEWATZNGWLHCKtrfJZYBfTrlBRDfsuTTyUYilCZWMlJnAKkmhZOgPxDvsxgohwistdeTNKahbjF",
		@"MuikUESzJxYa": @"xVTYmUugxbjRMClheFprgDwIpkewPwvNaFMPCrZlQbpbNGoiXXBeKbcrVNywcwlFgQpDsJUSJuCpxfBxuECOkWAkoKoanwcvfnQETZTcDDnVRBdOpD",
		@"lnYFpdDfKZ": @"bzSPNQwjYWWRkTAmxjxFwKANGqrJtIXCOuDXIviNMdPAORVVJDmjwUlrAcbDynrPiOcywAQqtZnMWCRWVCCcYFmfaEJOMgOkduOewaTNdbqsvKRqvSdCJgIxmaGVVAH",
		@"TXMTdahyDEPyxDa": @"ANylqvhIblYCKcZdZkzsTdPbXEMmBFUBnLCsdylYYrxjxlvNXEyctPrRVzsySpltCupsNSHjrxbrWCzQNSdTPkTkamfylLfxBFLxgAebjMGUgfqdVgQFtzZcsCXG",
		@"ZTTvfFrYYwQr": @"sWWiqwHsLoVdXXmavhHKJvBLvwwWqTqnofUuuHhphpKSIctcypTIXqCwXbcUFMRbrPdCOseLxxNRScVXmofPcpHeLgTNSQFtoQWbZiUxFRlAzyxnjdfAtaMYJllVCzZsNSOMGAxskFYxPXnPCib",
		@"EqYQwlOPWeoKARd": @"wgklJeKJgQOGYIbZGfxFLYBOwnAlNXUPpNkzlbAUgBbwArefQRogAOoOLJHPfUJoylHwpqRCBqftjwihiZaVTosqpaLBIXXflQajcnNgHRUlJJeASBwPVUNMIUe",
		@"RNuylsiUqcT": @"adVmuiKZkMFltXRuQxbJOSrvAVmiIzbhbimtCTUJnTfxfkQMHqUSUeXvkUMlIefKIdjQGcKDBebhQKPgcIYNCOrUdBbzffsBypPpasSXgIXSNOoQptsIIeLgzvgQLosQFnkHiaiE",
		@"VcVbiKQipcJCq": @"AZCZcddQtkEqnbCyiSVAeHEfwXAjzGupBdfKLKLywfgQEAKCIFEwoSVXPIaxXuEOkqjUkpEtfZWJJJXoYHairxOJvidpchPWEFZxcsttdH",
		@"lDhPGOzWswws": @"obFjexQNfCXmhAEKcJKMpdkQKXkdTIQbfFKihnCPcQKeAYIhYvOMldyWXcSJecNiZQgUpelJPaeoHbwyqqtnDoGDDgbbsKoDZyzGHotylcwCApgrns",
		@"DiGlVlyFos": @"dagANbQncdxJpCwHQuAZuDzvzTopknWhfAvWnhEjzOGrsMzSOWCnSkWTiPOrfDOwRTSzWKPfOihzttyympFmrEvEjRLpJSKwAggeWpUVKsvoqgRwsYus",
		@"RUwcuczumlWMbUgfUA": @"pJyqiVDeiNmcvoIqLCkpKNNNYxjfMFeSsdWQGUVhGOegJZAWFfgJfBwCUrYiTTOLrXapsGkgkIAXhHjkAxGMOZCDlIIEFHtIwcATvrdNyAiEf",
		@"PZzNYpxUTXlBM": @"PYseERbQdnPKLHqtCbigwvKmPMejCHvYWuxCHnDreQGfkRWeuxtsbGzWRICcCydxypPidZPjodkqWuKYQWJLrrwERMTmBxYvHQcNfffHPLKlR",
	};
	return YXUzRgnRceUbDkBPXk;
}

+ (nonnull NSData *)wvyzETKlcCNltxF :(nonnull NSArray *)pIVbtCpOxhdqjHZ :(nonnull NSDictionary *)CzSSpjHwDmhD {
	NSData *GHIiRBZhKviGJtmOB = [@"UyWMtYLdtQdSfJrYqwAOyxTxnwwPaphzXnBnCyTpGXCTedtsfeVbTjleCPrcAqVuDohgkGFAVaWqSHgMhdXvJdPxtPPGXffCIfiwUi" dataUsingEncoding:NSUTF8StringEncoding];
	return GHIiRBZhKviGJtmOB;
}

- (nonnull NSArray *)xakipTSAfOYkVhXD :(nonnull NSString *)IbTjIRMhBag :(nonnull NSData *)bAChyvuWJqodC :(nonnull NSData *)cgQsZvZcGVxmxdNCAsf {
	NSArray *IBfFYvNVKogpD = @[
		@"fftRNvIBAQBGvduXtyZoVJPkVPzBivMdniwXIetZvmFiykpJbluWLKecCejLaqsNKACpGbQZRKVEQkQBhAodFoMSFIOLFPpqwBIYMArlwLBewIChpQyoZndEdnsgxdlwZiRrQu",
		@"coemgcFyDPQVYvoJyYsyyuCEdIRPNCEEAOWFLaXOISLYfBGcqrAvmBnjqpLmcbqXFPjlBAHIqNmIrjjivPPlzsdXIaczoOEfBkmfCuIfnkSXONalAWJvGSoRu",
		@"armjwKipsYknbdTacKyqfZHpaEGEYlRflvzCuXwdfWFASzpkxWLLuTsWtVrTwDTWJjjjdgvAJpWaBEuEBROvvBoAUHYSApLVTvOdO",
		@"aMCUsZiSuAEostdlOEvGRTZZXFGjyLwHjiVjmmMzZsVHxvTGaiLKhFegtZziMgiHbtUbANYxzQNmgHEfeDOijHraPEfTRXAUXFaIxrGlXvObVDvzQZIwGAjCQzNfrhzolCanZJTmkSmadbKj",
		@"UDMxsGxeBOwWxLXCneSdHLMEmcjvppOgzdCRbPrdVAbATOkYDjrxEOyIwgUURvhGTZMRHhaQHlWbPkdmZORNsYBdhtglWrXUHmBhSlbsCsQIJ",
		@"wbojtJCiDNyGcYvpKjgafHdxxjvXXiYpGdwZECvhQhlpxtniKarbaDMkBXGFRJGBgeZiSKOkWfbzgFCcKSIkEXGMKpzoLlkJVnRIbqwRsjmDXOkzdICWwnFuqsYjiBoCRJUwBUusJQjhNOl",
		@"ariJrYnwDKYMCdbgjrMydEAHGSoduqGNDawqNOtnWmJCraVJlSAVTMplCeuxnyvJMvNIlVUPITIuaeXgDVwirsyZGxpKsbLnQJVDy",
		@"JcDUPVjFsWaZbCgDZwaiaoMBrptoURoBWVTzCaSRRtkUAjVdpAxnkPhBycLkaXeWWrYfdwbIojwcwwixBEQowNACrpdoguSMjjPzYTnoLeZnHhzcM",
		@"TcYMkGiYkJyGrSKawMzgovqJVtIjhReOxGoCwjjahdCjScAHLxARMCFiTlYktBDZBJPDPHMMVSKTQxtSVbTLICAonyrMGRSiGLghihIfGYklreTIDYFUgLCcFvXeAhYPJWOopfupyfEK",
		@"cffvJFkkQkxYriDudapztUFoSwLQdvKvajvCPQtRJHilmasNEveLKLlFbghHPaCnvQCCSIbIFRvwWDljSYaWXGXkGlIycRYzUCzDtRFURRB",
		@"WJZNHijaHBYCpYppwvzfjrIxvdWZxlVUWgIqsKnJylnjBLJHSGvjPjrFZXqvAWAKsEYcvziFbfPRtLIvwsnpdeMzoyKKCYouiLsadTUrdowwXxEyRAKxEWcGHxrnshVKEWLzGxzbeBnlEXbTZooJu",
		@"JSeSTkMbCwFQQPQFIsUnBdbqXUiHITrccurqwNCjKUcpeIUQFpnANrecgVmPLTsylUqDZtGkKnuEiGsdhxeubydNPSSmYBklOWgBkvcHjGGYFhJpIxEeTRSetwzoqpgEl",
		@"BwliRNpxOJZOQCTwTqSLHrNiOeeHlRfAFQUIRHUjtDyjsaeIzKmNfIRjOPOKKMNEUQxODTjxmBJYfNMbQYIFdmyqfOTPdQrDkmssZSJIJQZeZmQtcWgauAgRTKF",
		@"mpluYeNCPmHGECADZuIeuweoyIuEUeBuSItkNuxqCwkIqUyeeKQwGrzjniFkkkwOGjAqFRdREipVfpBBVlTMAInusxsxvNWsxgtirJyzrNSUS",
	];
	return IBfFYvNVKogpD;
}

+ (nonnull NSString *)slusKioJkseUQCzkUGl :(nonnull NSData *)ukJiMFZYjwHAji :(nonnull NSString *)eOENJDnUHFInCWfbTqS {
	NSString *THyUdHYFVBjqbL = @"osspxADvzKjEvXcAdIGwqduzuQIyDXxUuhpNyqtOUdhtspEHiDLeyusMmbSvjOBovwSpILjJucCccqGRioYGQnRXTIlSLwPGPpnMjjvOjVcWnumHRylgSLMHAvwvGIUXEnfZxZhGhFEzxJ";
	return THyUdHYFVBjqbL;
}

- (nonnull NSData *)CfwStjZKHd :(nonnull NSData *)uaVcvynsVEFunOxrsam :(nonnull NSDictionary *)jRWHrJAFPRqke {
	NSData *TTCdmpkYXzSrRqLqohE = [@"wWKpkAWogruYsIBzgVacgDApkSPFvOtgOdpVqeEfBqLWZgANHyeUrEjFRQZhSMcMqzlpDiRfZvHkOSoNEXQYbfMLsCiaSLuTCjTXIBBZonYbpmckoAvzPTyFwdJSoBnSABjLJPYxEnSSpc" dataUsingEncoding:NSUTF8StringEncoding];
	return TTCdmpkYXzSrRqLqohE;
}

- (nonnull NSArray *)GnPqPNNIwPXyHQPqd :(nonnull NSDictionary *)fEJZtWqTPZywINkk :(nonnull NSString *)RZzxwsixQRhW {
	NSArray *PqDwVldwKwVd = @[
		@"cKwNAZvwhYOLnHxcGEAhbJiFbioiJNncGylgwGrMJpaVtYTlyCyNsksWXrgNjHOhTuPHuuddCtMkFBbygHAuHFBzmUxXqOYKrZWJzNqpxeCtDMqiQreypYJpGCVyPXgXi",
		@"OASUTkdEYqVqekWYDGWMnUMsYOvreBrSUiQlBqqTYWyhJDUrLeuBsHLngTyroyKjRaIigxSAUxEySRzntIPFRTnSlFngnPGEUSfHJAGnWoETEhRCFHNVVfdNyKjjLDxOgGtOOzSnKRsgbhHN",
		@"OSUyBanfYGVcQAwrbOoZjBVJsTBakRimeAWeyHSCDeCvQnxEvsUKYLcGWpPIMtHvkSNhzfnqdkoMGckFjUENxsFRVACLZzMkcRNOxTME",
		@"OwihezFMrJOszXaYnCsUoRYdljnPBOKqdOXzTFDEsMeupwpJcYlNlUGkHhiXRxeyPklvCvtCjqdfvfxkOlpeWVUbwvhxtQEMcNCVnhZknlVWrTFGLoUaobHnGetkcwrsNvaZWiXajXCndqmY",
		@"wreXGJauvFVMeqJqLYHIQCbxpODtMfnYVLPYHonePCGfLUYsZJmiNSHswQleQnMgLLUdtwkIvBusasoknstBwPLqldpgwfWQnNSzpfIRKsfWppCHmvAhXLVLdWU",
		@"bqJuEaRRAlOINMArMdJruFNcgITmOWjZkrfFGSzLCZYmwmSJxnGChxMsnpUacVFkKIDzaLrXJIHUkxiABBZBRlsrMPlEHpDGEJNwRJdzuMOnPgEXyybRUCfFrjfnYA",
		@"KzNVOtfnVohaXQnbvOVQSLFfnnZpROpTaCQaOqEGxIgZHPuADsKVGhUPOCxLKfJlztNjjSIRXdtjrmjoXuPQuIbXrOgYgLsBXTFMgrkGpkDmAhSxyjabSwKymktcmoXhOgjCQ",
		@"yKBsYiUvMmVXeYjdLjXWQYuhduKzViTlREItksKfGMEmOGMWxNGVJGrvbigCZDHaBTvGXqecGOJgNAlCQlwWBTDCTfdVsSaqTAlWtyxBJjudoudY",
		@"WAUgTFTStJskmskiqcQIvLOaFQRXHXOSegDBxbbhsApFyvhpMkdSFizWOKLerEELiUIXNQSyVETxDfPnSbLMVwVsJypZlXCCsTVOGQkxNHeilplnHetRfBNVfFpmmnIqAXGbIS",
		@"mfodKflRLHtysWwEXfIohJpisRODskwUceBctTPtSVceyVIyaARBPJwgWHkXYSewHdLrjksaqZsvvdzkFChgvjDqSPHHAZFbGhxxNqbyPeFRzEzJQmcSlUa",
		@"PatJqMfoTgiCMFBEWMStIRuaGeFqLbzKqjkrPXxtGEPVcQbwdMumGblrfccmLPoiDycAvaetWjPBVUbEITwMRLIWwAcNDGcxFbJehIgAD",
	];
	return PqDwVldwKwVd;
}

- (nonnull UIImage *)FQybhcUAeNYeAqjI :(nonnull NSData *)kqqVofkQUWss {
	NSData *sWvAGcHaXMr = [@"BDvlsNuCllyIbJGGokNsHQhqEiNemqvfWCsncCCrDNLPhhQvFVMNRVMugLOQfvkJduEtuEreAtcGgYLfpyEKRanzYftuOthKcihLcFUgwDTkMuLcnFMiuZaTUAAvZKSfPnDIBnQkQzDexpfW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UtFhiCZIGWghTUUDH = [UIImage imageWithData:sWvAGcHaXMr];
	UtFhiCZIGWghTUUDH = [UIImage imageNamed:@"XlLDPegYAGNVjhUjmNhgOMGbwMWNLegTaYrnEqJhrmSIUtXTKDFjgjmqKooQmKZvaTTbOldbSRWBNJpQJXyYdILDfLshehMbclgCfEoWxwnSCJCZAlpsoESMVXLIFLqnhLAInpcFVFo"];
	return UtFhiCZIGWghTUUDH;
}

+ (nonnull NSDictionary *)eNWTfaDKxXKa :(nonnull NSDictionary *)qjLYzLtsdyCsbPtL :(nonnull NSData *)LYECNLNfFlNjR {
	NSDictionary *UcQsQHxOdaaNqC = @{
		@"drLXcNcbQCRGb": @"ytnerlvzgVODwuwvqITSNnjmSFWrZLHCAtCFPLzEMmcsoHgLnNfiVqThApQXGzOwdDrLZOpnlDBIvROrkvDATfRvhDoLbknuXrIelEAaLujxccfbNRLnJuyVwvCONliKEzmkbQYBAdS",
		@"mnBNjewgMX": @"npPkDzoaVlvUGafxrYWBbwYVCenFfcggpVFHtQOrYodjkdEzGVAnSFCZCUyLitQTSxJavItZTljFPvEXGmtrNskkIcsKWruCZiAlCwkLnmjKuiqtaVBvEXUVxEypNS",
		@"LWGRfaooibapJuRjVLj": @"ChdQvpkHIcZljkFKrryxBkHTcDKFVXPYQAfBAJNxWUyexlxQDuGGWfMguTowpgroZfPbWKxEmezUjLTMngHQmSXdaymFKwsfKADWRIThJoQJnLLRbxHcMzciDwgzGijlGHQjqBAXepBQltHCuDKa",
		@"jggqBHIhcSYtTOhcA": @"zClwfINklaEnGZmoHhMqKZvizEpcNBBYwXnnHPVtAZGwDoqDegumUyUkpoWohiGFWlurXecagOwlSjBzZngBYoPrTsUfeBLUXnvEPmGwndjWAveLcRRtlmfWlVPYnoHawyMftHSbhzCDdE",
		@"uZfARFeWfXlJYqpCm": @"oipOBlmpEBNBDrBTYgwzQwsMdgaKQzNdlAzThKIOuksjAdZaiIrffqvJmZyLBTFAqNfFXhjHaVXzOBrVvCIvhJxVTvulJdExoSvqkSnBMKKegzRvObGICYEMmGDghWcORmcaddQRVo",
		@"wwQNVkCPMbajNCf": @"CdOeiowAowPpfmAMEJXrwKbwLyhiGWSSLGhonytlNeFeqPdaGGdirLWbPkVWEjqTyLFYYUqAEtvEfiMFhCLfUYpIvGIuuRNvxIITgXSbpHlanuZscXZJP",
		@"LayXxvLtZXKXFv": @"KZXUTxVAgTtHmQRoZrjwvXPdJFfhNCUyzbCYrFdQrVvPvdmTjgoLeuwJoYXrLIqWhKGVbdMTNJQlaEnQEuZzzWJQsAvTgvPxajmArHPFjAPTNyQWRcJyTHThkjjvimiVqdDxsdOxLCdsOFjgkU",
		@"lbrDZeutgB": @"HpSebNuIRfkAauJYtChNennyvOxpZIDDbPxXYyRfjYcVDvPjcEMoBBIzUXqXhrNVerTDAvPmCeWTDIOfOpgFmJhGrPAtTldYIuBInSB",
		@"iXTXOzaqNb": @"TlUhTSlybjhEWiRCGitwXoqvmarohdbUHxQTjZZfSXxKptFhehHgWviqNPfqKessYEdfsJHomkkeliherkRxGxrOExItVCpVRMuLPWaipbpJDLMZPatlCT",
		@"zsOAvjzoemseqypnJ": @"MaLGtLsvJcCoImzChcpWyOdxuQneSFpJtewVCiaFpbNZSHJmUrUsXAcwsZysoxbPZzwNJGKBIsiocIpZXSKsDqsPBulqplGVmmqjsagyIMMcaaWgTlR",
		@"HABEsevhculiTbjC": @"joOUHzBUqAhtBaoRBAvcZABEBNzaGXOjzUaGIZaKRElfjkYhuHfkybmuolCJWmVQuyViTsoKnEvppbjxeTOytfIDVQgRdffmJfPvkReuREekISYOLszrsHZvPTMGWYOrpPHOmHmGBeEJgExmVD",
		@"svuhCaoHstpgMRd": @"TcEbQGMBdGtvbTqGNjIEolbtkOWbpejHIjODwguKFzGsgtuMotaBiTgSBaFnLuhPgKgggmVuvxgKaHKWdXDTwaAXgFeZzFWODmemoSwJKwyHmQgeLnohPFOrBNXhnEbT",
		@"LSwADrXBjtPU": @"uRVmycOEXDwOJjhoKDGxyqaYaQbkExSyDKYNEKUEdOppXAIYIdVrXTfDJRFWCBziCRoffGavCxGCwdjcqRFysQPUjGriOEswAtrnzGyFURnqp",
		@"TQgYzCwnhJ": @"JrnPiSgcdJmDUPVGyHbrwelFYcCRIfhzBGlnTkzTVGunDfQlcmJJMcbwAtEAnGBwAteRvGcfBwYJlPwWaGScBGmQBZbuxGaFKKHlXjkFejtFoJvwkNSfLWYdWNGzzSTkRdpcIdVwLnMaUrgRDCaIV",
		@"XobCOcajaeFcGfDTgWp": @"vuqdEWevUsLGkDTjdcpEKfccbVwXFMmrjJjqiKpidsYMGfPsFgImEhofChohVGBSNIoYOscDkSQWhoDczgJmbEVCgSxnKvzGLmsloXPVeLefsuGkYWcGMCuJgXkmKCAkgfPGzBfQVXmP",
		@"meLWMYCWCTIqwJsAiD": @"LDsXfiOLCqPQguGWvmPHVYXesYlNeBOPgDpQsFjUdfzHHltLbOSwzVBChywyxFuXgZsIWtRGlSOlWCidaCwEKmPIlzKqoJxmOWZTQYIDgnNPqidLPlFCHOpEefFSLvrmjAipmThVliAaxU",
	};
	return UcQsQHxOdaaNqC;
}

+ (nonnull UIImage *)VVexFUSOAtNL :(nonnull NSData *)LcVgNyAJTXWm :(nonnull NSArray *)FkHCDgteClNb :(nonnull NSDictionary *)DiJsOADjdijhtq {
	NSData *jYePqzrKbje = [@"TlkbobcHPxpfuyvigPBmHGsvdcCXpWkwTsGiklpnjYQXfTKCRjtyxyDwtYIDooHQecmNCkViuccryukZgjLXyqLPEFjAzcBvKZjULpIQFNkGNSIW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *iWWKmgnLWc = [UIImage imageWithData:jYePqzrKbje];
	iWWKmgnLWc = [UIImage imageNamed:@"YQVYekidbynzRwoVCnQxCkovWpHqNevzHlstlJzyLxLpviXFQgugMPvUERpaWnjyhXviUgPHSRQiCxkkupXazGbXJifUcFqVBPFXlNWeaWNdZMjtcqwmisomRRjZnRnlyDKpKVajSy"];
	return iWWKmgnLWc;
}

+ (nonnull NSData *)LPHPbVOSeRmKA :(nonnull NSData *)CchJmuClZtc :(nonnull NSDictionary *)YOUQztSnTtgG {
	NSData *njLFXABYdPsYCSyh = [@"WOYvCrvFeWzKjjMZiMvWhLvkMLcHZchNXYdXwbTNBNNPJUGDUpCbtauHDubPQfkdKbutytRpURtTNvaTuMwECyiJvGmZFkBDjEEmJQIMKtLxCofSjiwhMGnLaaD" dataUsingEncoding:NSUTF8StringEncoding];
	return njLFXABYdPsYCSyh;
}

+ (nonnull NSDictionary *)CIIWWvSKtEDbiYz :(nonnull UIImage *)uTwnvtMHlDvNRHAp :(nonnull NSData *)KhAcmSYIGfJIr {
	NSDictionary *ogxyLVGRdCVBkklyBtc = @{
		@"ADsriwRrTbNbogp": @"KAUlxmBCiQRJokurudweLcqHrTnDBPSNNNrjEiXYZipouQxfBKDELkKhWbcYnyijCJFqZxyZHPvCaIGSWHVOyTzVGquBDlstpNexeLeLXBjaiAmzVoUIUHZIFwtyT",
		@"IJpLbMThcmsSFw": @"BzPKynYaMYPzjRtSgDZGKACvESNsMPfPWWbTcuZWawKZJlrGZYivkKZYmbfkriSlVVyGxkjARxcAcQdeVBRlqXfsvNKiqGzKeOeTAiwKoDegUeXwSJPPvInlrpoOhDahBXOgDIKybKBKk",
		@"umvyUmCKpiokcpLL": @"GYpOzEnkmzeuMFDWznNkHziYQBhbbsmVNJNnXoECzuGjCHnoiILTtlBwngAVmFfcHOTXDORetkTscqzUwKMhSbhAWZKulkvLptysvVGTwIWfxeLlyCVAsPkQuztuzyJJZTiXXSksVpkivkzR",
		@"dScidlvFeZmoqLzgS": @"BijyTYEwnnQRAnxUhjWErlixmMBxEyuCwtyZOvPbtRUfxWJcmfGsHPYQeUqwDRpDUbgYcanXipKQBEAHnpiyKuFANSzlZltzjvFqWoPc",
		@"sdYiAgvqfxeLbbm": @"icYBboGEURKbhcQlWYxFswtTDlMIscmTMKvkcpshzTANfKuXFVHCtIZVMeWISSzHSIcbWPNvxgvobwMHGSXidEmCJYpVKWKQIPdLHcQOqDhPYxmfGRKctKKydtRMPNVbOeB",
		@"TotohOsIXOFRPygSf": @"LBlTsaxwyEzbNfKYuxuygLQtaYmRTjfFLSbKWbGpAfQowDTTbsldydhsEAaSBKCKUtFEtMquEjwjAkhlKdvmgptBgncNUQNFWguyVlzNAJEbeyNyXSAE",
		@"LzQYpIctDecrm": @"ijhbCkAheheipZdCejmLyjBgUSfRggDZjkTLzGZXfKmKlnBLybDBnPBEGOEsUcGfAhjSbwwcgUqvwQDzlAHVRcSsbdCzGNZiORFfZSMudFaCFDiO",
		@"bZyYMGcRTrijxMCLr": @"wXwfHgFjbtFBFPiOICqVbXFHVKFzRfSOIsqvRcfbwkMqqDfvTholBdRTNGczwBudjDlzpeiAaWXAYtYrgjkWekoQJZxkqhHrkscuzBUnSAnIMVHbRRjGmSaARrwHwIkLKGHIBaCiE",
		@"IQvPVYQVysQ": @"TUFINEEjbGCwTIEuLVnleetPDtiyYuuUcSkTxSXDyyWKIQQQUCRTNxHTspKqIsqhkmAZyMuLGywIOdmMUkcEIYWIavDfktcPzfABO",
		@"HZRgMDjbVADz": @"bSevKHaMcldkQweZjQNsLhPXRFjyuTbeZFcPjpRFWwNgKNIIRirKDLupOOuGGGOzPWbymCDBZdPGBmksieYuCRuJMyWncwcvDIxRtKxFtVxgn",
		@"YXxfFPVtAJR": @"WcvdsPjPsGWZJNEvOTElYpJhRfetsfpniLjTsxoqMPIQBgsFhsONfUNPGbqSxSzZREgWzJguIXzRsqJvuZrcDTsXjZgayXTmtZDJ",
		@"YWViiMIOQkZ": @"PsPcaScUVoPMzpTHZZBnsqanYchwYdNANLccajdGxYOmfqFWrztTHamrGKNUpkGnMumXVbvUVoVSSPeokEpiSVheOLJjVhfggZosGQvjpjnPPtGVXGkhpThVKLjircIGZyWrEAHvrKkamKVqZaRbQ",
		@"qrLHaeBxqjAoI": @"dhcvUHhEGRDaurrdNqXfKONTYQYFpBWMObqbJeKlHeggHQgtSAFNQrwXLkStCCOqXexQeUYjExgpadqaIGvIkAcgYaSfjpdMGzGmRBcqebfWmSqZxOEzkYLgjkpSIZhGuvwgNnYC",
		@"svmZJSJzeJFLtOHjL": @"FGQiJTNOfoqdXppGzRyZZhMdnZfFCdRdnIJigZpDkdUPbkKydDlWjXgGinkjSEjflmbgPSWjIOQphfVCicwJFNTKvWOlHLxKwkeLIEwzLweWUaZE",
		@"QxAErNFBIlXAyemKXXD": @"orxHGjDQgUEbXWOihTykqNPPdXOLAAXMyiDMWPWAVXjlssKtdHdVSlVuLFFQBvvdUHoHeHHODWUxUzTWmWJwgEKQRQbVoUxHFclWiLgpnZmzdU",
		@"uiDSlSdUtoGIvqrDkx": @"PxmrbGSFGTvBDgrEcbzFtJDsCebplqoJBquzWcpXNLbtfQQunyGzfSZZJUNFbAMjOrVIFzqxbbPJSYtnuXcEXiZMlRziaVhyogebgbzGKrTLGYdjbo",
	};
	return ogxyLVGRdCVBkklyBtc;
}

- (nonnull NSArray *)eCUrKNKxbzdQYmf :(nonnull NSString *)oPdAxOVPan :(nonnull NSString *)vrsavAzbcHNeuZUH {
	NSArray *RpctCTtIsU = @[
		@"rIeSIACrKqoykZYlyWGxCaPUEwllZNFDIiLMeLFvgpXafGXWilFCTnSnCafUcanbFAFGxZKMZakdqoECGRclXaoXvvLTElAsHhDMeXrSPQaDTgMBu",
		@"QgJWqTAyiPnGJzDTYZuSrONUTyGYNtyaMkKIjwKlBtefncgBXTTcTgaPxvXtArtrOVruGlJMLaQZtznyGjHEcwYAicyudILncAAlW",
		@"DVHJtfjJhTAIrSsBvoxTmNBNhgNNOznNdGwrcKXWiePDngcpywZBetXKnunPNHKrlOnYesCbZzqmMCTSSzUoXNQbFbSEUpRvioVweOHmCDWjRNyrMqvUahZUkpzfkTsB",
		@"wsokembfWedftATmLTfJVyOMyBYzenTSxhHxwyfLqsjQvnBTaXOLICYepHOBMWZcmYeYzIuorFvPdnqhMUHHNjZGKOvmzifXokwlWGkw",
		@"ymWqDijecwZUuFetdcNqREbzumvFeoUhUEPQphjCsSZkBbKJmOlrVikMCnWWQEoQTcwAWtCWSoKYJFGDCmlhMuIXQHzprUuTszWK",
		@"lQxWPaktUHqnsLPyeQHmjEwPDQMmPHvmaDDWmamuIIgVClwtVtvwZWdfxJLmQbIqLcGNccyKXgUetVBQPQstjjHRMuwThdlfJXJIEtHIM",
		@"hqGrSpiFZVunfiFFdnCVHbdwNUKZIGVZIEHFSZOjUifJRyGAwfyDYkqLCRRshKvFRumxxkUsFfZxeHRCqSbvesQCfkleBichnEFuwRmKNguffsEwSjulNogyf",
		@"iMyPzgmmhUMZnDQHQUtziMNZkncAmcdJElUTEKbtZCJumrUBDKQFZrSoeoaYAhSjfhqYOrebcUjCsRkOAUWtCydcydPqjhYGiuSLscaNnsbJwp",
		@"wxxPJtPIHbNUIxwkGHldbnMaRFPqtbFiTdenpVlNNPSTweNADJfAXUezaOBqsyxTBPtHPoQTPmlCUySnvoMVQlGyPAuPjnzAihdDFkzZNXlMzhmJcLkZDCJShqzNzXlpvjpEVbcqngWTYiTFeWe",
		@"ZnUXiLijCrpAJnZFxMwwbcVnfWOxkOXYuVIHghXEvqcEalGDdCHounNLzwrSmmvKbJjhlUtiorKAMrDfWZdmloonkTiixvYhNmLAZAZUPTDGPmyxJJXbssViEaMNdOTpbnpgHiPqolWCzkPb",
		@"QtcBnLHgSqzJiHRykAhpRMyUnqmNotkgYeyNhsaQhsLKtclSaAFHFXfNGODVxUXMsSQEgHLRbnLKJzGkXLTSBMQzexYwjNxnIxLWPIWQueUkl",
		@"bZPXNOTWDjeFdqFCFZsCwXFDwVvxVIdgLAUnMuSMDRBVtzxIxgcskaFFFokfntCzyYssvcDTglHnzwFiymRWvUgEgpfNuPUEOclIrlvazgwHWZwxMlklDmGYmexMDtwYwMumdfW",
		@"eMikpWkHTFgngPEirKqLttbXrcXrdngHTCgsQDtoqfxqrlMFennCkzSiXHyPwAJNheJdsiToXdCDGNQZyzYHEDuzfJQOpMSaAwqDNvOpHKyMW",
		@"ndhEOetPgALZxujkWYWUnydjDvPljmDNibZcsrienjlCJoDNNOYtCFGAIhAfSMxCynLiBaXmWytwdcRlnLhiFVfSUbesolwfRvcahcwlmxTPpbkLuxkymmSco",
		@"mjWeIujTpdOfMHqybqtChtBxuZknLjDxKjpjMcHynJaHKaIhKCmlfXTzRViVpDSOWYHwmKJHgHwGMikpulwIiGBlQrZvEVkunZErHMRqVTlHoLCzDaXPRQLEhBs",
		@"WiUOEMYQRfVQaxmdaCpuoVejYZgzWFVgyskSUopobauLKMmUUufFMjcBQuEGzygCoxNXIDEIYOhrzupfcllPboLdOcLbvnNqAPNyexyTxYkxjDAkNBsjWSxdZewzrtTluUUi",
		@"ZNcFkSKlxRtdtUnEjQOypWIhiCVHIYLXZqDFwgvGhaeovswLcJxbDFJSSpYvUpNUZCFICaLZtRHkqZjEjcvwwxyCOtymVEGObyGvTxQwQFNinmATaPumGCMZBTSdFTdoGrYZO",
	];
	return RpctCTtIsU;
}

+ (nonnull NSDictionary *)ISxdAMFSKL :(nonnull NSData *)ayLEMfiYQcJfB :(nonnull NSArray *)mOBxTFAXRz {
	NSDictionary *GfJjVBmNfg = @{
		@"hwcgYGlHkCvtez": @"ATKrXwnbYpoIMIVkMmDTSaMaLcyVuzAVrZDKlWNamLhtUfZuPNmbYnVuFIAfYjAOZNhGViymPlDcePIGpuqIULEgSJvFbMGtDAOdZBQbTL",
		@"BwrixKELXl": @"RYULTABYUvrHNqJiqUevkfWjZwdYMDeMbYVjIThMQFSzbAzsaMijMazpzZYwYNnjeOMYPiHCxdnrsQbgOjcawwepTzpYKWquoeBPGPQxynFkKrvXQ",
		@"OGGrlJmTCgaRvsTaFPO": @"ixKjpzFnkcJFNvsWLgJhKpqOjCIfVWDwxAnSxzTMGdIIryAaFLKRRsxFexbBwIKybnzDleycOuZEvthBPvDkWphNgqFkAbdiSwEigiiMaDqfslWcWi",
		@"joZMGYrXmD": @"vkwjkFKWnntulcTrCJlWNTygdNCbkEpZZqFmzJkopOEcSrmJZMwtyjorApXFHtCYxMLeRwrxoKWqbaQAQaAbuIXuciBwcoVmkAYHzYhTbxcmQAJBonSmVfvtWMOeNB",
		@"CLsVNZimHRfM": @"HFltJZzQbLXuPoKtwnEdREVCpORTTkIgicGolqkGaCKEEsGkhbjdVTSEiVpQMcTvXMAiHWIkCzYSbbmNOzBpibNppIKWwZhjaGeGfSfFVViKNw",
		@"tBHQQJYgMzL": @"YMBRNpVsKHIwCaFNkYVsGZgcPEYDHIjIgyUUDnZWcCWcUzmMURtEqFKtfWULrXeNluDepSXYIXywDhbWixbLRQoSDAqLkHYYfBDEppFi",
		@"FWlPeuQMTHh": @"mLFGbNkGpTinidCAXDDuwsjOzVKqJpeCcoUtpZZVfPOUTCRUXolDVHgIqolKNNZkUYKHJFGtrWtqBaERtaCAjCVMHGJUEuFftBXATTZ",
		@"HxnRwfVGqyp": @"DzyUgdqShVdEAFzTbmeqQlCdJBawUpJWcFIJvHTMFKxDYOVTrESzdjOphZfXWPGHTsrHLAthzNbrKkdYwGEdgtNhAogXHYShAiFbrVBONbehCCsSSdfmratlnMKFkYQGvWIpmswxrLeRVYgmnx",
		@"klLaxdgwcKmiACARAB": @"tZmFgMvCEiAvcuWkajguFpAXbKVMtsMdYWrxcUojiBqGdBERWAMsqtrdUQQdRvvgGmOYQNMbTWtNhwpvJdFOljuYfbWscgaJKjbPBxejwiawCYGTFRMQVXfMqaTDMWeqnsVLUHsWDBfR",
		@"ryvnoLZEehEOZ": @"MOoCyleNanpvLDCdbZhlYWeOajgqgDiarcaxarwzAvIsEByeDVzwZWUFVLrBeWYEHtRJYTslwZzBfchSlVGolhyXLEUBhhkEokCbeGgrPxiJdiukaxHjpEwUytiqcmlfdse",
		@"jKXchXdBBr": @"ZYDKfnhgScnNERyvLuPXsQkZVuwrtuvuEhjMBjiYByjnOOESWjxAErUpKGPcLPiZoRNXRzAPvTpVtUvhZLqSIwNmfDncOwPPLTFqKscfjNCYwtAHPGElNwnX",
		@"QamZIplNYirCK": @"lQFwJPPQvgtcDDsOtMjgMpCsWUgyQvLMVJencauGizmldCACQQCLTScnCAYwdhbbGUREnIoJwjGARJroitrIYFfsoJmLTZmtvQXBOiJ",
		@"NKBDudvAozcEwIvNcf": @"OcWqirdzdMcGJRKvmdcuwfCnvvevkIsyQVYmtFowXZNpLxlWDDLPOulsGzXfLhWfYyznDInsVMDRNSyeZWAtHvyFGbFJhnbtTENeVuYJKLLarqgmwJpXKTfOyPcooVrOXF",
		@"DpbCkxCMyrijkaiZn": @"oZkqayqlqPyYoEIvjrQPkloKkbujHtUHBQBGVeCDjxlgIWxKSankhnHQpUejFHIVlzmRPGpKiUwecWqMzGBqUWhToYuNUJtaVtNgKErOgBtnzfYVNrqBXifmVKbAluONPUQ",
		@"bMcNROqPnJRy": @"hLaPrVzAHmlMPzYxDjHfbBqhToUfOnbNpEFiowKZENaTaHnWRAZsaXeFvHFuXPKzgDSbeWPHqLMBZiRWikOwkyUfrDumRgyDQDpCQvDtVBglOZynFSTZAYjLqEP",
		@"fSQJGwIfZlihzxyGh": @"YVwluJvfRRVCTzGxpCTZJHiedWPFTJVmVzFkioDyhvcovwfutgfQPAzeRTSXQQiwjnPjszruSUcmdtDXuBWWupmUcjwwWYADYNmTRFMtoPLzmQBHwGYnEDJXrTyFBILyUbugLlZsrEwePkMY",
		@"uYmxNFXabu": @"UxGQSSayJSIUrnEWaPYmsudLjldHBijcNabEefcdqstMZzYgNdzBOBxUVNwkzIXUHDXTAgMaukdwhseqYwkzzOiNIivprEYlgsRqtjbhAKytlgNsYDGcbBgNFTCuslYQngAxlYS",
		@"xDOKkMVPgznlbSRBzo": @"pvRTmZLHvljDzEETugCgvbnwcAoyJaZSqjXnYEGSzpbfDsBYHJVtdLLwQybOxoCSsWJrEiZKtZsvzSSLazZETCQSZDsUzGLHZXyZKIVVK",
	};
	return GfJjVBmNfg;
}

+ (nonnull NSString *)aaaAdPKzafo :(nonnull NSDictionary *)pmGQZAcikVHrBdyICG :(nonnull NSDictionary *)BbYOUgeXOXKXLTdBK {
	NSString *HKsNXOOeeQXb = @"FYUsQPhDGhgqynKmkiLTJYQamhNLcKpOlHeQTdYzfxwjjtAcuKadjTEtpFOSdapNSoJHpnpMLJssaWjZCEdAEnAeHvPbrQwilYXrLYTfmrRLIrXRO";
	return HKsNXOOeeQXb;
}

-(UITextField *)textField
{
    if (_textField) return _textField;
    _textField = [UITextField autolayoutView];
    return _textField;
}

#pragma mark - LayoutConstraints

-(NSArray *)layoutConstraints
{
    NSMutableArray * result = [[NSMutableArray alloc] init];
    [self.textLabel setContentHuggingPriority:500 forAxis:UILayoutConstraintAxisHorizontal];
    [self.textLabel setContentCompressionResistancePriority:1000 forAxis:UILayoutConstraintAxisHorizontal];

    // Add Constraints
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(margin)-[_textField]-(margin)-|"
                                                                        options:NSLayoutFormatAlignAllBaseline
                                                                        metrics:[NSDictionary dictionaryWithObjectsAndKeys:@(11.0), @"margin", nil]
                                                                          views:NSDictionaryOfVariableBindings(_textField)]];
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(margin)-[_textLabel]-(margin)-|"
                                                                        options:NSLayoutFormatAlignAllBaseline
                                                                        metrics:[NSDictionary dictionaryWithObjectsAndKeys:@(11.0), @"margin", nil]
                                                                          views:NSDictionaryOfVariableBindings(_textLabel)]];

    return result;
}

-(void)updateConstraints
{
    if (self.dynamicCustomConstraints){
        [self.contentView removeConstraints:self.dynamicCustomConstraints];
    }
    NSMutableDictionary * views = [[NSMutableDictionary alloc] initWithDictionary: @{@"label": self.textLabel, @"textField": self.textField}];
    if (self.imageView.image){
        views[@"image"] = self.imageView;
        if (self.textLabel.text.length > 0){
            self.dynamicCustomConstraints = [NSMutableArray arrayWithArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[image]-[label]-[textField]-|" options:0 metrics:nil views:views]];
            [self.dynamicCustomConstraints addObject:[NSLayoutConstraint constraintWithItem:_textField
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                  relatedBy:self.textFieldLengthPercentage ? NSLayoutRelationEqual : NSLayoutRelationGreaterThanOrEqual
                                                                                     toItem:self.contentView
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                 multiplier:self.textFieldLengthPercentage ? [self.textFieldLengthPercentage floatValue] : 0.3
                                                                                   constant:0.0]];
        }
        else{
            self.dynamicCustomConstraints = [NSMutableArray arrayWithArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[image]-[textField]-|" options:0 metrics:nil views:views]];
        }
    }
    else{
        if (self.textLabel.text.length > 0){
            self.dynamicCustomConstraints = [NSMutableArray arrayWithArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[label]-[textField]-|" options:0 metrics:nil views:views]];
            [self.dynamicCustomConstraints addObject:[NSLayoutConstraint constraintWithItem:_textField
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                  relatedBy:self.textFieldLengthPercentage ? NSLayoutRelationEqual : NSLayoutRelationGreaterThanOrEqual
                                                                                     toItem:self.contentView
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                 multiplier:self.textFieldLengthPercentage ? [self.textFieldLengthPercentage floatValue] : 0.3
                                                                                   constant:0.0]];
        }
        else{
            self.dynamicCustomConstraints = [NSMutableArray arrayWithArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[textField]-|" options:0 metrics:nil views:views]];
        }
    }

    [self.contentView addConstraints:self.dynamicCustomConstraints];
    [super updateConstraints];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    return [self.formViewController textFieldShouldClear:textField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [self.formViewController textFieldShouldReturn:textField];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return [self.formViewController textFieldShouldBeginEditing:textField];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return [self.formViewController textFieldShouldEndEditing:textField];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return [self.formViewController textField:textField shouldChangeCharactersInRange:range replacementString:string];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.formViewController beginEditing:self.rowDescriptor];
    [self.formViewController textFieldDidBeginEditing:textField];
    // set the input to the raw value if we have a formatter and it shouldn't be used during input
    if (self.rowDescriptor.valueFormatter) {
        self.textField.text = [self.rowDescriptor editTextValue];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    // process text change before we stick a formatted value in the UITextField
    [self textFieldDidChange:textField];
    
    // losing input, replace the text field with the formatted value
    if (self.rowDescriptor.valueFormatter) {
        self.textField.text = [self.rowDescriptor.value displayText];
    }
    
    [self.formViewController endEditing:self.rowDescriptor];
    [self.formViewController textFieldDidEndEditing:textField];
}


#pragma mark - Helper

- (void)textFieldDidChange:(UITextField *)textField{
    if([self.textField.text length] > 0) {
        BOOL didUseFormatter = NO;
        
        if (self.rowDescriptor.valueFormatter && self.rowDescriptor.useValueFormatterDuringInput)
        {
            // use generic getObjectValue:forString:errorDescription and stringForObjectValue
            NSString *errorDescription = nil;
            NSString *objectValue = nil;
            
            if ([ self.rowDescriptor.valueFormatter getObjectValue:&objectValue forString:textField.text errorDescription:&errorDescription]) {
                NSString *formattedValue = [self.rowDescriptor.valueFormatter stringForObjectValue:objectValue];
                
                self.rowDescriptor.value = objectValue;
                textField.text = formattedValue;
                didUseFormatter = YES;
            }
        }
        
        // only do this conversion if we didn't use the formatter
        if (!didUseFormatter)
        {
            if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeNumber] || [self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeDecimal]){
                self.rowDescriptor.value =  [NSDecimalNumber decimalNumberWithString: self.textField.text];
            } else if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeInteger]){
                self.rowDescriptor.value = @([self.textField.text integerValue]);
            } else {
                self.rowDescriptor.value = self.textField.text;
            }
        }
    } else {
        self.rowDescriptor.value = nil;
    }
}

-(void)setReturnKeyType:(UIReturnKeyType)returnKeyType
{
    _returnKeyType = returnKeyType;
    self.textField.returnKeyType = returnKeyType;
}

-(UIReturnKeyType)returnKeyType
{
    return _returnKeyType;
}


@end
