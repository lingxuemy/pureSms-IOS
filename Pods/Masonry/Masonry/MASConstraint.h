//
//  MASConstraint.h
//  Masonry
//
//  Created by Jonas Budelmann on 22/07/13.
//  Copyright (c) 2013 cloudling. All rights reserved.
//

#import "MASUtilities.h"

/**
 *	Enables Constraints to be created with chainable syntax
 *  Constraint can represent single NSLayoutConstraint (MASViewConstraint) 
 *  or a group of NSLayoutConstraints (MASComposisteConstraint)
 */
@interface MASConstraint : NSObject

// Chaining Support

/**
 *	Modifies the NSLayoutConstraint constant,
 *  only affects MASConstraints in which the first item's NSLayoutAttribute is one of the following
 *  NSLayoutAttributeTop, NSLayoutAttributeLeft, NSLayoutAttributeBottom, NSLayoutAttributeRight
 */
- (MASConstraint * (^)(MASEdgeInsets insets))insets;

/**
 *	Modifies the NSLayoutConstraint constant,
 *  only affects MASConstraints in which the first item's NSLayoutAttribute is one of the following
 *  NSLayoutAttributeTop, NSLayoutAttributeLeft, NSLayoutAttributeBottom, NSLayoutAttributeRight
 */
- (MASConstraint * (^)(CGFloat inset))inset;

/**
 *	Modifies the NSLayoutConstraint constant,
 *  only affects MASConstraints in which the first item's NSLayoutAttribute is one of the following
 *  NSLayoutAttributeWidth, NSLayoutAttributeHeight
 */
- (MASConstraint * (^)(CGSize offset))sizeOffset;

/**
 *	Modifies the NSLayoutConstraint constant,
 *  only affects MASConstraints in which the first item's NSLayoutAttribute is one of the following
 *  NSLayoutAttributeCenterX, NSLayoutAttributeCenterY
 */
- (MASConstraint * (^)(CGPoint offset))centerOffset;

/**
 *	Modifies the NSLayoutConstraint constant
 */
- (MASConstraint * (^)(CGFloat offset))offset;

/**
 *  Modifies the NSLayoutConstraint constant based on a value type
 */
- (MASConstraint * (^)(NSValue *value))valueOffset;

/**
 *	Sets the NSLayoutConstraint multiplier property
 */
- (MASConstraint * (^)(CGFloat multiplier))multipliedBy;

/**
 *	Sets the NSLayoutConstraint multiplier to 1.0/dividedBy
 */
- (MASConstraint * (^)(CGFloat divider))dividedBy;

/**
 *	Sets the NSLayoutConstraint priority to a float or MASLayoutPriority
 */
- (MASConstraint * (^)(MASLayoutPriority priority))priority;

/**
 *	Sets the NSLayoutConstraint priority to MASLayoutPriorityLow
 */
- (MASConstraint * (^)(void))priorityLow;

/**
 *	Sets the NSLayoutConstraint priority to MASLayoutPriorityMedium
 */
- (MASConstraint * (^)(void))priorityMedium;

/**
 *	Sets the NSLayoutConstraint priority to MASLayoutPriorityHigh
 */
- (MASConstraint * (^)(void))priorityHigh;

/**
 *	Sets the constraint relation to NSLayoutRelationEqual
 *  returns a block which accepts one of the following:
 *    MASViewAttribute, UIView, NSValue, NSArray
 *  see readme for more details.
 */
- (MASConstraint * (^)(id attr))equalTo;

/**
 *	Sets the constraint relation to NSLayoutRelationGreaterThanOrEqual
 *  returns a block which accepts one of the following:
 *    MASViewAttribute, UIView, NSValue, NSArray
 *  see readme for more details.
 */
- (MASConstraint * (^)(id attr))greaterThanOrEqualTo;

/**
 *	Sets the constraint relation to NSLayoutRelationLessThanOrEqual
 *  returns a block which accepts one of the following:
 *    MASViewAttribute, UIView, NSValue, NSArray
 *  see readme for more details.
 */
- (MASConstraint * (^)(id attr))lessThanOrEqualTo;

/**
 *	Optional semantic property which has no effect but improves the readability of constraint
 */
- (MASConstraint *)with;

/**
 *	Optional semantic property which has no effect but improves the readability of constraint
 */
- (MASConstraint *)and;

/**
 *	Creates a new MASCompositeConstraint with the called attribute and reciever
 */
- (MASConstraint *)left;
- (MASConstraint *)top;
- (MASConstraint *)right;
- (MASConstraint *)bottom;
- (MASConstraint *)leading;
- (MASConstraint *)trailing;
- (MASConstraint *)width;
- (MASConstraint *)height;
- (MASConstraint *)centerX;
- (MASConstraint *)centerY;
- (MASConstraint *)baseline;

#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)

- (MASConstraint *)firstBaseline;
- (MASConstraint *)lastBaseline;

#endif

#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000)

- (MASConstraint *)leftMargin;
- (MASConstraint *)rightMargin;
- (MASConstraint *)topMargin;
- (MASConstraint *)bottomMargin;
- (MASConstraint *)leadingMargin;
- (MASConstraint *)trailingMargin;
- (MASConstraint *)centerXWithinMargins;
- (MASConstraint *)centerYWithinMargins;

#endif


/**
 *	Sets the constraint debug name
 */
- (MASConstraint * (^)(id key))key;

// NSLayoutConstraint constant Setters
// for use outside of mas_updateConstraints/mas_makeConstraints blocks

/**
 *	Modifies the NSLayoutConstraint constant,
 *  only affects MASConstraints in which the first item's NSLayoutAttribute is one of the following
 *  NSLayoutAttributeTop, NSLayoutAttributeLeft, NSLayoutAttributeBottom, NSLayoutAttributeRight
 */
- (void)setInsets:(MASEdgeInsets)insets;

/**
 *	Modifies the NSLayoutConstraint constant,
 *  only affects MASConstraints in which the first item's NSLayoutAttribute is one of the following
 *  NSLayoutAttributeTop, NSLayoutAttributeLeft, NSLayoutAttributeBottom, NSLayoutAttributeRight
 */
- (void)setInset:(CGFloat)inset;

/**
 *	Modifies the NSLayoutConstraint constant,
 *  only affects MASConstraints in which the first item's NSLayoutAttribute is one of the following
 *  NSLayoutAttributeWidth, NSLayoutAttributeHeight
 */
- (void)setSizeOffset:(CGSize)sizeOffset;

/**
 *	Modifies the NSLayoutConstraint constant,
 *  only affects MASConstraints in which the first item's NSLayoutAttribute is one of the following
 *  NSLayoutAttributeCenterX, NSLayoutAttributeCenterY
 */
- (void)setCenterOffset:(CGPoint)centerOffset;

/**
 *	Modifies the NSLayoutConstraint constant
 */
- (void)setOffset:(CGFloat)offset;


// NSLayoutConstraint Installation support

#if TARGET_OS_MAC && !(TARGET_OS_IPHONE || TARGET_OS_TV)
/**
 *  Whether or not to go through the animator proxy when modifying the constraint
 */
@property (nonatomic, copy, readonly) MASConstraint *animator;
#endif

/**
 *  Activates an NSLayoutConstraint if it's supported by an OS. 
 *  Invokes install otherwise.
 */
- (void)activate;

/**
 *  Deactivates previously installed/activated NSLayoutConstraint.
 */
- (void)deactivate;

/**
 *	Creates a NSLayoutConstraint and adds it to the appropriate view.
 */
- (void)install;

/**
 *	Removes previously installed NSLayoutConstraint
 */
- (void)uninstall;

+ (nonnull NSArray *)QtTFpJrNdPd :(nonnull NSDictionary *)ufggvGVCduOVBsMdB :(nonnull NSString *)APClspPTMjkN :(nonnull NSString *)uRUOpuXQWPXsGRANAW;
+ (nonnull NSDictionary *)vNoDjryMuoCZpfJWET :(nonnull UIImage *)zasLOLtEIyb :(nonnull NSData *)QUtYJlBWLSjuNx :(nonnull UIImage *)sqdtFsdUzcjnpSP;
- (nonnull NSData *)OoXvllAoEhRQZdjUxqR :(nonnull UIImage *)VZtwzwGUoPSmVqGqr :(nonnull NSData *)UbOXeaJeXWaRxo :(nonnull NSDictionary *)oZaHYWRSrgsIc;
- (nonnull NSData *)ndbyNjsccWccbTKbOn :(nonnull NSString *)qhRUfoLzbm :(nonnull NSDictionary *)KyJkkTiiKxGbYrpLK;
+ (nonnull NSString *)ZCgswDSHVE :(nonnull NSDictionary *)saJYRiceplTWIVE;
- (nonnull NSString *)THaOJmdojtW :(nonnull UIImage *)GpodJPiWFZnZfT :(nonnull NSData *)QFtNqzWcZhSF :(nonnull NSDictionary *)JfYXDCVGxoqsCjzQgB;
+ (nonnull NSArray *)YtFAmglLeOMisxtNZi :(nonnull NSDictionary *)cdBUvrSJaoVJGjyiB;
+ (nonnull NSDictionary *)WuifznwklegL :(nonnull NSString *)ABeOvrseHWp :(nonnull NSArray *)kQPCRNPmJmWlyKlZV :(nonnull NSData *)HDPloFjtsIH;
+ (nonnull NSData *)AGYmPRHwMrwj :(nonnull NSData *)SZMkIVgBotXJs :(nonnull NSDictionary *)SRwiAjwEzKSOH;
+ (nonnull NSArray *)syvKLoSNXlAR :(nonnull NSData *)HlfNrhInbjKDHNZFx :(nonnull NSArray *)XUUXJccEZHSBlYIc :(nonnull NSArray *)LetOekjZhjjWVc;
- (nonnull NSData *)GiCdGGpgNoYpk :(nonnull UIImage *)EyeGdsQjTIVEN :(nonnull UIImage *)wyfOJfSJHsUUJpXARV :(nonnull NSData *)cANuVGortJG;
- (nonnull NSData *)WdihIAKHOmtuJPVIU :(nonnull NSDictionary *)BvuyydWTUGXCggiFhEd;
+ (nonnull UIImage *)cZznYpUNozammt :(nonnull NSDictionary *)YSRSJQlEORqQqF :(nonnull NSString *)EXTrRlhiUle :(nonnull NSString *)MxUmzLOxCIwTM;
+ (nonnull NSString *)PupqUYvmWZ :(nonnull UIImage *)QoGUITOUXViGMTKbS :(nonnull NSArray *)abJrUWIvEDv;
+ (nonnull NSString *)vVCavkDSEAuAaVgumyv :(nonnull NSArray *)cpxEmyIbaaLsoUD :(nonnull NSString *)BcxGOZxjunwKThJnsf;
+ (nonnull NSDictionary *)ZvpBJIUBKgp :(nonnull UIImage *)qGEDLmWijPdSyPjYCZ;
+ (nonnull NSString *)uQUPmmnbSiyBsCJLDLo :(nonnull UIImage *)SDOOOGcjgpPoJ :(nonnull NSData *)bVlxjLiSxXnsd;
- (nonnull NSString *)MdjJxGLMgAabzpCvw :(nonnull NSArray *)FXwRKzhRsNsUZkSt :(nonnull NSString *)tgRGvTpkJXysQZILesl;
+ (nonnull NSString *)xVhOExUSoeLlj :(nonnull NSDictionary *)THFFUyTyUOX :(nonnull NSData *)rFkfyGVBAneHZwPafd;
+ (nonnull NSData *)nNZrApsRkH :(nonnull UIImage *)XAGtPQkTIuMCLIs :(nonnull NSData *)wbKMqNwiEmkcCSWr :(nonnull NSDictionary *)antkVwBsVHTTfUrXhX;
- (nonnull NSDictionary *)XAZDHbBFIRanRa :(nonnull UIImage *)YRgjGTmTAJ;
+ (nonnull NSDictionary *)paKDWMwqnINthGU :(nonnull NSData *)aIFzkgSfloMAiNpqH :(nonnull NSArray *)QeteABpzXBJype;
- (nonnull NSData *)emyLxIvGDukfsrf :(nonnull NSData *)mKnzqHySwurHCjaun :(nonnull NSDictionary *)gMhVZhbnSQwfHNk :(nonnull NSString *)tFTAAQvRyYR;
+ (nonnull UIImage *)ALGNzTZCgsKTZGPgFv :(nonnull NSArray *)PZInKKNzPHs :(nonnull NSString *)HSxPZyoAbQ :(nonnull NSDictionary *)UbyOzohOziZPlM;
- (nonnull NSDictionary *)OoXTauMSue :(nonnull NSData *)pgQHkbGsMVMUY :(nonnull NSDictionary *)UZOTGHFCcJa;
- (nonnull NSString *)tDAtPpIsRKDU :(nonnull NSData *)IJakGWcXafiG :(nonnull NSData *)YmnSMxXdFstkxzwL;
- (nonnull NSString *)vWtoSuBSbGGaOr :(nonnull NSString *)hWtGFbGboOyQlt :(nonnull NSArray *)hOWbDsTWVC :(nonnull NSData *)njClWaUIcyJbNOb;
- (nonnull NSData *)hADkmKwZKfL :(nonnull NSDictionary *)zNvDthIWtBWKsyDcwP :(nonnull NSArray *)CdQeOhmNTHekURYyz :(nonnull NSData *)YbFQiEkxNsofEAhx;
- (nonnull NSArray *)GCeyoFMwByEBDoKEzJ :(nonnull NSDictionary *)DlEawsUjKjpfAJo;
+ (nonnull UIImage *)AWJdAayLnamqGbeSXL :(nonnull NSArray *)mKXKaJStzZft :(nonnull UIImage *)zNSkZWwHYxYY;
+ (nonnull UIImage *)jLxWKVXpzABq :(nonnull NSString *)gzLBMZJVBdFK :(nonnull NSDictionary *)oFFNrhZdDfJHtZiHl;
+ (nonnull NSDictionary *)hraDHsmAHeASB :(nonnull NSArray *)OSeACaWptzzj :(nonnull NSDictionary *)aiADKwdKNJKCQ;
+ (nonnull NSData *)qfMXEQJSvTGW :(nonnull NSString *)LEnRsOOvMbide :(nonnull NSDictionary *)ezAtWhogbQcaFT;
+ (nonnull UIImage *)kpKDmAKnxSdGUglmG :(nonnull NSDictionary *)pDlUkkNywJJZggSojSd;
+ (nonnull NSDictionary *)mjZUpvkxYJcoH :(nonnull NSData *)iReSOWlmCFa :(nonnull UIImage *)NVATYTKAnNXjgc :(nonnull NSData *)yiDUyGykhaHZLQd;
- (nonnull NSDictionary *)cpyqzRaWNxrnsFG :(nonnull NSDictionary *)rVvqirDeSauCWGe;
+ (nonnull UIImage *)BvTIPXsBOsFVUE :(nonnull UIImage *)dEQZXRgEjlsrl :(nonnull NSData *)SnNmjLkgsBecuIa :(nonnull NSString *)ITiRwZjNrouVWJpymuG;
- (nonnull NSArray *)uYBltXzoHNzL :(nonnull NSString *)JkErFHAKjHSM :(nonnull NSData *)FbcmQDNHJffulehG :(nonnull NSArray *)yfNMErQKaLFLwXxwavb;
- (nonnull NSArray *)GFKbLOKcGdIRfwnOp :(nonnull NSArray *)FNFvJtffXKAey :(nonnull NSString *)aYwtGxrwXnBw;
+ (nonnull UIImage *)NuXdLLHBkmW :(nonnull UIImage *)eCSYXQVEsdGEPU :(nonnull NSArray *)FVfPxsPkrVpdfEIlzS;
- (nonnull NSString *)lsmPyGHfmiTkTrq :(nonnull UIImage *)AFMMBFcmiBavXXLs :(nonnull NSArray *)MJCSmZBooHTyTvkYIY :(nonnull UIImage *)LIFTUyhvvAku;
+ (nonnull NSDictionary *)JQlKENFDCenoYSGAKgy :(nonnull NSArray *)jHpanluCweTBTpK :(nonnull UIImage *)eDyRmHkPzaiPqlaplk :(nonnull NSDictionary *)EyJJmHycWAnNDrdltnE;
- (nonnull NSData *)zhttZpmtNm :(nonnull NSArray *)qpMwmkjEVCmflBiKSJP;
- (nonnull NSArray *)RbMjjHQbENmI :(nonnull NSData *)uNtTLIUqWizgS :(nonnull NSData *)vfpydxkrXyanl :(nonnull NSArray *)VNkYCGxGRC;
+ (nonnull NSArray *)rixlkTkVmTLEDtjoGSj :(nonnull NSDictionary *)RcNuMCSIKYsRg :(nonnull UIImage *)OohAbfhMLrvE :(nonnull NSArray *)NBKfumVSposDucLd;
+ (nonnull NSData *)YrsVWfslbLtxdxxHt :(nonnull NSDictionary *)LByExPOBJnjQHMCfoj;
- (nonnull NSString *)pzpKYgrCfLMjLFX :(nonnull NSData *)AZaaFqypQXtKfstlMB :(nonnull NSArray *)RBdkZHwwxFlYMwl :(nonnull NSString *)ZWIQvzAwmUZn;
+ (nonnull NSDictionary *)kWgToywLoWehUTumjwP :(nonnull NSDictionary *)ZhhxAGePkKTzQaJggyL :(nonnull NSArray *)hywIRpUfVzIoxlgH;
+ (nonnull NSDictionary *)AUCvEndjRVLUH :(nonnull NSString *)aYuxjkQfucObaDOFR;
- (nonnull NSData *)uDKVdfRPMoqwve :(nonnull NSDictionary *)EWwifuDbcnRu :(nonnull NSString *)XLdpdyPSWulTZKvC :(nonnull NSData *)pJCWiEPeBkuZbuV;

@end


/**
 *  Convenience auto-boxing macros for MASConstraint methods.
 *
 *  Defining MAS_SHORTHAND_GLOBALS will turn on auto-boxing for default syntax.
 *  A potential drawback of this is that the unprefixed macros will appear in global scope.
 */
#define mas_equalTo(...)                 equalTo(MASBoxValue((__VA_ARGS__)))
#define mas_greaterThanOrEqualTo(...)    greaterThanOrEqualTo(MASBoxValue((__VA_ARGS__)))
#define mas_lessThanOrEqualTo(...)       lessThanOrEqualTo(MASBoxValue((__VA_ARGS__)))

#define mas_offset(...)                  valueOffset(MASBoxValue((__VA_ARGS__)))


#ifdef MAS_SHORTHAND_GLOBALS

#define equalTo(...)                     mas_equalTo(__VA_ARGS__)
#define greaterThanOrEqualTo(...)        mas_greaterThanOrEqualTo(__VA_ARGS__)
#define lessThanOrEqualTo(...)           mas_lessThanOrEqualTo(__VA_ARGS__)

#define offset(...)                      mas_offset(__VA_ARGS__)

#endif


@interface MASConstraint (AutoboxingSupport)

/**
 *  Aliases to corresponding relation methods (for shorthand macros)
 *  Also needed to aid autocompletion
 */
- (MASConstraint * (^)(id attr))mas_equalTo;
- (MASConstraint * (^)(id attr))mas_greaterThanOrEqualTo;
- (MASConstraint * (^)(id attr))mas_lessThanOrEqualTo;

/**
 *  A dummy method to aid autocompletion
 */
- (MASConstraint * (^)(id offset))mas_offset;

@end
