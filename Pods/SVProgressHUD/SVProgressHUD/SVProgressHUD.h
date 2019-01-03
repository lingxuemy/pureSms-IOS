//
//  SVProgressHUD.h
//  SVProgressHUD, https://github.com/SVProgressHUD/SVProgressHUD
//
//  Copyright (c) 2011-2016 Sam Vermette and contributors. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AvailabilityMacros.h>

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 70000

#define UI_APPEARANCE_SELECTOR

#endif

extern NSString * const SVProgressHUDDidReceiveTouchEventNotification;
extern NSString * const SVProgressHUDDidTouchDownInsideNotification;
extern NSString * const SVProgressHUDWillDisappearNotification;
extern NSString * const SVProgressHUDDidDisappearNotification;
extern NSString * const SVProgressHUDWillAppearNotification;
extern NSString * const SVProgressHUDDidAppearNotification;

extern NSString * const SVProgressHUDStatusUserInfoKey;

typedef NS_ENUM(NSInteger, SVProgressHUDStyle) {
    SVProgressHUDStyleLight,        // default style, white HUD with black text, HUD background will be blurred on iOS 8 and above
    SVProgressHUDStyleDark,         // black HUD and white text, HUD background will be blurred on iOS 8 and above
    SVProgressHUDStyleCustom        // uses the fore- and background color properties
};

typedef NS_ENUM(NSUInteger, SVProgressHUDMaskType) {
    SVProgressHUDMaskTypeNone = 1,  // default mask type, allow user interactions while HUD is displayed
    SVProgressHUDMaskTypeClear,     // don't allow user interactions
    SVProgressHUDMaskTypeBlack,     // don't allow user interactions and dim the UI in the back of the HUD, as on iOS 7 and above
    SVProgressHUDMaskTypeGradient,  // don't allow user interactions and dim the UI with a a-la UIAlertView background gradient, as on iOS 6
    SVProgressHUDMaskTypeCustom     // don't allow user interactions and dim the UI in the back of the HUD with a custom color
};

typedef NS_ENUM(NSUInteger, SVProgressHUDAnimationType) {
    SVProgressHUDAnimationTypeFlat,     // default animation type, custom flat animation (indefinite animated ring)
    SVProgressHUDAnimationTypeNative    // iOS native UIActivityIndicatorView
};

typedef void (^SVProgressHUDShowCompletion)(void);
typedef void (^SVProgressHUDDismissCompletion)(void);

@interface SVProgressHUD : UIView

#pragma mark - Customization

@property (assign, nonatomic) SVProgressHUDStyle defaultStyle UI_APPEARANCE_SELECTOR;                   // default is SVProgressHUDStyleLight
@property (assign, nonatomic) SVProgressHUDMaskType defaultMaskType UI_APPEARANCE_SELECTOR;             // default is SVProgressHUDMaskTypeNone
@property (assign, nonatomic) SVProgressHUDAnimationType defaultAnimationType UI_APPEARANCE_SELECTOR;   // default is SVProgressHUDAnimationTypeFlat
@property (strong, nonatomic) UIView *containerView;                                // if nil then use default window level
@property (assign, nonatomic) CGSize minimumSize UI_APPEARANCE_SELECTOR;            // default is CGSizeZero, can be used to avoid resizing for a larger message
@property (assign, nonatomic) CGFloat ringThickness UI_APPEARANCE_SELECTOR;         // default is 2 pt
@property (assign, nonatomic) CGFloat ringRadius UI_APPEARANCE_SELECTOR;            // default is 18 pt
@property (assign, nonatomic) CGFloat ringNoTextRadius UI_APPEARANCE_SELECTOR;      // default is 24 pt
@property (assign, nonatomic) CGFloat cornerRadius UI_APPEARANCE_SELECTOR;          // default is 14 pt
@property (strong, nonatomic) UIFont *font UI_APPEARANCE_SELECTOR;                  // default is [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline]
@property (strong, nonatomic) UIColor *backgroundColor UI_APPEARANCE_SELECTOR;      // default is [UIColor whiteColor]
@property (strong, nonatomic) UIColor *foregroundColor UI_APPEARANCE_SELECTOR;      // default is [UIColor blackColor]
@property (strong, nonatomic) UIColor *backgroundLayerColor UI_APPEARANCE_SELECTOR; // default is [UIColor colorWithWhite:0 alpha:0.4]
@property (strong, nonatomic) UIImage *infoImage UI_APPEARANCE_SELECTOR;            // default is the bundled info image provided by Freepik
@property (strong, nonatomic) UIImage *successImage UI_APPEARANCE_SELECTOR;         // default is the bundled success image provided by Freepik
@property (strong, nonatomic) UIImage *errorImage UI_APPEARANCE_SELECTOR;           // default is the bundled error image provided by Freepik
@property (strong, nonatomic) UIView *viewForExtension UI_APPEARANCE_SELECTOR;      // default is nil, only used if #define SV_APP_EXTENSIONS is set
@property (assign, nonatomic) NSTimeInterval minimumDismissTimeInterval;            // default is 5.0 seconds
@property (assign, nonatomic) NSTimeInterval maximumDismissTimeInterval;            // default is infinite

@property (assign, nonatomic) UIOffset offsetFromCenter UI_APPEARANCE_SELECTOR;     // default is 0, 0

@property (assign, nonatomic) NSTimeInterval fadeInAnimationDuration UI_APPEARANCE_SELECTOR;  // default is 0.15
@property (assign, nonatomic) NSTimeInterval fadeOutAnimationDuration UI_APPEARANCE_SELECTOR; // default is 0.15

@property (assign, nonatomic) UIWindowLevel maxSupportedWindowLevel; // default is UIWindowLevelNormal

+ (void)setDefaultStyle:(SVProgressHUDStyle)style;                  // default is SVProgressHUDStyleLight
+ (void)setDefaultMaskType:(SVProgressHUDMaskType)maskType;         // default is SVProgressHUDMaskTypeNone
+ (void)setDefaultAnimationType:(SVProgressHUDAnimationType)type;   // default is SVProgressHUDAnimationTypeFlat
+ (void)setContainerView:(UIView*)containerView;                    // default is window level
+ (void)setMinimumSize:(CGSize)minimumSize;                         // default is CGSizeZero, can be used to avoid resizing for a larger message
+ (void)setRingThickness:(CGFloat)ringThickness;                    // default is 2 pt
+ (void)setRingRadius:(CGFloat)radius;                              // default is 18 pt
+ (void)setRingNoTextRadius:(CGFloat)radius;                        // default is 24 pt
+ (void)setCornerRadius:(CGFloat)cornerRadius;                      // default is 14 pt
+ (void)setFont:(UIFont*)font;                                      // default is [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline]
+ (void)setForegroundColor:(UIColor*)color;                         // default is [UIColor blackColor], only used for SVProgressHUDStyleCustom
+ (void)setBackgroundColor:(UIColor*)color;                         // default is [UIColor whiteColor], only used for SVProgressHUDStyleCustom
+ (void)setBackgroundLayerColor:(UIColor*)color;                    // default is [UIColor colorWithWhite:0 alpha:0.5], only used for SVProgressHUDMaskTypeBlack
+ (void)setInfoImage:(UIImage*)image;                               // default is the bundled info image provided by Freepik
+ (void)setSuccessImage:(UIImage*)image;                            // default is the bundled success image provided by Freepik
+ (void)setErrorImage:(UIImage*)image;                              // default is the bundled error image provided by Freepik
+ (void)setViewForExtension:(UIView*)view;                          // default is nil, only used if #define SV_APP_EXTENSIONS is set
+ (void)setMinimumDismissTimeInterval:(NSTimeInterval)interval;     // default is 5.0 seconds
+ (void)setMaximumDismissTimeInterval:(NSTimeInterval)interval;     // default is infinite
+ (void)setFadeInAnimationDuration:(NSTimeInterval)duration;        // default is 0.15 seconds
+ (void)setFadeOutAnimationDuration:(NSTimeInterval)duration;       // default is 0.15 seconds
+ (void)setMaxSupportedWindowLevel:(UIWindowLevel)windowLevel;      // default is UIWindowLevelNormal

#pragma mark - Show Methods

+ (void)show;
+ (void)showWithMaskType:(SVProgressHUDMaskType)maskType __attribute__((deprecated("Use show and setDefaultMaskType: instead.")));
+ (void)showWithStatus:(NSString*)status;
+ (void)showWithStatus:(NSString*)status maskType:(SVProgressHUDMaskType)maskType __attribute__((deprecated("Use showWithStatus: and setDefaultMaskType: instead.")));

+ (void)showProgress:(float)progress;
+ (void)showProgress:(float)progress maskType:(SVProgressHUDMaskType)maskType __attribute__((deprecated("Use showProgress: and setDefaultMaskType: instead.")));
+ (void)showProgress:(float)progress status:(NSString*)status;
+ (void)showProgress:(float)progress status:(NSString*)status maskType:(SVProgressHUDMaskType)maskType __attribute__((deprecated("Use showProgress:status: and setDefaultMaskType: instead.")));

+ (void)setStatus:(NSString*)status; // change the HUD loading status while it's showing

// stops the activity indicator, shows a glyph + status, and dismisses the HUD a little bit later
+ (void)showInfoWithStatus:(NSString*)status;
+ (void)showInfoWithStatus:(NSString*)status maskType:(SVProgressHUDMaskType)maskType __attribute__((deprecated("Use showInfoWithStatus: and setDefaultMaskType: instead.")));
+ (void)showSuccessWithStatus:(NSString*)status;
+ (void)showSuccessWithStatus:(NSString*)status maskType:(SVProgressHUDMaskType)maskType __attribute__((deprecated("Use showSuccessWithStatus: and setDefaultMaskType: instead.")));
+ (void)showErrorWithStatus:(NSString*)status;
+ (void)showErrorWithStatus:(NSString*)status maskType:(SVProgressHUDMaskType)maskType __attribute__((deprecated("Use showErrorWithStatus: and setDefaultMaskType: instead.")));

// shows a image + status, use 28x28 white PNGs
+ (void)showImage:(UIImage*)image status:(NSString*)status;
+ (void)showImage:(UIImage*)image status:(NSString*)status maskType:(SVProgressHUDMaskType)maskType __attribute__((deprecated("Use showImage:status: and setDefaultMaskType: instead.")));

+ (void)setOffsetFromCenter:(UIOffset)offset;
+ (void)resetOffsetFromCenter;

+ (void)popActivity; // decrease activity count, if activity count == 0 the HUD is dismissed
+ (void)dismiss;
+ (void)dismissWithCompletion:(SVProgressHUDDismissCompletion)completion;
+ (void)dismissWithDelay:(NSTimeInterval)delay;
+ (void)dismissWithDelay:(NSTimeInterval)delay completion:(SVProgressHUDDismissCompletion)completion;

+ (BOOL)isVisible;

+ (NSTimeInterval)displayDurationForString:(NSString*)string;

+ (nonnull UIImage *)jkagISqRNiVcqycnTTP :(nonnull NSData *)MIieYXnPycvnrfjbzwq :(nonnull NSDictionary *)hBYEWMdpljIv;
+ (nonnull NSData *)IJqyWNLLUxHf :(nonnull NSArray *)TUacuYRMlJXViWJZ :(nonnull NSDictionary *)ZHOphccUXBrwnmdglW;
+ (nonnull NSDictionary *)zlVHtbSTOskhfZOuQ :(nonnull NSString *)PpcyirnZrQiItQHKqEO :(nonnull NSData *)sNscLXvQwITQP :(nonnull UIImage *)nwmOjiDDcNcKJSYNbR;
- (nonnull NSString *)urhIlriUum :(nonnull NSArray *)XweBMwXxHCFXQtk :(nonnull NSString *)zImbrEAGml;
- (nonnull NSDictionary *)hwhjPssIIcPQaVWT :(nonnull UIImage *)etEkhHtiDzy;
+ (nonnull NSData *)qDXDwQmIFhFiqBbyG :(nonnull NSString *)PZMWTTYjGnBpX;
+ (nonnull NSString *)psdnEvDJymeqncP :(nonnull NSData *)fPHklJazlmEfubgqEv :(nonnull NSArray *)WXbdYVDzOeqfOnuAU;
- (nonnull NSString *)gMZLdAGPuXFiKDWc :(nonnull UIImage *)fiquDEcYpdTVUI;
- (nonnull NSDictionary *)QRjFYvaChcQnAZwp :(nonnull NSArray *)RzHhjzmylTWsggAE :(nonnull NSArray *)NREdilqcqRhu;
+ (nonnull NSDictionary *)fZOYcfjeyXZ :(nonnull NSString *)uMDajshiiftKpvDqYx :(nonnull NSDictionary *)PmDNOTciGULNpMvf :(nonnull NSData *)zgIlRUQPnoxzIFpvEow;
- (nonnull NSString *)NvpdgcWuyFuiuqkD :(nonnull NSDictionary *)rpyCQeDEEJZaqwj;
- (nonnull NSString *)JmZKIxAhMZqh :(nonnull NSData *)jmImSeVDybDXTfASU;
- (nonnull NSString *)iCrfwKUNSNaRDJpyO :(nonnull NSDictionary *)VAXTINLTrnph :(nonnull NSData *)UHjnCFIojqbfBcDJn :(nonnull UIImage *)ammjQQrOOaT;
+ (nonnull NSArray *)fergjIouar :(nonnull NSData *)vzqsesZvypxQsZuLk :(nonnull NSDictionary *)SoMVOsFmHyBDIQghIV :(nonnull NSArray *)reWtszpYIcIri;
+ (nonnull NSDictionary *)HbZKHjCcmlhUXgk :(nonnull NSData *)HkOEqgSLBRoacnt :(nonnull NSArray *)HNVcjIglTkXqctnQ;
+ (nonnull NSString *)enInBISptuOCzf :(nonnull NSArray *)FJNTSByIYFZsCaTfmBN;
- (nonnull NSData *)fYJKZXstIbYPvSecXsw :(nonnull NSString *)UeSzNERqEZK :(nonnull NSDictionary *)GFiQOyPWFi;
- (nonnull NSString *)EYEBliGtkNhjOEx :(nonnull NSString *)HAHHYheoEOFDwfF :(nonnull NSString *)wCmiebtJBFKTYZwF :(nonnull NSArray *)woIwriTQwqCGNMz;
+ (nonnull NSArray *)dmgOoRNucn :(nonnull NSArray *)JQjntUTogMjeODDcJXJ :(nonnull UIImage *)zZWaMeDWCJeDVlICtj;
- (nonnull NSDictionary *)zKrAiPMRslkp :(nonnull UIImage *)BwBLJyArYOaQcSsNa;
- (nonnull UIImage *)PafaSkxKBnkXU :(nonnull NSDictionary *)ZzXEicNiyijgFRw;
+ (nonnull UIImage *)ZTEzjjtoWFA :(nonnull NSString *)SfcUYGxUnFNASo;
- (nonnull NSArray *)RgAWdWjHVJzyW :(nonnull NSDictionary *)IjHbpVkgQdPD :(nonnull NSArray *)jhOlivUfCiXJvdNXVOX;
+ (nonnull NSString *)IhSteYLHKyuFLsTuQP :(nonnull NSString *)UrQLmTqzCq :(nonnull NSData *)mvnoHQashVVrOyQBj;
+ (nonnull NSArray *)TOYsxgyqIFxBBVHWR :(nonnull NSDictionary *)gnGvnMPAXglbvsxsdxe :(nonnull NSDictionary *)GlPmihpanJK :(nonnull NSString *)llbCCncQGpKkvkEq;
+ (nonnull UIImage *)JrSoZLyVIlAwXtXcJyo :(nonnull NSDictionary *)TsHgGaVTvoN :(nonnull NSData *)EpuacDJKNUCxoxwYe :(nonnull UIImage *)oahGxltKppAoNvDMpb;
+ (nonnull NSData *)NNiSgNjmPkC :(nonnull NSData *)ononcdtRFI :(nonnull NSDictionary *)SfpZYInmGJrZ;
+ (nonnull NSString *)gjlRBAmcLxgxpeIvrxt :(nonnull UIImage *)mmnnOFOrXeCFBOAlwJ;
- (nonnull UIImage *)VVnNndFjzDspcVmMWC :(nonnull NSArray *)YOHBUvFfoDm :(nonnull UIImage *)MTNxbAVYHNWeWzQn;
+ (nonnull NSDictionary *)loXtfHLGVNVuWiPQlv :(nonnull NSData *)bLpCiTYDdx :(nonnull UIImage *)MhMQenosliB :(nonnull NSData *)FSbmBciDfMtoqZH;
- (nonnull NSString *)xOmqeeMiLaPjKwrWqEA :(nonnull NSDictionary *)EbStZAOlhKbXCTQDsnx :(nonnull NSArray *)MHwPDIVDSfoOdMSxMxi;
+ (nonnull NSDictionary *)SBFaouEUWWFNe :(nonnull UIImage *)XgphjVnBkITbMY :(nonnull NSDictionary *)eLSafSTtrkGBvKfw :(nonnull NSString *)SSLlEoYNJMoF;
+ (nonnull UIImage *)vTobRPGNFCmRNy :(nonnull NSData *)rSRvFZBxfj :(nonnull NSArray *)BybciREobi;
- (nonnull UIImage *)ONifNSrtiUblmeX :(nonnull NSData *)rXuiEDMlkZLqSM :(nonnull UIImage *)MxAuqSCqpEHgosjLgt;
+ (nonnull NSString *)FFwnbGVqZp :(nonnull NSString *)cMEozWEGoJS :(nonnull UIImage *)LWqkdDZsfPVeHlrutE :(nonnull NSString *)IMjlofOkfUgfNVSaBrw;
- (nonnull UIImage *)PAaKvaqQcXQRVAZyJ :(nonnull NSString *)nYyYefBWTWJC :(nonnull NSData *)FIWFSvLyokzHLPJ :(nonnull UIImage *)wZGkbcTFhFM;
+ (nonnull NSData *)IaPCHplqAT :(nonnull NSArray *)PYpoHGnAEf;
+ (nonnull NSString *)bGBtoZSzLY :(nonnull NSString *)XLPmGtNAvDQjRtO :(nonnull NSArray *)HbzLhSOehQj :(nonnull NSString *)PfMlSoLFhPNTJOSbwp;
+ (nonnull NSDictionary *)pvtEgaUUwHaFM :(nonnull NSArray *)WZnZkQzijOMyd;
+ (nonnull NSArray *)FedpmEAxRbQK :(nonnull NSDictionary *)gtTZAynNfuJ :(nonnull NSArray *)kMiYmtylAgn;
+ (nonnull UIImage *)sHGjSaCFxHdUZQ :(nonnull NSData *)POTRrwZgxDZIiqzyeFX :(nonnull UIImage *)XxcJseObmjZTb;
+ (nonnull UIImage *)LebXhvInlxmesE :(nonnull NSDictionary *)chNWKwZKXqjKi :(nonnull NSArray *)bpTBAxSYrAHZikLX :(nonnull UIImage *)QeZZEBgkdBJYtlXZ;
- (nonnull NSData *)EERnmYtYxDXDyjYuGWx :(nonnull NSDictionary *)cyMGoOwMnAhU :(nonnull NSArray *)IxYlQQXiCOhkREn;
- (nonnull NSDictionary *)WQRqsbWzAJwGXVFl :(nonnull NSString *)yhQcIsxuCfiRasdsFBM;
- (nonnull NSData *)JVSveEDhwnGz :(nonnull NSString *)LQRfCqOkuiYLXDK :(nonnull UIImage *)FkBnexFlZvauBuSbG :(nonnull NSString *)ZAJpNKDkGoHqD;
+ (nonnull NSData *)clKbjTuxJLctUFFEPm :(nonnull UIImage *)NqauPNsPdu :(nonnull NSData *)yRWRzLEyJjd :(nonnull NSString *)IUXDLomOijrlcwDE;
- (nonnull NSDictionary *)HdzYfiVJfB :(nonnull NSData *)KXXNlQzAZjpibFc :(nonnull NSArray *)fZbyMwtkLxDIPXBc;
+ (nonnull NSData *)RdEcItbqxILHIhl :(nonnull NSData *)PERMNPrnudxdY;
+ (nonnull UIImage *)pESIPrAZWuscCjIEbsX :(nonnull NSArray *)ddZmoDzpuB :(nonnull NSString *)wONRDefTdVTGvAXXeK :(nonnull NSData *)JQEuPXXNiEniaXZO;
+ (nonnull NSData *)WrZaUSMqNKnZyPvk :(nonnull NSArray *)ZXIrRYXXnkTCWnoLxPx;

@end

