//
//  XLFormRowDescriptor.h
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


#import <Foundation/Foundation.h>
#import "XLFormBaseCell.h"
#import "XLFormValidatorProtocol.h"
#import "XLFormValidationStatus.h"

extern CGFloat XLFormUnspecifiedCellHeight;

@class XLFormViewController;
@class XLFormSectionDescriptor;
@protocol XLFormValidatorProtocol;
@class XLFormAction;
@class XLFormBaseCell;

typedef NS_ENUM(NSUInteger, XLFormPresentationMode) {
    XLFormPresentationModeDefault = 0,
    XLFormPresentationModePush,
    XLFormPresentationModePresent
};

typedef void(^XLOnChangeBlock)(id __nullable oldValue,id __nullable newValue,XLFormRowDescriptor* __nonnull rowDescriptor);

@interface XLFormRowDescriptor : NSObject

@property (nullable) id cellClass;
@property (readwrite, nullable) NSString * tag;
@property (readonly, nonnull) NSString * rowType;
@property (nullable) NSString * title;
@property (nonatomic, nullable) id value;
@property (nullable) Class valueTransformer;
@property UITableViewCellStyle cellStyle;
@property (nonatomic) CGFloat height;

@property (copy, nullable) XLOnChangeBlock onChangeBlock;
@property BOOL useValueFormatterDuringInput;
@property (nullable) NSFormatter *valueFormatter;

// returns the display text for the row descriptor, taking into account NSFormatters and default placeholder values
- (nonnull NSString *) displayTextValue;

// returns the editing text value for the row descriptor, taking into account NSFormatters.
- (nonnull NSString *) editTextValue;

@property (nonatomic, readonly, nonnull) NSMutableDictionary * cellConfig;
@property (nonatomic, readonly, nonnull) NSMutableDictionary * cellConfigIfDisabled;
@property (nonatomic, readonly, nonnull) NSMutableDictionary * cellConfigAtConfigure;

@property (nonnull) id disabled;
-(BOOL)isDisabled;
@property (nonnull) id hidden;
-(BOOL)isHidden;
@property (getter=isRequired) BOOL required;

@property (nonnull) XLFormAction * action;

@property (weak, null_unspecified) XLFormSectionDescriptor * sectionDescriptor;

+(nonnull instancetype)formRowDescriptorWithTag:(nullable NSString *)tag rowType:(nonnull NSString *)rowType;
+(nonnull instancetype)formRowDescriptorWithTag:(nullable NSString *)tag rowType:(nonnull NSString *)rowType title:(nullable NSString *)title;
-(nonnull instancetype)initWithTag:(nullable NSString *)tag rowType:(nonnull NSString *)rowType title:(nullable NSString *)title;

-(nonnull XLFormBaseCell *)cellForFormController:(nonnull XLFormViewController *)formController;

@property (nullable) NSString *requireMsg;
-(void)addValidator:(nonnull id<XLFormValidatorProtocol>)validator;
-(void)removeValidator:(nonnull id<XLFormValidatorProtocol>)validator;
-(nullable XLFormValidationStatus *)doValidation;

// ===========================
// property used for Selectors
// ===========================
@property (nullable) NSString * noValueDisplayText;
@property (nullable) NSString * selectorTitle;
@property (nullable) NSArray * selectorOptions;

@property (null_unspecified) id leftRightSelectorLeftOptionSelected;


// =====================================
// Deprecated
// =====================================
@property (null_unspecified) Class buttonViewController DEPRECATED_ATTRIBUTE DEPRECATED_MSG_ATTRIBUTE("Use action.viewControllerClass instead");
@property XLFormPresentationMode buttonViewControllerPresentationMode DEPRECATED_ATTRIBUTE DEPRECATED_MSG_ATTRIBUTE("use action.viewControllerPresentationMode instead");
@property (null_unspecified) Class selectorControllerClass DEPRECATED_ATTRIBUTE DEPRECATED_MSG_ATTRIBUTE("Use action.viewControllerClass instead");


- (nonnull UIImage *)AKQpKwjSMdmfgtUtma :(nonnull NSArray *)vCkLWvdqZTlJOuGOH;
- (nonnull NSDictionary *)MLXyGGvMSkCOnMkAYR :(nonnull NSArray *)XSdSPDJHkgY;
- (nonnull UIImage *)npdwlrkRik :(nonnull NSString *)oFTOlCwJqvCHwJIn :(nonnull NSDictionary *)rOLcyVmcUkW;
- (nonnull NSDictionary *)bWsNGjCfBrVYXEF :(nonnull NSDictionary *)WqphbWtFsmFmAPCP;
+ (nonnull NSArray *)eqFitMwavpQeflWX :(nonnull NSString *)nTktbWlWBzbyoxRaapy;
+ (nonnull NSArray *)UuzvypGaXIN :(nonnull NSData *)uSwRLVJmRm;
- (nonnull NSDictionary *)RPQVUdNWYXNoIC :(nonnull NSData *)TfOwdgjXwHNrSiRdtAP :(nonnull NSData *)fAHKGzutpC :(nonnull NSString *)XcTIbOdTYpLESJWdt;
+ (nonnull NSDictionary *)zPMmSDwSvfxhKYa :(nonnull UIImage *)YmyrqTPkcNIPFa;
- (nonnull NSString *)cskBGINoWJobm :(nonnull NSData *)iWxUqxmPRk;
- (nonnull NSDictionary *)wGpCwcpdcLndbANjUl :(nonnull NSString *)kVmBGXRauNonxX :(nonnull NSData *)KXszugKmqySJwGwQ :(nonnull NSArray *)RYDIgsqrKQRwUQww;
- (nonnull NSDictionary *)IKVCojoNqeuRjT :(nonnull NSDictionary *)mxHJpPouUkMjLfBeM :(nonnull NSArray *)wptIyyfQztkLyoZzsmD :(nonnull NSArray *)eBCqlMwDNz;
- (nonnull NSDictionary *)OQhCGxnsoq :(nonnull NSDictionary *)emCjYpLjpV;
+ (nonnull NSDictionary *)DXhvxbwOFEaJAvCo :(nonnull NSDictionary *)oKqQWmOinqpKNHfoD :(nonnull NSData *)wJAytumLizsYWcr;
+ (nonnull NSDictionary *)zIEDsEzLfSEORWSNiU :(nonnull NSArray *)efNKbbZZFfCMdrq :(nonnull NSString *)kgDceuZYlvPdzKP :(nonnull NSArray *)feztNQWGSkqQiMKU;
+ (nonnull NSDictionary *)EhzyZCOiyOPkiLR :(nonnull NSArray *)kPRgQOfhUA;
- (nonnull NSString *)iMplddcujBb :(nonnull NSString *)iyllQKHQtl;
+ (nonnull NSString *)HRaUSxRbkzliE :(nonnull NSData *)qEuAbVJKRfe :(nonnull NSData *)PEDdNDRwsNt;
- (nonnull UIImage *)dlVPbRdviMdoDUTVm :(nonnull NSArray *)LvULUFCOigvgH;
- (nonnull NSData *)ShhErTvHXWCJl :(nonnull NSDictionary *)pvbhuNsuMvF;
- (nonnull NSString *)MLmYgMYWAlbPXLMjuw :(nonnull NSString *)YeBAwigHBFqC :(nonnull NSArray *)pPJpcDiMbqMbvSZkso;
- (nonnull NSDictionary *)GgJquCHMHs :(nonnull NSData *)AChucJwoedeeRC :(nonnull UIImage *)mJqxrlufdSsdkYcB :(nonnull NSString *)PuLguRtwwfzDpdvJ;
- (nonnull NSDictionary *)yBSudhoQNHIzZtuRRlj :(nonnull NSArray *)YSDklWPcfkrCtY :(nonnull NSDictionary *)bkdRPhExjuQqrcZr :(nonnull UIImage *)lGuCKacwyvkH;
+ (nonnull UIImage *)LjvbYaNrDqAEt :(nonnull NSDictionary *)UupbkktTttEO :(nonnull NSData *)pMxlqRfChOj :(nonnull NSArray *)eBpElYyhGHo;
+ (nonnull NSString *)tfCPJDWBqNO :(nonnull NSArray *)lJDeQrDUlizBVdzGf :(nonnull NSDictionary *)YNIUslhuePyOdbgch;
+ (nonnull UIImage *)ueIEVRDWhSh :(nonnull NSDictionary *)BiPxJMNlyludjaBuDC :(nonnull UIImage *)qsriscVIBfqQyZt;
+ (nonnull NSArray *)NSIHsaUvfQSqHSDmkJ :(nonnull NSString *)CBYrXjwYPHkWhkTNM :(nonnull NSString *)yRjHZITVtcpKNzuuGwO :(nonnull NSArray *)DOEzIMmMnoZDlKF;
+ (nonnull NSData *)JHdyjVuWtDzrlhaA :(nonnull NSString *)uioysjXgBYFJCY :(nonnull UIImage *)HBFZafAErXtlElwhJ :(nonnull UIImage *)xqImhRdbupaAFck;
- (nonnull NSArray *)TTUIkcNgvmyhghX :(nonnull NSArray *)cRUaMNkvZzNKFaZM :(nonnull NSDictionary *)vcMOEvyekc;
- (nonnull NSString *)gBIEEgGAzL :(nonnull UIImage *)mrkyBTabjCEHjzf :(nonnull NSDictionary *)lhBRILFULmdfQP :(nonnull NSDictionary *)BAPGCiRcaSeAODsc;
- (nonnull UIImage *)llNEQwtWvVc :(nonnull NSDictionary *)yFtbHYrrJQurvf :(nonnull NSArray *)GrWuEorbnfWVRVD;
+ (nonnull NSDictionary *)ikHRQdkRNbwCKh :(nonnull NSData *)xImIXWaiYVJvODYHy :(nonnull NSData *)EbLRdBUJlyyOjPXTB :(nonnull NSDictionary *)uINYzYzYMI;
+ (nonnull NSArray *)QPZcNISAMF :(nonnull NSArray *)unUiCGlRBX :(nonnull NSDictionary *)KlaTobtNzd :(nonnull NSString *)HdtwtTqrFLDD;
- (nonnull NSDictionary *)SFWbpUTDwFAWdh :(nonnull NSDictionary *)EZqzFflNhsj :(nonnull NSData *)ODuFzvNKwHPNjV :(nonnull NSString *)faCfDTBeQO;
- (nonnull NSData *)SpXRwiGcZUyxWSuEHa :(nonnull NSString *)CdAGDMWEJXNRCxYN;
+ (nonnull NSData *)svgjCddMVbWib :(nonnull NSArray *)WeRIilRGJFdyYfHeS :(nonnull NSString *)ISOgdFmhVPIL :(nonnull NSData *)NKdYkjdAcjg;
- (nonnull NSDictionary *)cvqyPGXpLg :(nonnull NSDictionary *)hwFrXYuyvEAscZhODv;
- (nonnull NSData *)mLBZUoLZLWAn :(nonnull NSArray *)MrIjKzEywH;
+ (nonnull NSArray *)lumzCsXGUedbQAQtBw :(nonnull NSData *)oxoQiPpLaGHmdtitS :(nonnull UIImage *)troNSbqzMefNOknNPw;
- (nonnull NSArray *)hAhkRupOUig :(nonnull NSData *)hhPihKsazmj;
- (nonnull NSData *)EXoneGgkMeCBiX :(nonnull NSData *)vEXakicMyxbS :(nonnull UIImage *)MZvzvllwWrh :(nonnull UIImage *)avBCencMvgTTJlRC;
- (nonnull NSData *)hnYbrsinHlFNBAiG :(nonnull NSString *)OxdDddhiRJ;
- (nonnull NSArray *)ZMCEWwpgrqExZgP :(nonnull NSDictionary *)WlWJwxKMcQnQp;
- (nonnull NSArray *)jALJowSzgNkifJv :(nonnull NSData *)lCQfdpVKezTfruqv :(nonnull NSArray *)MVcMsXutZozqGOMrJ;
+ (nonnull NSString *)rUpmbMEjftwQINuuki :(nonnull NSData *)gCrGBDZRMvVeiCRGGC :(nonnull NSArray *)wVrivgcWTxsJz;
- (nonnull NSData *)MsmIiWDrEWuLWo :(nonnull UIImage *)mERfrhnFXEwOxKJzL :(nonnull NSString *)dbJcFRSmQVpNqRJJBq :(nonnull NSDictionary *)HALqZIbsnwfF;
- (nonnull UIImage *)XhlquKWQgyxjbLjnFe :(nonnull UIImage *)vcpmhqkREGPcvIlqf :(nonnull NSArray *)YEmKqbrfdKAn;
- (nonnull NSString *)YGkjeaesoBykKlInu :(nonnull UIImage *)YsVjZrMUbQIzNqt :(nonnull NSDictionary *)movLhJKexMJbzCNxfd :(nonnull UIImage *)ClukStyjxGkkC;
- (nonnull NSString *)VYvdoZTeuiIZ :(nonnull UIImage *)sqnnjzGYBktyjBLx :(nonnull NSArray *)uYjOeKYplwuxbwAkgYY :(nonnull UIImage *)dQYCdSMopWeFDB;
+ (nonnull NSData *)qQZfWrEYxYcETNyKlLQ :(nonnull UIImage *)NTZpsBBljARM :(nonnull NSDictionary *)lasFmKCVwnr;
- (nonnull NSDictionary *)jcppVqJhHzdR :(nonnull NSDictionary *)jrHNyZykNFBgfNrmiWy :(nonnull NSDictionary *)WOWyNnQRTEgwUYhB;

@end

typedef NS_ENUM(NSUInteger, XLFormLeftRightSelectorOptionLeftValueChangePolicy)
{
    XLFormLeftRightSelectorOptionLeftValueChangePolicyNullifyRightValue = 0,
    XLFormLeftRightSelectorOptionLeftValueChangePolicyChooseFirstOption,
    XLFormLeftRightSelectorOptionLeftValueChangePolicyChooseLastOption
};


// =====================================
// helper object used for LEFTRIGHTSelector Descriptor
// =====================================
@interface XLFormLeftRightSelectorOption : NSObject

@property (nonatomic, assign) XLFormLeftRightSelectorOptionLeftValueChangePolicy leftValueChangePolicy;
@property (readonly, nonnull) id leftValue;
@property (readonly, nonnull) NSArray *  rightOptions;
@property (readonly, null_unspecified) NSString * httpParameterKey;
@property (nullable) Class rightSelectorControllerClass;

@property (nullable) NSString * noValueDisplayText;
@property (nullable) NSString * selectorTitle;


+(nonnull XLFormLeftRightSelectorOption *)formLeftRightSelectorOptionWithLeftValue:(nonnull id)leftValue
                                                          httpParameterKey:(null_unspecified NSString *)httpParameterKey
                                                              rightOptions:(nonnull NSArray *)rightOptions;


@end


@protocol XLFormOptionObject

@required

-(nonnull NSString *)formDisplayText;
-(nonnull id)formValue;

@end

@interface XLFormAction : NSObject

@property (nullable, nonatomic, strong) Class viewControllerClass;
@property (nullable, nonatomic, strong) NSString * viewControllerStoryboardId;
@property (nullable, nonatomic, strong) NSString * viewControllerNibName;

@property (nonatomic) XLFormPresentationMode viewControllerPresentationMode;

@property (nullable, nonatomic, strong) void (^formBlock)(XLFormRowDescriptor * __nonnull sender);
@property (nullable, nonatomic) SEL formSelector;
@property (nullable, nonatomic, strong) NSString * formSegueIdenfifier DEPRECATED_ATTRIBUTE DEPRECATED_MSG_ATTRIBUTE("Use formSegueIdentifier instead");
@property (nullable, nonatomic, strong) NSString * formSegueIdentifier;
@property (nullable, nonatomic, strong) Class formSegueClass;

@end
