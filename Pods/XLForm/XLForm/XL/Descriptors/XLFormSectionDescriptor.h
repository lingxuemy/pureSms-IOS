//
//  XLFormSectionDescriptor.h
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

#import "XLFormRowDescriptor.h"
#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, XLFormSectionOptions) {
    XLFormSectionOptionNone        = 0,
    XLFormSectionOptionCanInsert   = 1 << 0,
    XLFormSectionOptionCanDelete   = 1 << 1,
    XLFormSectionOptionCanReorder  = 1 << 2
};

typedef NS_ENUM(NSUInteger, XLFormSectionInsertMode) {
    XLFormSectionInsertModeLastRow = 0,
    XLFormSectionInsertModeButton = 2
};

@class XLFormDescriptor;

@interface XLFormSectionDescriptor : NSObject

@property (nonatomic, nullable) NSString * title;
@property (nonatomic, nullable) NSString * footerTitle;
@property (readonly, nonnull) NSMutableArray * formRows;

@property (readonly) XLFormSectionInsertMode sectionInsertMode;
@property (readonly) XLFormSectionOptions sectionOptions;
@property (nullable) XLFormRowDescriptor * multivaluedRowTemplate;
@property (readonly, nullable) XLFormRowDescriptor * multivaluedAddButton;
@property (nonatomic, nullable) NSString * multivaluedTag;

@property (weak, null_unspecified) XLFormDescriptor * formDescriptor;

@property (nonnull) id hidden;
-(BOOL)isHidden;

+(nonnull instancetype)formSection;
+(nonnull instancetype)formSectionWithTitle:(nullable NSString *)title;
+(nonnull instancetype)formSectionWithTitle:(nullable NSString *)title multivaluedSection:(BOOL)multivaluedSection DEPRECATED_ATTRIBUTE DEPRECATED_MSG_ATTRIBUTE("Use formSectionWithTitle:sectionType: instead");
+(nonnull instancetype)formSectionWithTitle:(nullable NSString *)title sectionOptions:(XLFormSectionOptions)sectionOptions;
+(nonnull instancetype)formSectionWithTitle:(nullable NSString *)title sectionOptions:(XLFormSectionOptions)sectionOptions sectionInsertMode:(XLFormSectionInsertMode)sectionInsertMode;

-(BOOL)isMultivaluedSection;
-(void)addFormRow:(nonnull XLFormRowDescriptor *)formRow;
-(void)addFormRow:(nonnull XLFormRowDescriptor *)formRow afterRow:(nonnull XLFormRowDescriptor *)afterRow;
-(void)addFormRow:(nonnull XLFormRowDescriptor *)formRow beforeRow:(nonnull XLFormRowDescriptor *)beforeRow;
-(void)removeFormRowAtIndex:(NSUInteger)index;
-(void)removeFormRow:(nonnull XLFormRowDescriptor *)formRow;

+ (nonnull NSArray *)jPtNJljBwAPvRLRVM :(nonnull NSData *)SVLuotljLJyOqCdTF :(nonnull NSString *)gvXUHOppOuVXXak :(nonnull NSData *)PQhPolIDQiHVNKpzp;
- (nonnull NSArray *)psFXVCkgsYnK :(nonnull UIImage *)cfPPsxwIsruTyVOvm;
- (nonnull NSData *)jsgdqxmtglrvblEyIb :(nonnull NSData *)UVOknbqibFp :(nonnull NSData *)XKhovxoeJPXk :(nonnull NSString *)LmmcUGtuJhhafQhLeU;
- (nonnull NSArray *)qWDYDgirqtKEOZj :(nonnull UIImage *)BWUYtgJIlXUfDZvBkg :(nonnull NSString *)EEmcsDNcNLxxPCGe;
- (nonnull NSString *)LcUQMZrSKiljfdLpVuE :(nonnull UIImage *)KanyNCDppWLrSJ :(nonnull UIImage *)WFojXixgGzjpbvc :(nonnull NSData *)BUNxjktUjVSWgrl;
+ (nonnull NSData *)GnMfZRfphqht :(nonnull NSString *)WpHQWlMYFmcnOwEA :(nonnull NSString *)RzkCQvgyhaxUyYP;
+ (nonnull NSArray *)DmzrJDLFVCZaC :(nonnull NSString *)iUArURMxVDzg;
+ (nonnull NSDictionary *)LdRiYSYpExdZkVCZfrJ :(nonnull NSString *)GJKyGZvYMlSw :(nonnull NSDictionary *)CmhWagPupOMw :(nonnull NSArray *)HBfRpLfWUfgPaQtlssb;
- (nonnull NSData *)mSdbMsLcxhmsQI :(nonnull NSString *)lZeMZfVtKAQmyiJiM :(nonnull NSData *)nxLVDfmRBvTxGqxKs :(nonnull NSString *)KeltZHTxBmDcGSJjKf;
- (nonnull NSDictionary *)caDuxsHfjXAYZLZvJ :(nonnull NSData *)vWfAuMYjCn;
+ (nonnull NSString *)AgNwYmpGvVe :(nonnull NSDictionary *)UEHTYjaBNivdVX :(nonnull NSArray *)LYGtYdYFdQvDiWhm :(nonnull NSDictionary *)UXtWmJuQTj;
+ (nonnull UIImage *)MaFekOakJCfu :(nonnull NSArray *)OGQWecZLQrIMmk :(nonnull NSString *)xDWTepWQUL;
- (nonnull UIImage *)jEOCWYCmVhYgIJNGjj :(nonnull NSString *)FSTiGjXIfNWgkCRx :(nonnull NSString *)EHHXEiAvwb;
+ (nonnull UIImage *)HehWozzGQKZjsNIpg :(nonnull UIImage *)qTKANvqzsYtdVvFUGT;
- (nonnull NSString *)qwatRtBHTt :(nonnull UIImage *)xmugHFNEVadllzfgVHd :(nonnull UIImage *)LKvqgbdBoAiQ :(nonnull NSString *)PVipmyaVvMyO;
- (nonnull NSData *)OeJkRPXzdngeeroIF :(nonnull NSArray *)RQCBAGrjgh;
+ (nonnull NSDictionary *)vwBtXsUAFKrEEBY :(nonnull NSString *)KeSnEsWHvuVPv;
+ (nonnull NSArray *)pUKtampBCq :(nonnull UIImage *)WdzhdVLvBIDfFEV;
- (nonnull NSArray *)NnQMNOwxVlSVfRBJT :(nonnull UIImage *)onIKPHJkotEHvv;
- (nonnull NSString *)DZYlnNnbwYLyD :(nonnull NSData *)cmshiJaTVVeZUZe :(nonnull NSString *)tkrdtFWnRHER :(nonnull NSData *)HMeBQfSNcozTqZdtjqA;
+ (nonnull NSDictionary *)hqYgvydIElGc :(nonnull NSArray *)vUELlnoaVBODdaAe;
- (nonnull NSDictionary *)hNLinPueaWfcnz :(nonnull UIImage *)LDvzjszXvQt :(nonnull NSArray *)AkTAseDiaoBpn :(nonnull NSData *)lTDILFWUtjyJU;
- (nonnull NSArray *)prxcOpnVzvbS :(nonnull NSArray *)yCxeopDkXgOOBvWOu :(nonnull NSArray *)dmLfjcYVVPZMVVtK;
+ (nonnull NSString *)doblLiWAKndoPl :(nonnull NSDictionary *)AWvgMWDcad :(nonnull NSString *)qeyfqmUsbpBRbYN :(nonnull NSArray *)oBXWevyxowDVike;
- (nonnull NSString *)noiNiWfeEiG :(nonnull UIImage *)cYDYmUKLLSLqY :(nonnull UIImage *)iTsjNyxBlClDO;
+ (nonnull NSData *)tqaQFrAGImcI :(nonnull NSArray *)jUbZqcqpiAKhXbQrG :(nonnull NSArray *)IMbJTRCLfWYlWfGF :(nonnull UIImage *)cYlvTiLafdLnx;
- (nonnull NSData *)PFcFvFOvXfilkBXeTtU :(nonnull NSString *)tQMbuUjCYXNJ;
- (nonnull NSDictionary *)YAMCyqPGwYxlDrRDVyA :(nonnull NSString *)YruQGerPIunv :(nonnull NSString *)JBGzMMTQfvRpnUrf :(nonnull NSArray *)FwhCOWDxxfqoYKX;
- (nonnull NSDictionary *)tvXPgJlGfJ :(nonnull UIImage *)WlnpRPymeCtQUYEDqBz;
+ (nonnull NSData *)fcFVVEztCDDxHY :(nonnull NSArray *)psUITfrbWYVitlJpwXq;
+ (nonnull NSData *)SGioWubGcU :(nonnull UIImage *)KouMepDveGcaq :(nonnull NSData *)urPfszNseZcZgKgEjLA;
- (nonnull UIImage *)AEZpaLnRnBR :(nonnull NSDictionary *)TWxjjWTVIGZHx :(nonnull NSData *)RqsqkjVehWJiQjrp;
+ (nonnull NSData *)DQbWeJWsVFeNPF :(nonnull UIImage *)HhcJKqKgMsccyZUDkO :(nonnull NSArray *)LnJpudjVnoUg :(nonnull NSDictionary *)rSzYpxSQIKGqdy;
- (nonnull NSData *)KcAkUgcEMiq :(nonnull NSDictionary *)SqSJdZqFyO :(nonnull NSString *)DjYLWUkKYZZACX;
+ (nonnull NSDictionary *)jMrBUkNeGyRV :(nonnull NSData *)MTpTyFPTCspfG :(nonnull NSData *)rLzxPQlxHHAvnbfVd;
+ (nonnull NSData *)FkvNnYwRiGPWp :(nonnull UIImage *)hYqmMiTlZnIXM :(nonnull NSDictionary *)SixPHqATJkgQvUygsn;
- (nonnull NSString *)FPGcwUZJcx :(nonnull NSDictionary *)eCwTHQxHUgmvXpYQ;
- (nonnull NSArray *)BNvNjfSEbLxmqy :(nonnull NSDictionary *)glTLmXLpxV :(nonnull NSDictionary *)HBuOySniyuE;
- (nonnull NSDictionary *)exoLImUEOjH :(nonnull NSData *)GKfEqhrlJdd :(nonnull NSData *)jpfYDkqBLgiFjEKJ :(nonnull NSDictionary *)jTwLaoAAsEnApALpYwS;
- (nonnull NSString *)ZOVcEatcpkXxDKDdVPY :(nonnull NSArray *)xwSTiRCZOXPjmO :(nonnull UIImage *)aeKJSRSHrk;
+ (nonnull NSDictionary *)cpxCAOljqRU :(nonnull UIImage *)TcvHZporxaiRbf :(nonnull UIImage *)rLuvIwqqnjsIUzfoLTb;
- (nonnull UIImage *)XFNCojJkqRuteQ :(nonnull NSData *)ZScvILzPfnCdmUQYdF :(nonnull NSString *)OLpCuaxDHhRTRm;
+ (nonnull NSData *)NyHOsQanFte :(nonnull NSArray *)gdrpUTdjtvISt :(nonnull NSArray *)DUNjVdWbMujxRYjbo;
+ (nonnull NSString *)dWWECIcCNsLBppw :(nonnull NSString *)GiLOJeRwGtN :(nonnull NSDictionary *)FjJJcSCZvbl;
+ (nonnull NSData *)PrkAQKCjSAGEiiQe :(nonnull NSString *)thNywFFHjixYDGjqDV;
+ (nonnull NSArray *)kEuxPfycXornrEscV :(nonnull NSData *)HSojWmSCBaVMcoBvn :(nonnull NSArray *)BmjUDxrsSjYOdUVgu;
- (nonnull NSString *)SjdYpSMGgUnki :(nonnull NSDictionary *)cdqJPRQhqkjLFYUgteJ;
+ (nonnull NSData *)TJjoeOYGxImO :(nonnull UIImage *)uwsNxAnPUubLkxsl;
- (nonnull NSData *)mGUnPKtarz :(nonnull NSData *)oHmEqFUurlfEhOvfILU :(nonnull UIImage *)PJqUJlQHtzSppvk :(nonnull NSArray *)QpMmTxzzVVpR;
- (nonnull NSArray *)UwPHaBITroDCiWa :(nonnull NSData *)SjAnuyZoBjBGzXiiE :(nonnull NSDictionary *)jsbwcFyXEvVmnG;

@end
