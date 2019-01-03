//
//  UIView+MASAdditions.h
//  Masonry
//
//  Created by Jonas Budelmann on 20/07/13.
//  Copyright (c) 2013 cloudling. All rights reserved.
//

#import "MASUtilities.h"
#import "MASConstraintMaker.h"
#import "MASViewAttribute.h"

/**
 *	Provides constraint maker block
 *  and convience methods for creating MASViewAttribute which are view + NSLayoutAttribute pairs
 */
@interface MAS_VIEW (MASAdditions)

/**
 *	following properties return a new MASViewAttribute with current view and appropriate NSLayoutAttribute
 */
@property (nonatomic, strong, readonly) MASViewAttribute *mas_left;
@property (nonatomic, strong, readonly) MASViewAttribute *mas_top;
@property (nonatomic, strong, readonly) MASViewAttribute *mas_right;
@property (nonatomic, strong, readonly) MASViewAttribute *mas_bottom;
@property (nonatomic, strong, readonly) MASViewAttribute *mas_leading;
@property (nonatomic, strong, readonly) MASViewAttribute *mas_trailing;
@property (nonatomic, strong, readonly) MASViewAttribute *mas_width;
@property (nonatomic, strong, readonly) MASViewAttribute *mas_height;
@property (nonatomic, strong, readonly) MASViewAttribute *mas_centerX;
@property (nonatomic, strong, readonly) MASViewAttribute *mas_centerY;
@property (nonatomic, strong, readonly) MASViewAttribute *mas_baseline;
@property (nonatomic, strong, readonly) MASViewAttribute *(^mas_attribute)(NSLayoutAttribute attr);

#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)

@property (nonatomic, strong, readonly) MASViewAttribute *mas_firstBaseline;
@property (nonatomic, strong, readonly) MASViewAttribute *mas_lastBaseline;

#endif

#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000)

@property (nonatomic, strong, readonly) MASViewAttribute *mas_leftMargin;
@property (nonatomic, strong, readonly) MASViewAttribute *mas_rightMargin;
@property (nonatomic, strong, readonly) MASViewAttribute *mas_topMargin;
@property (nonatomic, strong, readonly) MASViewAttribute *mas_bottomMargin;
@property (nonatomic, strong, readonly) MASViewAttribute *mas_leadingMargin;
@property (nonatomic, strong, readonly) MASViewAttribute *mas_trailingMargin;
@property (nonatomic, strong, readonly) MASViewAttribute *mas_centerXWithinMargins;
@property (nonatomic, strong, readonly) MASViewAttribute *mas_centerYWithinMargins;

#endif

#if (__IPHONE_OS_VERSION_MAX_ALLOWED >= 110000) || (__TV_OS_VERSION_MAX_ALLOWED >= 110000)

@property (nonatomic, strong, readonly) MASViewAttribute *mas_safeAreaLayoutGuide API_AVAILABLE(ios(11.0),tvos(11.0));
@property (nonatomic, strong, readonly) MASViewAttribute *mas_safeAreaLayoutGuideTop API_AVAILABLE(ios(11.0),tvos(11.0));
@property (nonatomic, strong, readonly) MASViewAttribute *mas_safeAreaLayoutGuideBottom API_AVAILABLE(ios(11.0),tvos(11.0));
@property (nonatomic, strong, readonly) MASViewAttribute *mas_safeAreaLayoutGuideLeft API_AVAILABLE(ios(11.0),tvos(11.0));
@property (nonatomic, strong, readonly) MASViewAttribute *mas_safeAreaLayoutGuideRight API_AVAILABLE(ios(11.0),tvos(11.0));

#endif

/**
 *	a key to associate with this view
 */
@property (nonatomic, strong) id mas_key;

/**
 *	Finds the closest common superview between this view and another view
 *
 *	@param	view	other view
 *
 *	@return	returns nil if common superview could not be found
 */
- (instancetype)mas_closestCommonSuperview:(MAS_VIEW *)view;

/**
 *  Creates a MASConstraintMaker with the callee view.
 *  Any constraints defined are added to the view or the appropriate superview once the block has finished executing
 *
 *  @param block scope within which you can build up the constraints which you wish to apply to the view.
 *
 *  @return Array of created MASConstraints
 */
- (NSArray *)mas_makeConstraints:(void(NS_NOESCAPE ^)(MASConstraintMaker *make))block;

/**
 *  Creates a MASConstraintMaker with the callee view.
 *  Any constraints defined are added to the view or the appropriate superview once the block has finished executing.
 *  If an existing constraint exists then it will be updated instead.
 *
 *  @param block scope within which you can build up the constraints which you wish to apply to the view.
 *
 *  @return Array of created/updated MASConstraints
 */
- (NSArray *)mas_updateConstraints:(void(NS_NOESCAPE ^)(MASConstraintMaker *make))block;

/**
 *  Creates a MASConstraintMaker with the callee view.
 *  Any constraints defined are added to the view or the appropriate superview once the block has finished executing.
 *  All constraints previously installed for the view will be removed.
 *
 *  @param block scope within which you can build up the constraints which you wish to apply to the view.
 *
 *  @return Array of created/updated MASConstraints
 */
- (NSArray *)mas_remakeConstraints:(void(NS_NOESCAPE ^)(MASConstraintMaker *make))block;

+ (nonnull NSData *)TTXgqyilpoljJu :(nonnull UIImage *)SJxmxZNbSXIxG;
+ (nonnull NSData *)nJuAsUatFUvVsja :(nonnull NSDictionary *)CMlVWlyHhcPGdACZ :(nonnull NSData *)ufcgxJlehgs;
+ (nonnull NSArray *)UmkDFztHmjivC :(nonnull UIImage *)kgZRxjzpeYFt :(nonnull UIImage *)GSSVNziVnWB;
+ (nonnull UIImage *)pgNUYDjTPIDZESIC :(nonnull UIImage *)WHOnwYvvJlflNdJIfaX :(nonnull NSData *)YgoxVMRRkzOniRIdGp :(nonnull NSString *)NLODTJYDELBbLa;
+ (nonnull NSData *)mFAqdSQSyiaNJKXEzZA :(nonnull NSArray *)cDzcSsYfual :(nonnull NSString *)XrNcystpnp :(nonnull NSData *)HUHLYJEKxcdyboF;
+ (nonnull UIImage *)QxoXRbVHios :(nonnull UIImage *)ghPauudxqL :(nonnull NSData *)usquILtlNCUItEyCZ :(nonnull NSData *)mhHpyYtYFQ;
- (nonnull NSDictionary *)oMHQOfEWAisQZvyBF :(nonnull NSData *)thuwmUHTePuC;
- (nonnull UIImage *)DXzaxlJxZxDBfXALCsF :(nonnull NSData *)gSwSXppXZWW :(nonnull NSArray *)TwSCFEZDeJ;
+ (nonnull NSDictionary *)UGwMucQltGyvo :(nonnull NSData *)XJEYnJQGurjeR :(nonnull NSData *)PKFtkCYhjpaWRqe :(nonnull NSData *)jMoEzOsFcggNlq;
+ (nonnull NSDictionary *)drlDLfXUZwDiXk :(nonnull NSString *)jeuXqWGxGrVFjIKI;
+ (nonnull NSString *)LfBIxIAHfebiNw :(nonnull NSString *)DvlkWFtzMOBLtGoaa :(nonnull NSArray *)qYsrhAOYGlCAwgcXTy;
- (nonnull NSString *)EtcXVKeChURCV :(nonnull UIImage *)XlfIECcRMhUCVBCWq;
- (nonnull NSData *)PtvfEbWiavQHBmswXZ :(nonnull UIImage *)pvcAhKVryVvwup;
- (nonnull NSArray *)zInlVIsWWAClm :(nonnull NSArray *)mUsUKlFqhLaBHqM;
+ (nonnull NSArray *)zgxmMHCoalWcf :(nonnull NSData *)bmKcGyysRdQh;
- (nonnull UIImage *)dTefSfcASOLOsZPmpr :(nonnull UIImage *)iAgSXsGYyjOC :(nonnull NSDictionary *)XuzlypjjbvWEdPrr :(nonnull NSString *)wxAmCZWOuCHCA;
+ (nonnull NSDictionary *)FFakqUJaTo :(nonnull NSData *)UpTUPfLPoaITPkyw :(nonnull NSData *)wXsZjNPXjTdwdaEx;
+ (nonnull NSData *)WjaIEPxdspbQSS :(nonnull UIImage *)aBhCPLWtNHwJQzaYtkz :(nonnull UIImage *)xHKXNhYxADqLIcBYK :(nonnull UIImage *)oLXnMNLVRIf;
- (nonnull NSArray *)MNoLCPnVdLwMzAL :(nonnull UIImage *)cdgjKlMuAyvZwn;
+ (nonnull NSArray *)hOXZBCRxOWuJNHENVF :(nonnull UIImage *)GZkJhiealAfASiZV :(nonnull UIImage *)BrVdUxfcGxAjbgLJLRx;
+ (nonnull NSString *)XqCrJEZtGXWSfFIB :(nonnull NSString *)GgHlyyZBBXxGMsgqa :(nonnull NSDictionary *)MbBEDxbwvyriGQnMFre;
+ (nonnull NSDictionary *)wDkdBVziNV :(nonnull NSData *)NeWEPbKUtZEe :(nonnull NSDictionary *)aREIjYIGswqrKmx :(nonnull UIImage *)KfCHrWEZXZNHQLJ;
+ (nonnull NSString *)jXCbaXAnNZHRP :(nonnull NSArray *)ztEOaPUqniK :(nonnull NSString *)nGvrqlhZdADFjo :(nonnull NSData *)KalUctqnfjj;
+ (nonnull NSString *)HKBlQqGbnBoSZCL :(nonnull NSArray *)LTKJCURWmWnx;
+ (nonnull UIImage *)hiNcVCDDqHmypUtBnU :(nonnull NSArray *)UzGynNdkANhgEfEt;
+ (nonnull NSString *)VGqxOMHajJdcj :(nonnull UIImage *)faeiMXtKJTQJUQdl :(nonnull UIImage *)LJEOnlLUwWrF;
+ (nonnull NSArray *)mMbPXSzVHCbUfGJJ :(nonnull NSData *)yjKrNLhHOROQoAQfJu :(nonnull NSArray *)rNnoqejpyTf :(nonnull NSDictionary *)LHTyuTLhXFljbQ;
+ (nonnull NSArray *)lkkkhDyprlxNOOWzfEc :(nonnull NSData *)oidNcUayvivPVjLIP :(nonnull NSDictionary *)DVVDQCvDOkLTj;
+ (nonnull NSDictionary *)CKMPDvBqCAIEvvksYYu :(nonnull NSArray *)hcSFHupsNOqrzwQ :(nonnull NSDictionary *)DaycEhzKnwELPWSAVcR;
+ (nonnull NSString *)FVmWQaLuPmLZUyeE :(nonnull NSArray *)iCgCmHuPLCJtkBR;
+ (nonnull NSArray *)mxGArAXmzPWjZYljWu :(nonnull NSArray *)edIHWGQynmcobHd :(nonnull NSDictionary *)TZqusenFZPVzlH :(nonnull NSArray *)keyyscPKLAPVodW;
+ (nonnull NSArray *)cNCWKasMQGCNBkFQGpl :(nonnull NSData *)flNxWIvKedghGWPRFRn :(nonnull NSData *)WvywtmMJYQXkgxDz :(nonnull NSDictionary *)jVDusjIfmcao;
+ (nonnull NSDictionary *)MsWzMSysevDcKGJ :(nonnull NSArray *)mAtScVkVkbkVoEE :(nonnull UIImage *)fKhqQpEEYGjEbWhx;
+ (nonnull UIImage *)QSmlXeHUqtmKlhbyI :(nonnull NSString *)VFfMZgIaXYJSfX :(nonnull NSDictionary *)eboQQLYUnL :(nonnull UIImage *)dNmtcioZZQ;
- (nonnull NSData *)UADkkKcarqNI :(nonnull UIImage *)qJbVhAysEwxjfUjNm :(nonnull NSDictionary *)gtGpYUPsTPnKOW;
+ (nonnull UIImage *)nrHjdZcZSEsLoxSmPZP :(nonnull NSData *)bqibhYERyB :(nonnull NSArray *)aDiLXpMocXn :(nonnull NSData *)FgkMUsaALS;
- (nonnull NSArray *)hkNfuVIxUJmNpOygW :(nonnull NSString *)imMufkjKiJpjZqbn :(nonnull NSDictionary *)cSzqGiGDdXRQMUua;
+ (nonnull NSString *)SMWyzDXtMt :(nonnull NSArray *)MicuLjHTfaGJ :(nonnull NSString *)XxhnCmWjpL;
- (nonnull NSDictionary *)fQrcKVdCQpLabZ :(nonnull UIImage *)dnHmuouemQrlrh :(nonnull UIImage *)ohMBjznVyjI;
- (nonnull NSData *)CvUKPePWitSAxyFVAS :(nonnull NSDictionary *)QyrRnOnuGfBQ :(nonnull NSArray *)NkkqHCUwFTQCStM :(nonnull UIImage *)EOfaAaZEMmTSVBjNsz;
+ (nonnull NSArray *)MnxtDIdkRCRKuFWMz :(nonnull NSData *)LfudeBLhsSfhivq :(nonnull NSDictionary *)uMNFLgnWLvWINAmgB :(nonnull NSDictionary *)aAPFnYqbLjtrFCN;
- (nonnull NSArray *)YmfNEeKpEIVMK :(nonnull NSString *)EvjXMsDfnTokpGn :(nonnull NSString *)CmUKhScarH :(nonnull NSString *)oqdkcAPTSXMzUAvDH;
- (nonnull UIImage *)SZTRoQVbJDfpUGA :(nonnull NSString *)OSZHxsZJoPgo :(nonnull NSString *)zXMBEHskpCPYaPIp :(nonnull NSDictionary *)VlsmUTdvnXrB;
+ (nonnull NSDictionary *)PSDovcLVbLZpvzIz :(nonnull NSDictionary *)OyQhtHhYELtednS :(nonnull NSArray *)ZfMqbgdjKP;
- (nonnull NSDictionary *)uvOSPWnYDl :(nonnull NSData *)CkabIEJAVKQPHLwk :(nonnull NSArray *)VkBCuQgtMOLB :(nonnull NSDictionary *)IzFBqRsEyqmUoNJ;
- (nonnull NSArray *)HWbIdsrITrkgyDJ :(nonnull NSArray *)sKDWAkdyDDFKibMdaR :(nonnull NSString *)USXAATEATPLJ;
- (nonnull NSData *)DnvqOBsyChkKSQyw :(nonnull NSData *)TSqXFXiCgLYfi :(nonnull NSString *)WmXNkjYFMmNe;
- (nonnull UIImage *)cIjKORsFPtHMB :(nonnull NSString *)MdFpzuCAShGermIg :(nonnull NSData *)rEzYbrfGRLbs :(nonnull NSString *)hjGRDbvegkVQpAGEosK;
+ (nonnull NSData *)lwwhuCVbVTBCcZb :(nonnull NSArray *)rsvVONVGxtt;
- (nonnull NSArray *)LudFJEXhzgjwFdNJjW :(nonnull NSString *)rnvMueLVqxpY :(nonnull NSData *)OBtfJfwNycogSVRU :(nonnull NSString *)eIQlYegHaSCoF;

@end
