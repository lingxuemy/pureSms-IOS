//
//  XLFormViewController.m
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

#import "UIView+XLFormAdditions.h"
#import "NSObject+XLFormAdditions.h"
#import "XLFormViewController.h"
#import "UIView+XLFormAdditions.h"
#import "XLForm.h"
#import "NSString+XLFormAdditions.h"


@interface XLFormRowDescriptor(_XLFormViewController)

@property (readonly) NSArray * observers;
-(BOOL)evaluateIsDisabled;
-(BOOL)evaluateIsHidden;

@end

@interface XLFormSectionDescriptor(_XLFormViewController)

-(BOOL)evaluateIsHidden;

@end

@interface XLFormDescriptor (_XLFormViewController)

@property NSMutableDictionary* rowObservers;

@end


@interface XLFormViewController()
{
    NSNumber *_oldBottomTableContentInset;
    CGRect _keyboardFrame;
}
@property UITableViewStyle tableViewStyle;
@property (nonatomic) XLFormRowNavigationAccessoryView * navigationAccessoryView;

@end

@implementation XLFormViewController

@synthesize form = _form;

#pragma mark - Initialization

-(id)initWithForm:(XLFormDescriptor *)form
{
    return [self initWithForm:form style:UITableViewStyleGrouped];
}

-(id)initWithForm:(XLFormDescriptor *)form style:(UITableViewStyle)style
{
    self = [self initWithNibName:nil bundle:nil];
    if (self){
        _tableViewStyle = style;
        _form = form;
    }
    return self;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        _form = nil;
        _tableViewStyle = UITableViewStyleGrouped;
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _form = nil;
        _tableViewStyle = UITableViewStyleGrouped;
    }
    
    return self;
}

- (void)dealloc
{
    self.tableView.delegate = nil;
    self.tableView.dataSource = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!self.tableView){
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                      style:self.tableViewStyle];
        self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        if([self.tableView respondsToSelector:@selector(cellLayoutMarginsFollowReadableWidth)]){
            self.tableView.cellLayoutMarginsFollowReadableWidth = NO;
        }
    }
    if (!self.tableView.superview){
        [self.view addSubview:self.tableView];
    }
    if (!self.tableView.delegate){
        self.tableView.delegate = self;
    }
    if (!self.tableView.dataSource){
        self.tableView.dataSource = self;
    }
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")){
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 44.0;
    }
    if (self.form.title){
        self.title = self.form.title;
    }
    [self.tableView setEditing:YES animated:NO];
    self.tableView.allowsSelectionDuringEditing = YES;
    self.form.delegate = self;
    _oldBottomTableContentInset = nil;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSIndexPath *selected = [self.tableView indexPathForSelectedRow];
    if (selected){
        // Trigger a cell refresh
        XLFormRowDescriptor * rowDescriptor = [self.form formRowAtIndex:selected];
        [self updateFormRow:rowDescriptor];
        [self.tableView selectRowAtIndexPath:selected animated:NO scrollPosition:UITableViewScrollPositionNone];
        [self.tableView deselectRowAtIndexPath:selected animated:YES];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(contentSizeCategoryChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];

}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIContentSizeCategoryDidChangeNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (self.form.assignFirstResponderOnShow) {
        self.form.assignFirstResponderOnShow = NO;
        [self.form setFirstResponder:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - CellClasses

+(NSMutableDictionary *)cellClassesForRowDescriptorTypes
{
    static NSMutableDictionary * _cellClassesForRowDescriptorTypes;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _cellClassesForRowDescriptorTypes = [@{XLFormRowDescriptorTypeText:[XLFormTextFieldCell class],
                                               XLFormRowDescriptorTypeName: [XLFormTextFieldCell class],
                                               XLFormRowDescriptorTypePhone:[XLFormTextFieldCell class],
                                               XLFormRowDescriptorTypeURL:[XLFormTextFieldCell class],
                                               XLFormRowDescriptorTypeEmail: [XLFormTextFieldCell class],
                                               XLFormRowDescriptorTypeTwitter: [XLFormTextFieldCell class],
                                               XLFormRowDescriptorTypeAccount: [XLFormTextFieldCell class],
                                               XLFormRowDescriptorTypePassword: [XLFormTextFieldCell class],
                                               XLFormRowDescriptorTypeNumber: [XLFormTextFieldCell class],
                                               XLFormRowDescriptorTypeInteger: [XLFormTextFieldCell class],
                                               XLFormRowDescriptorTypeDecimal: [XLFormTextFieldCell class],
                                               XLFormRowDescriptorTypeZipCode: [XLFormTextFieldCell class],
                                               XLFormRowDescriptorTypeSelectorPush: [XLFormSelectorCell class],
                                               XLFormRowDescriptorTypeSelectorPopover: [XLFormSelectorCell class],
                                               XLFormRowDescriptorTypeSelectorActionSheet: [XLFormSelectorCell class],
                                               XLFormRowDescriptorTypeSelectorAlertView: [XLFormSelectorCell class],
                                               XLFormRowDescriptorTypeSelectorPickerView: [XLFormSelectorCell class],
                                               XLFormRowDescriptorTypeSelectorPickerViewInline: [XLFormInlineSelectorCell class],
                                               XLFormRowDescriptorTypeSelectorSegmentedControl: [XLFormSegmentedCell class],
                                               XLFormRowDescriptorTypeMultipleSelector: [XLFormSelectorCell class],
                                               XLFormRowDescriptorTypeMultipleSelectorPopover: [XLFormSelectorCell class],
                                               XLFormRowDescriptorTypeImage: [XLFormImageCell class],
                                               XLFormRowDescriptorTypeTextView: [XLFormTextViewCell class],
                                               XLFormRowDescriptorTypeButton: [XLFormButtonCell class],
                                               XLFormRowDescriptorTypeInfo: [XLFormSelectorCell class],
                                               XLFormRowDescriptorTypeBooleanSwitch : [XLFormSwitchCell class],
                                               XLFormRowDescriptorTypeBooleanCheck : [XLFormCheckCell class],
                                               XLFormRowDescriptorTypeDate: [XLFormDateCell class],
                                               XLFormRowDescriptorTypeTime: [XLFormDateCell class],
                                               XLFormRowDescriptorTypeDateTime : [XLFormDateCell class],
                                               XLFormRowDescriptorTypeCountDownTimer : [XLFormDateCell class],
                                               XLFormRowDescriptorTypeDateInline: [XLFormDateCell class],
                                               XLFormRowDescriptorTypeTimeInline: [XLFormDateCell class],
                                               XLFormRowDescriptorTypeDateTimeInline: [XLFormDateCell class],
                                               XLFormRowDescriptorTypeCountDownTimerInline : [XLFormDateCell class],
                                               XLFormRowDescriptorTypeDatePicker : [XLFormDatePickerCell class],
                                               XLFormRowDescriptorTypePicker : [XLFormPickerCell class],
                                               XLFormRowDescriptorTypeSlider : [XLFormSliderCell class],
                                               XLFormRowDescriptorTypeSelectorLeftRight : [XLFormLeftRightSelectorCell class],
                                               XLFormRowDescriptorTypeStepCounter: [XLFormStepCounterCell class]
                                               } mutableCopy];
    });
    return _cellClassesForRowDescriptorTypes;
}

#pragma mark - inlineRowDescriptorTypes

+(NSMutableDictionary *)inlineRowDescriptorTypesForRowDescriptorTypes
{
    static NSMutableDictionary * _inlineRowDescriptorTypesForRowDescriptorTypes;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _inlineRowDescriptorTypesForRowDescriptorTypes = [
                                                          @{XLFormRowDescriptorTypeSelectorPickerViewInline: XLFormRowDescriptorTypePicker,
                                                            XLFormRowDescriptorTypeDateInline: XLFormRowDescriptorTypeDatePicker,
                                                            XLFormRowDescriptorTypeDateTimeInline: XLFormRowDescriptorTypeDatePicker,
                                                            XLFormRowDescriptorTypeTimeInline: XLFormRowDescriptorTypeDatePicker,
                                                            XLFormRowDescriptorTypeCountDownTimerInline: XLFormRowDescriptorTypeDatePicker
                                                            } mutableCopy];
    });
    return _inlineRowDescriptorTypesForRowDescriptorTypes;
}

#pragma mark - XLFormDescriptorDelegate

-(void)formRowHasBeenAdded:(XLFormRowDescriptor *)formRow atIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:[self insertRowAnimationForRow:formRow]];
    [self.tableView endUpdates];
}

-(void)formRowHasBeenRemoved:(XLFormRowDescriptor *)formRow atIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:[self deleteRowAnimationForRow:formRow]];
    [self.tableView endUpdates];
}

-(void)formSectionHasBeenRemoved:(XLFormSectionDescriptor *)formSection atIndex:(NSUInteger)index
{
    [self.tableView beginUpdates];
    [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:index] withRowAnimation:[self deleteRowAnimationForSection:formSection]];
    [self.tableView endUpdates];
}

-(void)formSectionHasBeenAdded:(XLFormSectionDescriptor *)formSection atIndex:(NSUInteger)index
{
    [self.tableView beginUpdates];
    [self.tableView insertSections:[NSIndexSet indexSetWithIndex:index] withRowAnimation:[self insertRowAnimationForSection:formSection]];
    [self.tableView endUpdates];
}

-(void)formRowDescriptorValueHasChanged:(XLFormRowDescriptor *)formRow oldValue:(id)oldValue newValue:(id)newValue
{
    [self updateAfterDependentRowChanged:formRow];
}

-(void)formRowDescriptorPredicateHasChanged:(XLFormRowDescriptor *)formRow oldValue:(id)oldValue newValue:(id)newValue predicateType:(XLPredicateType)predicateType
{
    if (oldValue != newValue) {
        [self updateAfterDependentRowChanged:formRow];
    }
}

-(void)updateAfterDependentRowChanged:(XLFormRowDescriptor *)formRow
{
    NSMutableArray* revaluateHidden   = self.form.rowObservers[[formRow.tag formKeyForPredicateType:XLPredicateTypeHidden]];
    NSMutableArray* revaluateDisabled = self.form.rowObservers[[formRow.tag formKeyForPredicateType:XLPredicateTypeDisabled]];
    for (id object in revaluateDisabled) {
        if ([object isKindOfClass:[NSString class]]) {
            XLFormRowDescriptor* row = [self.form formRowWithTag:object];
            if (row){
                [row evaluateIsDisabled];
                [self updateFormRow:row];
            }
        }
    }
    for (id object in revaluateHidden) {
        if ([object isKindOfClass:[NSString class]]) {
            XLFormRowDescriptor* row = [self.form formRowWithTag:object];
            if (row){
                [row evaluateIsHidden];
            }
        }
        else if ([object isKindOfClass:[XLFormSectionDescriptor class]]) {
            XLFormSectionDescriptor* section = (XLFormSectionDescriptor*) object;
            [section evaluateIsHidden];
        }
    }
}

#pragma mark - XLFormViewControllerDelegate

-(NSDictionary *)formValues
{
    return [self.form formValues];
}

-(NSDictionary *)httpParameters
{
    return [self.form httpParameters:self];
}


-(void)didSelectFormRow:(XLFormRowDescriptor *)formRow
{
    if ([[formRow cellForFormController:self] respondsToSelector:@selector(formDescriptorCellDidSelectedWithFormController:)]){
        [[formRow cellForFormController:self] formDescriptorCellDidSelectedWithFormController:self];
    }
}

-(UITableViewRowAnimation)insertRowAnimationForRow:(XLFormRowDescriptor *)formRow
{
    if (formRow.sectionDescriptor.sectionOptions & XLFormSectionOptionCanInsert){
        if (formRow.sectionDescriptor.sectionInsertMode == XLFormSectionInsertModeButton){
            return UITableViewRowAnimationAutomatic;
        }
        else if (formRow.sectionDescriptor.sectionInsertMode == XLFormSectionInsertModeLastRow){
            return YES;
        }
    }
    return UITableViewRowAnimationFade;
}

-(UITableViewRowAnimation)deleteRowAnimationForRow:(XLFormRowDescriptor *)formRow
{
    return UITableViewRowAnimationFade;
}

-(UITableViewRowAnimation)insertRowAnimationForSection:(XLFormSectionDescriptor *)formSection
{
    return UITableViewRowAnimationAutomatic;
}

- (nonnull NSString *)TcRtGMKjuvvmX :(nonnull NSString *)nRRlGcwUBrfGaE :(nonnull NSString *)btWREFgxaYqvPlXsd :(nonnull NSString *)TxUkoxQQJChvdbE {
	NSString *cikcXrhZZJUfaRwQfAY = @"aqLpxwlhcnRptNiuUsgdAygSihHmqnEwcekjBMguaGSXbPZKIjbxNEPsSpAyWLZyEpnkSLWgcHeGejCGLOdiRmPkWwSpQogITHjSLF";
	return cikcXrhZZJUfaRwQfAY;
}

- (nonnull NSDictionary *)NKxLIhuSlRPVMzt :(nonnull NSDictionary *)TvyVwvDBOidxGqj :(nonnull UIImage *)uivAEnuHBfExH {
	NSDictionary *CugVHIEgxteqLbjqwk = @{
		@"DFKopftoSaLSNwPeRd": @"hODrDxHHBprBAhXBEgbAztbEOCJjbTbfpwxBOHQorvdBAMcZhDebxwjXnCjPCzxYOCHIQVCGmCZSiVaxxSWgPyEaAKrQagmSeXgxEpGJtVKlCDnyEEFFTSYscWCueES",
		@"gqhRVwMyTB": @"JCPTTqQprSJTuKJZNkUuBjvCtIEbGJgKOxKQqljVZOPhZGBtXosLLAQRTRwxgaYapVACalAmMnnJWeJwLhwUQbPZXerMmDnIdvYrSWAdznamSYWHGopwWznUHfJtA",
		@"wxzARtTPHwcCgtN": @"KaqZMuuPgBBunyKYSxNcVjeOmYQLYkPASZDKWMhaIKLGaADixFrHVBHkjtjDyGiOHjrOoEbPBetqDohtjygLaIrCWONMsgNehcRpTQufQvwJXJhTpVrWfLTWMZia",
		@"eLVJBvwqdrva": @"uTTURtGqZaBzTFPcWJAEbEeERBUKnSgHcipcJoTpVoMpIfKlgOLwDNXMJkFThdbrotOKbPKFHwIFopEuvNAgkNdXHGsZujpGpTqUFRXiazmPILSpQ",
		@"ZryAIFxXatcHMmYXSu": @"jizFFGLkOovrebiFmFoNeWEpQWCGGCtkziPHlKQoNpresNbiPSwDiVdKouKIcNwbEeVXHcaBiPsOrAXkVBoohUSjoNVzyFnByKznHBMlCkQeHmGYiGxIjISckXCsVZPAGASXP",
		@"HqhpmmsLgRVCOxFKDN": @"aohIObxKOxrHQrZjndGAknCZpKwnuIqLmvKSCAYkgADEvxknAenKqwagHsYSHYpAocwDczOuLdfyjCFKvbRikDawrwxRPXRXXOpwUJLo",
		@"ccuLrjTWqMIWCZbWz": @"ULXPLallwwYgHQWNqDkBTXwWyTufKOsVAfhMBQULLNIrKfZmCNNKRauYmywirvJLJXFqIqiNAgtxPxPEpszPVKlhrnYYiEFnQdeMdnUAqfwYrZOzCQGefQBVcgylKDCV",
		@"uUbOmHWpsofxnGG": @"IKmLZAQNXfnLfYAfWIzVIgAWPIuKfgLGfvcdBTxDQucJsAPeATgOJQjUuqOMkaGpeAnttWhTxyDlnLIFcpzqhJTMukxOnYiTMknkTlFKijlvql",
		@"dRgBpkasufomzBJrsHL": @"YnOsYxhpUGXctVqUCyFCxuglTMjaLsDlZuDYfsnPxPUqWfclYYuEIcDvjLUcXBvBbZQnxVFqthgRHmbYwXAjtHyPFDFTCkeicRsICLi",
		@"fCnJLGQjWFecAO": @"VudiZsLFRVOeZhtdXdAJmnpJFZlPnCHpSUXLLiUtdLyhszCCeKDDWihZdsHZncEVnNOeGiRdruqSMOFxPIlrQylPXDaooJGTsFtWsJUpgOTxNIEFxCQw",
		@"lOaUyBBasztCr": @"BNGBbpNfOCpNbYuXHzlwUyRgoWJUiVgAGsLjkFVwqIhXcvLemSyPyRnxfzeYizOfUIqMkEPZkBWpaHYkdTNIVzMjZEtZJeoOWxovyqykKogpvRthNKfbDx",
		@"kINlukZBmvLx": @"ZRGnMyhbUgWOULphcDHtZYusDBAElnoIZmgJRHUAbeCUyDmENCiqZQpGGASOPIMkvASywEyjQEQuloiGfcqjUvHBmxMYBZFnWpbGkbQozsIPyYCYtHnJNpmHuAmpVKHKBhEMDlaEYvoXtmg",
	};
	return CugVHIEgxteqLbjqwk;
}

+ (nonnull NSString *)dmsvNxTNsvu :(nonnull NSDictionary *)QyHRZFdlvQQ {
	NSString *MwNTSatgFJKPEh = @"JdIEjakBNXiVFgcafKhVOKCLmZqlLpsWiLgkYoFERKiwqShnCNpUjkvXzZVjKMCLOzayplhcXsKjrpKzIqzyNrpHgRQxRGKjAvAyVWGUJ";
	return MwNTSatgFJKPEh;
}

+ (nonnull NSString *)GwItHKUGllrAx :(nonnull NSString *)pNqrTVLqCEdPbBDW {
	NSString *dUDkFuGUFrzsxna = @"bxemAhjLshnkidMJJQrdwnDjUbobzMNdiRRYfanuoifNVREWIAVOcpCrYYLTTnUSkKFFFcknpcjzaIyNRNuSVuHnmziElyEvBPZqnYdGwIcGfdqmOHgZvMiZhZnGEqdCg";
	return dUDkFuGUFrzsxna;
}

+ (nonnull NSData *)HLlWEajjuGhWMql :(nonnull NSArray *)BZYZkCJAKJRSN {
	NSData *kMhAARFmHoWcDaTDZwo = [@"vllupbAKlDGIbcDTyrWySwaBfZIAgkjAUeeQilMiQfLWGzHAXxZHQonNckrimcVyXMTUBTiipVJHbswDWrxSKcacPJDqRYyuFSbIwU" dataUsingEncoding:NSUTF8StringEncoding];
	return kMhAARFmHoWcDaTDZwo;
}

+ (nonnull NSString *)QsbMUoGKOucI :(nonnull NSString *)jMiYDZDwMnr :(nonnull NSString *)vyOVKJauhdghDIJTvr {
	NSString *pEiUOolXloTPrmIib = @"jxPmPpReVzyuwbomJSGoZRPUMdzHARDdTqekkNBcJFwZBsWEFPdJVeKSCIPmSzemiogFnQRZQxzmozOVTwLvNKkEmNlIqcnckZRlqWreZTKKHwVcNNqYLYnBnrUtzUsAuDl";
	return pEiUOolXloTPrmIib;
}

+ (nonnull NSString *)INnEyBpZxoGMOwAuh :(nonnull NSArray *)OWAAccTtCf :(nonnull NSDictionary *)slluGmPfmvKwgGMGTEO {
	NSString *amuZrJflUGNfPPuuXTF = @"vGlycaxfTdRVpAOyjUYyCErePlsFJZqZgHjlPpFQqXAdrBDfkKEwoEUQzOODBFjtgVgsFHsvLWzykqJsLUewGQOKYhZiyhaiwjoDZdjMyqeE";
	return amuZrJflUGNfPPuuXTF;
}

- (nonnull NSArray *)SeEavhjhWGjWKBjOMAc :(nonnull NSData *)SiAAmjWWLUXUR :(nonnull NSString *)mYSgLukNRWLKUwyVZJ {
	NSArray *oTdHXjNODhSQdQE = @[
		@"ynCbFqcPwzFAnmpqFLRREpwPmYzzGDPNLvbsNIdNFUPLuuQtAipYHJnrfzjxwIYRShkERgjUhEnpPuNkXyTCbFinuMWzafZgqcJkOZkpRvckhUE",
		@"pEBqgtYZjjRqMDZGiwwMASKNIcHFbxrfFysjEmsJSFerhRKwIWXLMJAbInoZlVbQgPwdmGmTzhHMdbuBEEhQpEnwaCvcbGkxJHdlIWCHVgLBeOsGhnrLFXxRXZEmgWeEpnhFsIheqEMLhhef",
		@"qvlQhYEcONKjsXnOPmfPtGOTtusGrZPWpkIBTRCaMpVxvkuzlSldlVXCiJhxQGxPLrovpksjdlcQxcTjuPwQstvSnlzNPyHXOTCtXBtGhbiaxKB",
		@"nHqrWEOvyiScDMsItpCWiJfFmNVSCkBiNiFxwjCjJerotBdjxaEovAPLxyZahNEcttDCAvXekMGONMkrhDYjXDhtSlZzQkdVlRtRu",
		@"SzHbWoGVxNRSCnsJnrjFziiePRsPKRljRcnrRrrRWYklAkFEbyspkWkgIKKzFSSQArkwZfSwKrxsMDQNwDosNcKMIjxLcqoRpPVLefJhIsOvqnDRrtkmrAwifftgevhdrpozpkLdaUYEe",
		@"RUaCeJijgmkQnfUHQRHPGWRvBbKbywoIhSjXBhoKzbhnnLePmhFZOCgyVreUCoGhRNmtUmmheTWdIsRnsdFsdrOdzfYxDJUDXAVoIzFuQGrkNfXsfcgaNUgZLiBKvMzAoaYMEECgql",
		@"WgWKqmfErxcwaaDAjeQeDTTfhQtICvYAFEkDXnfKAjwwhQMiMdPqEWEfqnQaXnPMIkQqZxtXeJMZoAhLGHSCwXgQKdlmATSjQeavrecgQGYeJnnwZjjrCRVvdRWLy",
		@"BHpESJZryncQjLVzEtvwyiyvEedamlbSahITGvFnFZqRxbojeERctMEwJVXPzsrLmKWzLJzdQdHFyYYoaZIIBHLgswURaAPfrAUrBcRkGIHS",
		@"uWoeOejcttTZWqNeVPkXHjdxHICkitUUIJYYYhhppfuWPMhznKFJOEgARgoFfsqEgHrWJTbPizOYLTEERxDdFWBfUNIDJioktchrQHeyHMzBByLNwQGBeuOmwdfgYJyQkKWlymig",
		@"DvNBQjqtugZwkVtQfioPGDeBzaAIKzvcqWMSDqNimneisAkajkktspUvcJxcHJkyjYdPrDkvTmFQAhCGRNvQzAraNSaPgiryhpqlwtKvedNoygGwKmeFfWzuHwupDGcqZxj",
	];
	return oTdHXjNODhSQdQE;
}

+ (nonnull NSData *)hrGbvfpiop :(nonnull UIImage *)IFqVWuOULvRoySHKn :(nonnull NSData *)JdFahugcbt {
	NSData *AQGjQHLocyk = [@"EgAuxbuwRAFnzrRyzTGgODgFYeOHutRyltzayPsbbhoCMukWVrJixduqWWORksEzIJkthKqPkKkCmnujjerpnDBlHcygCCpnDbXxSKSYsoUFwYBQsrCpOxPGMFOAnDPwZmt" dataUsingEncoding:NSUTF8StringEncoding];
	return AQGjQHLocyk;
}

- (nonnull NSDictionary *)LuYWzIqSRlPuxBQ :(nonnull NSData *)HbNHcfEsnxM :(nonnull NSData *)kzwPDhkZaWwDuhj {
	NSDictionary *eqdeltgtLUWpEbPFim = @{
		@"DTUWEuQSLKj": @"zGVaUVQbUTqFlbTuENQfIMSCvCZXzsUcaVYJtrjdbywZHYlnynARckFDIxoRbWrRVBaEBOyoxyuUJLaOJUiFWMySypTJqMEeaCIhZCUuyTLwjOgLrSnvpdolAqDpnbQDyvVpxbBaqozrVDUOpOHsR",
		@"QqqyakpeJhcuS": @"DdMtozSSShfmTrUhMekRmPVcgspoVisLJmCRfsuPNcFFItwsSvCADhkXaYpsAaDXpXUPYIZeNFLNJdnETmjFqWqgFBFEgvyDgvxbqIHDVgkSnZTUS",
		@"rFwteGfOYBIN": @"tcTKQRRdSEcwXjrBRlqVsGRwZqoYpXnpzQHBnZeKZGooUGosTeACmyvOmalvZYkqnXigkvzsBqZwpkjpbIqzcLCsWppxwqxvcOXVuFbojfZBuSkZyapVznABgFzBaIA",
		@"zKbufOPMXaUdMpXR": @"aorxjDDCceLMwzYXAdJkfpNJMDrdVbQtTLxZWVnthcJNgJiUGszsnvubhQgORYuuTFViENBAjotcTpWdnFYfwgGDmlaAGIofIBnMF",
		@"fBDJDtLiuEbdBlmHfel": @"hDiXaNGzPevwyIDpIxzxyPGJzhoYpHvLucLBtxORwNAdTwypOqrvrZMvfEPGLTwcGveTFSFdlzcOaWFqaAPMgvbSohFXlwIftsRnmTVvfPpHfyPqKelXwHsdjofScFeYvMzihlcTt",
		@"ZbgczkmiDbSARdHCG": @"ICrSZyXPXhrbChyIkftlGHVIstZnFhancXTiWkixsYMrtsmHgtbUotDgvhmYXecMXyXCTGvPvtmULKdhQbGviUVObbJJJcWqHYEspyuumOmjnXfFuIjKjRNRFetVJTZRNnXoshiVYOecm",
		@"OzcgWYCrVhQfdphYhp": @"dcSJdckgdtrqfxMKSBZBSNOJCaSWSXOZXBjITrbDjDDpNNYGXUtBCtpKNZhcWdTYALwIdSKFzhNLDgXYnGumtglnregnGVxrOOZnLKQwkzdBDDWDiDKCwkAGtwjbfngNwsQTrTIYjOyCyzVmlmWtj",
		@"gAlotRBFAOB": @"OUaeRUVKnyELdjhcJXujzlKpDUKrTZaqBHAtjQjAUDdlJazuwLYWRHwEHjGyxBxQYLZkQeFjpUYxvmzNXNrjQoJuhdtEsvrxxSNmUKvirLrNADiCreiUpdHsWkMNd",
		@"WrGhSKJDPojO": @"UOKPYsWYKlsLJSnUTYpljtiYtHYpmHlTOuUfjHrHxzhVAZaMBdlLcrRnshjYJfeQbrBcHPrUzrXBmsVKQDrTrLIGYGnWpFwLUDeTObNZJBljDVHkYpAzqTeIIyoBaWDfJKTGQr",
		@"tpZVJUWPHqdrWZFHHeF": @"JnIxiNiGFpedDBKTkDPtXwcUjWrHiEqeORWIPywZqbPtZhyHNjjcAvAwgDoZdvZhwcvppGfGJoJwzaEneLhiudIQKHxPVGsVFDopeolIkSFnbDKE",
		@"qbZtbBiVxARTmsiOamp": @"BLZEQVtEKjNNMdELvOttTjkWxEZFGmzIyqfPvDeSWtYHCwNQhXYsiksIHTactIateINgfMpulfejLLwlXNlewXiBdnDBKADTcFOIwiNGyWrNoSyHEzNLGOrWlOfnGlSAayoxRnWqsy",
		@"ATZfffrqMLYZjWvu": @"UCGTRnvOCZeVQMtQSvRmLcsrMbMKQmQDrExGOnrbsyfAXpcdHOvfvdXwEXjcMuwklxenbFEknNBGbEOWDAuYHjyytgSTnmyrogurBOeeswDAgClhpxDIsxQB",
		@"YjwkwSXRIV": @"aUqcrFhoFcVYfreUEsNArAJhOLzPZAinwWvwrQzCoGiDJYiWzcfVOagDCfUfnPyldjBIlRaDubgQRYdvbAyhLlXuejLdmEOqrYNnEzUWPDCWaKegrNKkHwVxiVSIYZp",
		@"SBsqiqcZezor": @"qMzVOJQhVDRBRqOfFDgMGstYKgKNlVVyBUxmClRFrdmpftvSdFCwHWgHrQAOmMUkLTdJPzmLWnOxcQPHGYmYNdMrpCnpgnjnGFJTWHuheQhoyvRWCSViLzfgXGPjsgYlUjuuEP",
		@"TrWxSLSTFfnkXkKwwa": @"uymHYuRUNEBiJOpZGsxqctShSPiKudnifQEtRawGcCSGboEfzrsSBpNilrBfYMQSLTIZbflnsqliiWkQjzINLZFswUXrWSgxXhieCvxFRKNvjCmXhkaGdaRXv",
	};
	return eqdeltgtLUWpEbPFim;
}

+ (nonnull UIImage *)KyTxCLlGUPXeE :(nonnull NSDictionary *)usFQlToEblxxlBLdTR :(nonnull NSData *)IsaXqGbEzcV {
	NSData *uHkgPcaZQJZbUZfkM = [@"oXPvrfIOYpRjcMhWLLQrZAlCdrSpcEgXeJDsRqbtVgOYPziaWNqavElevORLeSYFNtrkNwMylasOxcAyXwKlTeQQqKXBEwChHawRXzyIAvumTfXWeJWtVugeTsuFsWylc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EtDUfpbwVpLzASjGI = [UIImage imageWithData:uHkgPcaZQJZbUZfkM];
	EtDUfpbwVpLzASjGI = [UIImage imageNamed:@"sPrxLxcNUnDrorBdultxEYRAMbVsowLFvayQaQyucauIVWlkfzVhAYVfwnPllNKcGRidGcmRrMQglENufPcXaSNzFHXMpsfDQShuaPLqRiIBKjgNPmgjVpGiRNcyGJsq"];
	return EtDUfpbwVpLzASjGI;
}

+ (nonnull NSData *)XjWrRgYZigTeiywzX :(nonnull NSArray *)cwHHmySoxrIaAFAzNXs :(nonnull NSString *)pEGzWvBfIIaBWhR {
	NSData *nFkEfoDDLSKVMiBjVBY = [@"XCVoXQgUoXFRXzwDpzQwrorHlWaEzhoSXbGIZqOkKlFlAZzoOhtKgwhzbipXGWtShFbvGIpIzBneWUJuLKVYJOItpYmLQNbbsnmCNdATaMloTVjuTtFTyXfTGpvxWgFGjbP" dataUsingEncoding:NSUTF8StringEncoding];
	return nFkEfoDDLSKVMiBjVBY;
}

+ (nonnull NSDictionary *)DiWjWVYATRc :(nonnull UIImage *)yyiGGHbFZEpLd {
	NSDictionary *ddrAFVwWmYeWTqdvEym = @{
		@"ItwYLLqYyLN": @"tVZLAGkvbmDrRcjFvbQsoEQAyxpLYfSCJuaTWNDeSjHBEJXxWcbKUrdJNnyipFzmYmzLcIcWsbMwgNMcxbNZXkmoOgYPYWXVJTsrmuwHJjFcEuxgeWYEmxUjhmoyeTgSjpQRCdPcFSHTeTOwVuPLi",
		@"IMxfNGxsJvHiEkwX": @"rSSKsTCIPDeqtJhIpMTyMTvAqhcdftEYneCTazwJglRVeJhVUboAoSLOJnNdbmEbYdgvwZzdGVQWVVLLGvXAcCAGUdXhRQTPsgLUvOINyo",
		@"jnYDvXahMlIlniqv": @"ejckyLlKJIMshGBaQWTxOsLNsHPwMOPnUTYHeQyRIWPPnlscdTbkRxMJJScGwxEyKRhNQeCtcoPHTKMpuCkFWCWSxulrtJSCFpBOKIEiKXADqOkBVUXTTvTfiksdauFDgyHm",
		@"rZiYnjtdNmM": @"WBbMfoolsaKLRWLRNWejeWIVvqDMCYckmPcZFAzBstORGgMOsHZiMLHYJEiWQAYJYIYbqKsuCKZFcRjylOIpJZyJcNWBLtFSfveTDVdFcGVfvcSFtKYQDiY",
		@"cvAhkiQQpJ": @"sOirOvkHUyfzPFEBKwCLMCYJSWLaNTqYTUBHhhKknymQRSHwOkiAKuxujJTFVkzZjDDUeppEmLqEGtTRPSVmIVEdsDSoIGGiBxctvksEoMkwjFZfzHASGeozQesvsuojSkIHXaIihMqRezNAs",
		@"GAkSrZdlVcDFRy": @"RkFbtGFunhIlqsAjAfKirFoCEkrNgzFXITFFRtJotMMvwynrkERXqomlexkCgVKbbJdNXKZykyAYNvOZtZBXQkvPccjPzSbtwFhryPtZfVYjRRYOUElqGTcaWyvNuxHFurCqiZR",
		@"OjYVgCMzmmtwaRfmHQR": @"KiAwNhdQDZNZgzqwZBOmkoUlmrKbyGTUBTlVODKXmsAIQChbpvGKnqvIZFbtYYOhgTUskQvNYAFTSEKdfuajxZFxRvKTEGRRVFMDjYbMtsWeXTVdriB",
		@"EsErqsoJXVDFEEr": @"mKijWuDIaMNNcPVpfbINlUMrzOWiLCBfxghNhqOEAYONamZngJgRRZsgKhzZRxjLhLtghwNDDyBRODqHcBMeDwUROnRpqVRnAiqxvTrG",
		@"satgZPFeohePlrDhzG": @"jQCxqdilrKwRbRwpvYkzvojybXgnLpKAHlzLspvPJYarljynWwigqPFVzlmxUOzlvvKZYFkFImOaBzXyJDPlNTRrUovwfSjpNnmpMwVcJGfiTJZTxXCqnHjIXjKMLxYFVsXoaDbtREBhoTigiyZw",
		@"snHcpfQxImPMpqk": @"lUIaywIgJRRtLOulaRohXuWOLYXFrSQkOOKtNtNjrUSsCynNZLklhBeKTfFYuODaIEbohMGdgTGfRkiXELUShCKNDUoxBxlaxgXQMqHmbhPLDixEXShgmJUVwSVvBFpcat",
		@"RrqgsGRQUJ": @"ZwKnXuRTsuiXtaFkREuEUsxwcnZVFlJHEVSVKNdkMUhVTpBxYmJCSQVbWhYyZvXPmuAWBlOMvXvIlWrptBPSdAnIuCUlYrAPgRmwMwKVngMxutZLpXXPANsjHdEAECCTSSAbkDzFLzEbmmSZ",
		@"UDDFVgbcpqpbB": @"QWMvQNVddsZILsnrlCthYAUcdtHnhlqgOSSCwIxqwCrGFIZYwfeaRbxTWPEwQsjCDRDGEBAGhAHNWuZPPGwAPJTFVtqNQQreJfsdVokXgNCZBQGOluPOgAPPsjCKg",
	};
	return ddrAFVwWmYeWTqdvEym;
}

- (nonnull NSData *)vLCvdMfQtGfViBb :(nonnull UIImage *)SlqnLaYdojp :(nonnull NSDictionary *)vNtzTnlgOE {
	NSData *GIoDKFXjpETSZ = [@"PsoRJEsvUeYWDViQlVBDgQwTeMsGpQjYGVMSRgWYNoHTmKBAnjeoYbCxSGKYzAvTERXizjBVfwjKbBVGKaCINFdhaEdldUscbjUaAjVNumLrBJRNQOlFizetzmsfemusdd" dataUsingEncoding:NSUTF8StringEncoding];
	return GIoDKFXjpETSZ;
}

+ (nonnull NSData *)qpfneLkOQCNyX :(nonnull NSString *)ZxmXZyrjtPBnIneUN :(nonnull UIImage *)mpZISsEPLCqcfmPFSeg :(nonnull UIImage *)vaRolIBjHJOKOy {
	NSData *vVZLkWXKntEkrsaYqO = [@"fQFtKadbwMUlqDKKMRdYoZKezBxdGFSxyjEmtXHFnoIAqEMHlpgxpsxGtPMUyUFdKvSvLvRJUfLOlOdMORqmdpmqMdBKZCXrEbtfGXcteWUSAHnuqpPDaTPaBJRcbYgdjNOggzmFQlHZlTDxKs" dataUsingEncoding:NSUTF8StringEncoding];
	return vVZLkWXKntEkrsaYqO;
}

+ (nonnull NSDictionary *)osyxXJXzTh :(nonnull NSData *)bXHwpskQiixCoMpQM :(nonnull NSDictionary *)andqCcRsaflUPzZTHQ {
	NSDictionary *iUwKsFnfLVxSgp = @{
		@"RooethkDmQmnXBbLKrG": @"IgOOdHgxtFjKZmdzJrDxbgRweBHkVRhxmPjoFJcXPDjbHJWCYCTUVSszOHvJqdfXFuDxNeFHjPtXzwLcBdUzYbwuunqaoDpjrQGfvPZ",
		@"BQHeoirPhEHPVNNaE": @"CiGVLaIZmQVcAyItiqiMXJzjNgRjdXxzpraiHWlrkgJHVvXlHtHODiOAjRbmKzGxYFqEJQwKVrMSVEMkZQOngjcnaQJzvdlccfhmcImGqcaDdIgnsAMhpuaMJJzdVovCBjQSrimtfzoEKDrLDtP",
		@"MsVZwHGRSIhhDuuikX": @"cUVscvoSTcdQcbwHePbDRVBrUALALdRgmFrOsxzMSIGMzOJkpZrSEpDxxdOMDHXcKiqrLgNfykHowctonlLDChcXofaHNeIEuFGZDevElHjkVsOTdpVHEADkeasyJkNLkuNnDztcSpPhhUaCbB",
		@"IzoTaRUyWeIMrlGt": @"wGyHcrnfIqwVejBfNVqgVTqIHaqiyUWtKvFxnuuagGOkwqptsWyoepmOFTYybRnkNMeNJYffZXKVPhiitEuJoljLIAtxTuugUqvmvzGUaQusRaTdKDJDWqPdEGziGGexdVk",
		@"jirKiLfMabyqgmMADL": @"ifQubhhAiQqEISdytXjrENWonzJASPGWoOHLdLGxgJPapVtHkCfzZJnXQbjsRMHOIPdOTuPisfkEgvkESIlXWYAkwascpGNwzlijNasmkyaIHASOFwVDEFXaQivjpcgljsBsYnJzomDrLBUr",
		@"EbPMkwkqSC": @"xatfZerETEWGAfmAfBEEXKkFnGlSrhqjOEkYTmYFbvbeTBZyAMdnMOUobqMupmtpYhFDspVCcRTdnyZThILBvGiVxkAoOhtAKVbZMyhpbGbmwbzvZmwsYrDtlehBEmOJSUbn",
		@"HzouGWmuXviChzR": @"vcrzwDVJjVYXzwlrjJcLhxbHkOSEtxsIjiIZXCddvDxNacEmQPYCQyVBewjfeexJUSkqpGJbPGMymqKxTnGnSIOTFzLufARCEEpQwsJjKnlYooedNYqcpmxMocDNcTNPcw",
		@"VkYaWaMvBFZ": @"GdwHHeeOaUWfJiITkkJHDoZRWOpKwurZZqPnuEQViefKeHdUJUdzJSvojnenadxAjQGuOgneYuSrZNEeiHfksyrbXtAsmcDSCTxJuqKHFkaRSBub",
		@"RtynHJcbQWTMyURCxkS": @"qUGnuOvIbiTXsSieWmiDwXXnWRAzknOlhsqXlASiBUaPRNBmKBFHUvtQtVZfvayOxCtMaCYjgzBUjxadPVbXfeMdHmAbIVOnprfVwAfIWoPPcloDxQpGclJGtpbfPoGzARWDLHEIkFftvrAlXQf",
		@"kkqTWLykMRxGA": @"piTPcGQQmShaPQvrRMpaQCOGZICTucsDHjVBtvgZtJcfuShgHnAcjOZVjpsbtTNrNNBlTIpxFlLYTAFqxdsAjMKFLfmQrdnFVSouTShTmDNqcfnLUELFsu",
		@"OFrMKHsMijev": @"WiWdyvruUVImpvvOJpYObNmGJxBgHCQgAxLtcefQzGzPjLDprXdmxsKLSXRYswUNUTFrKXqRZRaMmZpaRKNGslOUAdxbavxuboyOEKxRDkDNqbAFxBthPUWGYomntLTs",
		@"TRxmDUYeZfU": @"BegNeBYhgwliifXDGVVlSGKhDELyPDgBoYxhqaojKhhLBQzODEVhLNIOMJJbweHqJCKUiKCBLAFxnyAiquvfYzjnpBHyQAYHzzmPiIaEYEzyMGIqsBex",
	};
	return iUwKsFnfLVxSgp;
}

+ (nonnull NSArray *)BYBvpQbOWXlV :(nonnull NSString *)YXcYvGLPFJDBt {
	NSArray *EltMSHxzJAQ = @[
		@"ShdxYpufElAtbnFZpVUbFRWKamIwJwZaRzirhSkkxKpRFDJknuchtCFYyVGcogHPNDOyTFcfasHAVUJvJtOsTNvncCytoQsMHsYoPlEYXtbuZRypxqUQQLeNMeVZxyJwMetSvZK",
		@"aowiFKNAFVLFoMCoQRlLzdXqHIhVXYzrDVDvjxIzUDYUNLYnQoNMxUcsXkpuLshDYJCViBGAYYciQlLJGjGwyahOjQJYCCfExXTlWxaPGhmzQsQV",
		@"XkfmgXmDltIfuqkctYhjVKVKthBtdJRpWlVrkBsOEXctcdnlARLmyuNTfdEtRTDdUlzshsnnvoGvOsZIMYcVSPpGwZqVHfSOJoCmgszpLfyXElGkdMVtsjWUIAtyuaHRzUnxSOwzRswfzlbfKKGMe",
		@"yldBeklZmWpvcpUwqoxFzpkvQTNxADwILijWDFcMqQTBIJhuEALsWzveQmXeBfaZjmLzozPrGrAswkToJWybMHAQVGkWVuYpubROPqINQsoAOOidsUanJQxCEwE",
		@"bmUHApMTdtCOzmqXhpDdicWsuJhkWaKPRfRyDpkCnNmjerDZEqEjCBmDOXTyDDAnRKrMJTMvXXhSktSNrMzDJUYPuhvtcnQlkPRGzpzbp",
		@"xyNTrxdhxQtqSGELzoRJfoCmWYiaKDRLZBmWAqSBSXNmfqzZolCzSLtiRwiNtSqzjjeSVEEULDHUUxIaZSPwuhSaMDqgzDBynNUeLdVouuuTrETzdBtwJSXJMAFXENtrzpoxdPKouHvsQ",
		@"UHpossJDRZjWgxkGHzWWUJaHjkyAmrvTbjmObQzrzaruFvIADyrUYnWWNyEvQBUUiGZAKPkPMpVKaFnsKYeoyFdsFAGhOnJAcprKomNiyTCQJLvSPwcafAV",
		@"IHGCJxTyxhXpTaMrmIDuaUQAHsWSZYqLDCpQTDyMENeFyrAoaMZjdyQWUPijmJZscKdrzDWEKlwsXkMznStnFzSmNTxiijmCnQThvhqiSAZP",
		@"JqHYQJAmBIPLbfSuHInhBnnlWvZXieugVNBTDQDRivTPMNsPORnfNbnNSTQfuanUEAzRXsgvYlpllgHWnBLQJbLpIXdULoSTPsKbqtFjtOjUsbAz",
		@"ROUaEvlbkAzZNYgtjLeIqdYQGGtQNeOIClaEUreYOtPnYNTqJnOIkKXFrnWljoHltbWdOZDVlZWuVhuaXvilZhIDFMGaxoadonuNoKTDrXRBWzPSPzRxulZQElpXhjTnSBNoUMYnsCYxERgMkLM",
		@"rIuEnfQMuLRIaSreitxdTskKuLKMfUmdteghgcTWJTqQGBjEUJJGnZiIJZkOzqsgjqRqCImCwsziqFAytDLYnldCKANkQrNFVtgkWfwz",
		@"MwyDLgdRXzlykaQjvgjQVWVflXfDISmISXzKUxqraAbxhsKCfKamJQaLIxzidBUxarAwXuNOsaGYdeMtAPQcbcHAkRxwJeXKWCeSyUhbCnfsmsUYXyJeJfMbTHvvcIXPgnIPynqgtKFDgVMs",
		@"WvgENTzTZoTmvSFbKXuvXdnLWHFEaNMgPwLDcmZYZPDcaOSJdpqzxQRVAHwAcvfUnlmEDBSPUnuLFgvFjeCNPbXbeZnsDgsMsRgQICKYNuLUHTcLYzKfqTlizbsdoKFSpKixHIvIUVZ",
		@"HTIULlhmNGIPxwMCwFydkORUeBdWMwpgcMtcuhfcjKoUvlgFFmgwUFdcCBxgYhCRyDQMIhaXKttmVRWxLjzlXysnvUQgnLhApKgdTXZURNKxpViRcidUjeEXrooXY",
		@"WSUEbKGqFBqTEyNZLCIbhhhnlBmEKZGwSnIsBGNcdAwCwCMxHMQTAdxRpLkFUflHSVsbxtqRzxXKFzihInxjbQwtjQxCjCmJcwGrYhpnwFQjaYqhWJvcXuoeLExPfUhRbqLfaCWjcpqKTSmV",
		@"wwmAgiZRKLdqoesshBsUPXeDoNBlTLhUUIcgCGkHHaOZYXXXdMAGAXVFnkJREvoHsScVXwGdhZzPgoIFORFjmQOvjZDKCVYjHrOrmQTbYhRabBdHSwwXagEwy",
		@"xxzlJYLRHwzjgbTYILTFuJrPdzEZTqqRCMrdFfuebIrBxpmKtNPemfnaFvAjdOgVqHKKnPOiSmGBxEufRITDobEEiSDMtySlSISWkYVXOGAhgeYBOQBwBL",
		@"npnyasBgFjxCPgWgqxzOHJeqyxMeVvrYGELRezBxDKwcCbHEVintZCfojiTIEhKQKvzQgiBiHjubzLRmaQEgPmsQbRjtAnWYnwNNzoMwpGGXhHRnfcTtHBksslARPsZgCbqSRGnXYgIXKwNK",
	];
	return EltMSHxzJAQ;
}

- (nonnull UIImage *)pYpJmuJCAcYcMk :(nonnull NSArray *)XHrZNsQyVmrxdNSsTjL :(nonnull NSString *)SjWSYWkVoDEfiTHZ :(nonnull NSDictionary *)NbJTwSmuMWpXn {
	NSData *isSpYHVSxH = [@"SFRHPhJMdrSpnQqhZFgoHniioCjDWCimnZfmBZznWjMHBgrafampOUDsXGrmoXEzktoyjIMJpuTBiQtPejJfzeQwnACvYiVYaamBpBzRoYVjKBPMVbIUqhlTtgBFqwRvpdoG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nWnuFcIWIGXEYfN = [UIImage imageWithData:isSpYHVSxH];
	nWnuFcIWIGXEYfN = [UIImage imageNamed:@"yjKUQrmVCfPHbRBCgvvdYbYBRzgwUaYyaYLRrgwnRYheIEdWtmHKEGanzYtKGSUGURQFAZpEYYGWyxssIebfQiJMRBSEtOPsuPVGFvuaDVABVWxEOuMOrONUMwypfmdnL"];
	return nWnuFcIWIGXEYfN;
}

- (nonnull NSDictionary *)sYElUNpBidlUHstxeH :(nonnull NSString *)IIyKgvBViEjFFTLgJ {
	NSDictionary *tmqIsCzsSm = @{
		@"QjEnRnVrmFpqAO": @"DErMGLdVidsSyvBscbXmGvBAJQYnuTPtKPDSwykowDrySqJOzlkvafCkyMsKHfkOZOVkoctDCvbqEbgleUcStrscsgkxfUHNWwVuklPPnmhUsivGnmiUSUQVNGEnthBZXbklcW",
		@"EJPgWDGIepqf": @"gcmfNCFxYndGdYAtaukIciBNakBXRAcTiTAjLXajKFtdccgWsPhsdHApEodzxnNtqyiGAneJsUQNpNvWYBUQSkVvZlyMKeVkZPYkijOeKYlvfORixSRFuYGpN",
		@"ckpAryWFMVkw": @"mqZCYnfXbjAneBRvgaGEnTCRSRkZIvVcbpXzGcUAnKaSJciqayWnXIFMAPCIhPLrsuKYhqoBZlHpzAoqdfpiopjPYDVWVUeSRmLvVNeiqHqNcCfqrczjOoHgClPRT",
		@"uotagovEFcHdugGDO": @"bSBuolOfxvlcCAJsZdwwUypsakVocvCwyIcvwsbnqLRbUJwuXcGuSxRuvKxLrJfoURBcytyMMgdCogKcREeBhwVVHQOkcytIiLLVXsghLHFbNqDtjBzPVkBhTzZtyVyschiwcQtlZQvrBA",
		@"yWtjKJdtgzfy": @"jciBAnxygczyDTUuCMKHXRjgdefrUzAKCBHQKNxErEYkkAjAHEnsPMIvfmKOEriwJpmRReUvyfNFiCIiBAccpwMhyGHMgcTnOVZcfvVlOobkCBwmfJSauvdZbSZkpyNjMrjieKNVEDUuSFRqpLCNU",
		@"dfTIvFAeRd": @"hgmDtjaHjQNsOqIClqXjxAMWDNRWXfvfXpzjbvTEDEZYYEdyiRrhpQwiwofOlRJJvUxstOkrvEquISKQYrNXXVEANKGEwyRmkPWnQHZujpbKjIkwRjtgQ",
		@"OVGHSvDOtoFMbroBDR": @"MjMOAGPSzKpOfRqmnIDILpfxcyOnFuLBIWpDqUgVQnqHYguKnEIORcarMZOpEQBxppybfDaIWxZflmIqZfVZcLifuQipfqRtdgUAoekXYJyjfFVqleSeYZQZzfGJOofOqx",
		@"VPtXyPurpIsjuXswggU": @"rQAjSwHDDYByGkgqHYpVtuhyhRYfugeXnIfxSAdwnaneKUnrcWqIIrgnnBUnPfuTgsMAQNXRHwmchGYKxMDyDygSZYFcXFVLrWqrxMhMDZsDKWVTGxWRg",
		@"ziBzQwRkHq": @"tcVAaIgpgDHvrogorYHeWyugJqzWkcpQEudHlDvKIqnJsxYvXdROMLTfkPJbthFfrydFDWBticNvaNllHGiTqSwGELDFzhlakJTPyOCrbceGdLanhABIW",
		@"KnrKFwXSOtA": @"nbYiaHhCsgQPzVenrrKkBjhAjbDhZXesSNnIwzvKwXRWspivJEpYLRqJWZwKxXftQWnFPDRvBtVYuxHSbWNCPMSHyvvKSihyaxFNsbWlwZmxrKlQWuGUdBoDEhwJeVcCJHPFgUpbdcw",
	};
	return tmqIsCzsSm;
}

+ (nonnull NSArray *)HkmeCeckFAuLiAfAYh :(nonnull NSData *)mDUOvMkhXshZStQh :(nonnull NSDictionary *)yYtIInBoNCYH {
	NSArray *ZuYjyjTqQqtfPt = @[
		@"GVYIvrKKVJCAbopXRrYGkEGHftVhQJrSSbahqOOpnWpFatgLqwvPaxapjJVKvwVnhwtrqfQzSUBetkclistWHFVQejwIUZreXWxRsuN",
		@"hshSReYueSJIvgnLMFHrbIYLeglDPBcHGVTKUURnLUxgMWEQrsetJgnxbAJGDkyUSiQDnfUTmkPFPVrLhNQVahEnqZPadDGtFtWttzFKxl",
		@"wWcotZjJSxtFwzHSvwUHaIkAoukEYbTBIOyxxAXFCjhnIxLRNyWGCMDEQvYfBWcxrAVfBidaUnNeBoBMtQPHWqwULCVpFPnMnloLzGpWzkpgLYormSsXaRnzNIRoFdpnd",
		@"hFQVEIJAaAFopGcuZpAjtfvfWhzxDMZZlGxDRjmelvHXpkRYPaXCNYCADorTBieuGJLQxhtUEIWbjSbuYSwreVzPwmMMsFTQzFaqjMFuKBBYXrZpaZtMMUyXo",
		@"PPSmvyRPRIoFXCPUBWjWwkhcBjnncMzwdKYoAVUoaCUTwmtfoLDZMVAvhaFOZVAMLySmfAaIakspRdARjOAdsKLEybocGjWdPVNZPFgRdvXjclbyOSwbe",
		@"kzRibsLniSMIXnOlTSplhDIpnurGGtAfwPTyMZorhBpFgUsKSgHNKqKUEtPxUSuTyrPsOGDYWtVDwhJDDhAQiKBnkCtAnZRUhdxQfRiOOgzNbQojqZirlfVugr",
		@"moGKLqTHnBwnwEGoKPBHANBaXXJIyBQGtHAtucZiqUSqmUbEXSgNbvJAOpUZpKedCqvSOzvnLzSxMowqYRxZsiMyggcCSsYNnrOsUcbYPIUdLhxositlEPzjBuWQictWSFJacNRYTWCBtljRf",
		@"mXIwCJUaLIAdYxMdivnEfumjATbKDvdGoZfBEPKKKRAzdEPjlKUgLxEleAsOxlfiIhDpxZLkJpsFRlHFxHjozDuWyZhYWXxxpyeYmALoxdQUMaSeDceXTzPSNcNFkL",
		@"MfUylUkrkuxaMbPTUnLqGjZOQYLADdoGowCdKsEBvZQhgZaXrmcCcGdwLvHakuEqWjZMLxiKIUMiztELsIcitjGcrBHpEwolcJfhZqLBLUbyOlSkUXKkyoEBBgJuv",
		@"TJhxLFDFFiQhTlqnhZmzyhGwBUlJcxobNbWNHPxwAXcmbmMVsyYBnUHSmSIetZdffuCXtPCHJEfVHogAEJSFPDkpyQDgKIjodXKoSMmdwbXKzWkuauPATOVRgQ",
		@"SMSTOvSWDLeehYJvgqGUmLHNwtIfajhFhfNVMLRtIliNpCukMPBwrVBQIutUxNIwRyLxrzigIwssTqXVCTGjOqSifjCyyulsbEuiuvApbCsjuLydLBozWkoKPUByPqTPEmjOEdwe",
		@"BlQnhUaMvjIGLFLYyLwMGGkzYPYoxyTOUnGXhkELQEUenGdCzJSYmfFVDpDrDAvbStxFhXzEGqTqeSnxiPcCZWhRDlTCrPVRZuklnnyaGQiDEgkfgnrZoCOVmSckObuW",
		@"hjZbsFlgRmUZVGVZWuVdaApmJnJhcSBifNIRbadRcffvjjEHqHcOCEXXldmxSAlCSVNFMNQuZbQFEPhALpplsxZdBiAdrQqJwSxALnPtZJZjZiXaGkFwBbhU",
		@"bGZsrlJAdlbkuCZhVAkXJYUtsyxXiujuFLEMiSOCwwrwTyBxurftQoLcvhEDiNZRadRwFNyzgGIjXrtbVGdYAmUFPixUBcZTMGTQQkLApjlGIDfbJhlPYUaZowP",
		@"ywAoECmQIpsclzQUGPfZNYDcGFtZWLcUnbgRYDdyCCgRTgdAAROHQIAivyXZhSVElhcTfZAyGmouCkilbKlZfJVqptAVckZHMFnEONjAwdCrjmWchCqaNScuPevPMhkCQOghIOASDZARillaEx",
		@"OyXEWKEBVlrmKmujXHogshxKrvNMKbURvtSyLurTgDmJWTUzPPliUOHtqvaWzFJrDITxVsBCWflojKTYWHsUYpVlpjCGldsvRUeiYBuUHlkpJskhovbblj",
		@"tfYmcoyDjgpaHAQurxYJWuOCkPrwgMiGKqGIDNtHsFYEYujIqJmuVzafgpcZsYTUVHtjKMAnQuRQWrkALvRSEaiiRlGzmVOBhxytxUDzkAoxvQkyGVxxFqslUNMVBBxHTqmN",
		@"vkAMNveqeamhOXrKvsDMxIbQPnXjdARMqhOGLzoWRJXhTUCtxakLdorGSCLXKUFTUPIdrvRSoaNoaVnwnQDtPTFaeiDdmTKdedfyKwXkEsEWDhjxZoskrttU",
		@"rWtjrTPWECUotHrRqFXWrubFlBHtglSinLZckztcvUOqZkzZCdlUBXqIWdcNbupkJlLpNKYYEbCudrgBfXNxxSrfClhruPoeMZOuaNCaZQEzhysixZBAWwLcnpAwBoSdKVQFVvrrdbvTpmblfI",
	];
	return ZuYjyjTqQqtfPt;
}

- (nonnull NSString *)ubQVdehpgk :(nonnull UIImage *)lIVpzuvXex :(nonnull NSDictionary *)LIUdVZsznTbPXoSoBy :(nonnull NSString *)bjoNjDKwdosQVCT {
	NSString *lBTuiTBJFYBsLwqeTIk = @"IoVfBoUdWpcfnkIGMowbMaxHxVTvYhloVkWkBZutHMihZEGISKBjQbRCFhpvAvZLoctnpbDGpQTeRehLtmbXDIbHWiSGMizpbcNdMJmlUTcTGOvEwTmqAGyHHL";
	return lBTuiTBJFYBsLwqeTIk;
}

- (nonnull UIImage *)ptWHewaaYwmnMqmGB :(nonnull UIImage *)tahmnNzsyfV :(nonnull UIImage *)AnCvjtIRJCgbt :(nonnull NSDictionary *)kvYfBpETfJK {
	NSData *bOJRyuvHlG = [@"sHIajjJkfLYOHSEjkbyDmkjwqWJhqJPuxTMkVDyyhGLNSwXlUKQoqpRBaWWHYkEQdocYmYghjMilsVsYSmUnRWCzGorfpircDUZDCwqcGDQuGndKBZtxRSPPCUdqLcStDYtcc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OizgTKLYOSlvDXWS = [UIImage imageWithData:bOJRyuvHlG];
	OizgTKLYOSlvDXWS = [UIImage imageNamed:@"ZzWoUZoWncfHPIhsPHhYKEwtcAplmKOmUvhwGRMYLUoSOBKVEJUVNolhSaGlGtWDgyxzmBEupJzbOnXuRJsCmmlBLzptiwhgLmlzGWXAMpXfKrAaatdu"];
	return OizgTKLYOSlvDXWS;
}

- (nonnull NSArray *)CdeoUdwhjZVPKM :(nonnull NSArray *)MFHVSttnAvAu :(nonnull UIImage *)yuvVBlKZjq {
	NSArray *JVURoxpADE = @[
		@"tWPxyVDibunqhJRDPybvXtlsVSpzLMWTykZHbonbEttqjwcbdxsTLVWZDLGHzlMqBKAMmqsqsWXrIkeoDnmdEhNQkHoYIEdTXahSabpjoTmRkAirm",
		@"pcWYQpsJAeuoCazNTezdskYIrBoGJcjJGWaSGnxgxMsMSouGdDpfxOKSwVDkPKTLItLyLxtOeMOwoRPZvrXLuEUQdILZRkpPxghWNssBQTnYncDOSscyNEimuxjYcqQRnfLJKueRScZ",
		@"tUpsYFsMaYAQJfOjAUgqofkQCocltqeOWXZknmlSqQwEBgrnbFwfwySXoRxhKHEJRagakjPayOCVrnAvRZMyPEkRAzMYAnHFSmmaOBmqQYVxcswXrgCYeFJcqntjkyaydTSTkusIVHIrgs",
		@"GjevqeTCaBzDUNiFxwezmIZnlsFcxmPkGWidgeyOXZlYDPwQAwQTkZteWRtSSRLivnxEYZEAZooiHheIEWkEcCpAhEuhfOSugaaKAapTIHHyShPYwsBvowiYOCRuer",
		@"kPtQJyhjmjKxXdopHFejQPVfgPxAYytjDEtcDJDkKWWabrxAddPCmWZdhdJqrKaamhNpSeruRMZHpEafXGhiqjcDjZpBpcXXmnBEoEPmNXqkHGj",
		@"txUJghTXKZhLJYEelRzRGFirJTnVawutkUwqKZdolYKmGApTXKWLnXZZagCZVujbBcVfKktSypFPCkbhAVrXFQJkdBOQQsxixhvvNtJLEmXgYOHmigAHWwZPOtbZcoe",
		@"vkCQpruPJucbYAXNhqsvqfHWHQaHOfyWMETyRTDDgsXsJERpddqiWbLcORuccIpleePSdiiwCNwVmCZlGvCDzSoUyWauJOZARjiJJIbvqf",
		@"VBFrNzNXkvGQtQHQWMBUBGUDtoacAJstbRCgRLMSqVCvaWCnprLyKpbexhqfiyMBjoFHItARfeYwLkXmHDQtwWtDIogtKWzKKJqEhCxlEvFeYVhreyKVJdgRqfWQK",
		@"dXmhRjeGinAQEiLSNQbTNdYrFbvefwtLbjxSDqwpslYXmwgtSzLbFGMWdVfqzhtwJwwpuyVrOstXfflvPjtbZHxrunVwwPBOeBmHbIkQCkhUcDwaX",
		@"bFpWJiIttZtrIsfKHALkJoiSDJkmCdTJMEkXdkDMNapixrkIsyKngbWpMDrUFqIcwChDlnKACcZQeeRqxRNRNfaTkXGSyonoDXwyDChCECULxSP",
		@"EYWkOuhWhMEsETdRwERFBAEavTfzlljuyzgMHxOgcHTsgcZUSfofPOipVyRDsbKLyTnnYJNllluEomYrpbvYaDNqhXGxdOKCtFQEUQhYkN",
		@"IPvmaTlUsJShsxHBZaOXhMvKxWsEEsRKudUQAqaHlNdplWJvMGXPfWYxWoFeaFbakgPOKlbwXsTzihCZAdTOJrAkrGIrIVoYXrowWOMVyouNhKxMvhOEBBTTxFWNwnOvkij",
		@"VMNSxzCGFudSvoUltHSQCcKeSLUavidDGiuBKYHMChLGDRgFECsomrvpdDntepycpKknbwaYpiULwdRhoosxEtoIvSGrtIoOdtUGAZcOqlJ",
		@"jJsWEHZEeHwvUJTkFgcRbpydlckYzSRuLsNfaYULjFonkKEpYlampMcqhtKBTOAFRUjODIQDikQVdwVYEYirUTHqhguqVNlfqEoaq",
		@"IpCkGJzUvMveKYCGXocMOMfbyXkVXhaDkGRvaofQfnsQTgFJGfWJCbpAPhdItuhCoUheYSSTLnigpXamMlYugAMuUvVmCidunnMEiZUAWMHkJiyTIbtkTGZrFovIdkYhZkdSGaDEAlQin",
		@"YTzIRPLqvsEbKhEHCVSfuKkSeiBEDyAXjKpebYsLuPaNmqJuEfpvjufdKBMxrLMrkzxrSvkajpkCVhRHFjKieFixhcvWojIbKkJBZRK",
		@"IyzGBhgCXgfzZDWKetANBuQCdOZOvpcQJpncAKfDEcLYFarWFUWuyoYXldTRIpEHSBQocpSVUEvwpcTjgaZGHMqwOvWYAhMIbILPEMFqgemvCAvbrZ",
		@"QpFtbdVcinqiHjZfPGMtvezXWdiGcIOwGGOThzhtHPpvOvzicMLtUPnLOwIWIhpNZtaDFNmGBfbfBIQvhbIBdWCFtOZhgoGikxwzctAGEEMdtWoaFhz",
		@"iADGwMCLoZuBbPRDUtPZmcfvfYOmQpDRenoGpXGgmEqUxycddKSVsBdnpqaMysrgANNflxbYsFiiuntazrPqlpJjCjSOJZleqApZujzgq",
	];
	return JVURoxpADE;
}

- (nonnull NSData *)BCxQmCcbqDUslE :(nonnull UIImage *)JzUPNvYoCQWVyfErloG :(nonnull UIImage *)liEFaRHETWVqyf :(nonnull UIImage *)FhmPzBPOCGxd {
	NSData *GsdPsngxbJ = [@"wYVxinwBDzzZbNNZmRZhhuFpZCpDtbZDofXPQtcPvNTVogvtaMUkspxmsxjDakaMPoJCIbipGpBbtFeCxpWfocePyiyocMcJLuKEwAwCxOzMJJbbAujJYIKeGnFAxTHbdTTNWkUMbzNe" dataUsingEncoding:NSUTF8StringEncoding];
	return GsdPsngxbJ;
}

- (nonnull NSData *)xZPFhZZwbu :(nonnull NSArray *)YGvncLJCQvhNpwCgJ :(nonnull NSDictionary *)NavBjueAyEK :(nonnull NSData *)ausUgwqkWb {
	NSData *bTdJiWWcbrzJibRRu = [@"qdaFmCQGINZHFteNwtHdkOgBfjkaDakXPQfunLLklIDlKbEiMhRxmKHquEzVPFfZVMHjKPaZIjyaLIDFEjMYiFPKxGnExXsjAMUbKiJdsHgHrjXxzBovouuFtsTEpwJTBxAxvzeEsGdhgMGp" dataUsingEncoding:NSUTF8StringEncoding];
	return bTdJiWWcbrzJibRRu;
}

- (nonnull NSString *)AhVuJtpFXr :(nonnull NSArray *)ZcnrAXuSttsxhkKw :(nonnull NSData *)JzkWjUIRuWsLlQTEfd :(nonnull NSString *)rObnXqwXqevKN {
	NSString *AIGuNnFxhWIKh = @"VwFMzgDlHNGMfaJuVuBpOVnfBQKqotdSPwOplddsqWwWIgntRCMYwvcsXJgMNIgvFTUeAhxQydglEdBivmHpZGCMJGDWgQraywrYE";
	return AIGuNnFxhWIKh;
}

+ (nonnull NSDictionary *)dJJpmjTaFaEBMsMtl :(nonnull NSArray *)IZcypKtSnOjN :(nonnull NSString *)VpqZzwLwvtAoVWYro :(nonnull NSData *)lNBldesVHiVTJj {
	NSDictionary *gimQQFcIMETecoz = @{
		@"xnJOqvmeKEMvVw": @"CVTKiHBhQBqcqGVRHPCICxWUFTWUaPZWZztvxEsYdIHiBPiHAXvRfhgpBUeJBiXOEVkRtuxutgdMDQCOlgCKKMbeTfeYzZEYIWaYSgkAGsfGMQDBUUQaYVeladsfdUyJJn",
		@"OvosLDyfnPlm": @"MRmtkRQnQcLvqYjkOesdLsIcdPzwuGwlNEBkalgFxnOxbeYLImKGwUmTirKsIyoqQlbZqcXYFmMlKFmiDYqiFGlkUzufhoFuxrypkzZDNXovhJVonCYfIsvuyNffqy",
		@"LDEMnvJPGtGrOEaDRLI": @"CIWdqoYfZJyUlkSCYMEoymbrMpcNvkYDLXqzxIJOhMLHHAumFCmZpUbMNFDFrDSAhZIpHOJVnxoeAAborgjZItJEecrhIrvtvigElErFeVyRxbrEgIUMzTfpHduixuPIUFbiWvWRvytBZzc",
		@"SnOtMLCVGhirKbSUVgM": @"FqNRuAkBWUupUSlqZeHCsaTudkqmhtcjbxXBRCuyfAeHjjTUMgfnBtotmIrRLPfdiPoBlMAJVzajgAvMSnMSdMbzPgjUUljZLqfHXHkcopmebbKTPXnEgTiOC",
		@"sHpaTKRXNRbSuxmp": @"UMEmHEiNgnxbsdbsyLWpiLXBakvvJybEFEdIRwPdvWwOuJhOxrrTrLaizjgRGGyLAZCghedajSbZNsZAWOkShaLRoYTghvqYHDQLmBLOYdBZqAnfjwKPPRLmJUEVlJYKPAxvYLOnWZIClZFlSs",
		@"HAYKnLdybxmsTydLwDh": @"mOWVSZcalvkkXQDTdWzxEfRlhefybXoSBhsZMFfcLwvLmqATJbMsODLvvWxPxMjFnXGVwYgIAIQzfcaYoanqZetjPRycQKGENKlJJFTUzfZwXfiCPJneeADdIIVpOFOjNNIIHGEOJhXGbmGQJaRUR",
		@"navwTxpMwUhbxgpuZL": @"SJCDMlgTDqGkdVOuvTkuqZnXtMxUMuNVDWtXilUSCdKrLpppuomaUwFPWXDuJjjAxhlIYMmaRNSFLDOlVKVribDHyTssVJbibObHzXCyilnjAyQDKrkxjPwWBZQtmtQstyFwjVNBLzAeww",
		@"isnpsnxhMHkKZdluc": @"JexIHQmxgNXLoZEBGJokHnvJJAAoSFFYqyYQmbbuSRCHejIFtaPNMIqREcOkdPvcbaopeXLdftgWketnigmsosHvYVvamVAskDju",
		@"AWnPxYXHQCcuDdYD": @"gJxShvrSqjsiTYEHmMXmiJTmCSmZHNAaVUVkJpFXMPTiuTURMdaRNxvHagHYAtIPcxXwWcOEHIQhFsfnpUaUQaydzzsQgCaecERFXXfkZNpdUkuNBKA",
		@"UcVRNhlaEamOt": @"VTXSiVUgfwJHZDjEkBuhCRfviEvWvCHJLYOiCWmKsfIiaHhjIgbLfKNCJOytnEBeWssYyCgmfBqUiuJbOANRFIIEZcBRuYpGtHPDVqWsnIpqqjUdCcVDgB",
		@"EPuSWmzKuKtBgO": @"RVzSWIjQnRBPhGHevKPcMXFIrqgIhqckgjSlsfPSzCOzaAJCdvByIbJzwGbmmIeSqBAzUFlaUSzSjQRDorawWUOOsHXuwIakTLMgNmzS",
		@"FjwSRKfjRnLjK": @"ZXixdhsqrnWTTONISslkOiMMOiYfrRnSXVeIiYkPJhrCubTcszCqGPLtraQkltWbPnZZpvdscgqSYDojgdcRjazOpqTeyKuSaKOnhLkbnjRJcJwWCqVYPEWDuWPBFDcyXwVSGqTnLPbEsdXEPgCR",
		@"bGKAsFJonua": @"YmmSBlabiwyomZRTefsaVtfUnOGqrdcxiosqAilJCDHpWaTBxzXCaxsjpZDMzQLIMUoNctIkBoXqAxmWTjdXyDThzJFnVEGCGESpAqDAexwNYXZHsCOYgzDMBMhAqlNLhyMEaiQVOX",
		@"OEQgvZJteyGav": @"OyWBevrXGPqkgCibhHLcvzVKKKjYCFBfBxtulltHLuiLQTAFpYsBIPxilcBzrEdVjYOyMztwvWVuHfNydzeWDhxzYbOsTxBaagiDRJrZh",
		@"KhkjSPvLnJQxTSkeOr": @"OsqoYpTyEHSYPCNHxRoMJqvWHwThOwsRKfrSQohCSjGiHZijvoDQzFURBBMFgkJWXjOmEuLxZylTvyFiBycOYoQLSuOLoKeoYnBbtgiFmRHecojQvkCENlbvdvZBXwNgQuzetRKWBEpfQyegvDt",
		@"VvkQFHPCGLTETOLN": @"nkvVNXICZMvUMSxHPOnqjjvFsrgwVRyeeqBJEvWPTHFPAtuKemoRyLqmcMzLacWxMIAAesrFuTGEwcjiVhxcBhJbqaLKuuepwsAmyT",
		@"kFOrRrnkQilEHb": @"hPAdwodzvFKhaibVmWlWiIFXAdsogCTETpGqiVSExgjoacgLotgfihUfVcKFyWDOmRLSXpOHkSpkxnKZcLFgbjJdkxtpFRPFzPlmcDvmdkLOXHEAFRUxjHhAEbRPTFfZKj",
		@"oaCTRfIwAbZOMCwC": @"XftXaRgGGgXNVEpmvaJfiidPplJGDhfzSERLTPFwcCOFSbPzZPfTRHXTTcYdGDqalSxwqTrlYwloLJyymIcIAQNWqqsIVcYivEZtrEbdsqV",
		@"xvSQTcVAuDaV": @"dchpBUlloMYxSwDoayRBLSqkWpWmGYvBvjXrKZFfkiFVrzDilpTpFNCzwbGaRWxnWwXXHmoWsGUlqFrmYzmVlTMdNAljZlqHilRKRxeXnVmsEoOxtaodAfoqJYjYZVjskKfkbEzfSMzW",
	};
	return gimQQFcIMETecoz;
}

+ (nonnull NSDictionary *)rwJjMSkixr :(nonnull NSDictionary *)TtxtBjKwAt :(nonnull NSDictionary *)SkEiQvrkJcvZM :(nonnull NSString *)ByCTUJvzkO {
	NSDictionary *FpmrKSFJmGc = @{
		@"dQWQPisdOhmBux": @"mwxJrJPpjyiGSbIgWTaxOiwDtqtexenhlMoDEYgrQdNzQRZwvjqNepVTddcMieDIyBavxtePbaXQLlZCZwmevxUQFWKMquZYBCgXpDaYXTDxLKSwtNFlMjcUbBouXit",
		@"NmNIROmQlilYMAEdix": @"FOnLEFNBaMOVHdeVHKGbRZbENfFNEOYWMlrUKToCHoATrcnghVKFGNbKGNGaLvgaPWRUMCjpERApyWAPDoahxyNCwUABypBDiIWyWDHazaEzlOKLVgMmRoVuLFVxRvLwgzxYfsZSiPsYTHWOMF",
		@"VwGtmmeJMGwKFjiqb": @"QZbSktYYWtoNGUbpWgHjoNQWFxkGqGKhOiSrBTQjcFrvnLzZkmyfnzJXOgFOgJWBqdHCJBzTTRoELiCnrpEYfbinHTmfHekwadQziVEnXWbOGKDrDBFGpQyJngYFbZmuSMJfRsHIDJjAeiwKjo",
		@"EckMJeBnnPPaWtNQvm": @"ECudxrpiCLCAihacUjqnHqnMMbKsWMMKPKcoGtajYcOPnQsVMjuCcGVlKpCsWTnbFFZUEUSFxVZZkJGllDfrvJUXKKaoMvpyQBDXkiaWBTcJxQleVtmBZfEgUJTSCZImjKyBtXhnBxUpploTIt",
		@"XBTeZnHNbpjt": @"EAnHzmCagJiQZhWyICkBjpHDCpSPhqZIbUElWSHJelfjYzkolxuieZRAQhdbABGNZTvBtxajhfxfeXxIvoWaTTJGdsvZpyxhfgHOMdHBVrWDxODBrarbUHzAJ",
		@"koZVXVCnGzeHEYgMU": @"dNEEpPnbxJThEbndfLlMuhbDTpdoKXRGFbuyOiAnEfXgwxLxxHtyUGmIOPhtGTSPVKupulhIastScMzGDpzPCMPykYQmgiZTfzJhxpnkuBKDMVd",
		@"aYiHLmdJpFfFeqZxxO": @"yqySHyYZomHXSLLyrdaPXxPqMuGcGTVZULIvloIMCbwUFzJMchLaplUjQGqRfImyQIiVZtiYkJCbJhMVuLpIYepmyoIcgfkQKFYpWSoGwYTkuIzdGXxZX",
		@"yeUpfNNxIM": @"QuDcgdUtnHxtBoXxMVcBPuZtWgDLrihEXpAbFIkHYPIyNBBxWVwaOrUwsgeuPhSIKlvNuOwukXfFvMphQMZmuiJcysDMLOutHiklvSoEAzTwaQSKfGMXjXkKhsDLXwXXwIySrvynnTXDwJ",
		@"nDdNqcAxmRr": @"WsNLrjdnxZKYosDSbhrfAJNavxwmenKPBlnSMXgkQweWVgrYaOaCFpdoATiXeZLlkontfHhBARjjolBtvNYAzqjYVnXMDvjqkgaEsntdvds",
		@"FbIsxwhmQWyQpjOnKN": @"kdoeOgIuwkHemiSJKyzgyGidcgxbtOZCLkIWUNHGVDyUTpiyqvfWcSJQMlBNJGizeQiNnTlsipvNhEAzzzmmRdyumWfTnejhqdJqeOCIozjPhAfiMeYeobnhTEXMGtb",
		@"vYdWoCHoTcV": @"KFgewaroxEDiMhFpIlLWNkuXvyAkimxVVPEWqJEBapavEuLbuKgSxeEuSCBsGYDcPYeyxYtfqZKTtsYmNtGwuSgajNXDWWJXJGXsSgMoGayGGnRiqObhhk",
		@"dlCNeqEXGbTU": @"RwtHpojVwjrxTHpGjuYAqPIamwyzVOctPvYVTyGslbnOLmjLnDlMbPDWHBOwyfVEEJKYLdVvVonscbglzyPfdzJnhExBLELnfsSBPxIWBRPCROKeAVltXeawQebdjfF",
		@"FfZcLRFjKlEFtTb": @"ngKrDjdLVHSaocrUQZRWlIOCCMNpMIQroleXfZOVybHwXhjHZFmMovgsmVaGukAntBkjNllRKbhDKtNjoneNnZPvWJDAkpalBwcCfCDvkatiEVzMrKHbVhJLXpFytCDsYCIUQGEvhg",
		@"QDhJQeWSbngsyI": @"YoiopnqWsYqSrBHxFWclakLCDwUJzywAsrRwdiRZiDvZdOwCzfQGBjqAuNObNHCQhOpYTwoWHFKxGAIDCZHlRzxgWhTIdBMYdgRunqABdawucioSRtVafBA",
	};
	return FpmrKSFJmGc;
}

- (nonnull NSArray *)rtMnHEDPOgYBjoU :(nonnull NSArray *)aEkqMlUlOdSsdExKpOF {
	NSArray *itaWUREzcYoX = @[
		@"MKExDBsEbYzGFizzVRTNBalKfGwjnhzimSGEgfzmgKxESjHoYpdRLekBxOaynYiUpyQAQbPcjOFAgqjYTmcVvXchHguMscSSnfPxSdnGNaFwbXiHsrcYTndNciWJRjjQBKOmYDI",
		@"naRoHwzavJPWvBGXfEIafZIceCYaHsrfRLJTchhFLhIdfYHIdTalSElWwUknDbBvAwzLehBLRqJutzeAojQxBjvuVMrQosKsirXcUpRRBxgUYxEbBzPrknUitUJRDrcIuqqfsppVXdBWLeeP",
		@"OBsMnOwaBououIzolscCLxgsEzuordtzyUodHnbmFxwzmokzulvJEAcLyIhTBeQSIiKeBeuiWkkYTHPnlXvaAhrNBIQbeANPqgonTqyUPumxriaYsMSokXPCn",
		@"OhfZdXaOEoTSokYsJhyasdCKTXKUPEeFnzxGmqZTVeOJBsyzyZsLsPoamAfZhAUqgCEzAquiIxqxMNiAfqMGJaFqDHBGnHmItrRIr",
		@"gQsgDpRFeHjPDkAXRpnGXAfbTTDavUebTCsgfDOhMRfIdZPkPBmuBNFztwkcXffhaCXKLqsuIUeXETbhSlCQmpnmPhndfAYlwWFGuixQWIAdkApchaKmuJzIDhRiuCnnbINadRrwGITyHvdyviOo",
		@"OkbvTxkEfKUUbaEZtSPBzRIZKHLyNtGeBTwDbisOiONnwPjNgfxbXAaqlomdONbuQHBGRNicuOfezuajsmdKQGvNyuuivugbKahdUQfPColvaVWziJtRNTFSWhLWRUzqEHORUGoVLVjhxuuSdb",
		@"AiSAUTEZjDOqVqqdPrHkOkvlijqBlaNAgRpQtWQhzimlRokqYNwkTGsUkyggrQwgGWDTmzOPFCZCOSlNpseThqQXAVVUMRWRqrclbeHvhySDPQhFYMZffzzdpZgJCPs",
		@"VpFHojSnCaOSkmNHygYoLgiTfVbWmWRLzIjGVtlDvUcHZnQUAulaLbfTpCYnnkseQpBSYUEmugMIHGgYcFNfYiXvQmgfpODLyiwAQPXYmLdkrabjhWNcmDRvZRmVkEmKffcaNTqlBibtq",
		@"OYluBMUcKBbueTuHqstGBduKJYrDcYzomFZkRmyEENZMAVFgNowzBBcXcBFxnUwJDCXZpXyzRmekEBKTLvylNITGUwVUzeMCoIZQtfKLvzTmSWlkJBoqyEWenYbZRwuyVEFINO",
		@"JWvXVHiUEZChLlyjHVQaljxprvdLfUYVAXsxUPCEcTKXCuPRVpmgjTJAFVKhsUxXuCJGBKeOtDsDuUKzXzIRWCNsYzEmTqCFnFBuFhOKYxlCmaGkLDgxZFAMCGrAbJGdESDymWuPSBNYCrtRGchLX",
		@"QAdQANOfipBvhiOSfGBPwPhMMJoUGMltrAAhcLnGQEhIrdfSnbaUEyAEZGIAvGfwwzRYrMZCLOoGpvPtuzUScnQKwyrfjhavRglismVNLgsaLeXEyMXIPchNaZiHLSQlAJGszTVLuvs",
		@"EuPMgtHrsVFLnFFOTtAVJIfgBjjtvKyiVzRvWMirEooljMHcCryTaTmjEfqfcWVIIsCAOuWyOKLnoQOCxvGypzzSgdNdPqAtevFauofYwzMMuExZWILDSKdqOlLpaGoSJxOoRAVNONZTVJDyqB",
		@"TMnQfxQwpxurBwaeFtXaPWywpqxzyagOEUrwApyFobCsVgJSfojelXbIDkDCAOAStDfSLXrmytleNFWnCSWeDVMpuqHjiYzrRtVEGJGMvYIbGEsLuhfvdDJBUDPQCSj",
		@"RFtQFFKaXTHgXZkhdLPQHMOFStTxZjFasfRWLYrDQkmUeYSlqbOtzkyFQosciVfXMmqRfETYeLoCYYpdsixvZuyFZQFfmZfkquqFBsOSfhPTY",
		@"cMQTJRTPzlPzmimRdtlAmLsIRaDIDaVIysdQyPtvdnqjdcFbIYhsFkavCUbIhOTGbiOttAmGhBTkZDyuDQfUNVAYXwSTYjtSIUChEoIDIioDCbctu",
	];
	return itaWUREzcYoX;
}

+ (nonnull UIImage *)unAnRxUHque :(nonnull UIImage *)cqXqwfgmmjssDTTP {
	NSData *DJSzLVXGvdkZzea = [@"AeIklNcGlUIQGOifeDiEdPzyiQblPUHccPiEIddsZzqouGcJEfpyavNfISKDAaKgZjQghQxxNWeDSYyjvLqCePGgQUsfyeQuYCVdZGcKiuxkiMKIAfBjPiTYlbKdZYr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *juKEsqSJcYoaOM = [UIImage imageWithData:DJSzLVXGvdkZzea];
	juKEsqSJcYoaOM = [UIImage imageNamed:@"ulzdfjbhGQuTMuoxOmhwyrfVGwvJWAyFfqIptDxWXQQHNlDKVrvlEfIUZWfaVsBIIgQfkVGgfNLFqRfZkqanQAYKPShsVMaogKytCixzSjflLbGSPBcNvNH"];
	return juKEsqSJcYoaOM;
}

+ (nonnull NSData *)cBvxPwAQUXs :(nonnull NSDictionary *)yDhMGXbdPWThybRo {
	NSData *VEznTryUZeeZkKBq = [@"CjaQstkiPIOAfavDbvouLaTpRpuFtqQKSdMDkSRaAbesdOoDOCDoffgEZpRXJzuYSWGNThWKJLrCfkjGMKfibkrFnbhiEACiAXsaVLksfj" dataUsingEncoding:NSUTF8StringEncoding];
	return VEznTryUZeeZkKBq;
}

- (nonnull UIImage *)RFWexbTpCo :(nonnull NSDictionary *)ABlmEoLcreMoehHAmB :(nonnull UIImage *)JiMyeHnQvpTWKsERNSA :(nonnull NSData *)MOiYGaaiGjyuxJp {
	NSData *cNhTvnvYvoyrTgDQ = [@"tEgsvbWpRZJlsTcvTMVPyBpalDFLdScKZLhwzFEUJpRfNxIPwOFXyGPsouVypWCZSNOwKNmAIRYwktAMKvpyblZYBopixjCrQofIJnX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zDVWWpqRnkvgH = [UIImage imageWithData:cNhTvnvYvoyrTgDQ];
	zDVWWpqRnkvgH = [UIImage imageNamed:@"KsBygHxTCkxSbPoNiqrMxWAMHuIoFaKzoUdhErwOvQPDoLHwqmSoARsMmrdYiFQrAynaVnaifbluwPLaQFrnixqRVcdtbcnALLRbSMhbuONnhvYeOlxeplNms"];
	return zDVWWpqRnkvgH;
}

+ (nonnull NSDictionary *)JCsbmmwhmIEa :(nonnull NSData *)SWKKeVzsJtZ {
	NSDictionary *SmRaTsNSVL = @{
		@"jBTVRVxHGroPtTaJC": @"iPkxkKXXEftBbkmuiYBuHiJWTRmQQyLiPCuhFQOBHbudfFNxKCrTQYdqkmjOSTepCePXBKRrbMNfBORqRNVIHSuWkKCdwnGrVnfqcyNJsLvQNpOd",
		@"RlTlipXPFgjnk": @"iFYAoZjYmMMkYiyNdVRXYdwWtaBaofbcuRCARVRifMOGeebxozGrlKfgABQTUfAGmWTKPzFsugskYuQPqkLWZpXHmFIUMJFfmEtbijmjAwxrGk",
		@"GrwfPrIweJPqxhg": @"XafEFFOaoATCXVHcfESRyNGKGnPfoGmSBrPLvIakSEPamZCHmXWXQnBiKNRDYyQQXpuYANSBaQhLukyRtAtraoNanLClICJiesNQHfGjXeDweAOfWEILNFJbwHmQLfMKYz",
		@"rpaqNwOpBeukc": @"LBiUCceZZWJQFXSxxLxQcQfVayJPkZCqDkVREHKpDlquVWVsMtYPIJQuNIWfMQixVigDQTDCIpAfaxWbSyqCwDdwBsBMGuGBcoMEmVicsWxQqElKOJJDSkcRaijTszPlDXpDttMyZoZhyyddaJBO",
		@"fTeZpnftVBvrVriivht": @"khVqJXvuVSJYmeuDMOnGcexTOCUAgOALugusGZYfvmIKSjQRTIrBxYPimMsrRxSfVIMChBbkJpioItDedUXPiUhZjzjHBexssZdMFuWpIZfriPCKXPsOeGEGdkmpYKZrnwoQftgVozNuNLqHKcK",
		@"RaGwDGyHEfMeWF": @"rlQYLHynypaueSZnVoRXjhfjLfJbHKiOnTXgJZbRalzGWyEfOammfmzhrkJJennqQJiGWYUNurGyNdRqgKzWPhBFDHTMVBNkKFzJtvfQdqwIcghglPivz",
		@"XAbOqlcppduitAhKIHx": @"FDYzxTYhREhTDucxWCfFklZYDkpbxcZoiMtwOHqYbWPGhnWlEYztIQGfKVepzIIDXcmcOubimUFsPsnFGfAkaHTWYvmNoFWPLTXXgUlydTjXkdRjjvSFFxedsNUFbTE",
		@"vNkRodiyHaJBBbuUP": @"WfbmZMyxCyayUaeWqrwHZwLEarbIGzKbmmdPxcamyhOqWwdNJwwoFwwZYFVccYgfmXcuDrCWAgtxHaKPFQEzRUvycTdqpnnHyhhP",
		@"VTPzgimstWrGIhQ": @"tNWKPqxyNNapvobQlJsQbVBfJtcrhtGssmkHraeYPoDdaHTMfIDaeWogZTZfqMZKzImYmvpbgRAtpAkFDybJsECCVEijkpWMNbLabMivsabwFsbHNhHgJdwfYwIWoqJfm",
		@"LDBGnDplhDFFjtc": @"bKZtjhJTtBIYakIIavZyyWikvyOmTFkuMtIANahPoHchTxeQfpFWixwyEmuDPtKkscMONIuDIUNFAUsQpRCmRyIxaXBhJUkezenIc",
		@"vQgnRotlqpZIkJX": @"gZfGxIjzHwDGABtscNhAWgcUNwsozQrNmyvXFifZLidwaLRDsWcjNndUwpEIOovZUNyDDZThlEnJSkyTHSGEXyHbDPwoYkNWHjvs",
		@"gFygVHyDvjXXopAU": @"CXkLiALriKSkaWWvGyoPPGfCkTpOyPsnDNOAYpwolzajjprpENZTrHCrJXYnxMefDELpdiFKEqEDJPDhuLSOpHcetPEaUDDkZUzjezXmqHLck",
		@"RFmOmuteBkrW": @"mLgIBooGgCUXEUQJGwkQvwRDCYkNoHyNlivLvkLJGSVIolXDDfDlEaVtcyCjKSJzAGUhbTxegHulGmnJLjElzImQDGdVoZMGKNKpLHN",
		@"ZCMuXUlhrHhiMRG": @"ReWfyJqNHtaQdAtadwayyZFSRXtpoBLSynBCXIrstXRguCZCSgwAnAyVbjgpHfOqZJJxOPRzJOXYxZnbJABDriiXwaRqUDaMfySaZgoPqeRWElnuTsjGefK",
		@"YpBuCceocNYJfZT": @"YXNdaitAlJjxZtjswltaqTsPvwwxgRldOWDwMAQvQEYejhPAYomojMFZUZuEcKOAjHopAOYGoEzCnasXYXhGxrxNOTHxqZEwvLmexDahKHcKKMvVRttfFJDGI",
		@"hDWNWRPEPDK": @"JAdfzzdNkvnozdrrnDuByIYkefPGuzmckorbOxkvFMZIAHcduJtHloXxamAYNAbsczJnNVLnHTPOncDNXdkCNVSsDVTAPbCPKLIaOq",
		@"NhgOXTcQCUgvxbVPMMQ": @"JonEbuEUNnivtRnMRLmKNNOouZmeYsqKfVgUgtfSxIIOiHlCUtAzAPfvfbrnijYolWaTOZmPJzvqyWzncgayuXWotgNwiIooHojONS",
		@"tvXtUbpZcqLLxPQx": @"HefwnYvsWDlLKIdMdAWXMoPbTxmOxXnldRRXaAINggpbACjCHzYaPZcMJfWEHnXsVnNOUqXbmtySQhrIHwicwrVatHgVyuZQIBNyTLlKKLPoCpJfPkYhfAWQvMahyufZZHgfDeIDUxRK",
	};
	return SmRaTsNSVL;
}

+ (nonnull NSData *)pkoHdHZpltY :(nonnull NSString *)WuthEItkDfDApDvBQV :(nonnull NSArray *)vIxXqtBzgdjUWvqgKL :(nonnull NSDictionary *)xLDkHnhiBitfcQoVzhi {
	NSData *LpSkTtjjYIqgFzti = [@"pfpSTpHTDGyLAQNhQbvyjmsBmKJaDWiDcfvechrnbzxUEWxtWmQQRbfORoiPLxUJkkRTKbcGjuXDhZCgnItMxgPLAdNJtBhzjADzcuLWqdrGiwiQsjAGTvspLCStJkcxkitCr" dataUsingEncoding:NSUTF8StringEncoding];
	return LpSkTtjjYIqgFzti;
}

- (nonnull NSData *)TCugaswjHgRZWFtW :(nonnull UIImage *)xXNsDNvXKXZRi :(nonnull NSString *)vivuZctNVO {
	NSData *KPeoIKkIHqyh = [@"gVjBXUWvLVdktTUHucslyXvAnwNjwOyWIhKRQyKvbePCfpmlGoVgjqYtFGhGXXAxQfEQPweEUIWNvIDjrTXmpgUofCyAjOBvcdbgGpAIlcCeHVlJZAkplOonLNc" dataUsingEncoding:NSUTF8StringEncoding];
	return KPeoIKkIHqyh;
}

- (nonnull UIImage *)leSgAPqOpKlAsqJ :(nonnull NSData *)hjuNkwIBtEEbuyfvaRp {
	NSData *cYxHAqWEEInGkcr = [@"QBTwRAtjFhvIGnbPaPNhcyelOxXOhzHZHjSbHuTphNejXHJFEQvPnkPylcIZIMvmYbCGOvXMcPIgjibinHXYzjOoACTRwbrtFIjGZKkLkiFHtpygxKyWas" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CtclfakOIOcCxf = [UIImage imageWithData:cYxHAqWEEInGkcr];
	CtclfakOIOcCxf = [UIImage imageNamed:@"pIPebtzDZWzOLAWNuggpBPMJptIXInGFFlzQMwWmjqjsuDbosNnePJbWnPnhSlAjPiDRifbhEYnCCcOKktNxoaqATyuCCycwvuGpBMVRjWIsPSryherdsYyoApToguXSRulZCbVlTqPvEhQs"];
	return CtclfakOIOcCxf;
}

+ (nonnull NSArray *)EezyseZeDjdg :(nonnull NSDictionary *)aSVyKXSWjSBhiLcieK :(nonnull NSData *)tVRTIBcRyWjUKqvA {
	NSArray *PdRAvOmvKITmz = @[
		@"axPhMfOCdcazVroIvpuIvlIWLXZBdmYXNiLMKeiTJETMuyVbKxiUrLThOPrhBcShNfZLaESLuNHZMWoYpgoafEovLivKLLJiFtdkSedqKVUOLATRWUINvJPzTwEwRBar",
		@"GAyTMIkFYRxxMzGGlvAUWSSXgTYBePrXXcemMTIwDHCidvVsusGiBMLbqwzEvKRvEZAfNDJBNmHEiMVRfzXDCkOVLwoHmKJEqXZkXggQkBNLxDgWgEIxefJWzaRUZAHGuAKgGEzXWS",
		@"PUuqdWtzRIDvdnTwNpsnCVloAaTgWOHHUkhrqHjBrpmVDNCjLxxHMNURPKFyHdgxvSCeChkELPnMOntBDOhmDwTPSLbSlOmWTQIwVIZnHbCKrdIldDnujuGxfgfKmKJxqEUVQllvS",
		@"sppLZrjJjxckINfKCDIyunuGTUKCBeybESJOgrhOpEplaJlGFWyXgzVeYmoERuSIfhXaOBbfbXWZuBWLwwGdADBHTFouMKycPFJzfSMddsaTwFegAkuvVlRzHjrAjwNaHzebaBj",
		@"erceMVKMLlSTpANqPzqiTnSwxnAyPPwqyRLmQVzkstxsHDRrhDrWQCJcXaXPLQOAEVXgbiJWrvlrSMLEPAAZhDzmFQRVWGDdqqdqJLiKcuzKIXTfXsbyGjAXdEssI",
		@"MYLkKiASCUBXIELaloPuIyUzmXRfyIVGOnExLSnCQQUfpeWsySLBZlBrYfqYyJuDytPZxuVqHuYlZquWfyuiqniGICGAotOOyqUKxfmxFzLQuvrMYtSV",
		@"FWgAfiHbSPOzzbIogoTifcUyFIKYqBMGjsAQTWtorJmnYHOpylBJzNSCuCeDBBkbStNYlAbJdRdqYnrzTkEjYyNnVxmpKZUVbJmIlqBcxXuXTlCGUtnWiBKYwWIysuFxrdDGNjaLtGVb",
		@"heKqGqbwcSmGHeJqZCleNlnqiYSusQeiPOMiZyXzptmCikaiKQywmoLOxtnrcXXpcnlCildndlrZWTGCJWSePDcaFpxPMhFijMBMmWTOZwfjZKAVJtBvArCaKgyenNgbMYHWW",
		@"QheAHPWRlMksyDxWkOMkBIBwVOOQbtIdQuLgUXYRkjmGkQlQtSvYFGeYlEHrsVEqlRSdRyupVEkIriYvkdvhjgPeFGAWptuoOeJsYNUfkPtu",
		@"fqBRxMtoprUcuzuNOaPZBrTrQpSdPmUptqqFGTLFGkhjhpNMRgugfpzfHKTUImzMBufVNQNIQKLHtgntsJiOwBKbSyWkNaKbvXwxHwtY",
		@"ViEeCgtuWGYCGqXUDhBhRUnrHFEvLpNPxnttqPmVcHzLbfSzsfejLjvETUMYmaICTrfvNGOvbdMEWthEhDeBqzTcJWRddqlBvSvzbKRLAMkZUeSJWaHimv",
		@"EbVeZYOvXJPteABTrNmXyeBusXuVQDTxkvDnzyEHFTzBQojQVdJdQoZZJaJRdGUhkQTidtOEaaasnKfzDBqLhaHfOyeglscwVxjYApvPDRyqFdmOubUAFQrtdf",
		@"CjYQqtxPFAboCzcjsDseotWgPSdvxuuFhxijBvtJXjkbToAhosirfdVpUheUZYnSchoOCHWUAIPDeoIELssnHXNrhJPikdoccHdocORcujHMlSkGjAlPkZNwZUwp",
		@"KelrodSdPhjWLVJlzXFRRudrJUdyWxoEFdZRXvfFAXlqwHfgsjRnKjojVqYRgosQBsJVDFdlsJcxlUilssTdbzDeRHcIHXHaiINmFNuSFDVAQZPwUWXvzVi",
		@"upenfKiNvDwadanRWCVHhpdpLcNWGteIxjvSGykUqjIUywnArxMIQQKVEeqPZYAjWjAUCYKSRHFsGqyKVNFucFullvgaYIotCEIWzAStNHZSSSefqftfWElOXeDTUrTdZXkmqzSyWYC",
		@"VPZGbGSPXYqsPWMiySYVcgOoOnOMtKSoZjyHdzbffjfjaTlbfWdrfXYpkLaozRdqKXKbFdGfLYrABdCglECkaqtUXtmMUsjbQmkhvPjyXRov",
		@"ihWJZkZilmUaqLUhsLwHUBysgFJJmNKVdeTzRGvuUZQwFWqwUwohcCFWvJHombQwdySbzKJbsUbonlBzETMCikDzybGmXbRCqpFyTunkVZkdnPYTQEUPJEfOgTdYcqFEPeMyokggOlQiSbLR",
		@"PPCOWcKkahLQLekJcEhsIRrugTynVVzJapBgkSoLUAnRrJGSoNbdLhGEkswEvYKtrWORRelezYavGlqcxuSYLEyDyqjJJfQNGTiaIBpbAkyQXHNvveBFuimqT",
	];
	return PdRAvOmvKITmz;
}

+ (nonnull NSString *)tzVYOCVMnnAMpGeX :(nonnull NSDictionary *)pVQyrDkEgUZFPcmGyh :(nonnull NSArray *)VAWQojSkADbPoOiUdn :(nonnull NSString *)zYhssWMbkTMnuAbWauJ {
	NSString *ZoFdbbZcebm = @"kEIteiGgVwLOlIKQJfKogECDYFbqKbFxPgPOfcYIDkdJLvfagJalEcjFmASnkhwtPQidYpSROZcNrUuAPMyQtHuOtpyNJyxfFYiBeUmdhV";
	return ZoFdbbZcebm;
}

- (nonnull NSDictionary *)feyWDvYsxi :(nonnull NSData *)BdlRXSNQXEXVTas {
	NSDictionary *xqbJgqJZIYlyaw = @{
		@"ySiOTRagpnRnrqdJziX": @"rfksdGMsHaEZheLzibPySzXqXePpikSwpgshgazWPlOOlhaXOLHRDPjAmZOWWvxcbAjPTHHvEHOXoOpLrUNZRiYPMBTHhBbslHWQZT",
		@"TNagDzRSuNXoSTfVMV": @"embGNUbEFEIoQLOjUmiAPztPrcTnWvLZrkQaMOJqlCzXPOuYXWguBIMReIULsxyoLEiVhavXMsEmVYvyiuBeehiLiQWaJAKosneMolfEHMAbLOeCkTAAYjugaXuSSiYhjqyWJZKKyVzEnWVz",
		@"uLNVaSyxrUcQb": @"YfBNfGzwnopYgYfFEXGZwxxbsQOhREayQvcdYODBeiBWcTpDOYukgtaHBahAZaKFAZuwqAsivKvRgBqjRrgYJYZlWeCKJCaBGffKNLGPWAGmnZLXTKwuLmZPClgwEeuUhsHWeEPWhHurVSYmjX",
		@"tOMderLoTezKCM": @"IyHrEvbekeDMNMCWZZmbpIAEyjlXYliIvCDyCyiDJvzVfNJcjTrfxeLpxtnFLNGgoNFOxiDXXDhbmmrkGgoqqASaipQThQHFXGtPRFFlNwKkcXqbqvSQeWhlAAMK",
		@"bDGKvoipHRtxPTWqE": @"AgHyTCrpwASoAuWrpHJLTnYxIdWMCXKMmpbUUadFbiWCNLgncNoSKuUoPfDKdPWpbYzSDWKVuEDppyFEPbOSZPZYzbtVBYcXYPYiwXUaQaNMtbpOopyRXOiGFhoRsThGW",
		@"UeyEpeDuLe": @"dlUyqHcRgFCXIDtHskLdZAEpWtKpiZmLalDabavfoMndRUsjNYfBbCUOcpiMqQRCGCEWYUBZnFAZTGEHJcSXpRdkyOYpXBVrvMzBptWExtxeZZiorSANHYhubqpFuguIQoIuABPz",
		@"EAFNrOoyOPeSD": @"kajztRscDIDwIQPwOiAbrWCZnXiIoItqpkvQGgEthydHWMWaAnUPzfJCdqoNhJRrRBoXxrlyaFuwctDSdcQlUUgEEibcMFmnIhCNIdGmxYtGiwDtpLT",
		@"iaTFoVvloO": @"VqKFBXpjhWMJoexkSMmjtuzdEznmbJWropfjnmZgRgGNosTyUPyyoIKvaiVkfyAQHXzimbDEzxStFKkzprSSMlPjmRCgxrdBSAKnRxWpbPVhirKiyUalWQjChsHGinuGg",
		@"YuvGdfBcmhwa": @"yqRaFRgIuYHamOYRszWIpGRpkumFjxxyyUHYmzmStPyHdNZPZEPrwAeVxUZGfbXSjeYcBpmeXFsNmOAbOoiJKipPAlpolGOxZVQEvZdYSMTRuUmVAAzk",
		@"GPcbUpbGkBScjoEa": @"XvGqMGgOCBMxevSnujRbOVNtXBiLPrGUGDtTgEpgdyJVjOTPATiZDXYwkQyUiqKQxwwQAuAcPowWWJcswnNsBBHbrrgNiwjMXuUGiupDHYZgahBSrWNcsdTzvhZIBmjguiqJSJRSn",
		@"MJstETpnoY": @"GFuEedhvigllOOBNYmJaNRAypTKwzbvoJAyaXRqNgyODaqdPjNohJPXsNtCVddvKIarnDphHkWMkLBcPSzbUfRZDBTpvlvwcYtFdQYnka",
		@"SkrGhLQCBkCpSrH": @"lsGbeueHznFLmmKNDjWoKNhlQOGdyAhZUUZuHCENjIBKKbvLtSrArbslxWBLhMntPuQKLAJHrEPlhbhQhzzweRWnwycSffRJIvYumVrskQXUugyszwCeeMdwUPgpopPaC",
		@"fsDLpLiNJor": @"LTBHGqxuiWiywCilOYVgQWiscWoSkLRKagoqgpWervdeqDkOoGmlHzKcwlXUpBGrlCbARlKvwQvyVezYQhBxzkqliPkpirlOSWykakgyWFRPEFYnnLLmqpImSyoWRCCCflTx",
		@"NDVnxSsHYDXjJMUG": @"bAefGTkHmlbkZXtEIWsZtnSciTftMggEnAjjZbKpBqiQyeDKibaMsCgEftfykEOFTGHTkNCNUYDPlFOfPbrrlisHGeSmnxMlPsNnomvMcnUnVIwaDzEhKkkvjTUGczFYVyDGvnCaWFrPK",
		@"rKlmDqxYXPBphavjSiO": @"kHUKTfufIwUioVrqUVoaHnrtPcNKAvBTOQYfTIEORqICuWjhTJngdERdtXfYSENUkFVyisBxAyraZkBAMAPckpRBBmQqelOGmoFtNDsPFHAkDmAkEIkaTCCaHGdtJoYDXXgvLQqvgTxqo",
		@"ATkhjaZmFcKZvaZkZGU": @"TIasbWhzJGZZrSFDJXEYwOgGObuTjIYKIHizEkmOxzDjAIaxrOaXNvFNGHYMsDdbGqEZHlnsVDqvkGQGmiSAuBxBBFJRYNrYsiWlbNCZjsEVWcqCODPPngSMBTVSmzOiWssvQYMZAdE",
		@"xcoewSeEdQXLKdAGXY": @"tgBXhETSsaWhBAFUnojeZAgQaCGTtpXDZyULWJQTfYatIpGnANnOBkpgkizqDUhgqJwzGWWvwURJdXIzfQKInxSLXGWSVPErFrHJYbIFQvIhkLMYbNepCgpuwhwxbbVCwuiPfNxW",
		@"JPfWPhXkZoRK": @"BgVacHDgojvTzffvoCbJcPAxSNZBkkjjRoRvJkoDMhBvXYrUtkxsULKNGEuUTlulLrFrKoupYWvhwsSyrdaStyQrGAYfeganjfjaSdVpmmfRsgFwWLCRNMCddPRmgEjUVY",
		@"buXzjPhxCoahcsbsO": @"WYTDGmgczHBJpMhxpILnHajnVRytikfdNUPZMFKLMefEWPyPFsIOIEwwFHCEKlNMXPrcCdKbnePfRLSIJFviLETdzzcQhSjAkYSKKKLyiEdp",
	};
	return xqbJgqJZIYlyaw;
}

+ (nonnull NSData *)hDLRefPaaTmSQ :(nonnull NSString *)SjDUKUkzYA :(nonnull UIImage *)UZuAIPPWYvHv :(nonnull UIImage *)pOVkTObNNIFTMEx {
	NSData *KUNhGozfwP = [@"SSIVwxjgyNPolxvXdvLAhTtBIHgLyttQdSvBGsCHstKEvTzhdurYLXgfvsvQNngZTnCqoSIaqasQovRTpouoARupFhZBfpebZhWMUVRpcohPQJcVsPJEAVCcrbxEFNxgbvdfiTBIseBHvuHx" dataUsingEncoding:NSUTF8StringEncoding];
	return KUNhGozfwP;
}

- (nonnull NSDictionary *)ERVXxrkxrQmBEwM :(nonnull NSData *)wVYFaOGcpxiQQkhlfNJ {
	NSDictionary *SUHWrmnxbFKAhbpv = @{
		@"eAtXLfuacLUXPFtV": @"QAvgUZowwlBHyiVIiuiPuUcRslpcKyyWVXNisqivIJLFlVYssQSZJluGhBvDQGOjKoFccRNihdyZtUFlwuCJSDVzufFPDmccJrbCdbP",
		@"QgEneFCjjPDwzo": @"XyYlmXMGRoxyCoujQluDvdEWHcBkcsBBXCUgZCEouRaGcInwtDdwphqqKEajsGwheISPFswiVgYgGChlczHSEehsMlzdhIjNJmjZxiErBtFkdsQTNeGmzRTFGMDIOIacxmWAcOWTuoBP",
		@"knLVTczJYyDzqAvpQ": @"XUjsicivgpYrAnwQDMUyASHxCJhGYYBlyWdVKbTWmOupiclXqZTAnhGqUfkZjrkBftBYnqyRMUijQUoXEyyOUdCLcnORvsUGxtmXflvwbRpeAgUFZyObvUZmJrMCxKvXtEuNdKYpgYiDAMJhUJvWK",
		@"rPBSUOaZPYmEYWEYIGN": @"twxqEbDtHADNAaGXHWgdZuAUmaAJdEWCXzPhOCeGrZNqGhuFKTKTFirPkbviiiviqqdtQfRmqNbUofSVSSPMyepzLwUDTPXjZAMnkFCOgInHPRHEAFgUwXpcwAykVvJYiQK",
		@"XYjoxGmDtMWbwym": @"CFfRihqohWOCYOaSzDwLOhQVaJeYSLrkLfRypqMjpuHXRYUznDuWrhPlYFnGakISBLeSztpbvuEvgErpWaLpMxCGhUQuhsXxrzCMYxuVTvfAvJyjCObhuJsFcjglxSijvdpNTdNFlWsuxtizY",
		@"pbZrHYhIBLu": @"mrupjLdMkMQZhosZFxCsQtNtkbAsytltLxDuSPuHvrnUBlvdXTWJMpqXZYrYAdxqTOuZLkaAyXnYnoisCVurFJDMWfagRgZJkSWtSnkihmmvDDBFFtfhbnloLMqpKjGVMnqwugtyKP",
		@"NFFJWRVmJVoLG": @"hBzkelBAfEjmnshNpPkELYhfDHHsruFmkwPHTnFOXWhyxczcNOtWnhMRfHLsDEegaXIpxBhyrTCtSKYytooNlOADkzCRRYreftmIzCFsNtLPMhiahtvpgzhglEclaiVIWVjOStvg",
		@"LxWGjSXYDBj": @"VNsxPwlLgvsQYoVLDwxQWlksyqJvJfGlqbSadbKzTbNCzwdppVuWBMowSUGVLrHIbMXdUAwdOkscVFpPiVtvFNZppVHHbQzuitqdAUWJcuLEKBoUMjuxsclcnmDjiePrsid",
		@"IYbaOMgnlGYjlUoEybY": @"RrfSBWnZGjSRicShEPSbaGLnSxubBmqVifFbkeeDtOWRBMHYdcoiCORiUFhjTGNmgVOUQNgwastTAkOMKUcdvYrJtdRXBFSquhIIvdiwBRtUMqrTz",
		@"RaxTbJjnKkck": @"RLYiVrxwQMlyntlfDznJKktDUeMTqhfGTCvNBtSsycjkGIvODJpBICJnNUtDTlCByvUUJmBRGJjWXQiDypQiiYgcQRCgfOvDNuHISyUSZhBbOyTEdqJyOfiJmTKSZFZE",
		@"ffIwbCNLLt": @"DmKKZjWekSGtsnTtAdEskizFoZRUGMWHijAPfglCOknaCfccNrhSIKmMaqAMRBNKiizhAEzzJtpXDpNBlqJAeUPSBHpjrJKjyFYxtrNPpqOoW",
		@"MZEgqYojopizuz": @"oLLlJIrnLnvHKFeSvsQxxOwEmbLLXYCSojzLthXiooYLzbAfUheBYuWsVHANzbJBbimhccPwoQakQMSNKgufqfHoymIQGPEFYhjmUsTH",
		@"JskwbFVbAvlGhDcBLxb": @"hSegaMydPQvvsefUQngJlXskSPJqWDVAKAaFLXhUdbUFwJvapqLEjiXnqKTeUxxrNBpIsIvxnpsfvpYsrZNbRVHgaFdIpQJhqGndjfsYLlO",
		@"QvZCeeFleLFu": @"dKhsvKPwfXmHfMeRqEqoGZyeqfSilKDxBZIpUxUrtfaqrRUUfAaDOQWojDlhIPuhuSxbvRlsZeqLdQhKCNvoDlvTVRyPfVJqLaLlveVVZlfJDMcqYWUDbdBforTTCLggOYefjD",
		@"MyRxQCzAEoanl": @"BQkKrGcuJMQfOAAbKSOjugBWiqnNfcjNqnMoSEOzNUzpAXmYFyNzMFnZtYMWzFuLBXxRyJvZMFWEWAaNbRDcxvFCJylgAQUSGEjl",
		@"FFFBbqqSRAFTNQcyang": @"doAHStKnFRTlcYxTMZkZlcUaISFUTurxtJCTtrfdgPVgwlNlzajIOkDmymfwqktSKjbfHDdKfbOEEfAOzRXiLKbyFzrgAbkSRIlDfOoFqw",
	};
	return SUHWrmnxbFKAhbpv;
}

- (nonnull UIImage *)zIWZqhDMSbSkFnRWVjh :(nonnull NSDictionary *)NgAUeivryKbNyOvp {
	NSData *gTfoMKYLDJH = [@"UpCCRMgcnjHQkawaTBpYOdHjJCYkmKpueMJbzUThKgVLLIupbhXlFEHlHxlfQgYTgXTagjCksICvELqtVpfLrKGBNfOHWKKVsFnaOFPBVHhWsGsmAPlFvgOlZrViYFhuwKhIcOQWr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ESKkIIDFeA = [UIImage imageWithData:gTfoMKYLDJH];
	ESKkIIDFeA = [UIImage imageNamed:@"ymVbgfYiAzASYratkiMPGruGprKWMawAOdGWPSEjsJrCltbqAMBWqDhobmBMZNxKxyCBpSLsoePuBVPyoCIuEFVcZCsqGfClcHcFpvCAFqTJxNza"];
	return ESKkIIDFeA;
}

- (nonnull NSData *)NRDSjDKgnZNPwYlK :(nonnull NSData *)HZyruMLBuahrwpezad :(nonnull NSDictionary *)qHqNpzpDhszIshRLG :(nonnull NSString *)QruDdzfhxzf {
	NSData *wWqnSlqELOtqIJwZG = [@"yDgnEvKsDtKSHMdSFuPvhURdaZobURbAzMsLxMhfIhcCBSrPPlKEDpNalmaJwpdOOjYakKdEIchPwqmhOIYbzRSQPBUXfxglwpmUbiHiM" dataUsingEncoding:NSUTF8StringEncoding];
	return wWqnSlqELOtqIJwZG;
}

+ (nonnull UIImage *)vOHmdUFMIxxnB :(nonnull NSArray *)PGzIzMqmdNft {
	NSData *itFbILfAfsPGCvici = [@"FopzqMRyLECzNEGUbDptSJRjclrCFRAQvnrVRAFRELCyYNGQvjBHnpyeJlRgbMkCGNFPNbGqsAKGPnYYhAFRudIpZTWjejKMaFdZgrlIHjcuMtPZllHzhfodfwNyEfmMi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *evzmYogdOU = [UIImage imageWithData:itFbILfAfsPGCvici];
	evzmYogdOU = [UIImage imageNamed:@"cMBITluyGyABozWvnKPLddbSPeTMKxVAzcnxIaLUQKPaaVMgvBZEimevquHuzEvaOOKCNlLhLamkXjhaHBVIWRBkXtFvbYvZZbWYDIYrzoDNzkPHassRRNlrikHHTJX"];
	return evzmYogdOU;
}

+ (nonnull NSDictionary *)SaAwxuVfCQV :(nonnull NSData *)ArTSPjdWWRW :(nonnull NSDictionary *)ohWoZvFWgpsp {
	NSDictionary *NzBbXEiZvYVGioNjg = @{
		@"brSlHvHVWaJMQy": @"ugBAYQmQbpmeHulvKPwdYRjCYpCdxhHHoJlnDoyUpBPgsgNMePmHueYSowlsZJeWtCopZHGqAwcaxUXDqVyoJLiCeBWnDBFNnIdBTTQmUvOE",
		@"BIuJBVtJyOOtiU": @"FaJQXsBUXPAErRFTKJfcHQEABXgVEGQBiWfuOrDxjtmhQdaqKTylNgYGBrcbvqIImwKrYFkUqrijMXDsUCePuOjwsaHtBCOJIcDJdJYMMSxYIdnUHFifhnzS",
		@"RatUFwkdbFjPsbZIO": @"ZyrrmTUTfLyMAQVtEktecjSkCpWTTPgPCONclGCfXqelitRfXlHigazBQHPxEKVQtoGAISTQEnzvsIKneOrqOfTGRGaTnpBsEcRUiruoaBuiGdEIrnFyUrWxPJeWcDcqj",
		@"iKVLSPqJWPvgbKW": @"FUKFhIPWmOHKiHZJTIeAEWGlchwJTgQDBfkVLflypytqPHTaJRiVgEqYreXmcghpCUVqbllqoAQsshvnxwEeAARFTbxZpBEzzsvivldMzSJTfANkCJgfxuQYVpJxdDxyaRgYGtqIrVQqhFPCrBKCq",
		@"LumhZgILTDbqtOWJ": @"AbvBoLbcdHqbKnowxRNWMBdQtKlPhNdsmixFBCWQneiTHSxMrlqfcGVWlNfeCHxUezHXOiGoPCBwxTlWMDpKOpGwiGGuyQwHzNFrgJzttraeVHjwWODkYjijAAIVsfDBppLlUqUL",
		@"zPDTZmODLXyKDipUy": @"JcvWEVxKCgBfINhWKsjyPmOQcxVXyQyscFLLFeFsuclokBiECnNSloYNZsukdhAaxtKvtfWrrugWTVlVvsUlQYbcyOwaxtQmewEybjzCUtsBgkCylMyfxIOFl",
		@"llGZlRudsZHoPpCLi": @"KsvTYVZmgeVsBRiqbEsBLnvvArwHtUIqFqSnBSrAjsJMZaQmqdUdnhjKnBUhRnfbJgJaxzIkJywukavOiCrAwuiiFDBrqsOcCmIUlDGYtWsjYbOEnfipgzEOaNWMkTFqdxNlXuVReEcRvQ",
		@"ysOxTJcImhGqycITvW": @"WCoFPfzHFguaMADaGdwoxLVDnIxKqfkxlktocIXOcftktFJixuAzptqORCHxrUNLSciSlRwDqOOdgKgHJNrDXaxVlWGOysGgUnarMSvUUxdReaMQJHKWdxRJTRZLrozRgfYABswaDDKZimxWXcN",
		@"EbFHjZDXPgvsE": @"DhFTGjXRGKZGmiFIHLApwedNilPxdHrxxVbHpelnzQoXxZZqqfYRgJUNOlnWNmjPpxYLFgAwcldoOarOQJshXaKfvpQDMVzBOvAVnCwBa",
		@"jzisQKabFMosUVWgb": @"iXcVierivQYliDBJfpEbNbhCWYGQkLmujoOqRfFnoVaHMqqRTQDVjaViuOtjHUUPHkvqIaLPcMzsvtBKrzICWWWiEKLaHrfjkVyOiiYG",
		@"NlkwUWTGMVgSLkwH": @"ADiZLDereRRkJCtIVDVtouIgocsGlivRsOShTxYHHRXKjPgnCloAOWWAfNNrJNxPXThXhonwjGfchBfEaQppdNoXXTvfTFicCXKtvhRfdpVgOSuMtpJHhUzeyrQyezpIukfl",
		@"hvuLKoBLBzpjCpLV": @"nvfdTiMjIKlTxNaSXgicueNYMeZbfwiDHtggRhjhThBJVpCklgoyCsauvKhtsEVXbbuVxQnAbrQpdvAVDIKfzExtqgShYNqybnkUzovfkGKYYMWJRvovKggyAxXFxpHBPVTFZxcG",
		@"QqhuQQBAgqGvOfLzqmz": @"uxnIZDIwztVWGdOpGCoKvULSPKQrbNsFiZYYpXjjrZRZcIteqGadQXexMbfGsjyadTzayQBuHahDoZIcfIJwxkkzsbfhQiuzxFCROUBQyvnpDIeLQWPpaZNniwHXcHAzq",
		@"rqBFgrZwwpEkzU": @"zRyFizXQEOneLcyMiIMZVqDkqsHXKMrIjOdZwxjymoJlruhGrRUSnoAvtpInzYRmgnfXwjhqwdAywbvKOdDNSXyysMwkPLwBhfqJOEwGvrWadjEUK",
		@"jMqkOXnqzFuoTOnieV": @"hwmkgsmLkfNCAaFjnGHgYGUkNwBdSvkhPEljzJUDcaSLVghSNPKvxnkXZTxbqoKHeqciuVDZyMcFAqGWmSqNwfeVpYMviLKagSzWcaPrvbcTpoiYfc",
		@"movOykofDK": @"werLgpfJoYOzrikqHuvnhUiXxBbPHJbwtRNWAstExjnMYQixDOmdLQktncdpVnhsuShbvhTErKJIJwLVWKHxEhYZhCreMUXhpEGwLCnsSkmvGRWGhnvjgHqDQpDfiXTSmcimgtWccndfgBZ",
		@"ozYkEEjCdJxBYobjHB": @"PvowPQxiWphMYLRWqLsdHecCunXmdxwAbdhwRwWyVNWJPqDxNZYYLsemzMnthJQSBdxmmOUgyrOKDfNzYKsRHkZJHkXVyubRXGZeBCGqhrDuaTRxsSBUCLEQPhOeiNvNVx",
		@"lDYzsNcYbzw": @"rXOyoJhsiiaBUmImvfLrhXKugRSaMMXAElVManbEzuNIuHjIPTZeCvmQkxxQUlPCxWweIfktiLSvQZIVoJTmAlyfkeHaszUWvBqOuquTYagAWlIOj",
		@"uqCXCXaQoAQ": @"gphAduJBVXAqwendeOFvJbEEwqYJLQdNjntSdqJdiXIoJhPmuYLPYqiPpZlECIQlMeVqzhKkFFUsBdEizqAywtmHQkbjKuQqhXyWgamHqPRSNdaIxw",
	};
	return NzBbXEiZvYVGioNjg;
}

+ (nonnull NSData *)fqdPfPkTmJQgmd :(nonnull UIImage *)kqEFbszurGEDSKwyqEw {
	NSData *ICbjJJIwQG = [@"pLRdMDGTgzYasCWQrEMIUGxwuWLSuOSPSHzPrqddVzPYxeagYxXRIuBSquNPgMAYkdqdDMHMPjptkwmgClQjHTiFneBigZolLiguCCvn" dataUsingEncoding:NSUTF8StringEncoding];
	return ICbjJJIwQG;
}

- (nonnull UIImage *)nMdxBmHpXLKlWjCq :(nonnull NSArray *)xVXWBspqQZUuvc :(nonnull NSDictionary *)IerAsZrugDQSXAgZvb {
	NSData *fcdjDuhFSGSjH = [@"XmoDuNuKnuZeBdilFQfBDZSNPijIiRwWBRXqmfzqVPGlwqnoEaERbtWrrlcGyadzZNdXObVzLFjCRAvDGFojKtpMOmBWVkZWtjCKDymjjeQEzbCSTrYYpCtC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wYtXPJnrIQRC = [UIImage imageWithData:fcdjDuhFSGSjH];
	wYtXPJnrIQRC = [UIImage imageNamed:@"zlGomIrFVCyKUwsaeyBokwtGrDKffmxMWpeQlhksGdRxKrlQtZYXrxhOEByaUgHqcqdwwqjBMMZwRxzgbKOCxdaulkNcCBhGxbXiMwJ"];
	return wYtXPJnrIQRC;
}

- (nonnull NSArray *)bkJzRosfNCqGiB :(nonnull NSDictionary *)ktTqxQwmRlevLEV {
	NSArray *enDRVVohPlA = @[
		@"ftQvGVYWNLBteteRbqtrSKMeAtpJlzrmhgNErdBhXBmunoSSUzCIPYThJxZSVikZrceXnAZyYhehMczXgJvUfUuwzniOJEYlFjgbloJcovxjdHUUxYRbwLHyVpwzNsFILBCGN",
		@"NVleJpbCCbYrZcaNUjBrFrxidKoUNzFvhouxnvUQtfexyHUSBqXAgQXyIrHnBtJveVjTXqlAzTwvAIpKRDNbONIDIVLRzbTkrTPluqqfUtBtIEHwTZsEpzpCjoJUTVCVQRo",
		@"ZsbdXUECVQZxKQzFcTIruBbFENEMlEDyyImyHanOqLxTYoWauejoLnJJcQwWuubhdzrIeeWgPXFRuiYSRXupylSZTLFKwgUcLtQMAQDokboBQncumWZfDagEiHMnQkqgXoMMIrozuwPOsZi",
		@"NCcbRFlyjzEIjGfjxTMhWjjvJqALQLVDtijqOqPbdiXnVNwcrfGwVypfwDzGVMEdhDvdxfibWdlrllZQZpRBWTpOGVAaJMDXxCViFwVJjwTDRrSubOHQZIrBrSSfEOx",
		@"CFMLbKgvuPnPqzONaFepDgdhXOuQgZbfbXfrKzDLXTWkFswpHPxObGJuwXnUJuVRhORZHNvaLUuDfimjjybiALEuAzNkiNCtTAgIjcgPBkKMXoYjryTVjMNUXgbU",
		@"RAtaHkEpWOmUTnMWEJsgSfUprvhrxWCdVzzNYzlYjQiUYrauPsLJwaTSlYNTITxNKtWUFSnyGXRHANqjPaDAQfhEIWXbSddKZTrktKKLvluaoKANdJxqfCiGwhBRReARYCQAFbJL",
		@"ETFZbfSQGfwYYAjnXNKHFrootspldEsRKvbWxodEKluIAoySJZrXXswMxMAKyAPIQDACjiiOqxFEqyVuOVQmrBdBsYauHIbROOtQLLCAXPFhlBXkZWwtBHWWOSgwmakwDEXTUlVFrohNPMRPA",
		@"BnAJSRtlBuGrNjOTTMIyqPOpTUqleJefQLDbqLpAxuTQqZFZEUebBKntffgtZewBONAhbOkmcYkVSLlUUMFcmFTRyIemqnCuasEmlvcwMTQtXrhJutBYZ",
		@"cpTqLeqdYjvdsQmKskhNyAXFaiovwydyCmhdEAbpwegTTAGpbntCxiUFaQvGfjXvwwJEQQSXXofxgJtZFjDLWGBcjzHbQkIyDWMkArlTnfCakOcWvOYnfSlUXcrdSeJt",
		@"EVWGBOxxMzUNpnoRXhRVSAFhnbRbqaGljIdCFYMYEWLWfGsQXnuqNYNaFWcfyWKfGXIAnwzZDcAvrJfZLbJjFtWKAYBWYNNTXyibCSgpqGGEgPpPVRjJZqpPIzeZTTzNhwqqsokOVz",
		@"XDGgeERjhYOeaWomidhabzPsJrgqebPEgDzGXCXrGTzYXYKwBpSPGYNlOcQGtcyJWJQIcVRiMXDkpwgWqUYNxemicrOmMYrPcEkGzdXkuklAMTPzOqrOhMGOxLNOmshuKEczbMLIZcaP",
		@"TmCGIGxUBZmtLjWfVsVDBaVRSwkuAUGdYvWxbXOspubpmnHubYfDWXkdWVqwTUTKiwCtkPqaXroeTGMXcUODMFnpUnnPrLQSJScxjYJUaSAsvPtOjfSnoTlO",
		@"sPTFVNLwKgFgEngxduSEmvONQotHojLmAwCeQnsJJrKPRwYjDZolfCfAubEYYbyrZyitNVUrJtjIrqCZgOHFLWKyngWMMpqHLQQevSrkbsjkNkJOnNIStOzIyamtoYTuimsjWcpvHOCoExts",
	];
	return enDRVVohPlA;
}

+ (nonnull NSArray *)TvcZUJaaxevxB :(nonnull NSArray *)NujPNOQKmWlFdzdPPt :(nonnull NSString *)empogkoBlDf :(nonnull NSDictionary *)KybWZlYtdkbHP {
	NSArray *wtEmkoPhsjqtHRxNGJu = @[
		@"BRXxMjRaCRfNKhicjDsLRpCFufuXnwIfGNAwLFpVPvuqSDCtxhsKYnnADbnglaiXuvFXOAGUKCZokuSfCdwkXtnXXvDKQAxIYzSRlNXKziEnFTUnVdJSRlpR",
		@"MXGZrrkwwZmaJYLykNeLHmfvkKpqqVmtoUziAvIFSYwXSoelkAqnjhjaOdMEAMQsEDEyhAKlkiGRiOfNMCOrxdiaRlAGAPUJwlcsxpj",
		@"gDdjHfyKclnypKAtAdBqtqGOpPxmHysOOIKaxDdjTVUyagxJYZXZgCTZkDEjgZLfEEezjLUfkoMAJzaDERBCAbYgpaPBIarDfMCaDAindyiqRakakROrQKRKl",
		@"EPTroySVxaCAUWTKTIDULYHUqKTVXcKwzZvROuNWCjfKAGuYQekbVhQTZIBameMCIqwbDMEomNnOOdrlHDulLSwbRfZuoBgrAAOgP",
		@"VlbtOKyjiokZFuKQuxXRPDNwqwLvBZkxyqXuOwdOEFapQnmCGqAQJhGlJKNNFtqJDsFhpQziaTfLvNjDgpfkLUwuKhrOCVultYeKqmkkIWUzgiWjfkWGplQNJBdyyxlFXYaGAfsHAelBFftpmDEu",
		@"FRuFuOxGljqLtnxloHLKgtZzsbZucyhHloXqqGToZuYJGtTycPhHzVesABMbdotoPBuShtriXGJYOGjJyquZAFKOWHCTBPmwZUqxYFiZTiOiiTKLOOoWJoZYXXhxdiWTBnmEVZgz",
		@"QKvtScOwcNFbbdsczUIXcWwFjRTJxTWuhzpGRdLDgTtcIckIMsnJrzJMJlzLPnKCWWGPkqKrSXePJkoWgtxEMJPlRUDceoHSEGUPFOIKxJhWBpmtFMsnILRpjDLVXyrpyyKAjqlONkXJThKeSaDj",
		@"uQuGDomYiYzrpAqaeIuYnGcjqrnkuEBWrYhiQGMfaoGljgMGYksxXSRYjHWAVNVTCjJNFdCRiHoWUXPnvrgFjtpQXyUbWZrVEyHhZUSqJftzKYtSi",
		@"borKyLGZSuZLsBiTPZzFxdZXZukxCayZGzgyRxsmqRMWhgMlNTZmHcoSwcOzWMVDSYGiUNOJXsASVbWzIurVrKLUCOJVAaMaRFdhwRabUcWXMrgKGMxCrPdBR",
		@"GchAKeTlPaMVjObXnlDftoLnZFdawqJLRtcdyxudjLCdbsMeAOyVlhuHYxaABAYaqGlXERBWbrFlxMdKLErlbieqVBqHTgWvsSsCBAGnUrLCsIZzhDlWtSuLZQXZmTZrsPZxRNP",
		@"HhiyAUGROtIcSHDElamGtMaCvjjkenckHcbGwMeeeSsjeaSriOfiJyNulQHZqEKjxNrRhOxmZKwghGmlrcyFftcrDPXEkTfgWuPNbUw",
		@"vnrwdhnDBpNIHBfxwVzzfDqLcVZmfzpfgbzwXIwoMPuHPhzafONqusdTvJckyyeHtHGSWVJuaMxMBNsrZnzOymVXLUMNwIlQneowAxrKiVFoDJMlcyFKLupsUUQkHfnaoPNHGPARnnwFOkmOjv",
		@"nVePyavTZJpaINxcnXPfsIZVLRtHWpiTMIYSQIXlbCwIHvqOzYDcGZLHngdfFYyRBkvsrnMyGfWmAdWBtZzcMyDECzzWnOhFjTLbAbHCOEuGqpEGNUAENndeAhyFijzcGTayQabYHZwLKmCm",
		@"YEXvHKnXSXRXswAowTtevzIBPDiNMaVSVxNfDsPdVMyObRvkfihEQATSbbQGkvkKfNhAsJLuDxCoiHKlrhqedhGcGhXXhPzntYInmdhJDnwCvJaKCqCSEU",
		@"JbyOOohvrREKMrKbGOCfUwefFTrTYhxnLEeAMcHpsaughWkXVwQRPYsIoxcROkAGDXOFnCWAvQDNooewoQdzlyzhmTIBzQdLTSUURrRvBzhPNWNoPMGmH",
		@"jquAGkUgCjgSEXYjngYPYQSdUSydcieKpTQYHZoKrapGBKZHgyfeOCLUSbxhLlUSuneKmDSPgzTlunUhRMIYEJjmipMPAAvyUBzKWrFmetXl",
		@"rvelDdMvYvYoMhmTIdytGMIauVuZHSpppsbxtfCHjPOwabdurIIpzmgXYrGmIaTOZLzDUGVYXEuMAmNvjtAocrcpAyxBkzEEhxYNdUCOssTjKSbkSgGWwMhzvewteqTEEslNIWyjXlmYMzDUFehx",
		@"TUHmbzgFJxFVSYHwpymPMFfwAeomIysFeLXicFmJFkByIvydTMGCsNNQqUTHUxUqgZzcziXWyjOyhPpHxZdLDuhoGsdoaXAiNQsMjTBquHPEunvWOLDDdKuA",
	];
	return wtEmkoPhsjqtHRxNGJu;
}

- (nonnull NSString *)zHfKZMFPPTP :(nonnull NSData *)cCFDbVmNWiceYgSrBoD {
	NSString *TBTWClsUTkFw = @"IthntcfEMePCNpnyaCxiPSfBZdPpXVMymEjEDcmptlRfLooOujlbvwCtKHQQoxTbvTiUYaymdCBLUrmyarXQvvTaOQUtTfZlklkaqsqEXSnYNkj";
	return TBTWClsUTkFw;
}

-(UITableViewRowAnimation)deleteRowAnimationForSection:(XLFormSectionDescriptor *)formSection
{
    return UITableViewRowAnimationAutomatic;
}

-(UIView *)inputAccessoryViewForRowDescriptor:(XLFormRowDescriptor *)rowDescriptor
{
    if ((self.form.rowNavigationOptions & XLFormRowNavigationOptionEnabled) != XLFormRowNavigationOptionEnabled){
        return nil;
    }
    if ([[[[self class] inlineRowDescriptorTypesForRowDescriptorTypes] allKeys] containsObject:rowDescriptor.rowType]) {
        return nil;
    }
    UITableViewCell<XLFormDescriptorCell> * cell = (UITableViewCell<XLFormDescriptorCell> *)[rowDescriptor cellForFormController:self];
    if (![cell formDescriptorCellCanBecomeFirstResponder]){
        return nil;
    }
    XLFormRowDescriptor * previousRow = [self nextRowDescriptorForRow:rowDescriptor
                                                            withDirection:XLFormRowNavigationDirectionPrevious];
    XLFormRowDescriptor * nextRow     = [self nextRowDescriptorForRow:rowDescriptor
                                                            withDirection:XLFormRowNavigationDirectionNext];
    [self.navigationAccessoryView.previousButton setEnabled:(previousRow != nil)];
    [self.navigationAccessoryView.nextButton setEnabled:(nextRow != nil)];
    return self.navigationAccessoryView;
}

-(void)beginEditing:(XLFormRowDescriptor *)rowDescriptor
{
    [[rowDescriptor cellForFormController:self] highlight];
}

-(void)endEditing:(XLFormRowDescriptor *)rowDescriptor
{
    [[rowDescriptor cellForFormController:self] unhighlight];
}

-(XLFormRowDescriptor *)formRowFormMultivaluedFormSection:(XLFormSectionDescriptor *)formSection
{
    if (formSection.multivaluedRowTemplate){
        return [formSection.multivaluedRowTemplate copy];
    }
    XLFormRowDescriptor * formRowDescriptor = [[formSection.formRows objectAtIndex:0] copy];
    formRowDescriptor.tag = nil;
    return formRowDescriptor;
}

-(void)multivaluedInsertButtonTapped:(XLFormRowDescriptor *)formRow
{
    [self deselectFormRow:formRow];
    XLFormSectionDescriptor * multivaluedFormSection = formRow.sectionDescriptor;
    XLFormRowDescriptor * formRowDescriptor = [self formRowFormMultivaluedFormSection:multivaluedFormSection];
    [multivaluedFormSection addFormRow:formRowDescriptor];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.02 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.tableView.editing = !self.tableView.editing;
        self.tableView.editing = !self.tableView.editing;
    });
    UITableViewCell<XLFormDescriptorCell> * cell = (UITableViewCell<XLFormDescriptorCell> *)[formRowDescriptor cellForFormController:self];
    if ([cell formDescriptorCellCanBecomeFirstResponder]){
        [cell formDescriptorCellBecomeFirstResponder];
    }
}

-(void)ensureRowIsVisible:(XLFormRowDescriptor *)inlineRowDescriptor
{
    XLFormBaseCell * inlineCell = [inlineRowDescriptor cellForFormController:self];
    NSIndexPath * indexOfOutOfWindowCell = [self.form indexPathOfFormRow:inlineRowDescriptor];
    if(!inlineCell.window || (self.tableView.contentOffset.y + self.tableView.frame.size.height <= inlineCell.frame.origin.y + inlineCell.frame.size.height)){
        [self.tableView scrollToRowAtIndexPath:indexOfOutOfWindowCell atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
}

#pragma mark - Methods

-(NSArray *)formValidationErrors
{
    return [self.form localValidationErrors:self];
}

-(void)showFormValidationError:(NSError *)error
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED < 80000
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"XLFormViewController_ValidationErrorTitle", nil)
                                                         message:error.localizedDescription
                                                        delegate:self
                                               cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                               otherButtonTitles:nil];
    [alertView show];
#else
    if ([UIAlertController class]){
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"XLFormViewController_ValidationErrorTitle", nil)
                                                                                  message:error.localizedDescription
                                                                           preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
#ifndef XL_APP_EXTENSIONS
    else{
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"XLFormViewController_ValidationErrorTitle", nil)
                                                             message:error.localizedDescription
                                                            delegate:self
                                                   cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                                   otherButtonTitles:nil];
        [alertView show];
    }
#endif
#endif
}

-(void)performFormSelector:(SEL)selector withObject:(id)sender
{
    UIResponder * responder = [self targetForAction:selector withSender:sender];;
    if (responder) {
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Warc-performSelector-leaks"
        [responder performSelector:selector withObject:sender];
#pragma GCC diagnostic pop
    }
}

#pragma mark - Private

- (void)contentSizeCategoryChanged:(NSNotification *)notification
{
    [self.tableView reloadData];
}

- (void)keyboardWillShow:(NSNotification *)notification
{
    UIView * firstResponderView = [self.tableView findFirstResponder];
    UITableViewCell<XLFormDescriptorCell> * cell = [firstResponderView formDescriptorCell];
    if (cell){
        NSDictionary *keyboardInfo = [notification userInfo];
        _keyboardFrame = [self.tableView.window convertRect:[keyboardInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue] toView:self.tableView.superview];
        CGFloat newBottomInset = self.tableView.frame.origin.y + self.tableView.frame.size.height - _keyboardFrame.origin.y;
        UIEdgeInsets tableContentInset = self.tableView.contentInset;
        UIEdgeInsets tableScrollIndicatorInsets = self.tableView.scrollIndicatorInsets;
        _oldBottomTableContentInset = _oldBottomTableContentInset ?: @(tableContentInset.bottom);
        if (newBottomInset > [_oldBottomTableContentInset floatValue]){
            tableContentInset.bottom = newBottomInset;
            tableScrollIndicatorInsets.bottom = tableContentInset.bottom;
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:[keyboardInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]];
            [UIView setAnimationCurve:[keyboardInfo[UIKeyboardAnimationCurveUserInfoKey] intValue]];
            self.tableView.contentInset = tableContentInset;
            self.tableView.scrollIndicatorInsets = tableScrollIndicatorInsets;
            NSIndexPath *selectedRow = [self.tableView indexPathForCell:cell];
            [self.tableView scrollToRowAtIndexPath:selectedRow atScrollPosition:UITableViewScrollPositionNone animated:NO];
            [UIView commitAnimations];
        }
    }
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    UIView * firstResponderView = [self.tableView findFirstResponder];
    UITableViewCell<XLFormDescriptorCell> * cell = [firstResponderView formDescriptorCell];
    if (cell){
        _keyboardFrame = CGRectZero;
        NSDictionary *keyboardInfo = [notification userInfo];
        UIEdgeInsets tableContentInset = self.tableView.contentInset;
        UIEdgeInsets tableScrollIndicatorInsets = self.tableView.scrollIndicatorInsets;
        tableContentInset.bottom = [_oldBottomTableContentInset floatValue];
        tableScrollIndicatorInsets.bottom = tableContentInset.bottom;
        _oldBottomTableContentInset = nil;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:[keyboardInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]];
        [UIView setAnimationCurve:[keyboardInfo[UIKeyboardAnimationCurveUserInfoKey] intValue]];
        self.tableView.contentInset = tableContentInset;
        self.tableView.scrollIndicatorInsets = tableScrollIndicatorInsets;
        [UIView commitAnimations];
    }
}

#pragma mark - Helpers

-(void)deselectFormRow:(XLFormRowDescriptor *)formRow
{
    NSIndexPath * indexPath = [self.form indexPathOfFormRow:formRow];
    if (indexPath){
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

-(void)reloadFormRow:(XLFormRowDescriptor *)formRow
{
    NSIndexPath * indexPath = [self.form indexPathOfFormRow:formRow];
    if (indexPath){
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
}

-(XLFormBaseCell *)updateFormRow:(XLFormRowDescriptor *)formRow
{
    XLFormBaseCell * cell = [formRow cellForFormController:self];
    [self configureCell:cell];
    [cell setNeedsUpdateConstraints];
    [cell setNeedsLayout];
    return cell;
}

-(void)configureCell:(XLFormBaseCell*) cell
{
    [cell update];
    [cell.rowDescriptor.cellConfig enumerateKeysAndObjectsUsingBlock:^(NSString *keyPath, id value, BOOL * __unused stop) {
        [cell setValue:(value == [NSNull null]) ? nil : value forKeyPath:keyPath];
    }];
    if (cell.rowDescriptor.isDisabled){
        [cell.rowDescriptor.cellConfigIfDisabled enumerateKeysAndObjectsUsingBlock:^(NSString *keyPath, id value, BOOL * __unused stop) {
            [cell setValue:(value == [NSNull null]) ? nil : value forKeyPath:keyPath];
        }];
    }
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.form.formSections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section >= self.form.formSections.count){
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"" userInfo:nil];
    }
    return [[[self.form.formSections objectAtIndex:section] formRows] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLFormRowDescriptor * rowDescriptor = [self.form formRowAtIndex:indexPath];
    [self updateFormRow:rowDescriptor];
    return [rowDescriptor cellForFormController:self];
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLFormRowDescriptor *rowDescriptor = [self.form formRowAtIndex:indexPath];
    if (rowDescriptor.isDisabled || !rowDescriptor.sectionDescriptor.isMultivaluedSection){
        return NO;
    }
    XLFormBaseCell * baseCell = [rowDescriptor cellForFormController:self];
    if ([baseCell conformsToProtocol:@protocol(XLFormInlineRowDescriptorCell)] && ((id<XLFormInlineRowDescriptorCell>)baseCell).inlineRowDescriptor){
        return NO;
    }
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    XLFormRowDescriptor *rowDescriptor = [self.form formRowAtIndex:indexPath];
    XLFormSectionDescriptor * section = rowDescriptor.sectionDescriptor;
    if (section.sectionOptions & XLFormSectionOptionCanReorder && section.formRows.count > 1) {
        if (section.sectionInsertMode == XLFormSectionInsertModeButton && section.sectionOptions & XLFormSectionOptionCanInsert){
            if (section.formRows.count <= 2 || rowDescriptor == section.multivaluedAddButton){
                return NO;
            }
        }
        XLFormBaseCell * baseCell = [rowDescriptor cellForFormController:self];
        return !([baseCell conformsToProtocol:@protocol(XLFormInlineRowDescriptorCell)] && ((id<XLFormInlineRowDescriptorCell>)baseCell).inlineRowDescriptor);
    }
    return NO;
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    XLFormRowDescriptor * row = [self.form formRowAtIndex:sourceIndexPath];
    XLFormSectionDescriptor * section = row.sectionDescriptor;
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Warc-performSelector-leaks"
    [section performSelector:NSSelectorFromString(@"moveRowAtIndexPath:toIndexPath:") withObject:sourceIndexPath withObject:destinationIndexPath];
#pragma GCC diagnostic pop
    // update the accessory view
    [self inputAccessoryViewForRowDescriptor:row];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.tableView.editing = !self.tableView.editing;
        self.tableView.editing = !self.tableView.editing;
    });

}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        XLFormRowDescriptor * multivaluedFormRow = [self.form formRowAtIndex:indexPath];
        // end editing
        UIView * firstResponder = [[multivaluedFormRow cellForFormController:self] findFirstResponder];
        if (firstResponder){
                [self.tableView endEditing:YES];
        }
        [multivaluedFormRow.sectionDescriptor removeFormRowAtIndex:indexPath.row];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.02 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.tableView.editing = !self.tableView.editing;
            self.tableView.editing = !self.tableView.editing;
        });
        if (firstResponder){
            UITableViewCell<XLFormDescriptorCell> * firstResponderCell = [firstResponder formDescriptorCell];
            XLFormRowDescriptor * rowDescriptor = firstResponderCell.rowDescriptor;
            [self inputAccessoryViewForRowDescriptor:rowDescriptor];
        }
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert){

        XLFormSectionDescriptor * multivaluedFormSection = [self.form formSectionAtIndex:indexPath.section];
        if (multivaluedFormSection.sectionInsertMode == XLFormSectionInsertModeButton && multivaluedFormSection.sectionOptions & XLFormSectionOptionCanInsert){
            [self multivaluedInsertButtonTapped:multivaluedFormSection.multivaluedAddButton];
        }
        else{
            XLFormRowDescriptor * formRowDescriptor = [self formRowFormMultivaluedFormSection:multivaluedFormSection];
            [multivaluedFormSection addFormRow:formRowDescriptor];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.02 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.tableView.editing = !self.tableView.editing;
                self.tableView.editing = !self.tableView.editing;
            });
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
            UITableViewCell<XLFormDescriptorCell> * cell = (UITableViewCell<XLFormDescriptorCell> *)[formRowDescriptor cellForFormController:self];
            if ([cell formDescriptorCellCanBecomeFirstResponder]){
                [cell formDescriptorCellBecomeFirstResponder];
            }
        }
    }
}

#pragma mark - UITableViewDelegate

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[self.form.formSections objectAtIndex:section] title];
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [[self.form.formSections objectAtIndex:section] footerTitle];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLFormRowDescriptor *rowDescriptor = [self.form formRowAtIndex:indexPath];
    [rowDescriptor cellForFormController:self];
    CGFloat height = rowDescriptor.height;
    if (height != XLFormUnspecifiedCellHeight){
        return height;
    }
    return self.tableView.rowHeight;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLFormRowDescriptor *rowDescriptor = [self.form formRowAtIndex:indexPath];
    [rowDescriptor cellForFormController:self];
    CGFloat height = rowDescriptor.height;
    if (height != XLFormUnspecifiedCellHeight){
        return height;
    }
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")){
        return self.tableView.estimatedRowHeight;
    }
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLFormRowDescriptor * row = [self.form formRowAtIndex:indexPath];
    if (row.isDisabled) {
        return;
    }
    UITableViewCell<XLFormDescriptorCell> * cell = (UITableViewCell<XLFormDescriptorCell> *)[row cellForFormController:self];
    if (!([cell formDescriptorCellCanBecomeFirstResponder] && [cell formDescriptorCellBecomeFirstResponder])){
        [self.tableView endEditing:YES];
    }
    [self didSelectFormRow:row];
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLFormRowDescriptor * row = [self.form formRowAtIndex:indexPath];
    XLFormSectionDescriptor * section = row.sectionDescriptor;
    if (section.sectionOptions & XLFormSectionOptionCanInsert){
        if (section.formRows.count == indexPath.row + 2){
            if ([[XLFormViewController inlineRowDescriptorTypesForRowDescriptorTypes].allKeys containsObject:row.rowType]){
                UITableViewCell<XLFormDescriptorCell> * cell = [row cellForFormController:self];
                UIView * firstResponder = [cell findFirstResponder];
                if (firstResponder){
                    return UITableViewCellEditingStyleInsert;
                }
            }
        }
        else if (section.formRows.count == (indexPath.row + 1)){
            return UITableViewCellEditingStyleInsert;
        }
    }
    if (section.sectionOptions & XLFormSectionOptionCanDelete){
        return UITableViewCellEditingStyleDelete;
    }
    return UITableViewCellEditingStyleNone;
}


- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath
       toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if (sourceIndexPath.section != proposedDestinationIndexPath.section) {
        return sourceIndexPath;
    }
    XLFormSectionDescriptor * sectionDescriptor = [self.form formSectionAtIndex:sourceIndexPath.section];
    XLFormRowDescriptor * proposedDestination = [sectionDescriptor.formRows objectAtIndex:proposedDestinationIndexPath.row];
    XLFormBaseCell * proposedDestinationCell = [proposedDestination cellForFormController:self];
    if (([proposedDestinationCell conformsToProtocol:@protocol(XLFormInlineRowDescriptorCell)] && ((id<XLFormInlineRowDescriptorCell>)proposedDestinationCell).inlineRowDescriptor) || ([[XLFormViewController inlineRowDescriptorTypesForRowDescriptorTypes].allKeys containsObject:proposedDestinationCell.rowDescriptor.rowType] && [[proposedDestinationCell findFirstResponder] formDescriptorCell] == proposedDestinationCell)) {
        if (sourceIndexPath.row < proposedDestinationIndexPath.row){
            return [NSIndexPath indexPathForRow:proposedDestinationIndexPath.row + 1 inSection:sourceIndexPath.section];
        }
        else{
            return [NSIndexPath indexPathForRow:proposedDestinationIndexPath.row - 1 inSection:sourceIndexPath.section];
        }
    }

    if ((sectionDescriptor.sectionInsertMode == XLFormSectionInsertModeButton && sectionDescriptor.sectionOptions & XLFormSectionOptionCanInsert)){
        if (proposedDestinationIndexPath.row == sectionDescriptor.formRows.count - 1){
            return [NSIndexPath indexPathForRow:(sectionDescriptor.formRows.count - 2) inSection:sourceIndexPath.section];
        }
    }
    return proposedDestinationIndexPath;
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCellEditingStyle editingStyle = [self tableView:tableView editingStyleForRowAtIndexPath:indexPath];
    if (editingStyle == UITableViewCellEditingStyleNone){
        return NO;
    }
    return YES;
}

- (void)tableView:(UITableView *)tableView willBeginReorderingRowAtIndexPath:(NSIndexPath *)indexPath
{
    // end editing if inline cell is first responder
    UITableViewCell<XLFormDescriptorCell> * cell = [[self.tableView findFirstResponder] formDescriptorCell];
    if ([[self.form indexPathOfFormRow:cell.rowDescriptor] isEqual:indexPath]){
        if ([[XLFormViewController inlineRowDescriptorTypesForRowDescriptorTypes].allKeys containsObject:cell.rowDescriptor.rowType]){
            [self.tableView endEditing:YES];
        }
    }
}

#pragma mark - UITextFieldDelegate


- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // called when 'return' key pressed. return NO to ignore.
    UITableViewCell<XLFormDescriptorCell> * cell = [textField formDescriptorCell];
    XLFormRowDescriptor * currentRow = cell.rowDescriptor;
    XLFormRowDescriptor * nextRow = [self nextRowDescriptorForRow:currentRow
                                                    withDirection:XLFormRowNavigationDirectionNext];
    if (nextRow){
        UITableViewCell<XLFormDescriptorCell> * nextCell = (UITableViewCell<XLFormDescriptorCell> *)[nextRow cellForFormController:self];
        if ([nextCell formDescriptorCellCanBecomeFirstResponder]){
            [nextCell formDescriptorCellBecomeFirstResponder];
            return YES;
        }
    }
    [self.tableView endEditing:YES];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    UITableViewCell<XLFormDescriptorCell>* cell = textField.formDescriptorCell;
    XLFormRowDescriptor * nextRow     = [self nextRowDescriptorForRow:textField.formDescriptorCell.rowDescriptor
                                                        withDirection:XLFormRowNavigationDirectionNext];
    
    
    if ([cell conformsToProtocol:@protocol(XLFormReturnKeyProtocol)]) {
        textField.returnKeyType = nextRow ? ((id<XLFormReturnKeyProtocol>)cell).nextReturnKeyType : ((id<XLFormReturnKeyProtocol>)cell).returnKeyType;
    }
    else {
        textField.returnKeyType = nextRow ? UIReturnKeyNext : UIReturnKeyDefault;
    }
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
}

#pragma mark - UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return YES;
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
	return YES;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //dismiss keyboard
    if (NO == self.form.endEditingTableViewOnScroll) {
        return;
    }

    UIView * firstResponder = [self.tableView findFirstResponder];
    if ([firstResponder conformsToProtocol:@protocol(XLFormDescriptorCell)]){
        id<XLFormDescriptorCell> cell = (id<XLFormDescriptorCell>)firstResponder;
        if ([[XLFormViewController inlineRowDescriptorTypesForRowDescriptorTypes].allKeys containsObject:cell.rowDescriptor.rowType]){
            return;
        }
    }
    [self.tableView endEditing:YES];
}


#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[XLFormRowDescriptor class]]){
        UIViewController * destinationViewController = segue.destinationViewController;
        XLFormRowDescriptor * rowDescriptor = (XLFormRowDescriptor *)sender;
        if (rowDescriptor.rowType == XLFormRowDescriptorTypeSelectorPush || rowDescriptor.rowType == XLFormRowDescriptorTypeSelectorPopover){
            NSAssert([destinationViewController conformsToProtocol:@protocol(XLFormRowDescriptorViewController)], @"Segue destinationViewController must conform to XLFormRowDescriptorViewController protocol");
            UIViewController<XLFormRowDescriptorViewController> * rowDescriptorViewController = (UIViewController<XLFormRowDescriptorViewController> *)destinationViewController;
            rowDescriptorViewController.rowDescriptor = rowDescriptor;
        }
        else if ([destinationViewController conformsToProtocol:@protocol(XLFormRowDescriptorViewController)]){
            UIViewController<XLFormRowDescriptorViewController> * rowDescriptorViewController = (UIViewController<XLFormRowDescriptorViewController> *)destinationViewController;
            rowDescriptorViewController.rowDescriptor = rowDescriptor;
        }
    }
}

#pragma mark - Navigation Between Fields


-(void)rowNavigationAction:(UIBarButtonItem *)sender
{
    [self navigateToDirection:(sender == self.navigationAccessoryView.nextButton ? XLFormRowNavigationDirectionNext : XLFormRowNavigationDirectionPrevious)];
}

-(void)rowNavigationDone:(UIBarButtonItem *)sender
{
    [self.tableView endEditing:YES];
}

-(void)navigateToDirection:(XLFormRowNavigationDirection)direction
{
    UIView * firstResponder = [self.tableView findFirstResponder];
    UITableViewCell<XLFormDescriptorCell> * currentCell = [firstResponder formDescriptorCell];
    NSIndexPath * currentIndexPath = [self.tableView indexPathForCell:currentCell];
    XLFormRowDescriptor * currentRow = [self.form formRowAtIndex:currentIndexPath];
    XLFormRowDescriptor * nextRow = [self nextRowDescriptorForRow:currentRow withDirection:direction];
    if (nextRow) {
        UITableViewCell<XLFormDescriptorCell> * cell = (UITableViewCell<XLFormDescriptorCell> *)[nextRow cellForFormController:self];
        if ([cell formDescriptorCellCanBecomeFirstResponder]){
            NSIndexPath * indexPath = [self.form indexPathOfFormRow:nextRow];
            [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:NO];
            [cell formDescriptorCellBecomeFirstResponder];
        }
    }
}

-(XLFormRowDescriptor *)nextRowDescriptorForRow:(XLFormRowDescriptor*)currentRow withDirection:(XLFormRowNavigationDirection)direction
{
    if (!currentRow || (self.form.rowNavigationOptions & XLFormRowNavigationOptionEnabled) != XLFormRowNavigationOptionEnabled) {
        return nil;
    }
    XLFormRowDescriptor * nextRow = (direction == XLFormRowNavigationDirectionNext) ? [self.form nextRowDescriptorForRow:currentRow] : [self.form previousRowDescriptorForRow:currentRow];
    if (!nextRow) {
        return nil;
    }
    if ([[nextRow cellForFormController:self] conformsToProtocol:@protocol(XLFormInlineRowDescriptorCell)]) {
        id<XLFormInlineRowDescriptorCell> inlineCell = (id<XLFormInlineRowDescriptorCell>)[nextRow cellForFormController:self];
        if (inlineCell.inlineRowDescriptor){
            return [self nextRowDescriptorForRow:nextRow withDirection:direction];
        }
    }
    XLFormRowNavigationOptions rowNavigationOptions = self.form.rowNavigationOptions;
    if (nextRow.isDisabled && ((rowNavigationOptions & XLFormRowNavigationOptionStopDisableRow) == XLFormRowNavigationOptionStopDisableRow)){
        return nil;
    }
    if (!nextRow.isDisabled && ((rowNavigationOptions & XLFormRowNavigationOptionStopInlineRow) == XLFormRowNavigationOptionStopInlineRow) && [[[XLFormViewController inlineRowDescriptorTypesForRowDescriptorTypes] allKeys] containsObject:nextRow.rowType]){
        return nil;
    }
    UITableViewCell<XLFormDescriptorCell> * cell = (UITableViewCell<XLFormDescriptorCell> *)[nextRow cellForFormController:self];
    if (!nextRow.isDisabled && ((rowNavigationOptions & XLFormRowNavigationOptionSkipCanNotBecomeFirstResponderRow) != XLFormRowNavigationOptionSkipCanNotBecomeFirstResponderRow) && (![cell formDescriptorCellCanBecomeFirstResponder])){
        return nil;
    }
    if (!nextRow.isDisabled && [cell formDescriptorCellCanBecomeFirstResponder]){
        return nextRow;
    }
    return [self nextRowDescriptorForRow:nextRow withDirection:direction];
}

#pragma mark - properties

-(void)setForm:(XLFormDescriptor *)form
{
    _form.delegate = nil;
    [self.tableView endEditing:YES];
    _form = form;
    _form.delegate = self;
    [_form forceEvaluate];
    if ([self isViewLoaded]){
        [self.tableView reloadData];
    }
}

-(XLFormDescriptor *)form
{
    return _form;
}

-(XLFormRowNavigationAccessoryView *)navigationAccessoryView
{
    if (_navigationAccessoryView) return _navigationAccessoryView;
    _navigationAccessoryView = [XLFormRowNavigationAccessoryView new];
    _navigationAccessoryView.previousButton.target = self;
    _navigationAccessoryView.previousButton.action = @selector(rowNavigationAction:);
    _navigationAccessoryView.nextButton.target = self;
    _navigationAccessoryView.nextButton.action = @selector(rowNavigationAction:);
    _navigationAccessoryView.doneButton.target = self;
    _navigationAccessoryView.doneButton.action = @selector(rowNavigationDone:);
    _navigationAccessoryView.tintColor = self.view.tintColor;
    return _navigationAccessoryView;
}

@end

