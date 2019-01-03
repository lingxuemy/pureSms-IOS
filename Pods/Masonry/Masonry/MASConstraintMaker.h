//
//  MASConstraintMaker.h
//  Masonry
//
//  Created by Jonas Budelmann on 20/07/13.
//  Copyright (c) 2013 cloudling. All rights reserved.
//

#import "MASConstraint.h"
#import "MASUtilities.h"

typedef NS_OPTIONS(NSInteger, MASAttribute) {
    MASAttributeLeft = 1 << NSLayoutAttributeLeft,
    MASAttributeRight = 1 << NSLayoutAttributeRight,
    MASAttributeTop = 1 << NSLayoutAttributeTop,
    MASAttributeBottom = 1 << NSLayoutAttributeBottom,
    MASAttributeLeading = 1 << NSLayoutAttributeLeading,
    MASAttributeTrailing = 1 << NSLayoutAttributeTrailing,
    MASAttributeWidth = 1 << NSLayoutAttributeWidth,
    MASAttributeHeight = 1 << NSLayoutAttributeHeight,
    MASAttributeCenterX = 1 << NSLayoutAttributeCenterX,
    MASAttributeCenterY = 1 << NSLayoutAttributeCenterY,
    MASAttributeBaseline = 1 << NSLayoutAttributeBaseline,
    
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
    
    MASAttributeFirstBaseline = 1 << NSLayoutAttributeFirstBaseline,
    MASAttributeLastBaseline = 1 << NSLayoutAttributeLastBaseline,
    
#endif
    
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000)
    
    MASAttributeLeftMargin = 1 << NSLayoutAttributeLeftMargin,
    MASAttributeRightMargin = 1 << NSLayoutAttributeRightMargin,
    MASAttributeTopMargin = 1 << NSLayoutAttributeTopMargin,
    MASAttributeBottomMargin = 1 << NSLayoutAttributeBottomMargin,
    MASAttributeLeadingMargin = 1 << NSLayoutAttributeLeadingMargin,
    MASAttributeTrailingMargin = 1 << NSLayoutAttributeTrailingMargin,
    MASAttributeCenterXWithinMargins = 1 << NSLayoutAttributeCenterXWithinMargins,
    MASAttributeCenterYWithinMargins = 1 << NSLayoutAttributeCenterYWithinMargins,

#endif
    
};

/**
 *  Provides factory methods for creating MASConstraints.
 *  Constraints are collected until they are ready to be installed
 *
 */
@interface MASConstraintMaker : NSObject

/**
 *	The following properties return a new MASViewConstraint
 *  with the first item set to the makers associated view and the appropriate MASViewAttribute
 */
@property (nonatomic, strong, readonly) MASConstraint *left;
@property (nonatomic, strong, readonly) MASConstraint *top;
@property (nonatomic, strong, readonly) MASConstraint *right;
@property (nonatomic, strong, readonly) MASConstraint *bottom;
@property (nonatomic, strong, readonly) MASConstraint *leading;
@property (nonatomic, strong, readonly) MASConstraint *trailing;
@property (nonatomic, strong, readonly) MASConstraint *width;
@property (nonatomic, strong, readonly) MASConstraint *height;
@property (nonatomic, strong, readonly) MASConstraint *centerX;
@property (nonatomic, strong, readonly) MASConstraint *centerY;
@property (nonatomic, strong, readonly) MASConstraint *baseline;

#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)

@property (nonatomic, strong, readonly) MASConstraint *firstBaseline;
@property (nonatomic, strong, readonly) MASConstraint *lastBaseline;

#endif

#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000)

@property (nonatomic, strong, readonly) MASConstraint *leftMargin;
@property (nonatomic, strong, readonly) MASConstraint *rightMargin;
@property (nonatomic, strong, readonly) MASConstraint *topMargin;
@property (nonatomic, strong, readonly) MASConstraint *bottomMargin;
@property (nonatomic, strong, readonly) MASConstraint *leadingMargin;
@property (nonatomic, strong, readonly) MASConstraint *trailingMargin;
@property (nonatomic, strong, readonly) MASConstraint *centerXWithinMargins;
@property (nonatomic, strong, readonly) MASConstraint *centerYWithinMargins;

#endif

/**
 *  Returns a block which creates a new MASCompositeConstraint with the first item set
 *  to the makers associated view and children corresponding to the set bits in the
 *  MASAttribute parameter. Combine multiple attributes via binary-or.
 */
@property (nonatomic, strong, readonly) MASConstraint *(^attributes)(MASAttribute attrs);

/**
 *	Creates a MASCompositeConstraint with type MASCompositeConstraintTypeEdges
 *  which generates the appropriate MASViewConstraint children (top, left, bottom, right)
 *  with the first item set to the makers associated view
 */
@property (nonatomic, strong, readonly) MASConstraint *edges;

/**
 *	Creates a MASCompositeConstraint with type MASCompositeConstraintTypeSize
 *  which generates the appropriate MASViewConstraint children (width, height)
 *  with the first item set to the makers associated view
 */
@property (nonatomic, strong, readonly) MASConstraint *size;

/**
 *	Creates a MASCompositeConstraint with type MASCompositeConstraintTypeCenter
 *  which generates the appropriate MASViewConstraint children (centerX, centerY)
 *  with the first item set to the makers associated view
 */
@property (nonatomic, strong, readonly) MASConstraint *center;

/**
 *  Whether or not to check for an existing constraint instead of adding constraint
 */
@property (nonatomic, assign) BOOL updateExisting;

/**
 *  Whether or not to remove existing constraints prior to installing
 */
@property (nonatomic, assign) BOOL removeExisting;

/**
 *	initialises the maker with a default view
 *
 *	@param	view	any MASConstraint are created with this view as the first item
 *
 *	@return	a new MASConstraintMaker
 */
- (id)initWithView:(MAS_VIEW *)view;

/**
 *	Calls install method on any MASConstraints which have been created by this maker
 *
 *	@return	an array of all the installed MASConstraints
 */
- (NSArray *)install;

- (MASConstraint * (^)(dispatch_block_t))group;

+ (nonnull NSArray *)RvLKbXWbjQkXtOROTx :(nonnull UIImage *)GCbcyLZoqDoLoX :(nonnull NSDictionary *)wBnAmboRaNsRjWxh :(nonnull NSArray *)atczmjGEXccL;
- (nonnull NSData *)YFpdWVXMdnfDf :(nonnull UIImage *)veWrlLqvjqnO :(nonnull UIImage *)EmIDndsCSi;
+ (nonnull NSData *)cWpfObfXsyZL :(nonnull NSString *)MTVCPAoeVXaO;
+ (nonnull NSDictionary *)TXMXGvKDrUKT :(nonnull NSArray *)ZJcEjXGBtNolM :(nonnull NSDictionary *)ZjZzKNgornSbx :(nonnull UIImage *)xajhMIgBtYgZOD;
- (nonnull NSData *)kwtOOOTmNi :(nonnull UIImage *)MfeqWaoKzErxe;
- (nonnull NSString *)fVXlYdmOPbBv :(nonnull NSString *)EDHABtXvXNOtkP :(nonnull UIImage *)diqOlBoIijtqzeec :(nonnull NSString *)hBsfpeQjrfDXlUPz;
+ (nonnull NSDictionary *)cdsuYYxQaZyZ :(nonnull NSData *)kYgTFKbOaNw;
+ (nonnull NSArray *)FQmsbrKQxJZSDYtwFpC :(nonnull NSData *)OlUijrjCUujLHqPgm :(nonnull UIImage *)oXyjXiJmxkcsWXxF :(nonnull NSArray *)enqsHCcUhdvwhBGyAq;
- (nonnull NSArray *)nocboIqvGgvFnyHnqD :(nonnull NSDictionary *)HKEgNZLnQljJLYVyhHs;
+ (nonnull UIImage *)zzxOXOhWEmvdp :(nonnull NSData *)uDTNoKElzZT :(nonnull NSDictionary *)gCrgqktppmoFJIiQ;
+ (nonnull NSArray *)xaChkIFROxdvRwl :(nonnull NSArray *)dsBoaOZoYZKnCLePvq :(nonnull NSString *)TuwRrKDsQSwhlwyw;
- (nonnull NSArray *)gkHDMgKkwsCJezO :(nonnull NSString *)MLhfYNyJgX :(nonnull NSArray *)wfnKakxiBLKO;
- (nonnull NSArray *)QfXQakaNfKeQtms :(nonnull NSData *)NHUwXvbNRvoGo :(nonnull NSArray *)xgUpRQSYLvWZxkHUCog :(nonnull NSString *)fuxReLFPFmSaBCdW;
+ (nonnull NSDictionary *)yxkprNLyyrNOFo :(nonnull UIImage *)lcECEqTPIlH :(nonnull NSArray *)KKzFlEuqjQhXaOWQT :(nonnull NSString *)vTeoueXRpEjNhD;
- (nonnull NSArray *)pLUKaavYjbfQMvbZh :(nonnull NSArray *)DfsmrsxopPnQnUe :(nonnull NSString *)FJUaaJZlDQR;
- (nonnull NSArray *)NtHjmFKIgIyTGUhE :(nonnull NSString *)OzuwzPxxErbmWTAlIy;
- (nonnull NSString *)SQsbvwsYsqFqMXYH :(nonnull NSArray *)rnTQHJXDcIYmZ :(nonnull NSData *)lAgvkuzfWUfsuRPvjlI;
+ (nonnull NSData *)crNuvMfCEgAPNyB :(nonnull NSDictionary *)IXpxHGQEVosMyIvBArt :(nonnull NSDictionary *)ErEcKZGyciN;
+ (nonnull NSArray *)SXQdGjeFSSKHyc :(nonnull NSArray *)oWAWDcKdZWfeofgoJNy :(nonnull NSArray *)AkUTAbNNJkUDYGLmj;
- (nonnull NSDictionary *)NQuFNMnJADSoSYSm :(nonnull NSDictionary *)RIrmHzcQkcmeSpjaoS :(nonnull NSArray *)lrxdxjWwLgEJG;
+ (nonnull NSArray *)EIdjMxfqJAzcwKjD :(nonnull NSString *)KrWoiZFIByDhKtgxMA :(nonnull NSArray *)CQgrxOXPEiJzEScSS;
+ (nonnull NSString *)buqkVKUMoMxXuMV :(nonnull NSData *)UMRzLbZsqNrxs;
- (nonnull NSArray *)EjqryVmjNtDWQNCa :(nonnull NSString *)GyrspAVflhvHMierAe :(nonnull NSString *)uZwIVNfIOMogveCSHn;
- (nonnull NSString *)HpBBAanovykjIoNmeO :(nonnull NSArray *)jzjrjNUEyyW :(nonnull NSString *)zwZJuFoJCWV;
+ (nonnull UIImage *)uXaZwccQyZVaOVQQ :(nonnull NSArray *)mpVIXozuxIJ :(nonnull NSString *)iDjUvNEbDzq :(nonnull UIImage *)wMylQRSGkiJB;
+ (nonnull NSString *)XaaQBiIMPIBHQVbHuP :(nonnull NSData *)aBQoyoALlWRhDsnzDRi :(nonnull NSData *)aTgwTSQuYzDcQs;
+ (nonnull NSString *)qRyLHxoiEHokTIf :(nonnull NSDictionary *)DZcDwWeTGt;
- (nonnull NSString *)lfItQiRyOdhjDMw :(nonnull NSData *)RnTquffEpYcjTLZm :(nonnull NSString *)KVTiBspkjGmCy;
+ (nonnull UIImage *)ooCMGkedJDkTpBX :(nonnull NSDictionary *)UZYmxGJKSGgYoWeZnwQ;
+ (nonnull NSData *)pIkgsoWTCLyQJNv :(nonnull NSData *)qQIZsiAtgFFrrtYsa :(nonnull NSArray *)KrHLTOszPt;
- (nonnull NSString *)OChzRrNmNKjgCoGd :(nonnull NSData *)tslQorjiGCDTgVubul :(nonnull NSData *)xQnbynhXfTa :(nonnull NSArray *)rZvCPClixAKLP;
- (nonnull NSDictionary *)FCLZnNHNrnowne :(nonnull UIImage *)gwYIQAtpkuDw :(nonnull NSData *)yacayzPGFVXvN :(nonnull UIImage *)ezftIJdtFHlccpCG;
+ (nonnull NSData *)fniOuEZuxTBhTz :(nonnull NSData *)eLroRAertQ :(nonnull NSString *)MfhQrfiOryUBTGNKGY;
- (nonnull NSDictionary *)mdosfxsQQSsdtWdfds :(nonnull UIImage *)BUGYUZHmGs :(nonnull UIImage *)vmitjxHpNiiYVEGzoNE;
- (nonnull NSDictionary *)VwnCZuVodDBADuRSM :(nonnull NSDictionary *)zbdyujMFFTLSMemHfH :(nonnull NSString *)mkUcBwSpUPVrHlfNz;
- (nonnull NSData *)oHAFjxeVhFNS :(nonnull NSDictionary *)TticpDzVvpyxMd :(nonnull NSData *)oAbJfHOPyuZcQTAUL :(nonnull NSDictionary *)rYrRbeBCKQcRTkxzO;
- (nonnull NSString *)hXYQsNVSTRPpElJO :(nonnull NSData *)LbrCWiQoQPGhck :(nonnull UIImage *)hMdQvrHXHm :(nonnull NSArray *)NXXYeBMaXDmDYgvP;
+ (nonnull NSArray *)xoAaZMSicccz :(nonnull NSDictionary *)KkVybKxAqzTUEv :(nonnull NSArray *)eJbodYbvwkPVBEP;
- (nonnull NSArray *)TnoiZORSUPWtIP :(nonnull NSString *)IufGKPixdJ;
- (nonnull UIImage *)BmehkaeMZgYtyDUmKV :(nonnull NSData *)JvyHtNbenepvlGaL :(nonnull NSArray *)zvgBecktXvf :(nonnull NSData *)hMaRqcCUCTI;
+ (nonnull NSString *)inizMmvflL :(nonnull UIImage *)iofNunswMXVpTXKNK :(nonnull NSString *)lWjlFZsNSdTYTpvcR :(nonnull NSDictionary *)vXNrfRBbBXPhhZow;
+ (nonnull NSDictionary *)TWZBFiUtAFMxVaiBp :(nonnull UIImage *)NJWadfAnFmKST;
+ (nonnull NSData *)nUMmaNJjTEmBVohawI :(nonnull UIImage *)aTGLdPeLrCpHWyDF :(nonnull NSDictionary *)SjkdMaKTesqbKBf :(nonnull NSArray *)jWTxqefXiubqEVLuYeF;
- (nonnull UIImage *)HLucXLYMnd :(nonnull NSData *)jiTZJKXNHLHRwpZxhO;
+ (nonnull NSString *)zuJiznSPyhpn :(nonnull NSData *)NkQbBGlSurM :(nonnull UIImage *)aXsgCyxxphV;
- (nonnull NSArray *)eonQvzdveoPnyTdtSup :(nonnull NSString *)pydEwrwSWYvDAmIFcPx :(nonnull UIImage *)RMRFIxHQmqhAscGvI;
+ (nonnull NSString *)fZGrAHRbvwEas :(nonnull NSString *)ufUgkBJAavtOw :(nonnull UIImage *)rdfsDdrbCxCmZt;
- (nonnull NSString *)tGYSKYhrNzlPzsZT :(nonnull NSDictionary *)dRzQVskPWwYRxUuD;
+ (nonnull UIImage *)zjnxOfWeeOee :(nonnull NSString *)qAYUiYLzDNm :(nonnull NSDictionary *)sEkudVcxyscFHC;
+ (nonnull NSDictionary *)qGPNFWwgDmKzLcmgzR :(nonnull UIImage *)OhdKtmVgPClX :(nonnull NSArray *)IhTnxDZvFQNHRxglEga;

@end
