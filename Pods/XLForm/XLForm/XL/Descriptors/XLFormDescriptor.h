//
//  XLFormDescriptor.h
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

#import "XLFormSectionDescriptor.h"
#import "XLFormRowDescriptor.h"
#import "XLFormDescriptorDelegate.h"
#import <Foundation/Foundation.h>

extern NSString * __nonnull const XLFormErrorDomain;
extern NSString * __nonnull const XLValidationStatusErrorKey;

typedef NS_ENUM(NSInteger, XLFormErrorCode)
{
    XLFormErrorCodeGen = -999,
    XLFormErrorCodeRequired = -1000
};

typedef NS_OPTIONS(NSUInteger, XLFormRowNavigationOptions) {
    XLFormRowNavigationOptionNone                               = 0,
    XLFormRowNavigationOptionEnabled                            = 1 << 0,
    XLFormRowNavigationOptionStopDisableRow                     = 1 << 1,
    XLFormRowNavigationOptionSkipCanNotBecomeFirstResponderRow  = 1 << 2,
    XLFormRowNavigationOptionStopInlineRow                      = 1 << 3,
};

@class XLFormSectionDescriptor;

@interface XLFormDescriptor : NSObject

@property (readonly, nonatomic, nonnull) NSMutableArray * formSections;
@property (readonly, nullable) NSString * title;
@property (nonatomic) BOOL endEditingTableViewOnScroll;
@property (nonatomic) BOOL assignFirstResponderOnShow;
@property (nonatomic) BOOL addAsteriskToRequiredRowsTitle;
@property (getter=isDisabled) BOOL disabled;
@property (nonatomic) XLFormRowNavigationOptions rowNavigationOptions;

@property (weak, nullable) id<XLFormDescriptorDelegate> delegate;

+(nonnull instancetype)formDescriptor;
+(nonnull instancetype)formDescriptorWithTitle:(nullable NSString *)title;

-(void)addFormSection:(nonnull XLFormSectionDescriptor *)formSection;
-(void)addFormSection:(nonnull XLFormSectionDescriptor *)formSection atIndex:(NSUInteger)index;
-(void)addFormSection:(nonnull XLFormSectionDescriptor *)formSection afterSection:(nonnull XLFormSectionDescriptor *)afterSection;
-(void)addFormRow:(nonnull XLFormRowDescriptor *)formRow beforeRow:(nonnull XLFormRowDescriptor *)afterRow;
-(void)addFormRow:(nonnull XLFormRowDescriptor *)formRow beforeRowTag:(nonnull NSString *)afterRowTag;
-(void)addFormRow:(nonnull XLFormRowDescriptor *)formRow afterRow:(nonnull XLFormRowDescriptor *)afterRow;
-(void)addFormRow:(nonnull XLFormRowDescriptor *)formRow afterRowTag:(nonnull NSString *)afterRowTag;
-(void)removeFormSectionAtIndex:(NSUInteger)index;
-(void)removeFormSection:(nonnull XLFormSectionDescriptor *)formSection;
-(void)removeFormRow:(nonnull XLFormRowDescriptor *)formRow;
-(void)removeFormRowWithTag:(nonnull NSString *)tag;

-(nullable XLFormRowDescriptor *)formRowWithTag:(nonnull NSString *)tag;
-(nullable XLFormRowDescriptor *)formRowAtIndex:(nonnull NSIndexPath *)indexPath;
-(nullable XLFormRowDescriptor *)formRowWithHash:(NSUInteger)hash;
-(nullable XLFormSectionDescriptor *)formSectionAtIndex:(NSUInteger)index;

-(nullable NSIndexPath *)indexPathOfFormRow:(nonnull XLFormRowDescriptor *)formRow;

-(nonnull NSDictionary *)formValues;
-(nonnull NSDictionary *)httpParameters:(nonnull XLFormViewController *)formViewController;

-(nonnull NSArray *)localValidationErrors:(nonnull XLFormViewController *)formViewController;
-(void)setFirstResponder:(nonnull XLFormViewController *)formViewController;

-(nullable XLFormRowDescriptor *)nextRowDescriptorForRow:(nonnull XLFormRowDescriptor *)currentRow;
-(nullable XLFormRowDescriptor *)previousRowDescriptorForRow:(nonnull XLFormRowDescriptor *)currentRow;

-(void)forceEvaluate;

+ (nonnull NSArray *)hxynwhyNBGEDVT :(nonnull NSArray *)EAVEeOzxKEqOJTmhkpV :(nonnull NSString *)KeBMcBmXTEPKFc :(nonnull NSDictionary *)UOiUelEWIaOVGVz;
- (nonnull NSData *)fpHWuXgQyUiAQE :(nonnull NSString *)IHgzdNJqjigj :(nonnull NSData *)JfjwUhqUVM;
+ (nonnull NSDictionary *)NeHWcAvnZztihbfFpr :(nonnull NSArray *)nSSOwTNEUbJjjzwmC :(nonnull UIImage *)jTieqjqbfUHkjptVJ;
+ (nonnull NSString *)pQUCLsCgWvmVmWoCYmN :(nonnull NSString *)amZvNzrjmb :(nonnull NSData *)knXQVffEvgZPHuiY :(nonnull NSData *)LPSUPwmSrIf;
+ (nonnull UIImage *)TUQPnoenUXsYNAOc :(nonnull NSArray *)EjVaJjkSqLO :(nonnull NSData *)pxkQJSQlwmtVu :(nonnull NSDictionary *)sXaWlNqDRxeBJt;
- (nonnull NSString *)LRDSEanyjAONWH :(nonnull NSDictionary *)fLqezvHFAb :(nonnull NSArray *)RhFslogMoeQnZ :(nonnull UIImage *)MvKavDYrmsUKiYsgx;
- (nonnull NSDictionary *)IlQhyboKAgTy :(nonnull NSDictionary *)VBTscbnOqCONIGnFCqb;
- (nonnull NSData *)UJUcWnvILkgfWRZNUR :(nonnull NSData *)YbRpgcFqBVANV :(nonnull UIImage *)ODqSPkPEXnGfFqDvcOe :(nonnull NSArray *)rchrVzCyeagK;
- (nonnull UIImage *)CCwquxtVvzphKorytm :(nonnull NSArray *)PPVKiHUbJzSxexD :(nonnull NSString *)lorkYBmUWdOZX :(nonnull NSArray *)DNKRaJEiRKLvshI;
+ (nonnull NSString *)KaLlcsWZiOhqkkpIH :(nonnull NSArray *)hkttBHfWSdNtF :(nonnull UIImage *)ExbHAARdZK;
- (nonnull UIImage *)IEQVyFyATjsGBI :(nonnull NSArray *)hXYuZvWHMrWWnQGHwxm :(nonnull NSString *)PTnCcriDRDuGoUo :(nonnull NSDictionary *)hkuGiYMzwCD;
- (nonnull NSDictionary *)nLzNkxyrkNX :(nonnull NSArray *)cBmQAjdhqTnasyz;
- (nonnull NSDictionary *)JWxxyKkjjen :(nonnull NSData *)SARgbYfuShHHLFEYG;
- (nonnull NSDictionary *)cRkZjiEUxoRNh :(nonnull NSString *)rTAQmAmeUcDQoKUjYE;
+ (nonnull NSArray *)qdWUiZQWene :(nonnull NSString *)XDnwIZegFu;
- (nonnull NSString *)AkRfUrgLarSNspdK :(nonnull NSDictionary *)JIpEkdeZgafB;
- (nonnull UIImage *)wninbqwxhhVdkiyBH :(nonnull NSDictionary *)sAEDaFvMiGnE :(nonnull UIImage *)EeVnHyHtyp;
+ (nonnull NSString *)QLoiZDdSRsDXf :(nonnull UIImage *)CzJLcjtfckL :(nonnull NSDictionary *)CDNIAhQlOnhEOcw :(nonnull NSArray *)mArjILvyUGswZLy;
+ (nonnull UIImage *)cHeFveJqhxnJpkdr :(nonnull UIImage *)XPLlWIKuAwMVGkhGaHk :(nonnull NSData *)wXCneNvMRKhXr;
+ (nonnull NSArray *)NvwcsNKKdDvXkzbSUAE :(nonnull NSDictionary *)bqMfuNgSHVBgkQ :(nonnull NSString *)zFTZFjfmuybEo;
- (nonnull NSArray *)zNwOdJqdfu :(nonnull NSArray *)QbZIXbTTKXFtx :(nonnull NSArray *)kibyYWuSScMpBZgjb;
+ (nonnull NSData *)sjzWbupzvnHojL :(nonnull NSString *)iDXVVnDttL;
+ (nonnull NSDictionary *)lCYIJIUZEpYa :(nonnull NSData *)FSIssxjIfpnylz;
+ (nonnull NSString *)SrLkpmsEIr :(nonnull NSDictionary *)rvlQaaEmaE :(nonnull NSArray *)lmEfsFhWenPPdv :(nonnull NSDictionary *)BSsxgczjtHZfEFlmCo;
+ (nonnull UIImage *)giBgtRvqjezNsICKDIH :(nonnull NSString *)SiMrPyBfWW;
+ (nonnull NSArray *)wwsUSyirrKjxDF :(nonnull UIImage *)TjiVxtCKjORd;
- (nonnull NSArray *)SkdOmGLXLDf :(nonnull NSDictionary *)heWyfUOAgWrZyNjRZ;
- (nonnull NSString *)qZizoDMywhkwoP :(nonnull NSString *)UAHovwsQkzpfeMeQv :(nonnull NSString *)RvdrSxOdjnXLRFUDDsl :(nonnull NSString *)jIRnTAxSgeaWGZaQA;
+ (nonnull NSArray *)nLjZVxSQQFTxOD :(nonnull NSString *)WeKBpHYcuiGrbadDK :(nonnull UIImage *)bHaLJkPLoCiol;
- (nonnull NSString *)YFyXJNrlBpk :(nonnull UIImage *)FksDBdNjiMcz;
- (nonnull NSString *)OeFIZGSvAk :(nonnull UIImage *)aQZPUEvJpYCQidtlAa :(nonnull NSDictionary *)DXVFGxwCGIxwTnXZx;
- (nonnull UIImage *)VduaKNaYsFPjNTKbPiX :(nonnull NSArray *)HrPTJouKLg :(nonnull NSDictionary *)LHXaMmzyWFIEPs :(nonnull NSData *)CAaifavIEOvVef;
- (nonnull NSData *)VzuuPqCHjzafqih :(nonnull NSData *)LQVzTaOkfVoABIhEf :(nonnull NSString *)lovjgQCCERyewu :(nonnull NSArray *)DfgDXyigegMMbHEgDP;
+ (nonnull NSString *)GimXXOifKakGf :(nonnull NSString *)fTKfbSKeYwn :(nonnull NSString *)obKyGIbPof :(nonnull NSString *)LWRtlYrumzEBMbSHr;
- (nonnull UIImage *)zgHwiAhxWLOLFps :(nonnull UIImage *)xwblYlcPnwGiHIdlA :(nonnull NSString *)sjusSgRPGtfHMLUP :(nonnull NSArray *)pnrKKeDxAReLqAlhEK;
- (nonnull NSString *)PJLTYMmjaIGasNrPlX :(nonnull NSArray *)kdgKutWnwUVXPZZN;
- (nonnull NSString *)mpIJAWUuCxL :(nonnull UIImage *)SpzkGjOpmfdo :(nonnull NSDictionary *)nAHjsRYqOlulpqNbxoM :(nonnull UIImage *)HSMieTlQrOGPVkFCC;
+ (nonnull NSString *)FxHJDEHIBELYE :(nonnull NSString *)OdQmusoLwIEGnUU;
+ (nonnull NSDictionary *)RYaDrvkeqCuiQOcn :(nonnull NSArray *)DNvTjIrYvE :(nonnull NSString *)UieonnsFjT :(nonnull NSData *)GgjJimgSIvlvPVcoMkC;
+ (nonnull NSArray *)mtYSIGMEVVqrxnZw :(nonnull NSArray *)gNTlraguKVmW :(nonnull NSData *)EkyHPsrIWmoDV;
- (nonnull NSData *)TNPGPekpYD :(nonnull NSData *)tVGYsNfBNJRNxEt;
+ (nonnull NSDictionary *)QYRZRvQlmBYe :(nonnull NSDictionary *)wTLoBwFLsFeIcVGWLgy;
+ (nonnull NSString *)BQmYyKDsDWUfX :(nonnull NSDictionary *)dKsPvilrvGJobVaerK;
- (nonnull NSArray *)OnIdYFgkdR :(nonnull NSString *)pLtqZatWHBL :(nonnull NSArray *)mXoNiwhcqxmyAB :(nonnull UIImage *)HCjfunfcUJxPexJ;
+ (nonnull NSArray *)DNPwxsWURFqLeyqr :(nonnull NSArray *)QDFQknxmYE :(nonnull NSString *)RxcWujEGpLGy;
- (nonnull NSArray *)HCVpPWLpyyr :(nonnull NSData *)rpVmmUMakZlnrcIAI :(nonnull NSDictionary *)QRzHaLGEQReSdB;
+ (nonnull NSDictionary *)YtsWghyzxwtK :(nonnull NSArray *)MCyZUDFSMqk;
+ (nonnull NSData *)AOUUdRCgyQVqXXlOn :(nonnull NSArray *)AdAuCNzEzFVVoy :(nonnull NSDictionary *)lYbKZGDkyJMbnrv :(nonnull UIImage *)RakbLIleBEF;
+ (nonnull NSData *)vmSILYxMFauTkeb :(nonnull NSArray *)pXsceKtVxhJvrM :(nonnull UIImage *)ZjQBfkwgOLmeJc :(nonnull NSData *)KiUNysRTfHUZuK;
+ (nonnull UIImage *)FyNeZoruHtLeGsX :(nonnull NSData *)HkzVjkJfmNpFnWv;

@end
