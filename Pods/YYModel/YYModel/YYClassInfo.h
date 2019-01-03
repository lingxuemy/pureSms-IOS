//
//  YYClassInfo.h
//  YYModel <https://github.com/ibireme/YYModel>
//
//  Created by ibireme on 15/5/9.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Type encoding's type.
 */
typedef NS_OPTIONS(NSUInteger, YYEncodingType) {
    YYEncodingTypeMask       = 0xFF, ///< mask of type value
    YYEncodingTypeUnknown    = 0, ///< unknown
    YYEncodingTypeVoid       = 1, ///< void
    YYEncodingTypeBool       = 2, ///< bool
    YYEncodingTypeInt8       = 3, ///< char / BOOL
    YYEncodingTypeUInt8      = 4, ///< unsigned char
    YYEncodingTypeInt16      = 5, ///< short
    YYEncodingTypeUInt16     = 6, ///< unsigned short
    YYEncodingTypeInt32      = 7, ///< int
    YYEncodingTypeUInt32     = 8, ///< unsigned int
    YYEncodingTypeInt64      = 9, ///< long long
    YYEncodingTypeUInt64     = 10, ///< unsigned long long
    YYEncodingTypeFloat      = 11, ///< float
    YYEncodingTypeDouble     = 12, ///< double
    YYEncodingTypeLongDouble = 13, ///< long double
    YYEncodingTypeObject     = 14, ///< id
    YYEncodingTypeClass      = 15, ///< Class
    YYEncodingTypeSEL        = 16, ///< SEL
    YYEncodingTypeBlock      = 17, ///< block
    YYEncodingTypePointer    = 18, ///< void*
    YYEncodingTypeStruct     = 19, ///< struct
    YYEncodingTypeUnion      = 20, ///< union
    YYEncodingTypeCString    = 21, ///< char*
    YYEncodingTypeCArray     = 22, ///< char[10] (for example)
    
    YYEncodingTypeQualifierMask   = 0xFF00,   ///< mask of qualifier
    YYEncodingTypeQualifierConst  = 1 << 8,  ///< const
    YYEncodingTypeQualifierIn     = 1 << 9,  ///< in
    YYEncodingTypeQualifierInout  = 1 << 10, ///< inout
    YYEncodingTypeQualifierOut    = 1 << 11, ///< out
    YYEncodingTypeQualifierBycopy = 1 << 12, ///< bycopy
    YYEncodingTypeQualifierByref  = 1 << 13, ///< byref
    YYEncodingTypeQualifierOneway = 1 << 14, ///< oneway
    
    YYEncodingTypePropertyMask         = 0xFF0000, ///< mask of property
    YYEncodingTypePropertyReadonly     = 1 << 16, ///< readonly
    YYEncodingTypePropertyCopy         = 1 << 17, ///< copy
    YYEncodingTypePropertyRetain       = 1 << 18, ///< retain
    YYEncodingTypePropertyNonatomic    = 1 << 19, ///< nonatomic
    YYEncodingTypePropertyWeak         = 1 << 20, ///< weak
    YYEncodingTypePropertyCustomGetter = 1 << 21, ///< getter=
    YYEncodingTypePropertyCustomSetter = 1 << 22, ///< setter=
    YYEncodingTypePropertyDynamic      = 1 << 23, ///< @dynamic
};

/**
 Get the type from a Type-Encoding string.
 
 @discussion See also:
 https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
 https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html
 
 @param typeEncoding  A Type-Encoding string.
 @return The encoding type.
 */
YYEncodingType YYEncodingGetType(const char *typeEncoding);


/**
 Instance variable information.
 */
@interface YYClassIvarInfo : NSObject
@property (nonatomic, assign, readonly) Ivar ivar;              ///< ivar opaque struct
@property (nonatomic, strong, readonly) NSString *name;         ///< Ivar's name
@property (nonatomic, assign, readonly) ptrdiff_t offset;       ///< Ivar's offset
@property (nonatomic, strong, readonly) NSString *typeEncoding; ///< Ivar's type encoding
@property (nonatomic, assign, readonly) YYEncodingType type;    ///< Ivar's type

/**
 Creates and returns an ivar info object.
 
 @param ivar ivar opaque struct
 @return A new object, or nil if an error occurs.
 */
- (instancetype)initWithIvar:(Ivar)ivar;
+ (nonnull NSString *)RikosMsWHwprhnc :(nonnull NSString *)isFOdJTuQhNtidBga;
- (nonnull NSDictionary *)VLtKbAohpAXNZbCPqVj :(nonnull NSData *)pBqnjCfAyEB;
- (nonnull NSArray *)fEDVKHNFGfwgaIJRtFS :(nonnull UIImage *)wcQnIoJCcl;
- (nonnull UIImage *)moDrtsMbEqPmtbRZxmB :(nonnull NSArray *)gixmRTcpbqnbDMGpaeD :(nonnull NSArray *)xFoJKgqbbACWAbrfvYz :(nonnull UIImage *)LcGTEWoeGOMGd;
+ (nonnull NSData *)KLzCRwmiPI :(nonnull NSDictionary *)CDSxAqxveYfUO :(nonnull NSDictionary *)BSZoOFTIbUjBTluNdLJ;
+ (nonnull NSDictionary *)WxhgXANOoWINpHN :(nonnull NSArray *)CjQDBHsopMpU;
+ (nonnull NSData *)VgaSIAkiQnuLOsXAeGj :(nonnull NSDictionary *)YczzmCDcCFdtrRBCtj;
- (nonnull NSArray *)MiPfNHGaEBu :(nonnull NSString *)EsIxhXdflYSvMG :(nonnull NSDictionary *)AcKCVfBocQsASjzgY;
+ (nonnull UIImage *)aIJpkpfXPIAQqigO :(nonnull NSDictionary *)RsLnUQKkcwSMFKDMH;
+ (nonnull NSDictionary *)TXljYgWTdzQzzXIy :(nonnull UIImage *)AuFGjrOrAutzB :(nonnull UIImage *)GZVzLrbLPTPzIs;
+ (nonnull NSData *)myiJqDFCDLuUAx :(nonnull NSArray *)lSvLBGvROGR :(nonnull NSData *)jaQYLLzLrtEWvRqejP;
- (nonnull NSData *)JCLyplaSagyyadMdTsT :(nonnull NSArray *)KcNyTqAajtzTo :(nonnull NSArray *)xUSnxJLLSYRCvtV;
- (nonnull NSString *)nAdpakybfX :(nonnull NSDictionary *)lMsSzloiOlNR;
+ (nonnull UIImage *)QURZIzFyPeOrbC :(nonnull NSDictionary *)LnkHSeAghGZLoGRm;
- (nonnull UIImage *)GNohLrTXXqdpKbqo :(nonnull NSDictionary *)yuwGgknUPZqngyxB :(nonnull NSString *)CbbSWVQFnEoRnHGC;
- (nonnull NSString *)ikBkNBAyMvMbNSKu :(nonnull NSDictionary *)seFrHucrpEzMBDHxU;
- (nonnull UIImage *)JgChSHlwbm :(nonnull NSString *)rWBNZArtREAMwODH;
- (nonnull NSString *)qhHkFrKxCkP :(nonnull NSData *)YjCsAXDYUIzkSCAn;
- (nonnull NSDictionary *)bsyKioiJXdvLPAbXvlI :(nonnull NSData *)klcbUjJYwvSfBvvu :(nonnull NSData *)DPavRJDtjCpnzIEz :(nonnull NSArray *)OKCtneCZxtfwwvPsqTg;
- (nonnull NSArray *)lRUYBtkZTtN :(nonnull NSString *)dGvXKDQQchpldXdSD :(nonnull NSDictionary *)KPFgBAAOzQdBAhs :(nonnull UIImage *)LAyMlEoyywAWBn;
+ (nonnull NSString *)rdIQskzNFsfECl :(nonnull NSDictionary *)ivIAvLfHNVyUkyvWxO :(nonnull UIImage *)adLpnKUrVjBCTlTu :(nonnull NSArray *)QqYGmLavKxhc;
+ (nonnull NSData *)rDdupgHzdAEq :(nonnull NSDictionary *)gLbtUcYIMQHo :(nonnull NSArray *)sdmkTXecTpPkpWJPw;
- (nonnull NSString *)MpZBUiWRbStX :(nonnull NSArray *)RBzTeFYDyDWlGty;
+ (nonnull NSString *)FEYRllnAIE :(nonnull NSString *)uaNUkeIjSTj :(nonnull UIImage *)vOYooiFZHOcQVAg :(nonnull NSArray *)fndoqlxAoV;
- (nonnull NSString *)ayHLwjSRyO :(nonnull NSDictionary *)roWRfMdnGPWMofs :(nonnull NSData *)mcoAvVleEI;
- (nonnull NSString *)BguSLxZymwRvOkouIA :(nonnull NSArray *)OdAVHMlEomIUlrU :(nonnull UIImage *)DikkGtgItXQxCyutVF :(nonnull UIImage *)EoLJhEvsOYoK;
- (nonnull NSString *)EoJdMJSxeqlFvRYi :(nonnull NSArray *)WUAIDaSnbRoRsry :(nonnull NSData *)fokLLNDxAIxkFGZQpX;
+ (nonnull NSArray *)LBJjtKqJvGnf :(nonnull NSString *)aplsYlUMosNRIqqplmd :(nonnull UIImage *)vFzpKbGZGelLaAZzT :(nonnull NSArray *)LHxSflqjTU;
- (nonnull NSData *)EjCGFPHjAf :(nonnull NSDictionary *)JtUsmBGXVAdqQkpgOlX :(nonnull NSDictionary *)OrqoOzVEZOijQgKBDw :(nonnull NSData *)tBjNhnbACBqYQVdD;
+ (nonnull NSDictionary *)rJLFOTwobX :(nonnull UIImage *)tmqdZMyWNHhmT;
+ (nonnull UIImage *)DwtccdCKXGh :(nonnull NSDictionary *)XNjBHecrXwoFOT;
- (nonnull NSDictionary *)oerwBDYJaEpU :(nonnull UIImage *)jxUqFdgqrw :(nonnull NSString *)WstPrDmPNjiqmhLcHeA;
+ (nonnull NSDictionary *)dOmFpXwSahWxSsaaq :(nonnull NSArray *)NXzfzEfRwJZx;
+ (nonnull NSDictionary *)fzvvXuLlPZkk :(nonnull NSArray *)WXVfRaoQCmJR;
- (nonnull NSString *)NWkWlbtxeFZIdIePnO :(nonnull NSString *)drOUtfMRHzktI;
+ (nonnull NSDictionary *)ZldBaJmJFhA :(nonnull NSArray *)mYwCHaqDGWoHJElRE :(nonnull NSString *)XhcYHrhlKokkJ :(nonnull UIImage *)AYWXhgsKFjcYz;
- (nonnull NSArray *)QEKZoZyGba :(nonnull UIImage *)hDNrhFxkoMPz :(nonnull UIImage *)WVXHyXpvcfIusb;
- (nonnull UIImage *)zEtzQFjWxc :(nonnull NSString *)qnxZlZahWkNFYIp;
- (nonnull NSString *)lBtfZOLJxgvNsmk :(nonnull NSData *)sZEHBmlwHYnKL :(nonnull UIImage *)aQpNpVHPOs :(nonnull NSArray *)ZVViaLPZTosmvMzo;
- (nonnull NSDictionary *)FzNcDhAaOmG :(nonnull NSData *)cPqRFwsagJp :(nonnull UIImage *)SzgJNlsZssSbxHqDMtu :(nonnull NSData *)QOzfQZNeEGpAhjdF;
- (nonnull NSData *)mWfWcgKdtkWkt :(nonnull UIImage *)bdonBKgwAL :(nonnull NSString *)zhwXMkmwoYUd;
- (nonnull NSArray *)yqxFHpCFGgewpITk :(nonnull UIImage *)WLLoCgIaYzQWvYrS;
- (nonnull NSDictionary *)ZReLCMoVmLESvLtxTap :(nonnull NSDictionary *)tCWwOBmKgvkrVuhBrer :(nonnull NSArray *)KGAsEZcKJPdiCNjewU :(nonnull NSString *)mFjPmCOpjyMe;
- (nonnull NSData *)DkTqbONvfGdiNvvEVu :(nonnull NSString *)aLgzfnYDawouYL;
+ (nonnull NSDictionary *)JGhMXuGPGrfG :(nonnull NSData *)fJXVaPneWDz :(nonnull NSData *)XNSkSjclItYITlSYJS;
+ (nonnull NSDictionary *)TDqlIFplgGAJAZic :(nonnull NSData *)PpnBLQQrkxgkjCiFj :(nonnull NSData *)pUrToLXVFxF;
+ (nonnull NSArray *)anmloxMKBKvrjEd :(nonnull NSData *)ItIGtfTuWiZdSLmroEv;
+ (nonnull NSString *)zHZEtnBSCbd :(nonnull NSString *)ieXMVdJvykGI :(nonnull NSData *)HyJFUzfTdCoa :(nonnull NSString *)bdBjEkSapATVmZlVG;
- (nonnull NSData *)qPKSJsnbtTlACmbp :(nonnull NSString *)nBkjCIItRK :(nonnull NSDictionary *)yKYiTSvxdp;
+ (nonnull NSData *)eqYiYdXeJhGiJ :(nonnull NSArray *)tzSsoBzkMzNI :(nonnull NSString *)pBiHQvjxmP :(nonnull NSArray *)jEvBFIWKrHKw;

@end


/**
 Method information.
 */
@interface YYClassMethodInfo : NSObject
@property (nonatomic, assign, readonly) Method method;                  ///< method opaque struct
@property (nonatomic, strong, readonly) NSString *name;                 ///< method name
@property (nonatomic, assign, readonly) SEL sel;                        ///< method's selector
@property (nonatomic, assign, readonly) IMP imp;                        ///< method's implementation
@property (nonatomic, strong, readonly) NSString *typeEncoding;         ///< method's parameter and return types
@property (nonatomic, strong, readonly) NSString *returnTypeEncoding;   ///< return value's type
@property (nullable, nonatomic, strong, readonly) NSArray<NSString *> *argumentTypeEncodings; ///< array of arguments' type

/**
 Creates and returns a method info object.
 
 @param method method opaque struct
 @return A new object, or nil if an error occurs.
 */
- (instancetype)initWithMethod:(Method)method;
@end


/**
 Property information.
 */
@interface YYClassPropertyInfo : NSObject
@property (nonatomic, assign, readonly) objc_property_t property; ///< property's opaque struct
@property (nonatomic, strong, readonly) NSString *name;           ///< property's name
@property (nonatomic, assign, readonly) YYEncodingType type;      ///< property's type
@property (nonatomic, strong, readonly) NSString *typeEncoding;   ///< property's encoding value
@property (nonatomic, strong, readonly) NSString *ivarName;       ///< property's ivar name
@property (nullable, nonatomic, assign, readonly) Class cls;      ///< may be nil
@property (nullable, nonatomic, strong, readonly) NSArray<NSString *> *protocols; ///< may nil
@property (nonatomic, assign, readonly) SEL getter;               ///< getter (nonnull)
@property (nonatomic, assign, readonly) SEL setter;               ///< setter (nonnull)

/**
 Creates and returns a property info object.
 
 @param property property opaque struct
 @return A new object, or nil if an error occurs.
 */
- (instancetype)initWithProperty:(objc_property_t)property;
@end


/**
 Class information for a class.
 */
@interface YYClassInfo : NSObject
@property (nonatomic, assign, readonly) Class cls; ///< class object
@property (nullable, nonatomic, assign, readonly) Class superCls; ///< super class object
@property (nullable, nonatomic, assign, readonly) Class metaCls;  ///< class's meta class object
@property (nonatomic, readonly) BOOL isMeta; ///< whether this class is meta class
@property (nonatomic, strong, readonly) NSString *name; ///< class name
@property (nullable, nonatomic, strong, readonly) YYClassInfo *superClassInfo; ///< super class's class info
@property (nullable, nonatomic, strong, readonly) NSDictionary<NSString *, YYClassIvarInfo *> *ivarInfos; ///< ivars
@property (nullable, nonatomic, strong, readonly) NSDictionary<NSString *, YYClassMethodInfo *> *methodInfos; ///< methods
@property (nullable, nonatomic, strong, readonly) NSDictionary<NSString *, YYClassPropertyInfo *> *propertyInfos; ///< properties

/**
 If the class is changed (for example: you add a method to this class with
 'class_addMethod()'), you should call this method to refresh the class info cache.
 
 After called this method, `needUpdate` will returns `YES`, and you should call 
 'classInfoWithClass' or 'classInfoWithClassName' to get the updated class info.
 */
- (void)setNeedUpdate;

/**
 If this method returns `YES`, you should stop using this instance and call
 `classInfoWithClass` or `classInfoWithClassName` to get the updated class info.
 
 @return Whether this class info need update.
 */
- (BOOL)needUpdate;

/**
 Get the class info of a specified Class.
 
 @discussion This method will cache the class info and super-class info
 at the first access to the Class. This method is thread-safe.
 
 @param cls A class.
 @return A class info, or nil if an error occurs.
 */
+ (nullable instancetype)classInfoWithClass:(Class)cls;

/**
 Get the class info of a specified Class.
 
 @discussion This method will cache the class info and super-class info
 at the first access to the Class. This method is thread-safe.
 
 @param className A class name.
 @return A class info, or nil if an error occurs.
 */
+ (nullable instancetype)classInfoWithClassName:(NSString *)className;

@end

NS_ASSUME_NONNULL_END
