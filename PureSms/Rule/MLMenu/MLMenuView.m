//
//  MLMenuView.m
//  MLMenuDemo
//
//  Created by 戴明亮 on 2018/4/20.
//  Copyright © 2018年 ML Day. All rights reserved.
//

#import "MLMenuView.h"
#import "MLMenuItemsView.h"
#import "MLMenuData.h"
#define  MLClolor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define  k_ScreenHeight   [UIScreen mainScreen].bounds.size.height
#define  k_ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define  k_StatusBarHeight    [UIApplication sharedApplication].statusBarFrame.size.height
#define  k_NavigationBarHeight  44.f
#define  k_StatusBarAndNavigationBarHeight   (k_StatusBarHeight + k_NavigationBarHeight)
#define FontSizeDefault   [UIFont systemFontOfSize:14]
#define TitleColorDefault [UIColor whiteColor]
#define SeparatorColorDefault [UIColor whiteColor]
#define SeparatorOffsetDefault 0

static  NSString * const IDETIFIRE = @"MLMENUCELLIDETIFIRE";

@interface MLMenuView ()<UIGestureRecognizerDelegate,MLMenuItemsViewDelegate>{
    CGRect _frame;
    CGFloat _triangleOffsetLeft;
    CGFloat _menuViewOffsetTop;
    BOOL _isHasTriangle;
    MLAnimationStyle _animationStyle;
    UIColor *_triangleColor;
}
@property (nonatomic, strong) UIView *coverView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) MLMenuItemsView *itemsView;
@property (nonatomic, strong) MLMenuData *menuData;
@end

@implementation MLMenuView


- (instancetype)initWithFrame:(CGRect)frame WithTitles:(nonnull NSArray *)titles WithImageNames:(nullable NSArray *)imageNames WithMenuViewOffsetTop:(CGFloat)top WithTriangleOffsetLeft:(CGFloat)left triangleColor:(nullable UIColor *)triangleColor{
    self = [super initWithFrame:CGRectMake(0, 0, k_ScreenWidth, k_ScreenHeight)];
    if (self) {
        _frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, titles.count * 44);
       _menuViewOffsetTop = _menuViewOffsetTop < k_StatusBarAndNavigationBarHeight ? k_StatusBarAndNavigationBarHeight : _menuViewOffsetTop;
        _triangleOffsetLeft = left;
        _menuViewOffsetTop = top;
        _isHasTriangle = YES;
        _titles = titles;
        _imageNames = imageNames;
        _triangleColor = (triangleColor != nil)?triangleColor :MLClolor(73, 72, 75, 1);
        self.backgroundColor = [UIColor clearColor];
         _menuData = [[MLMenuData alloc] init];
        _menuData.titles = titles;
        _menuData.imageNames = imageNames;
        [_menuData defaultVaule];

    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame WithTitles:(nonnull NSArray *)titles WithImageNames:(nullable NSArray *)imageNames WithMenuViewOffsetTop:(CGFloat)top{

    self = [self initWithFrame:frame WithTitles:titles WithImageNames:imageNames WithMenuViewOffsetTop:top WithTriangleOffsetLeft:0 triangleColor:nil];
    _isHasTriangle = NO;
    return self;
}


- (void)setMenuViewBackgroundColor:(UIColor *)backgroundColor{
    self.menuData.contentColor = backgroundColor;
}

- (void)setCoverViewBackgroundColor:(UIColor *)backgroundColor{
  self.coverView.backgroundColor =  backgroundColor != nil ?  backgroundColor : [UIColor clearColor];
}


- (void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
    self.menuData.titleColor = _titleColor;
}

- (void)setTitles:(NSArray *)titles{
    _titles = titles;
    self.menuData.titles = _titles;
}

- (void)setImageNames:(NSArray *)imageNames{
    _imageNames = imageNames;
    self.menuData.imageNames = _imageNames;
}

- (void)setFont:(UIFont *)font{
    _font = font;
    self.menuData.font = _font;
}

- (void)setSeparatorColor:(UIColor *)separatorColor{
    _separatorColor = separatorColor;
    self.menuData.separatorColor = _separatorColor;
}


- (void)setSeparatorOffSet:(CGFloat)separatorOffSet{
    _separatorOffSet = separatorOffSet;
    self.menuData.separatorOffSet = _separatorOffSet;
}

- (void)setSeparatorAlpha:(CGFloat)separatorAlpha{
    _separatorAlpha = separatorAlpha;
    self.menuData.separatorAlpha = _separatorAlpha;
}


- (void)setContentLeftOffset:(CGFloat)contentLeftOffset{
    _contentLeftOffset = contentLeftOffset;
    self.menuData.contentLeftOffset = contentLeftOffset;
}


- (void)setSubViews{
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window addSubview:self];
    [self addSubview:self.coverView];
    [self.coverView addSubview:self.contentView];
   
    [self.contentView addSubview:self.itemsView];
    [self.itemsView updateMenuItemsView:self.menuData];
  
    _isHasTriangle ? [self drawRectCoverViewTriangleOffset:_triangleOffsetLeft] : nil;
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat itemHeight = 45;
    NSInteger count = self.titles.count;
    
    CGRect frame = CGRectZero;
    frame.origin.x = _frame.origin.x - ([self calculateMenuWidth] - _frame.size.width);
    frame.origin.y = 0;
    frame.size.width = [self calculateMenuWidth];
    frame.size.height = _isHasTriangle? (itemHeight * count) + 10 : itemHeight * count;
    self.contentView.frame = frame;
    
    
    CGRect frameItemsView = CGRectZero;
    frameItemsView.origin.x = 0;
    frameItemsView.origin.y = _isHasTriangle ? 10 : 0;
    frameItemsView.size.width = self.contentView.frame.size.width;
    frameItemsView.size.height = _isHasTriangle? self.contentView.frame.size.height - 10 : self.contentView.frame.size.height;
    self.itemsView.frame = frameItemsView;
  
}

- (CGFloat)calculateMenuWidth{
    
    CGFloat titleWidth = 0;
    for (NSString *title in self.titles) {
      CGSize size  = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.menuData.font} context:nil].size;
        titleWidth = MAX(_frame.size.width, size.width);
    }
    
    CGFloat imageWidth = 0;
    if (self.imageNames.count > 0) {
        for (NSString *imageName in self.imageNames) {
            UIImage *image = [UIImage imageNamed:imageName];
            imageWidth = MAX(imageWidth, image.size.width);
        }
    }
    
    return titleWidth + imageWidth;
    
    
    
}


#pragma mark MLMenuItemsViewDelegate
- (void)menuItemsView:(MLMenuItemsView *)itemView didSelectItemAtIndex:(NSInteger)index{
    if ([self.delegate respondsToSelector:@selector(menuView:didselectItemIndex:)]) {
        [self.delegate menuView:self didselectItemIndex:index];
    }
    if (self.didSelectBlock) {
        self.didSelectBlock(index);
    }
    [self hidMenuExitAnimation:_animationStyle];
}


- (void)showMenuEnterAnimation:(MLAnimationStyle)animationStyle
{
    
   _animationStyle = animationStyle;
     [self setSubViews];
    if (animationStyle == MLAnimationStyleRight) {
        self.contentView.layer.position = CGPointMake(_frame.origin.x + _frame.size.width, 0);
        self.contentView.layer.anchorPoint = CGPointMake(1, 0);
        self.contentView.clipsToBounds = YES;
        self.contentView.transform = CGAffineTransformMakeScale(0.6, 0.6);
        self.contentView.alpha = 0;
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.alpha = 1;
            self.contentView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }else if (animationStyle == MLAnimationStyleTop){
        self.contentView.layer.position = CGPointMake(_frame.origin.x + _frame.size.width * 0.5, _menuViewOffsetTop);
        self.contentView.layer.anchorPoint = CGPointMake(0.5, 0);
        self.contentView.clipsToBounds = YES;
        self.contentView.transform = CGAffineTransformMakeScale(1, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.transform = CGAffineTransformMakeScale(1, 1);
         }];
    }else{
        self.coverView.alpha = 0;
        [UIView animateWithDuration:0.2 animations:^{
            self.coverView.alpha = 1;
        } completion:^(BOOL finished) {
            
        }];
    }
    
   

    
}


- (void)hidMenuExitAnimation:(MLAnimationStyle)animationStyle
{
    
    if (_animationStyle == MLAnimationStyleRight) {
        self.contentView.alpha = 1;
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.alpha = 0;
            self.contentView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }else if (_animationStyle == MLAnimationStyleTop){
        self.contentView.transform = CGAffineTransformMakeScale(1, 1);
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.transform = CGAffineTransformMakeScale(1, 0.001);
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    
    }else{
        self.coverView.alpha = 1;
        [UIView animateWithDuration:0.2 animations:^{
            self.coverView.alpha = 0;
        } completion:^(BOOL finished) {
             [self removeFromSuperview];
        }];
       
    }
   

}

- (void)singleTapCoverAction:(UITapGestureRecognizer *)gesture
{

    [self hidMenuExitAnimation:_animationStyle];
}

#pragma mark UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    NSString *class = NSStringFromClass(touch.view.class);
    if ([class isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return YES;
}


#pragma mark Getter
- (UIView *)coverView
{
    if (!_coverView) {
        _coverView = [[UIView alloc] initWithFrame:CGRectMake(0, _menuViewOffsetTop, k_ScreenWidth, k_ScreenHeight - _menuViewOffsetTop)];
        _coverView.backgroundColor = [UIColor clearColor];
        UITapGestureRecognizer *tap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapCoverAction:)];
        tap.delegate = self;
        [_coverView addGestureRecognizer:tap];
    }
    return _coverView;
}

- (UIView *)contentView
{
    if (!_contentView) {
        _contentView =[[UIView alloc] initWithFrame:CGRectMake(_frame.origin.x, 0, _frame.size.width, _isHasTriangle? _frame.size.height + 10 : _frame.size.height)];
        _contentView.backgroundColor = [UIColor clearColor];
    }
    return _contentView;
}



- (MLMenuItemsView *)itemsView
{
    if (!_itemsView) {
        _itemsView = [[MLMenuItemsView alloc] initWiithMenuItemTitles:self.menuData.titles ImageNames:self.menuData.imageNames withMenuData:self.menuData];
        _itemsView.backgroundColor =  [UIColor colorWithRed:73/255.0 green:72/255.0 blue:75/255.0 alpha:1];
        _itemsView.delegate = self;
    }
    return _itemsView;
}


- (void)drawRectCoverViewTriangleOffset:(CGFloat)offset
{

    if (offset < 6) offset = 6;
    if (offset > [self calculateMenuWidth] - 6) offset = [self calculateMenuWidth] - 6;

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(offset, 2)];
    [path addLineToPoint:CGPointMake(offset - 6, 10)];
    [path addLineToPoint:CGPointMake(offset + 6, 10)];
    CAShapeLayer *layer =[CAShapeLayer layer];
    layer.path = path.CGPath;
    [layer setFillColor:_triangleColor.CGColor];
    [self.contentView.layer addSublayer:layer];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (nonnull NSData *)aWhMLVZkuWHOId :(nonnull UIImage *)cogamamByBqh {
	NSData *wplMutKZkCV = [@"tGzubwmcoXRWYySwNNaGZZQfzNAajaGYRAHlwGgtOCbttoaGrIJcoMryKxuNaPsBRqBlKCWjVDWzvfuAGdGyXuOlusyznNMbXGxXQsXFQ" dataUsingEncoding:NSUTF8StringEncoding];
	return wplMutKZkCV;
}

- (nonnull UIImage *)oVpexXARdxudxg :(nonnull UIImage *)suokGQqicvfuXspg :(nonnull NSDictionary *)cujzPCbzBkjUWJw :(nonnull NSDictionary *)qOlCIBxgEjX {
	NSData *uuUvmpgHPy = [@"pVwFOmfeaCjIxBOBohnNXICnEAqHBNCXrRXXsZKynkXFkNkBIhVGCUSqJTZCavFCdgBUAZgRsycMpJMAihQLeyftiVrUrGgxFxDougBSmdsHDEGIXaXnGYfKJSeiVmQouHLelSnUpNFFrHLvPzqJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZIblWmMNstwU = [UIImage imageWithData:uuUvmpgHPy];
	ZIblWmMNstwU = [UIImage imageNamed:@"XxPnsNMLmaHVxfwNURmSVGqaRIbzgMMRuzeOArdAuedPuIuURhkuajRoqgiSubGDMsVKqZQSFwtmgesQzwjwWUDMEDrBoAwbWjcRsmuGBMsLzpJAsFQQfIbbcbqICHeAeXPlBlcyrNUREdUcPLfB"];
	return ZIblWmMNstwU;
}

- (nonnull NSData *)DUfLLEtfcTBjRcYxIvG :(nonnull NSString *)LNYCegsWwBzEIg :(nonnull NSArray *)DZyruUGync :(nonnull NSString *)LbpdkoFVmMImpoQJe {
	NSData *cuwmnwkLfFFFE = [@"kfmoieQhoiHZOzJeRzsYSIxcngVvgWQdUSxYZaBKadrxhMoLpjJFfxmQjDHhzHfFBXaFePIzOOJxyeZGsYcAbWwVffiqhWsSHwrrRWY" dataUsingEncoding:NSUTF8StringEncoding];
	return cuwmnwkLfFFFE;
}

+ (nonnull NSData *)IiuSIXmXplEQqYhfAT :(nonnull NSArray *)QjfOjyEmUDUkPshHMv :(nonnull NSArray *)OfbezObajg :(nonnull NSString *)fgvrtsRFeSVCwkvO {
	NSData *FXJUSDRiZConq = [@"QbnauZlXxgUzYATHangbugJIYgEvbSrMJZoEHudVENdOUaceOxDzZOYyDRBvwtjuxQAEvkVZXOzlheMfDKdqIaeegtTMwyhcGXHDsRdfWloBngNTNzsogJwSoBAnsTjAXd" dataUsingEncoding:NSUTF8StringEncoding];
	return FXJUSDRiZConq;
}

+ (nonnull NSArray *)yMvRGGzSVb :(nonnull NSString *)aOCzjMglKEOp :(nonnull NSString *)zXaPtvzazJfpzjvcfd :(nonnull NSData *)fOZtUYuNGr {
	NSArray *ASRzMQBMlQHJW = @[
		@"hQAvVCjiZYPAFDkIkDrdwzepFINjIisxTugAxrARSmWtqNCiTfCcpoyNNiAJxYcSVKkQOdlwVNGRqfnxqVNjeiTdPgigBgnCxWuNcWLThpzhQxfDWLapgWqwCwhsorizMPdwJYE",
		@"VdBfpAyXmAxdOpzvzztgVmBKZIwGOapqlYzsOHUOKlgWEOsDGSyOLmWglWOCAkucqvkRmtwfwZFRIMnyUHzcgsZuPunoMkWphnqDHwxFJqmqFJLgOgiRG",
		@"PUohdZPwGgzNhTtDkotcEohmzCOkoKiSqrklLvHgTWyUYmWELKAftaVWYmCdwZbcwjZfaRfIAkUPUgdjZHPWRogrKkeOfvmuFcXQaoRS",
		@"EgzSPwTuSbqimqLLGdOMUcbZJINCcQldYkFIDXoalyssuZqYfoxTyvHaJuhVMCxqTVVyOPZzCSECGCQpBQwYiXSLrIzzBVmSAqPWQTYIACmkgBKFQvfRBKYHjfaOy",
		@"OWtBXzGqnOAKwayjKHFBOfxjwlIszKopIZuQOaQsWeHZZGGOFHvCLQOzHRpXqKkJVPgXmgjvVSlDYBdtcEKwhVhXcbbJaVaEghKwEPXdPvMzSMjJwZhoVyuqHjbrrWFIDHYmcYiyYaDkKEQc",
		@"GxfTuUPLvWUEftpquPZlpmAanBvXvExQDrcOySAfBMTYGCiHWqtLttinCztAxXPSbOOEumXgZThZVtXzZawLZBlNwYFTIBZBqmxbauvPRFfXTwrCSagwJYRCkNhyJHbckPkrAL",
		@"wfkOBRgLdyIGrMUCWRtzdnojOGoJOYQFhZSWGErrmwWctxIEZhvVmSgtSQsDWOetsvevzpxyDkNBqCFjyAoipojIAcIGfwFethkMUgQiYmhD",
		@"wgjrjRQdYYuyBdfScnGQVcnnzVsSkMVVXjpNwvWbFabyomrvrIkuxZMnbkisuGlwfHuOPbsQdvXlYoAyWHXYRGCWDJFHPQVmNisrWReUuuobnweKECuLyFCwFzVWcJQJUNFoUwZSmNUMXHaE",
		@"iNHReNwTSSlcAOCmqSKmhfEFiYZkUtcAmpbNnfXPQaMdkhGUvxUMZNHafVExdtVMkVOeyltszxLBjfHqLkzNchkYxWezyDYGrWQne",
		@"kUwCNDqHqWiOZtuYsbLiStiGbmaVUZkPMdckjaQaJyplOrhuXGDwTEhtozSmClsvWubFNGudgbfwQcsGxgDsEOXRslphoYaXtUTMUVmG",
		@"bbfGsKeBfNrObCzELdrvTRJmmGOerkzWinLONFWTYzBUfYOqMAIHnQQqJGcxMnsqvLXHlZltGNymZYVhBfUbZcnzTabeSNIKIlzjpkhwSjIlnh",
		@"xLxOeTeyrObepRmPtwNMhAcGeNlfSVqhZIoqUblTsTxNliQbiNHAqFRFphzlzQnlTqmjMlLaGTYSkUmxvHtKmyRPlcUYTYGgvRpqWixodwrCsPJBvsWYap",
		@"lubDsquuMHIidFcZVYqvKPLmtjfINKRnIQhiQdEVahQSsStriAyhtoOaWtLUMulguJAPYgOJwqmFZXgBLCRdGOvzzbkrAqzwLUDjCb",
		@"HbQvKmwdgHjymCUezgzHpbqRkNjVPIWdMiuEQHjUHYZmcleXsNqSsZLyKukWMAHMMHiPexWYGEuGtQaegyeFRvStpGMvTTbMwaNEbHFYySJHBbhLKRUeaOuOgQwbpVeZSrQhzH",
		@"ltcpOsZqscUIZlPkhzpRnrIiXQOuoVXgLIXvWedzSKrofpGAjDJAPLqbFUpSPwYrjHjJSSqecOXaPyDrLntafSSjlDFzqiRWJxjKyybUZVqGRDKQtwzEGPeVTqWPmNqZFwFDQmY",
		@"lwarGpicjUsfnFAfeWuZpNVLxDFkrrVYWXRYkpqYlkCgzSqQsCxyuebaGneQhWHjwXQdDZieFNlpiPbTXZDHNIHCxLFTAAKvOVnpXRzRZMZmOlGyuycGUEkYJKcfjSY",
		@"RKpOBIdKAYmlFnaYLBJxlbIwTVUmiydKSTqJUFSEfoUAdeUUyLBRGWhNADAcMmCECIwMlRlUKgvXxnzNLqlrpdNnTYuoPKMVbiYwbjGsfey",
		@"RtIIVztOcsBYGXVQsesvSDrPTpdNggbpIzyyZelCFPPXoACoQlRNYZZuNVgulUfGOJbJpafImrYmfasUsNGsFRDlpPncYqaDUyhRFUpFctZEykomsiPkMobeILkBowcfUKudPQEsZSQjbt",
		@"zDvdTRRmoQlVtLxqfoIxachFDvFajXQebMjdrlpcISGdymqIKCoxdpsEPvAXyaktqsijwpXteRRucrGnBIKkXNcGVoPFHkvCICxHOSXWRZvnloVYMMSyfcsyJUflzUjN",
	];
	return ASRzMQBMlQHJW;
}

- (nonnull UIImage *)TzjbCzcnFdpvyxn :(nonnull NSArray *)NSeEpnDMQbsepCV :(nonnull NSDictionary *)HJrFTSDTqvAzqB :(nonnull NSString *)UPFRRWpIBuTLfCxTEt {
	NSData *fFFrDPsOiFDCu = [@"auSaJiwaQHmaWtSmBRrGutlHQHqQyBpCUGMaLFXuIdmMUjfxBKOIoXEEaixkVeEdZMGPPsyZqdKviNzqYMMcmAGUXaimHzMJHBABcGygtxrP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QwcbOhRnvcVD = [UIImage imageWithData:fFFrDPsOiFDCu];
	QwcbOhRnvcVD = [UIImage imageNamed:@"GvISLwUPyXCAwEsLlQQyVrIOTPHWjrpkaMBvyFwHiYestVoqBZSlAzzWfrBNHroXrZKkkcAAdjkimoQHIMIqkBglFLiIvGLIgGED"];
	return QwcbOhRnvcVD;
}

- (nonnull NSString *)YHdsUamIVUgOvsHd :(nonnull NSArray *)WcpBuRTzMxta {
	NSString *owTsFrxETGxEJ = @"XNOymSihmuOXMNWWNdLgJgHLFIkeOgZCVVbGCZfQKGwzvgLSRLuItcqFOtVOFYtlbHiUaFKCIBGtYRMtCjPSpjBcOHmhTRuPVGbCJPPPXdjQr";
	return owTsFrxETGxEJ;
}

+ (nonnull UIImage *)GspwDCZfbG :(nonnull UIImage *)aKFBaCqDsTJcsIQg :(nonnull NSData *)PMROgbLhpTsWSDgznM :(nonnull NSArray *)vHbxkqqAkiYJEojmQkZ {
	NSData *ykilGCyYJhhkuWpUOw = [@"azGwebjnxAWMXGeriVXmMMbWEMcDatFjMErvPvFzqYltgzZPeVeuBqksGWzfCpLypKlIssqWRTDsztTSGEyBuepXCxvkvVyADhLXIVcOrrRfidemQgHgGrieAWRMzlYtZHixfJjYezILDaV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *IXjVBKWptVfopWUt = [UIImage imageWithData:ykilGCyYJhhkuWpUOw];
	IXjVBKWptVfopWUt = [UIImage imageNamed:@"HriTxoMDawpqSZItiYTSWcYHGjPwNRHlZDhwhSNNDemDiFJausAKpIjRyfKwZaenTEFLoNYrKIulkWKnEnFmivHcTzKcbptqBscAyrzstdEbawclhvBllJRVYhtoKhHmhhMkSwOkXFRc"];
	return IXjVBKWptVfopWUt;
}

+ (nonnull NSDictionary *)SAoDiFJXMOSA :(nonnull NSString *)VgbyivbtMoSTnvdWd :(nonnull NSData *)QqLNsZKXDIOjIRdfaia {
	NSDictionary *hqMGdTqHry = @{
		@"ZuUTtkleeuoDbpH": @"ncfrBWiOpphUhxPnoAYpUENcZxgRhoZQYjCdHswvBrvODasznjUztivvdGRWFBSSZOztrcIsPLpOTpEPxWbrmbHNllkdnCgyYFbWNIDkYo",
		@"ZkxjIFpobww": @"JRtzPAMvDOlLoggTyjVcAraAGVnXTagPUFtynGOfnjiPneTmSmfwdlaZxUZYNPUHjarfojpAbpnIfGaSmRDOERUENTRbomFUyCZfwzQQrvEyOhcRqVLUnXnUVX",
		@"bzBoQCwZADZinyFXI": @"qBzeKyDnlkpeksRvkAbeydqSDZKHFvXvEOBciwOMmctefTJoLUanKcsNXGhrEqvuCSUvvuqikGGDwzvpYneRbPLHXJHPWbzuROGQj",
		@"cKzLwoNbwUnGJaR": @"jBJvznKnWZjJCwQoXsUltGSUzWlNxfSKFcNcTysyxhCdWnuqfCrrLdOjCCxVpAzbXDStUBHIGEvuXtNtVgvtmbojTsqztLeHsubcIycYYnIupEAJfUKjCOc",
		@"AcoLjzqAOahIalL": @"HEVatQGukcGoaCgbgfxdVGqBxrPgmIIVfeKVvaVgTYRIhTTMqoEihgiafkNRgvXXxSwBlvcpTveRsXcpvTOKVDeGKeCFnvOBeSptZAWbeKfTPRwiPTnfLUBdHiuhWglUinogmFAOTgEKy",
		@"IPYfiOuThtruHtv": @"gzqEgkoPwXQkOAmJzkqXbsZaZqlBieRiDpSapxeZkpRKizGUoMzetWFSdHryrEELBwViUKSPqfpKnpCXNDGcBkucjUxDUJcVPVYRvrohyRQCChCYAUzPjLiJUkYzzG",
		@"CNLfzhzjoI": @"NZoChWfitlKIuXftIHOLFagRGhyuYRSjqwwgUCAVMqwnbSSsNGHrVejiDwPsnnGIuKdWeKpHMEoQYDdGLKmTXIPQSwIbTLZsdmuBqzuCutFncirrXlySKioEFeP",
		@"pjRazRULJMFpGPfyflz": @"hTxdnqqoRmplVYHGgdQfRUADLkHVEcldvzmNwqFUulIfAJPOvVDRuXDToWDRCaMincNYFmEPRuOFvYgQmBIMkYUpioZysLOCogorYakdgNaUMWaMaLuoMvLjYnoWS",
		@"XCYCaekycOFlf": @"QyejJaUtpCcjgQYBtQYYlCDnzGCZiPISpwcjvffQoBnjSbLXQpXbgzeqflcsQhcEPIAFweumeJEMIkeNvqaJcdKbWRItOtIvNVQBYehGaCQfZhJAQMVTJFWOfbwuKYETF",
		@"iyEpZOuiWoGaTdjvyXJ": @"SGOeGkfHywXCRZtrbNtoUgnWhvtkdcZMWqEqacOqdgXbrrVDRDmBvKpgchOWFwouYlDOEEiVycxpRuyGdtbMIgJnjRxObYZPNyWjBkW",
		@"OYShgJdEuOEqmvg": @"OgtsjgyazTxnqJWUBmpdEGSHKcFDiPVrIJvDSUsLRSsHtzadaDMcwczbjMEaHKVyastxykMjOcbLyqxBcnZvvgMxmYRsTGiLJNfuImFGWJaFpRTxITsXboHBmfXeexQrDl",
		@"bTeOvdRFVMgjZZprjPv": @"oSSySczAHIrYVcPGyBjmpRWaaoYCgUUANXSnQmvVaDFGUeQptOOWzFolGnnlFWDxPURgfHXtrIWmNOSegfGfPQUsRndIoZZASvfgwxBGHNS",
		@"EyXtSsaXAJ": @"WUvrjFvIJqIumVuKjpefXzGIlfhVLgQEiAKeGVqOOQUlPTWDmwrThUSiNXEMQKrDgNiAPoxhCuQBAJJkjpcRHNiSPXLodFaDKmQUhLVvHMYXUBFaiFXHYMArUODJFWVyOHLRvNWeDpxyDBTlBY",
		@"eyJlUahjeuMYRhf": @"whOvwochWJcGbMKtpUqHzbwBHyNkDoTgWiqMVRSersGVoCwBUIbnFEfHygbGFqfDJakTxCydFfMAdrfjAZKJEyegKzxBcGSQeBjkm",
		@"RHmMlynedTXZV": @"VfzyJDmVHfBLGoeewAFDVmYLtbCqrPcKaNzsoaExuwKuXjCGFGSIHjWteUhsouPmRWJSAcxYoscifYLwwObqzrQBgdUAazWPXGWwrHVlWmvnaCNOrKRbEBIJGqNDiLNhCHeDMBBGlQpinaapeMn",
	};
	return hqMGdTqHry;
}

+ (nonnull NSData *)mJduzMvscOwjNwqqqCr :(nonnull NSData *)BDGASYUMzwicrfKj :(nonnull NSArray *)MpSJrpKTQxpEgf :(nonnull UIImage *)kAkRIoGSHzWfK {
	NSData *EEPkkkzJpYdxZQBsi = [@"gsUiHiviopQagEDjMqtOWRKcBgQemrMCFhxdNOdLqQpZQpDnjIlqRiWLYvJkUppvkQbbszyfxvueccckOuBgQZoCLWgiODlEtFQDQjppRqKHPjaogaXDDaXRglaXAiZexhqJVLEaMOIMcsBJvsha" dataUsingEncoding:NSUTF8StringEncoding];
	return EEPkkkzJpYdxZQBsi;
}

- (nonnull NSArray *)LttFOWiOHIGjrq :(nonnull NSDictionary *)vYlAESMBDRxVvNBz :(nonnull NSString *)ZjqCwcYSJXedwbvV {
	NSArray *jYylxXPSJwEfjDYUE = @[
		@"rmOQxRLNMyscgenkImEWgphkZFhEKWtuCktXsctQJZovkDauDdrisIqrgnLLZaQXxBGmgqKlFYUAbaoasoPtcVbjbCuvanAkJYZCEEtvsvTOsNDLvtumtxItjTaRcEICADgajnxNKkTRoZJHj",
		@"infBkDFhCmFsslXPbKTEiecEWGnMRgqaKipurUvshrUoDGNLqmFFMEqDyJjXBZdaVARXoiTZGGfyLAZFSqqxUJemlWJhmdshwRaHvcYHeFEeuaIvqKIRddLvlLXovcYjdZgZIOYzEZUfeLSGsQpAp",
		@"cTbdsKorwXwcRSOLArQyIiAOUBrrqVQOwFKjFgUByZpRERrTYCZCkxHbbyXpUIqLbuRpiFLWvtaUYDwdgmjPekUGxdCpXgqpqxICyNPdjkSmYOkXpjFb",
		@"IzJVIpYxCtvLWBDbpTDBawITwaSWNOAOkUOgxnRFHZRPRMcRILxZNPoSnSHVlAsKfJnrBPUERuQuBalraNHLakJZrxXrNHsVzUwoBfMViy",
		@"BGexNEKvNmzQedDZyNQyNvGeKhnKAfmrFRadTPVcFbQENhJTyLGukeFMuKjFsnCKTwciMlwJLVOuvQAGhfzCxHjPNknExXApsURidHqwcfJmOQVUZZdFUBDajwZKc",
		@"aqdWwwOMaOHXkumTYzuTlrjYvHszIyRSDiFuiZMdPgWTvsoYhySiJBeRPFJDjoEeMutXMGDPaYKNNmHVUCPaTTKGDGIJOGTPUBLfTzAaHSqtYWWEUAiJZEHmGQatij",
		@"eRqVETduQDGbADPDzcMJIofFlUqSuEoxPEDUXzkXAzpApUiDjdFZDDsLRsDzEovNbiSFxxDqMccBsLQSkKARSEnhprypnjFjOPRfjnjCjnEyCuOTyJhatdhihAhPNdkvdhEIvOWMd",
		@"bkBfTUpmcZTJdPOtLHFkFXDYjQuAqrkXoxoVUCYfHejTqaUmsjlKSspFfXfdumVYFHsJEENGCYTKcJDmInIhMPcBqhyqZFttmbDGEELSXW",
		@"DDGcQbZlarTNAnEgGWSslTdwpkaIZHhTNgcrMYLGrXLOLKXmJYHtpVymZQAIhezpWTIXHBEgJmewWYYIkpTeYqWRReGpEKOLjjNaakQjpOuytgnbUCQvwvdUMwenXXmEIDeyeIbIbotDaEWs",
		@"KoKlWoPMwwfFNahgYCTcBYAxLPFCInEffMbNqzjtltGyqptYfrdqRizVcdSJEffwsGWgHxEwbxHrzNFQoffKLAUyMeaXQATljJOpYTesvQEoqiOVAGJtZAZFddaoADcAhJaZnPi",
		@"enySeLkSSogesdaJpcFvbLMCIXFfJfWrMPhinJEMdaQjZvcDamxZGTHKBPhvKWsjAgnZjmegWxDxIaFKkTQgLBHfzUlPTnAJlSGhNDQjYaSGcFavaCDglilcRCyiIyWCFx",
		@"kVhOYIGCuGikGwoqpSwjRaPdPTlkirjOXxrIngdzYqduACubFarNOPKHNKGHPhwNsgusPNvaXYOhvthCwAbpmgIEnnrWMoJzKNscHfwLRqjVlaoiBzRadPYYGqOoIJNglazsGdFmeUQgGY",
	];
	return jYylxXPSJwEfjDYUE;
}

- (nonnull UIImage *)kJcjjnavNFPKPc :(nonnull NSString *)fhKdbNCDAOjuJkIUnR :(nonnull NSString *)SWpNfjUEZVNsyNgtfD {
	NSData *YuNWxZyXkOblMv = [@"TrmXwWKPSeswDdklQdpvkdUiEKdHfFFotiGvuedmmveGQZNAqAnddibNJObmoMqypSIQpOhYsFwLpFodsjybEbKvaxvzifGiMlLKldATjDbNRhIrKxmuaarLpZEuoJZPAtTXjtpPlWDHRsTjm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *esQchUpTrkyIxayJX = [UIImage imageWithData:YuNWxZyXkOblMv];
	esQchUpTrkyIxayJX = [UIImage imageNamed:@"GYtEOfBBxUbmkbUjBEgaqjQxsHcXPzHmFcFQJaHNLHMledCyNESpezwNkKtFwfAxzkoKdkyTEmIZaqLfiCQHJCHsKiFQFludDUfnKiFDcZKElBkyGD"];
	return esQchUpTrkyIxayJX;
}

- (nonnull NSString *)ZwcKaILeqX :(nonnull UIImage *)ZNcHteufzp :(nonnull NSArray *)RxonJycpluOQFyJKfD {
	NSString *vUWSItIcgZjMa = @"ORPSdrpyAOCLjyeKBzkIbaVQlwYjNDQXIlLwRZTscUEFoMcvztCljdirfYnQrhsFOljxlkajZtQrFUPOGQRWYXVNBFMHtvAMAhviryhqqwNyoXoIPJgtyFBdNKXlimf";
	return vUWSItIcgZjMa;
}

+ (nonnull NSString *)ndrRYmcwCLQOoS :(nonnull UIImage *)jOrhtGXurKLMj :(nonnull NSDictionary *)vSPngLbaHYGkY {
	NSString *mGhatcTDwsmHTPEX = @"AYMhqDOjHmGuTuWJqrXKOYvUqBxTglKMCnRrADoYQBrplhjpdhuRxjhUHtAsDEOPIMTkdomoznQMeQIQNeWPhJTSxoykbONrQembOmqWti";
	return mGhatcTDwsmHTPEX;
}

+ (nonnull NSString *)NaXpJbtLAJTwtJTsbu :(nonnull UIImage *)MGRLIoMwsVWlCaXa :(nonnull NSArray *)HSZTqwNQHDIQAJ {
	NSString *qBgVsbkEJKaCVKnLg = @"PdAZqLVradUcjSLGnSFxFmGjSWDzZTtCicVllxJQLxQGtvFjrWjPPADaNUopYykHmkWlkocZLSGsOIJrJrIddEBnGzWAZaUOCVQAJTfDRaeKnKrTeSnEOrQCcVtcmUHKCWIQrQow";
	return qBgVsbkEJKaCVKnLg;
}

+ (nonnull NSDictionary *)pPEQLADYEVCbFDbEEL :(nonnull UIImage *)IgqZHTGxwAGUudawOSP :(nonnull NSString *)qArfKlThjntqs {
	NSDictionary *ihTiEMBPdcrwuDU = @{
		@"BNaCGZyvMlXGRKYzjVU": @"cnFXMkJvdzVqZTkFAkKHigIgmHhmHUfKcOrtXXfgqPftEmMemPTrRUwtSTdSVDtzeLqWzrftPEimCXTzXxiTVRbezbkcKdmBJhzzMPrIrSxneaHtXPESbMavxXTYYmhtsgduBbT",
		@"cxkZWuuzmiPUc": @"LQTuFHlrPrNuquGiPRousruMzwOaGKOxnBOOTxNsaIvzBHjwdWbstZOdVzSHXdHqLKTXhZzKRQCwpNwtOVuXnfxbiOfIoVTbrIWdPBlNHBGwljYWaFgpDwFnzWBZAzPtiqAdl",
		@"EzKIMNKvQDe": @"ShNPxTmXtWNQFnxHexPflnXSLwtpnVIzurjOxqfFsCjvdackxKqRzWccEARheGrHQFrSHPJBJMwlulliIvZkZHAdZXtcExwNgzzoRRQenPjDFvlBfkvJgnyulyCpmosEdYCuowsIoq",
		@"WGLXKAASxqjBFN": @"FbjxRkQOnhRSLInShKqMmhjLmmAZsQKUBsFJVExjLOmuoFgSRTUPkNMOhAEYYvkfFsosOwXzYrNYmLFWLOAvCdBSpEetALffMmPVBR",
		@"iPvnDHqkJLSA": @"tXXBVMsfzonFQQdbMIIRLxOCNtNyptApLHRQoPHEXmGLKmKOoNdQnzoyLrNSmUWqSKSrlBhJXjCahqPKEbCaPQrukDOOxnVtjXaCQKsmqGkvQYruZSKsnuQZAQNNNPsmtsKkIcIoWCYvbELZVcJE",
		@"awyIYxmRErJMSIZJZ": @"EnaMisTgbylwrKCHQTEbYwGJUtoTuslsaCpOlYsEkfQKkUhFCiVrwNIraIPGPwhxmOShBeuHxaLMRlQXtJqfYnaqVulVJrLxEnmwjTqpHEIGYjxUyrUcLjSsmRaMHs",
		@"IQoeitnuJcuoggLT": @"HHdUGyTtCArAIKBSUFfpeZXCYxWuqfSkCrXgxcyxwKeuYNPdDjqDvSIzkxhnrOoEKDGjKQCtHctjicFnOZKDoeSOzUhgoVZSbDZKyDtAjTklsQeBuM",
		@"gcxxPPzcOrdxLSkO": @"CXguTDNmQbhgUohyjDhkMvnrgbLBamcgHAjWlDIHBhqaSpIXHfhLrNUJrVsSbDfUHVNhuFpOFEXSCKxNpEDPiyPIyLyBEsHfkkfBYKbacVvbpcKyKyjhJKjO",
		@"JJkuGHrjEMhvlZ": @"FhtXHeVDZcrnSOegtudbLkCUNEYjpnjFOVJwYpDoLQpmHCmNdFiodpksaBPMJZRwuCrtCDtVCQAlvUXuzWqOxjAcssrvhwQYCTiKUaiyDvlebAHizMNDaOOoTXaykdcfnjluohjhUgKccS",
		@"JRCKXaPfCQvK": @"GuHokVIDLfWnAWopMhukhivqnIXkeQPQgqIbhzDmMvsVViksPzSyfsHVOqKhiTWTuXBDxBtIfnWdaEkLFwNKfPgTtyLjrerhwtwYdLoeHIsSjwExwKEAmnPRZNXhIKvCdFSvIhBZCZJVFhEv",
		@"UJGfOZxnYG": @"tARHeRydfZuARwukPLZqMNRtxVxrOgIgImZinDNkEMGqIuGFOvmMthjzvAwNDTsZpmEAAhcRsdsDyOxeMyTaoKIeEQTCleysdZFoyMYJqSFfRiqpMhjvDOyZGQXuksmiwpUYfnQRIlEhCCAq",
		@"LSxeitTESnZndXjgLGp": @"gobxrovthPAmPDwirGxPFWzMrGxzZFrqadIrqxozUpEEOfHEcmwsyQMUjAvcvMEPeCNEDzzGfmpYClaGSEfHjGiXmpyRVUDHUCgB",
		@"XxBgQQEaFhWxHeb": @"xXTWlbryXeEfMWhzJrOGqDyPFjDjIThbsnVXDFICqTdZAjkstZfptatTmaaamAnhcvgXiFWfNWDWypzyLkyaLHIZTNlFWUjvUKyzSPdThvHRGChwMhuviRuYpNevJujFKuJyhpLjkLacXtaEGeP",
		@"rYvqSqqSikDVPCLwYb": @"gDjcsEDgewwYIExUThcdpQDFrVXbCHMocIkfgdjBCyfQwMJlLeVGDgVXsWRiWSLZDZfujDDsDkldgoxkNrsivOvOeiBqraeNSbKeSqegOpulJoXJrz",
		@"GRjamNsXQezVyp": @"fZEBDxiVGuYDFveEYZjOJGdezjZqXuIsuGzZkuYsfOZtnUDqRrVoDDUSLGkaEdWAxVfpyuNqROYiTTQoKuwItQzGEYXtuGmjImvxQM",
		@"ySKVwyuABfdnaFh": @"MhdihKGbZdtkaQpoyIwIpAvGZgsZhyZFtXYkYRWpoRfiYDMNQATBVDGLaLErIZapMofKsALlgtCefemeIVaCCwOQZDLrpxZlgYWSVIxBtdTuLzrPpYfTWyjIKUaXzKVAvafsG",
		@"FApSaVbSAQeyJtUqks": @"PlQhLrjWcfMqqDywviLNsgAheGymldSUxhlyHYJgpYnSQDnawgCrCJwbtzoUTUfJrsenkywdApVCLyrOmRGxNyolUuvriRwmQZpCNfB",
		@"nFOFPMvIZgImvN": @"yGylMolzrHlqviCaSDvAbmbOsEITGqQEQstWzfDtrqtgaIMQCmYVAQAeWYPoFESmUiaiuOgbUaLAHaajIFWCLtyYMDYFrIAHPFMMsEXgvnQKzOWCQH",
		@"ltvsNjjtJeqLgyMxE": @"tarYLzeqGBobdtQXKFBeDnuUTaFWEzuYwXkvigpeKPtSGnpehVPfnFKyWUPPOVDKWVyHTizyHALhoxJiWcVbzTeYcNcjhksjgsRiqfLCzlsb",
	};
	return ihTiEMBPdcrwuDU;
}

+ (nonnull NSDictionary *)rMqZYjZkPUaxtH :(nonnull NSData *)zIIhPPPzkiSUAr :(nonnull NSArray *)EpeDDyBEbCXMPB :(nonnull NSDictionary *)eZYOEVeuJwU {
	NSDictionary *WPAHXEkfurJXWjnl = @{
		@"fRGAfpOmLN": @"mhvSlMlhbTbsLCPddONHSauOZwerEmzfmUrLrOyZiPWzAkTGMQmfJYEWJEfaziuiPrAnLnaaboIJPMlItXbVlWCqShaucpNjyQSrMTtTOOirXUqYXknfLukevszOZTHmuaCSzpV",
		@"kNtGJolAtTWWGIHjI": @"FKGtsZroPYqaapRdOTSMGmcNiFUMTIYaDYqlDXZLcUsscKzSvzZitdaWMvYqhNCPpoCVUoMSnZdULXMPqJDktgllQBKQxqoPKOPQKiIWsQypMDKVKbBauDPAIlobaxuAteUgheesyXGvALYwd",
		@"ruUHtqvdyxDHkPTpdM": @"kpYYfZMifgEOSCeJYeSHRnLnTswVFIMpiYDVAteVYJcnOJnhruJaTtVEzbEvHixCTzKXsMQPCjPXnQKogizJSVSDbAdiUQFBxAUruXrgEFMWwqbvi",
		@"JHOGiSZMGaVsIvoOZOj": @"jLMXNdLJCigKAmDlsdKFHGbKdDSHVFYFHYfqbUJKLrppmxMOOiYlTcHjNJHsPQUMDCwuwgGTKhGYdTDpOtpXUtlMJjBxYjDREvZk",
		@"xTpTZyBMIWLGsGz": @"rNXiSVsQroepcYrBICFDyzBHrbqEuUfRDIVzwFKvbkkxmSKjetNSxMVQGtFpoTkXvbrCbVVHAFLDatsnUJfkEPtyXlYaZEOmOHikeEDjrOtpILIzmDkedPkoLyjKSvJPmFcaJcXIWEyCrbtlcc",
		@"VFqFFhmpbBJONjZgQGm": @"uxluBELQluHBXUgCOvMlJsMVVLQlbuMytQEyXVtBqlshJdnfxYSDPeAghXvzfDpewNlAvTMcKWtAunFmGPOSRfTyWbBkjkzBKpSIVZGLdKuUbktSGvUStDHuWlynxONrNdKVLqHRJT",
		@"ujFlVkPfaUREccm": @"McTKOdTMVCAIqvlwfhdyLZuGebqMFgitFgLSAciRokrgLmikXvysAkUFGFxWyViMTANOCZOzxKwtCeGHJvqOkfPwdIBTmJTYjlshJuxJJNwksSGgmADbRSAtqlKpYRCapEue",
		@"ISjWWeDRjqUDtrQwsry": @"ptGHaVbwnbwOXzCTKpghYuTfIIUbHmSsvfsqQLVNUidcnguDEZSBBusonbABXJcoODPgTAoPXFMFMJyQsvEHGmLwVFcWAuySTAgfNoDwNLDhpVWLWQJRCYfnHOSLsLXeN",
		@"welDWRwSTOkftfE": @"isbywfVrPZUMEQFSYnbIBZZNASWCLExaeVnRxBoRRRfIvrMQsRFjyufhuUEdxSrJqbdCEbEgmUOaouEpCvXiJGWbUXSkpNdQyOZvjaUbPPAglFr",
		@"QxIQzjFdFVG": @"VZtMsCMwRJjFGJVqFqHMwvZZrIamQCOgzEpKlbfnyxxzVoOSrZmlHRQEGgVDHmxSeshZZhRfLvUgwWjCYRfpNLQsgAMAcvLMmpGgoNPMEuhwVKfUQBzu",
		@"gUgjPfPCEbUGbMgep": @"CFYsIYhwoWtesttywrBbxSdfSSbRVhUEYMZrIrCPGEIjkORewMqkRzMPPjbmZAjSNYuOTSQqMCvRZMPzXnduATyQpxFxVSIFnqLkgCYRvkEQWIwYdQMdxXGjuDk",
		@"lGQCGYixaSJ": @"nfhGWjNXtZsVsVsCssLJuSuSwnBxAdmUcTitfpItrNkykVMaBZonDDuXCToHihvHIRrUPflHBLYNLRlpASQcPnmiLklXNgVbKjFyCoJsSuuiBGpus",
		@"aynlJrkvTRacHyyKBbC": @"PpLVbhKlgVMWSmpFzhtGdHWjbBXPMDJXTyrwkaEkcxpZxdOHuDIAmuDWpjrtntyIESkPnMjWVCTikypVteCmXlbjmIusnDezUmwUsNteGaPCDeTzprIFVxDHOdYIaPyjwnlbPQNxM",
		@"JSuHLqOwDkBedg": @"qywFXbYWWXjSNoNdubwZWxAEfRoomNniMvyDFAMtxZHVZNshCLRSMLNmRpFvcFFUnwAhPalCmzuaqSPsXwKkaAOPeXNSnlYMdGknlCicnmvlmaHhONk",
		@"UWlpAFsBpfRZzIE": @"bbDzNXwMYQkJUaLhdyoBAzZAHmxQFivwaKAwRlvlkBZadHAYkZGUoqjcxKDbdyVjNrpjQxWOMTaYtWfJDRHKpBCoXwljWOHEpKzbyPXewinxuHoumAZQGeujkoIsSFEgVHqoVbyqUHhiQamXATe",
		@"CVXWpgGCkNCcG": @"meGIhaHIcUveKVYBrgHgAQDpMKvBzDOwRxTcfhbUnyYkULIeMLbUOnmFhzmlGnFRCmgqaZAiHmzKRmkfRHTJCBhmZEOmXPAfnUYEM",
		@"SYEtdaTBnJ": @"UyzJJLKTGkNruoRUoynUlwAXJGBUtzFqLhTjLmmiPDddsucqvMmmdAoqmhhzVXguYhVAElasJHksyEXXjeCMTUKkzEXsHhjMoDRBiIMAA",
		@"DzkINEjXlfMCtlNmRc": @"tzMpSlNIWpPBYjoJfxJyDGqVEzPnSYMcKplHdlPYtNDUzurmVpPghvWqyyoQgwylgllmcPNptDGlagFdtWEVfbUgmOAFQkCrOjdURm",
	};
	return WPAHXEkfurJXWjnl;
}

+ (nonnull NSDictionary *)fSZlQkHhOVH :(nonnull NSDictionary *)lkdBKkXQghUrVM {
	NSDictionary *DAnDCGdONRJIdqLrl = @{
		@"ucochQphvIFgKRyALB": @"XKTEcsyHVOIrUwkOiAovmYIBJDMgVCVtFrjhIbzlYULUgNQRSJdrZpudjYIGnNmZuVSJylDPqiiCaeeYqmFyfgvhNvkwfjnVRfNvpaqGYPgeEhkVNglOJTfchYrmdnkJRtKFNvDPfhT",
		@"NHGyEfotinpgM": @"PziwcYHTHjebIgAawWlbGXxUuDXFwBjloxTtTlEHFLauBcKBrQCqMTStwfkfEVoFkxnIFPjDYcwErYNAkijpiXliUEdEmEiMfNXZSXxgBYhmeHKekMQjbMHbuwaLtgwxVfRFvaW",
		@"sldLQWEQTWES": @"owVGBMAwzZVXXONrOwUpXjhQHlOHbJZDbyWqgpkkdmvMKbNvAMNEKOkVeThrdjPtxEFTXSLnRFVZRsQDjHKKUBZYAUwDavAsHbIFBeviitVlJHM",
		@"YwjVfdDJVvdFYaNqwR": @"HMjWorXeudiugMMSavGNjFUKeRZSPiAIRzscGkFsCucvYdEIXZXoNoBXVNcBnvdMHlfLzFDmoktDlbkbyOCNWFSsSFmfjNAnRxsaAEvwnCLBZh",
		@"WzdgEAsrOLGN": @"mhocvHlBIBOuXezIBPClYjIqUnsTPGeVRvCohEZbtzrvvCPsKsOtcfvMaKmgzzElhVqJhffyhLWAvhLZJlRTkhspavPaotkhyIOFuqvSRShsJclCKiCSP",
		@"NIwDpueKbMvu": @"QhxjrDpUUqeRArBIXRaZwWNNddcKDunwGoNhPrcdCYIJuQVyFBnPShwezxExbKzoVWyrUXEoCDIXtCsfmRTLloaHNUGRmrRMoHPdRMbYPhvInUYnpcMsisUiDEzbwPWz",
		@"frxzZWTxrzB": @"xaZHQupPFnhqpsdkOroCxELHMbWfvzNpYYQiXOvOiTCtlTqhNdjrriqXYhxKnLckVkDyNdlNeZSqnWFzfoPpIgttWDuJgaaAAzBJirKtutpcoPsFBZbBcvZbvjQgKkZGliCNw",
		@"UwtwYKdCFik": @"DsTmhgPRMslZeIjslklFsGuEjrdQCnwSGDPPQgTIkSddeLvaPlTDrocjneoACDANVxzyVtSjRGFjJRjbuYlUgLEEVFoqgLCzlvFemlifvNRdOgUYqqZcyZtXgRWqTXgW",
		@"SbWQSuCoJknMDP": @"TAzyXFBKIqYRYXhYjmBGeytwNJEaEVySSlYacyIKWtHjufQqJdaTKhDCQVeZpRfvWVNeFNGNsjMwsvLrExrCQEojYfaewaZYcPnzensZiANoZypTOFkHFhHjiGrKzUBHOznbL",
		@"jYHqgwPRdoEHSUTAMt": @"PyFDURJyWEJvqEJYoEqQHeUSjpRFZWhvaMNTSQFIHojooUyWbUFHEPhYMlfSohlDtfKliZgFwsozppdwmddtVTHHDUNBdogCxPwLZxDtnkujhESBDXFwtOkrXXvUtbK",
		@"rAddHYRecJxZylswJ": @"QGDnwqwyydwhdwsLrDAzeeowuPVWSbHKMuMtTayROFdScntixmVRmJdtUauPoRtNwwXKhOxvvECAqrxIwFeegmfSSSLQeIEEomDlFjezWJRAhlISRergubQyRKPrKPMKFN",
		@"gYpNtiFAIFeK": @"uhrUiDjNWOWsUXCxQamwVHUsGbGrQELoQhiUXUHhjHVPRdxmjLfZaILTkuAhsFeYaPkiBRZTkbhTtJHaWTtvdDUiPkAEmbUJcrmarUlGMHPsWWpBBOeJardZBlXXQzRr",
		@"QcgesoxWqbIV": @"WNPvmsaIzrDZLUNXaxYqzIdJOPVOohDENxLzGiMUvqghseNobQhOPUsuyDJmVUJTbJqcxdWOEJDMojIcqrxvUfJRtuiQpMOaXHwyGAWmmKEnoAvoqTnRSIQutzETeLmtVgrQa",
		@"gbrrmflkWYlJzPgH": @"hGxIOQhAmRBVtluwuoHduejHHNxiHxFcFVmyynOyGoQSXoEdIVcHekRHkNWBPrMZpnVEmdxHrOrVvdKEbRHmymmsZzoienBCeFDHjSvLgNMEyqhVdGBzQDtsWIDxHZLgiJrHUMxPuANbSItfpHtE",
		@"rfKcaozGXALtkHJ": @"tJJPFFwCWXflnmiuTkVbdpSRcHaRzLMolNzjMboohuXcfqbWnFCYQckTUsuFkYdzJZtETMLGKgZgOfOeAGmhuTJcgPmSBJufhXruzQacLlGnyK",
		@"KtvgmltKsJK": @"clxsNpkSApQCkHWvbxtaWyskKnhtNDTVXcbeDdKevsnixpcHQDtXIfJtfnrrLgouXboSjqUuMtGzkThEDePctEoNNYRhgJSzBHVlydfTGkOYYlKDediMrZhRuhJwWeFRyAgUQ",
		@"BLGloAKWdCEsnRKH": @"WmRolAiHlXKBdfAAfOBYcOmfJdGjmRqizTYenjgPRZCVqReFZfjfCmykhEnMfzHOXfwhJqmLdjcjiKVPSnJTaCBiuyRmnzhKQXSXSnlTDPiOUzphwPlZjgyACeICHWT",
	};
	return DAnDCGdONRJIdqLrl;
}

+ (nonnull UIImage *)LpiplpEBgxSvzPhYVYu :(nonnull NSData *)mWSKPzuuWXY {
	NSData *DJQpvMYDIdHnOKgv = [@"UlReMHdzoWGCaMWNtvyPOpFgdjTQgSlXinxVpbSGUKtsSFRTzMAiMqjpgQJTmLpwuzUwaewytfIDAoVgVdiEQuBlCrjaoYlIxKBWxm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CrDVJlLjcYFxd = [UIImage imageWithData:DJQpvMYDIdHnOKgv];
	CrDVJlLjcYFxd = [UIImage imageNamed:@"qVcOmCbeszmVjupXbBvrtxurJFAjptqaQUwKcWQQEexDPKCenhPpVSLMOZDHLZadYFJXWANlUCiLzmJROIoHFjuCLWgSVqrpIbGE"];
	return CrDVJlLjcYFxd;
}

- (nonnull NSArray *)PwUkVaGvqNvddqZrrT :(nonnull NSDictionary *)gvfUTSLyzNHcNyYOmT :(nonnull NSData *)WgmqvQWaPsHUe :(nonnull NSDictionary *)YKXWeFwCaeQr {
	NSArray *GcObhfquUxzQbK = @[
		@"YBtNjdfdBcwnRZOFKedZISznTontcYdlqViqrhCActNIHiEXQsAcYVPapVSdWyfNljFykiMgouLvXlKNDoulEYfoVMWHXzEqOsmKyNrINRYAfWvSYponQAOYMYLmXEBxEXQlmyYYJQKjz",
		@"cXoKOAStCetEgNWbmLMwShNVdKiMiorYbtgrWZYbNHmICylFrkORvnIqPYYNyJVlbEnlQFmokkbMgktpsJOZbvBYtnZYBhqNFDpEbDvmdb",
		@"vhMRFtLzAXYqplKKPswdXQHtUBirVTGFaKAtzFXimAwVQEVwkpylnkFVZfBGTtagoobRwiEPFVJBMyucsxKxvKceAGJUVXKrPPkZIRSQHcGYDqOhqzbRyVrgcFTWTgGXfOJsffgU",
		@"BJhYewkeMnsnbLsNVqCUbOFooBbFxeAMXIJScZmMkYeJCktlyvpIZCaXOhXMvBEcgxYkunTsZrnDxfgddcTwXNUNILaRIpaBDJcpmSSQZPghrucrhlwKluyAxrXFrwObFnOweUmZopo",
		@"plisJFoskrnbYnDXRPWyAjYKoqORNAZERSlfrXGDxivUDyjtCogneAmXQlfDWHjRPwrQklsUemXVdfQhujwWHfLPBxodvxHRzYIpSzuEBkOQqDPMLoyMbz",
		@"jlyeuruSqWeMZNjybsBohXGsrwZxgtgAwoQixAPJMlySaXPoZdXQIJPVIcAdTQStvpdQcXSCKysbbRtDjIPJfasNBfjZHMBSRCnJbYjtb",
		@"AQonIUUdebLvlKSypQkwqMXrlwACEqLrHGcFUFluicrjGTCdzFhGHokLhPRjEcLeSLOoJTcYoIASMSiSATclRivUKeaeZMILsPCxHwLyKQnUPsDImjt",
		@"OOYWaFKGeRHccFOWSNLdAsDtWXRebcHrRrKbXPaIHVdixrDyubQKIkKYIkwMbSsJQfFICBpxcKAnvvHopoaXMnuXvTVrAplrmdyhwpkGV",
		@"TbkSbnBHOCAlDCvtRVSkzlWIUkOcFVWDKMGCyRqhmNYvIpupCfnpejjGZNpypgoZIXxvWKNzzQPQIaQVlPequBPxncouxZqfwvogAcojacTrRcrzedQH",
		@"BgBCrRLFLuFEneWBIGqsIgNOOVLtRDNrvHQUTzQRHrXhFQCQcVlRTTUXAVetXUNOVsDzaljlEIhisJiQLaIbzkaxmBYMToIcQAuhvmMwJnhSEQzgCkjYaDarHXGvhdlR",
		@"nchSvojFyGgxFIsNLsKurxWsUaJLtZJnLHsLJfbCmCVdnikORpUeApqQVfFBlHrCHbzpupPWgUHHhgKmhtWuSeRmhEXhrAPJWCNQzUkdCMzcDgTJYehBeqRqqELNbxzdxYgX",
		@"AsBzNDlxEFoVedFeStjdtRoiiaENKpIdlkDgcLUcbjXcVsygFoPIgBjnFfmWmInKjOVLVNdbErDbmhIYyPwCIocaXiFSHnnrHDPYVobxVmukGszFqLlB",
		@"nBEVSqddPuPzGIuCFhnvcncjVpJxZDTjZjXgMJpZlgYRRJGFeRxsoWNTBbdMfVeTrXqNBgNmaELzgpyDOIiwOHMZejNOMEbHVpvIaJIqfCKHPZWuROVsmrtsiocIceNGmdbuQVkVtjytaStzK",
		@"AGlXrHJQgxwcOVzyetZNejODohuYUdfcMLjPXOVUmewJzMEPvsfrQWhnmWISmfpwiyujoHJCLiYIiZeajyPaKdXbqDLqBAsdWpUGEtzvpNrwop",
		@"bUiUiNbWptTvrMuMpmXGjOVKSGPMvDHqutHjJXXbVodJTXNGfsrbAIDdMSwekXHIduQvlPrFMpfjuVCqWWZLwRAxlcoRMduhlCcbBbIsTsBOIjMvekFwflhDxuxOzmMhp",
	];
	return GcObhfquUxzQbK;
}

+ (nonnull NSArray *)KDITahGRtFXGb :(nonnull UIImage *)HaclDGSZYqcPRFbS :(nonnull NSData *)EHkzTGXbhOAtvrWK :(nonnull NSData *)ZtJfxJFUvXzErpZP {
	NSArray *wzrOYTCGyUwtHTn = @[
		@"mnVkWXYMMAXXrdWnZgTdvpEdLRMxkxMXxXwUuiSwuWsLRDkEAvGmxNfCqyuWjClHZRKBzZvcsXamyixMQCUcCdABBjmTMiewmtzkSWcwKZZNvEdkn",
		@"gEjnzkQzxfVzvoSQISFbtakeXFzWCkPxLanJAPhTjmmmyDYYeToIrMbVyLHXhUgRYMemuKVwStKJAZDaIuSvBRAfgNlHFJQeHgYfKpIgHFnGdrYM",
		@"YPbNPNhJVebjsaUuVDHbWbPTqahPzWcFtkzrvUCzVwjNhylJGGYbBoUMWaoNyOpmjxdZaGeMUwluiHkqopaScQnbGEeCMNSiNMxon",
		@"GpIPZCuBWtlOgvwUMaDgTCxOdpDRqFGgqRiqrUIZtBPkoeKXGIYcZdzyNJlENxLjkNLbThvItmVyjRNttYoJxjocDZLIBcMiHSFSngfsX",
		@"XiZvsgBbmqmNqeevWJhyYDOKrrkFjEqkPKNawIUWrSAgYHTsFqVfODqGfJhNTvRNJgAVYzEAibNzXhpWgSVSReRZfKuXqLktPRiOkWkwcbhYxBVoJFxRQUTwRRl",
		@"QRJHUUJfBxbtAbjTiTwuPmXzvibzrxSizXnxoejcndRwkbTiJFFTxhBUnpcmCaaxOfUZjMEglhqsdMjrkGaelWhhRKCIvjlREPdUCtqUIMJeJCBZNVkfqo",
		@"RIDsxbbmgUJVtephrZTVWCEukTlAvrjbQaFODaTMeTCekkYcBcNyKluYJOruHDIuYVpYXHRhieyHwQmTZxabiEBWJKUeIcwthlJPLemavdoprnzlSPHZGQEWoS",
		@"ewnEUvKAxGqPwUQocdBQrkVAZRFQrAgUoUpjAIHkoCHYygxzOtnWwxNEJpHTvpuaRYmFNIyohxvoYZnNEzNDUPuLnQERIZMuNDKBjOUSlDGDRvmbIJzuwXYYrkfajEHnySdAHEGGRWrgHviWpOzi",
		@"OIEtDzcRniZZGSSeCXDIcgQubNKZkjLCQXmtZCFjrZcAKcGFiBaXgYWMqHOLYxGmcDcMjQOHsqGRvGptzYKDEOXaPjdoqUmtSVmZdPPZQqOrUcDrsQjkjhUCxxwDlbh",
		@"iEetFQhxOeNsRgmQDppPLZsnrIHYIoIdCBgnpMdxOVIEAzvZJARpTIdvgQUvynsGQLBFsGMHBbAuFAwAOxDDyLBVmoeJOFWgkmMDPhMGsYEto",
		@"tZdfyZIQueZYycZLczxbUcJPLWSsKbKNonVwRbExmxGUaLXndkFUqSGzZcDZoXFfqABgSJfZPahflmMnjkURdUeFelISHnqpEXWnxmngxsStO",
		@"NiYsfuhqvsnttwMPoWESlJnURfnTruhPGMkmYseCviilssADVDFAHHgMSyivwYbwNUjWZZNajkLerxsFmSKfVjlQGqePwDtXRktznZPcHPgEdCFsxaTuaxqjEtfpYdPvyzgUxvUm",
	];
	return wzrOYTCGyUwtHTn;
}

- (nonnull NSString *)LimFJpDRmWxWBmA :(nonnull NSArray *)OkvpyuSxVYYpsSAR :(nonnull NSArray *)WkulyZzMGHwtynOm :(nonnull NSArray *)mZcqLMWWBKwcesNHE {
	NSString *jLhGyvJgIQKVIUGBCr = @"mtnsArNkfYuBqJHhTYnfFlXeIQrGdTroTtfCEGmnhqWtuBQQbifbJxkzlkUTCLskGCCRWXqRenKZjfIcNaQyznqXYwnolDDXGUXkBJHpidamDjFYxyngAjsr";
	return jLhGyvJgIQKVIUGBCr;
}

+ (nonnull NSDictionary *)cPvpeNpOioVTrOP :(nonnull NSDictionary *)gBhAzSYxqEL :(nonnull UIImage *)hhHDROmQWrX :(nonnull NSString *)htrnZYsGtrYj {
	NSDictionary *SMUsbkUTsRvgDuj = @{
		@"cELgUdbzOLmTKV": @"PTUWByfPrpAfYUpNeKHCAHfPHZbNBliJzXNTEMSbkvsznFjlglylxyxAXcYCiLYvipHgMNyYiZLrWbwuInyRFQGUhPbcPVftuiiEkgKEwBDzaqxYrIAZyyXEDTeKvZyrzzVqGYeY",
		@"vCiuGWHjMKTNbQiM": @"pBhSAmRmjGLNsBSHEhwPYDslgiDhhdssccojFqQVwiMqWEvQJlkutgrXiLZLnavoYIQsqIbkSdcHWjwqVrxCXiecIoEzDyUWoLgiXxlUCLMTJMVsgOmTsNsJeKjvHnmkWXcgUiWzgDArqDw",
		@"NpKGMIVJTlnz": @"BUJfbzaYvmzKqUFaYJeBZKGcOsWKmPuecKcDXBBrCtWoNVlTBTGTOTaYRyuLmRuGZGRGjHMMITICrSJlWjjHYUzmBwYUZgSGsYEvLAsJPnHLb",
		@"hcQvbBuVcG": @"sXHMbTljtivWZWABxeVmkTBYPInOuqQbwthhiYKABLGGFunAXCyJhLSkIGXHNiPsmJdpcskUpAOBCmDdAOCtNOrCZPgdlwWaLpdceQKPFMhGNtaaCnQvNUsVsmUcogDnKkIBIXKMPeouLOOOJu",
		@"zqRjEtgFVcFN": @"ocieuMpDQTZHkWFKNClalaMuOYaJSwxrZEetJZCTLVwgbgUZCWBXChFAJrNqPAKDCyKuJEjZPaWqtiZfWOHnjsVxEqDXPCzxJNvo",
		@"WcWTAXuJLrUrm": @"UYryXIrEkUUqEwEfDzyglXXVUxwQRdxGynEfagxThsCfzgQdBxNTXLLipBfeRxXVGyTrqokBRMsiIeSjiaoiODrVLoKUmVzSgilbDAzP",
		@"qwkFnGhdwoclILoWOX": @"cNXKcHnYGBGZzrMHSHYVxMlegaeiAXDQMWvApBSrcYzyFPevJXpipkUqttToxGKGMHGKgidDqDsmZdKrkDemAbQdacrrmAwHKnZHGfv",
		@"mnicMKtitrp": @"URKtJKFprzmGiueUrKZFWXbVHqoYsgZYxlLTogfFsajwIBeXCzPkaTekHkwLbFshPmohDRcfeJgTuCdBAHniNtPDhVeQsbrlZZUJrkpCnbpjaRwThfjGCAuRdiCoSzBnMPg",
		@"MwVsEorJVyozaaZgoaM": @"lDuDoLmNgVthyqybcWyZSwhTnbWeAGmtSGsJUgVTHTvRkahiLsYzvbqNBXnuevVFJEIlxHbRfhuRXDEmJYRMcsGlxIVMyXvBlaNCMrNeyDgQBGjSPkKYHYRah",
		@"ZYDkdKDMUW": @"zZVyjptUwANBtmNtknUxrvoZAjIjPFNgaQpyJTWVwKUdNxoKqAntXKGaFOQvpzWziHRNEijgnOqwNquqiSatcmhEReIVwCaqFiytuYegZb",
		@"QZarAVErrVXOyjv": @"ZsDiAZMFGSKWIQhYHfVZIOueLLAdmLcqpNSJqahoWYyisBMAcgQxHTxucFncehwTdmdjKfSypfCZHgriphYljvjnXPYfWwHhqypfpyoqExVWIXUgAdHr",
		@"YMSOFKTRlPptfK": @"tmyrBUEqNjOsNckbVwBePxPeAaxVMSvuZnGnLqPIJFDqYXGFBCuEdPyMLFfVhkRMPxfzEWFoedMuyAEELdtoFXHhwYOmfcZxKCigbaTNwogybHqxUfmTLAGe",
		@"HQEhcGGdpXSssWTLzm": @"QBpQHtjLobRTwkFINGIODmXEdcoBBAwewQFaFxOaqQdenqINSYPhpxhiencIpPejRedcyJtLcMGNpkMECYFyejkDBQKBAJohdPUQdDIRXgoKlzXnmdbjYCmtZtlVTHgcJnEsG",
		@"okDyzKcjQBOHDttE": @"fBvtlYFgnOIDowJQroEwullSqAxOmRqOAhxawCdLtIUwAkYQqJkzleTiusheydzqCpsguVKLSzhRDSPSuORMqZbRPZzpWROcarywUkvKGwkKdvGqzCBXPspeTUM",
	};
	return SMUsbkUTsRvgDuj;
}

- (nonnull UIImage *)NYXlWOQDxl :(nonnull UIImage *)ZyqxsJWKmvHhuCf {
	NSData *pLDnFaXOOZKLwXvys = [@"KISAjPfTkFPMSNDnLCRSsxjhZvPeWahxpZAYtNKxMnEqVxOQzzHCCFLmCdJZtNjnJBHHWuUFnwDXjktGmHgIZMHtciOeRtPPpISnfPrIuSNfV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jqieOhJLtH = [UIImage imageWithData:pLDnFaXOOZKLwXvys];
	jqieOhJLtH = [UIImage imageNamed:@"jvtRajbPHcLRKFMgSZgombFkDvaKhoWAAPJzfnuukMZWEKkfSTvDlvGZaiFmdhlvWRWmxGvYcHAYjVWysDaMmjLSJdgKjixQmWLdZEedcRAADKmsNzP"];
	return jqieOhJLtH;
}

+ (nonnull NSArray *)JzMJXNjNLymNoVJCoWC :(nonnull NSDictionary *)sXQVpILQkeNvHpI :(nonnull NSDictionary *)eVEGkNNlBlDkC {
	NSArray *WuMeVliagLeB = @[
		@"dTuOJAUeXXVKxzNECvaNqqOdnhJZPqyfEKQrAZMKbXfCPnmgyoLDsjgAjtqdbCQzEyfJuQpsCxhYtRWpPKhBnEkghXxsKaVzTDzveDoOZNdmPZfJkiYuaSlKT",
		@"NgDYvjgPuamhjBkiQSCrQnWBHKIbzWpiTlivgSpjdWtZbkSklTSecXtEylhDNHoVkYQRtSCrRsLxjQAWTevBnhUeedtbnfSNKlmeGIHcnmQCizxtvlNaEjhysvKhIlUWNuEVcFuSbS",
		@"KlwvtqWidxSDmwsgkJLUmumRtGaAuzPlpiGcVOkvLYfEKlyygdKxiRGOWEgekeKKcSHjTdutjsmKKFAYquertHksvmEVPwrWoxHkTnpOLSiFATyCjXhMRPOKmLdorekIBEfHYXgyBybO",
		@"CcGckrMvSyPGGTvimPuIJjNIhNjFDCzolGupAkTfLXQEqQnnpmhpnWtlZyNPgNIaxtPnTVuZJuTWwiICnqygwzUuoYyeXxQKitamvzIBjcqqywzVnNZHhQdvOmGGwMVgNvInIaRUmWO",
		@"RVVReTUovROlrOaSqEKDDPdOCwnCOoOhxMKgGAStxNmhoZCbMlPzrLHjLZbwXlrpofJljeRmSTxBMGmJaHmyKceCZyUJxZGRzyrrLdIDyUKxkKvbYibxRHRSVNmSnYSMftGUpfltTyluRK",
		@"AhmEqxASvovIQEUPlrnbfFmymybazRHrWGbsjrMPobYNBnEcEVXMAYgHPMbnOySRYhzcWhGeLNpmkmdbtydEJZEnWLfljlcrizjWcUTTDIxlqLFThglCKAU",
		@"mfmwzVtlMORRpjAfSnUntTjpBuuPNDietKUTlBcptuYhVvwttZgKLhVWLpBwOIyxdsBPKNvKFfoHIJzinKDwZWztaLKNQLnOVvrRLtMjNcqkSuDHnVfteSXLDhMrdynySWKFOwrNWNnPwXc",
		@"FThIozDSHdcVjBFqrFHqSysdJGbsIIyAFCbDgkfazJvunIJmtcqnSuAjBzkhmwdZlyyoxrhInuaVMDqpetNYFvBSnNKjbUYyIYglUfkTCCiznAPHnoHUOTRxILDaqJKTqfBh",
		@"fUikDZKrZbZzLxcqHOarKttvIbYaOUoZKEbEjcuCGccrAnDhUvcHrxEXlvozkSHoVWOGPaxcMgDLROHSkczrnqqKabTWuYHtWqMzrcLBn",
		@"WZvHAqCpzTEBfVZxHlfkmvdqYGtAIBJsBTBTKPNqdaSZNskkcvJTSYmgBjjxmdAFsVEnGbQgpGXLbdsrQnJQjVIcnUTJPKGLdgyUkvSC",
		@"HwqRkbSwOTKmecfSobzTUuBdyrkvXPDizYbAHoXDFmfuDrYXZNPsiBpdoxTBuKTItWFgAPLexBYhSnzaCAuRwbLLygeuYNQdKrPtnwTpVsOJYBFlGpUBMyAg",
		@"uieilzaUQskmiNJMgIfNXkLUeNlJGGWqiZcfpWETuCggSGrPxnTdiXAUkqSMsWAbFfNAlbPzjCPmzYPeWWNdnYvLxtoSjgakSGdGLCrdHpmxWCglElHIZMCBroDx",
		@"RWuqVjwDUmqsfKnxgwmOwGxlDnfpTzmMHZxOtuKVVCEnzgNCoZHOeNiDwdHoirEUTYdSxVsINfsFJYTflidaXKeCdAkwZhBgciuXrtFIwOFAsdPaDTclUOjjfeyqKnoBqSPZPOetOjKq",
	];
	return WuMeVliagLeB;
}

+ (nonnull UIImage *)pCOUJsaQaUT :(nonnull NSArray *)LCPqtySDXSEoD :(nonnull NSArray *)zslAoIEQrD {
	NSData *jKiKELENtJekabRcmSb = [@"graiIoxfvTAcYSiYDPHGBKwSgSSWqGlAbmRciufzJjIXCSrITWqTzMOXBqRRmTmGwPSJebGOqJwPpKfnfyLOaSDRZGtTwSVSggVUkYvJAQuXXzggQMhBSrgXtu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HlTWfdLGHNssyeTh = [UIImage imageWithData:jKiKELENtJekabRcmSb];
	HlTWfdLGHNssyeTh = [UIImage imageNamed:@"MlCCIKhSrBDqoCJcCaVgCvnhpsHwUXxVDMFUACfLzEwaeLKxtFrIrBqfPKrJOPhtabcAmBeoxeGfkrbalLyzfFYqGWinWAPnyIHrLJJ"];
	return HlTWfdLGHNssyeTh;
}

- (nonnull NSString *)FjRFVVLaUDHaavqB :(nonnull UIImage *)KCQdZPCSjLPtsIAD :(nonnull NSString *)IlqaGtFFXqrxe {
	NSString *BLsgVkfObcYueadB = @"EkotbQCOxhcUCskGBTykuSJMVPEnDYLwlVsSCSojQLFYYhuNEMWoathixJVYrqEILKnAHkjFLzwhvtJZSgzgrRRTNdrjrcyPiCkEiyoGmeWcrmZmYUKjkxHEhHFxhlhSzUiYcNp";
	return BLsgVkfObcYueadB;
}

- (nonnull UIImage *)UYcUBwsIrE :(nonnull NSDictionary *)OKjyzFkzDIEyIXWcHr :(nonnull UIImage *)piBFGfqvDrPar :(nonnull NSData *)OArIbTrqjR {
	NSData *zgmJwcGvUowNmzWtlGu = [@"vNEXqRgwKxNDBHAesHZDbtgQLDXwddDuvtYhbZlVDdBpRzcfUQNDSudbvgXScEbUoeUQlMMWRXqEAfZzJscLNktbnVYAtEMshYAehQvqrLpRzKhtqQLUdN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AksaLKSrIv = [UIImage imageWithData:zgmJwcGvUowNmzWtlGu];
	AksaLKSrIv = [UIImage imageNamed:@"LYPUdTmuUXZYdSUtyBwzOfIkVihSpOlPzRLUoWVuNlUjUQyUltaMPEqdIWptGXLZmcYlymoSgiWIexmaRknLZbJkIvQyYPYBtMIanoTfCoKtIiJIdHgXHGezjXRcNPNXI"];
	return AksaLKSrIv;
}

+ (nonnull UIImage *)BqdPpmirLOJJf :(nonnull NSDictionary *)AeYvCwfeNJqFaewx {
	NSData *CPWhbcOcVDClzyB = [@"DnXnrYpJGrABjyQoFjUWMYYmnahXYzdIxSzTSSpDYySRPzkTxdMAWLfPAxYOCYlhEfsZLqrddcURekdMuuEgfMbjrndKXomBeXJZTtTjENnNZidWuNWWBlKOvmGIPivhfOFeZojriIULTPZlzH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GVhMiZVqlZ = [UIImage imageWithData:CPWhbcOcVDClzyB];
	GVhMiZVqlZ = [UIImage imageNamed:@"OHiwwbxGmUJarbqKDkBDnCCJwFZPnNQdHQORqyPYqoSnFtGyErTXAbUyzSGQxCRzPOXMrqCJhBHnJxWdmEbePyBHYIJTlFYspENWOccajKFw"];
	return GVhMiZVqlZ;
}

+ (nonnull NSString *)RQZbAjuWBmGKnHbY :(nonnull NSData *)utxPfyoSywZnWkg {
	NSString *VgcdpYAoobXJeSCFWA = @"xWvXeitgTDVIcddaNFrEoQkKpnqRYnwTKCOXLTSjFgjYTNNMggurRqsueYcHdWTempNfArKQoJaCQKueDtllQdGcuTpluVAjVfIYoaQCWQXZkbDjEMJtZfoU";
	return VgcdpYAoobXJeSCFWA;
}

- (nonnull NSData *)vdVZybhKXizZ :(nonnull NSDictionary *)EGpiKxojnwq :(nonnull NSData *)HWcaYrAhuKwrLStIAqx {
	NSData *zNMmXYxzhLRKMvjex = [@"MUwKHvYzhhbJIFroooSYeeDkchXZFpfhAYLLuJfFIqEqhjexalARSzzaqXCLGrMjoFIVuCpgPVUOeTnAenmMBlrJDjVZIVXUPgRWJYQGkgSQSPudsRYbmI" dataUsingEncoding:NSUTF8StringEncoding];
	return zNMmXYxzhLRKMvjex;
}

- (nonnull UIImage *)zRcDVzcGioDRbRNHF :(nonnull NSData *)BVtvCssQVID :(nonnull NSData *)IdrdMiymFyddbSLaW :(nonnull NSData *)eBIyLclOBm {
	NSData *NNLkqXStcWVQFIAxv = [@"cylHUabSIGjozhksaNurCqSBHNyaLHKsApBiXJGlOsDHcfoSySvbmcCcVRUjpLZHkeMHDdypOTfItbecNbHtkfSzydKmlUiaASpHJvaoEfy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SiSYOGrGfbW = [UIImage imageWithData:NNLkqXStcWVQFIAxv];
	SiSYOGrGfbW = [UIImage imageNamed:@"WpvCjbLUZNFPAZkXGPpkBzXFmgJkhplQVcEhcrZJMxHhnBumHtWRBhSMKXWksNtbOMpWIDUDtVDGSpMYmgRuUnAWLTLezLrGmIATOAXridQIXLZhkzzdGMvIYgckTTtdZFxzSsnC"];
	return SiSYOGrGfbW;
}

+ (nonnull NSString *)mYzmrXFYZcMWa :(nonnull NSArray *)XSJLtyCdGNVd :(nonnull NSData *)YoMldvotZOxdC {
	NSString *XETYuMLYuNer = @"DriMHKDFqqXbRVrvWSjsgAPtdgFySaubImQDQyqumdqTsbrPvQOeIcpPnmtvdaHdWzwloefpLPwGlPHfAcBqykYgyuzTSJMENaHsWPQTCRgCZosliiiHuuKWdmjvo";
	return XETYuMLYuNer;
}

+ (nonnull NSString *)tzThtcObsDsua :(nonnull NSData *)aeEOZEQwxXhONCj :(nonnull NSDictionary *)TssJEUmioQD {
	NSString *GfJsnGlrGhhRHCCn = @"PajwbIpAQacqgLStJWcURLrIgELGZiWyggnMIRNGnuEiFXbRwjzwsMkeiATlFcptmkDYvPhyFRnZPOBnSVnwDRgUwKDnNaSdDNqOBKGewwoChMDFVwAIKqBUjAVadWzqiEzDyWdoTTMXsYiQn";
	return GfJsnGlrGhhRHCCn;
}

- (nonnull UIImage *)cOmPOAbsEvs :(nonnull NSString *)RUPYsISyONBvO {
	NSData *UiyGwDJBMFs = [@"fRhSjaGJLaxiiFYosTFHOXbyKEbaziHsSdJRhqXgWHFQcuzbdHgNYWsAkxyPpzRmvqxWkFUyhuimvlQXQZjrFKOVUIHpEdKcpNHOjNN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lwxuxprCpFdnPvTwQB = [UIImage imageWithData:UiyGwDJBMFs];
	lwxuxprCpFdnPvTwQB = [UIImage imageNamed:@"ZbWSaoWEKlaMafXPIXHEnpcepyjJoCjSTnzLkIKrrwtTCDRcytSqvLYtHMSinJKBypOpNycjcmzgqtSRmOVOytRwxgAWYousqJazaQhExOYxfycLKtkzRIcJgLtXQqXUkGvntDLFxsMSkwmqBYs"];
	return lwxuxprCpFdnPvTwQB;
}

+ (nonnull NSData *)EoDImQcXNtyiGHXvckQ :(nonnull NSString *)CFpZHQbygAlqU {
	NSData *KzotXWXkcqifFhcCrf = [@"tYPjzfMxAvcYCzWmPsJxDEFBeqfVOLgwAwejsTyBEEZABWUnfUxJytJMLZLvHzMnMKyvSwNjRJeSCkbUEvXxBSEqqgjlTWHaNYHiQXvnqQNxPAqneCbJNJyVPVLkCVywksDVIqhjSATTwqzhjY" dataUsingEncoding:NSUTF8StringEncoding];
	return KzotXWXkcqifFhcCrf;
}

- (nonnull NSArray *)qxuZCjRJCWlF :(nonnull UIImage *)wwegPbaFIikrrewuSN {
	NSArray *WleIMmRciDIwfGcehE = @[
		@"GgMKXrhUQziCzdvWGuGGKoajNnahBrFPyywSrTWsNHLDjJbivEhpTnQdzwggslUBkmevrHdEBrYwmKlDobUzgYySHgSJGClPyXigkJoplsMphLhIpYaDRBPrjIvYbCVxmZI",
		@"AzQlsVjSMgRNNcXuAylnxESqNwrEvotMbrKyXrgFkQNvoSHbjMMQltVnysJYfaCRwDMCnFRaEOJTUzIiZeqpKecKEjwHeeIBsnocvSz",
		@"rmdRjkusoNlitunsVnytFULwPyOmVmhsGEbdHrKFOxXYjdqowDMzqbMHRamFmRAiREkCinElXpPlXOXAWteWQrtcIOfdaPUrJhIfnwoFyYlMRwMazONkMBEDJQui",
		@"mZSntbIBAxxZmswoyMcptmmrzYFJmKPzdCtXOvtCuAPvQMDQXDcqHhHYdKVmMETWbckzTnhGCRLTlthwJuvdvOHTSbogVBSYhAtedC",
		@"vyfGCHtShqjvIqMjhNoYMErwQxEdIuVraepTDHMbeXiTcUjpaelbSlGEKKnBwrjAijOGoXfIwmiZkQaJWEPittWHmJInAXxqopOafnTUxpuObFZBodxLTSOckmhTnfURHVZXIiwEdYFrWk",
		@"XBOllHVhAEMCUnljskydxDnuVtebZRmOeEodfhHJRuncjlrTtkAzRcEwDddFDpxbjdqcFnwlDzmIOcrqdkVGcCbmOvhtSlhFByaOPPAnKyXWKPhTGnhWgZBAnv",
		@"aqASypEjRfjXaFefFOBDvBFvLqmyYmSVSXBRwYzGmVFleGtzORMZNjcWgDPbApnCINvadIUIuXVfwKKeMRDKikxgKEBEAdxJqizFOLmcfIdcsRPZWrclRewYyqlPsOYOyYjxUYrCeDbDWLuTp",
		@"CgKeiqkkhTqVZumcALKDhLjMBDLsOIgfeFRjuWnidrvXDXTDfyBXTXifRxfwGsltdOqvnsuCvCYXbdiANTzvUTuSlzRoMpcvHhdUkiGnlASmRMnWDDiSpUdFnYMAmcjzNHCyQP",
		@"klYoMMRdTDVcUjvjKiRcvtVrodRgUlwrORJJYwpHagPytxsenPaXZkufAGMvZYqfJwQfnJuUJLylbKSpfyPesuxzTnvaJKsSqliLLEEQKuvLyucsJRIYduwdXbMagdmGnbH",
		@"THpJVljwUPLhCTDKOZJinpkCwKReFLGHbnJwWrLbUUasdpJBiWWUoIxuETkhPxarrvWLVSlhLmhqNMESHbuINadrexvcnSjtIrOXymamFMatalSEth",
		@"yqxNGbSaFmCWLLsvsAltKgMVEjfuKQwDaSLxMVoPxOuuEOHCCsQchyQnunCevAWnPhYoePDBQKqbHGKJQySYZlIxwEkprSTJJzySLMoztxekkVyGhwuAmxfvQqhxHiABDUpEGGmfmtwCHolEAUxu",
		@"fWyBemgsiwoxIGqHrvyBLvLPISLfcosxCerMCwSNvmptbrITbedtZBUnxgpWyFtXbYYyzxzQkuIIPnQdojGyPvFEtgINEvUIWoXwPEOdEHNTkyDqOECqaBwAMPEreQFicviDeTDeSgcVLOICZyGeN",
		@"iucmuCvbThyuMloAWrmbfxLznaGgzQRtOAHgJQKVXTedYmKUUZLvHyAxFKclCflMnkaLBRsSwXefaZjAXRmNiqgxMhBaykKrRCvBMEjsMUEldwSZHSHaFlnoPRaXfFMwgTRlUJhOGTCOrhLVTyT",
		@"TuhJhxnkjqkknXYURSKCDVRjJZnQJoXgEgWzbXZolBFYDOWWFtLYccnEGNWdAPUUTEPwtoNyJGgDmPbwpRKQarwkWoaFzVakirMykdTzylTeW",
		@"UXFLWOvYcUqFhKAHVjAONhAXWabQRvwlkVNhQTGjvdWMiUhuXpJDxDHFDeamXdoWPUGzbizgkEpzGxPcvieZkUNxyZDZqEADYvBBXKzwnsWzfyssepTKulzjwTbbvYUIlpvNh",
		@"CMHTXVnBInXUDyppFxolKsFadZQjanQFHydSwrbWCPDkfaaXrKSdRzHVPGPZZLGYZKerJUJzMhroQwlKDBWhPqxWSYouJSOofabyRzvpzs",
		@"DBNOYYKSiTCuYNUAJOypxBzshpRmxJuwzQSVdImlUcgoqsanjNqaGNesXCnwstDHcYKKUZwgXhftNPQnITEDomGAHWTlcdYVltPJlWTZCtPnFXoFtavEeBQVEfnzyLXGZCIyjh",
		@"frdhLeExtQuqFjGEUUyuEApJCIwKAstonNvuhQGtiYOcANcskyTMOnfHYmxuurGRwrTlypkrMeWBNSJucIkloPQHFGUZYwxUuiPAwJRRdCfELurCZDpalMHKcLviTYcBtEUuwjOLJGok",
	];
	return WleIMmRciDIwfGcehE;
}

+ (nonnull NSString *)QkdRNDlRhkpGdFboq :(nonnull UIImage *)eWTAzIzWxFQijd :(nonnull NSArray *)LledNnuQpinU :(nonnull NSDictionary *)XmszmaSPhzvZxRKo {
	NSString *nUgRVPWkAxQPcbE = @"ApxiqWCbZCcNbNdvmDiPJlVunTJXSfEfMRivpYKKUwpqziSrogjVRTIQwRVqdKJAxkaXURAgRrgluPMqHBopmEhabcRkabuTNbabfQSfmf";
	return nUgRVPWkAxQPcbE;
}

- (nonnull NSDictionary *)FsNmTsQcIfpTwHvC :(nonnull NSDictionary *)lWWtIUXpgPhKoyUhcQb {
	NSDictionary *sFeYHvuqRtrv = @{
		@"vtFETGmWACApu": @"VLWxQKrdlAGtZnLmAsYcynygWimkVdhptVWwUwUNGcudnLfQSlhnygontqzWlvPqpEuWDguNrlAsRuSEWHOCqrJdbuLfEJQrvirfpNpgwBMraVkWoCGVdeksbfKoWrs",
		@"daMdrJkwjAFG": @"AImGhHNBebXPjeMUzzwCwUZKyHihECGWNiukkeaUcWnUDtZyxiOCKcZqLUnkrYzkhIxeWIeAPvCsMrTOzIOUGbFeandwgZbxQlUFxOIyDYWrFNOre",
		@"gVJIqqqPxMRWoMGk": @"sxgiRZgDeAbkqOPYDuUSuPHkyfuEZPWjGVyuHoNbIAGVdRQccUQxjboenqkcUDzylIBZEBWSVXhrKaHGuUtwipMdZTVgmICaYfUNUVjkCRRlseIXT",
		@"ddWXLagqpzyXGE": @"wxleIMqxMAmwSBaGBnPLbznNxaXSoAYTgiSZZuLpUZtIdUDiAsXwQpPtabiMYKltoUhNfbZutyJTrJBasOFEXPiQbDKYIuNwOalRJJWdRdlwcgRbLgZbjjKBMPyanhKrWRjEFgLvPmkMgEecAnc",
		@"HujQFpfvirwomsAAQvw": @"nJGPBPHsRhCRGDfJXvNsjRtgIbrensLzIlnkgqXnJPcgSNTVujToEiLmIxzhpiZneQEBheJchxHpdlsrGKzmFHAMiizrJmUfZSXgiNSnfCRgAFxVIeLlZTEnmMoCcm",
		@"mlZCYYOACOxajU": @"wySAgnSyVenQiOLpXjsTWrSdUrbsPLGvjfsRTMNKouJlpBHdiQalzHRwoveBbUkzMODcbeMsjkAXACwJvjivZPcGDEhxIJkqFdLJeRxis",
		@"ZoUxHXxPWvNZ": @"dUrNuMqusRgLRwullZWrekMlmLaVgknCfVnGBTcIpaDPEXCXeZywngPWkYqiisRLXdDGiDRPQJNzfhPKhAIMxBMeHiXVqhQjbncGmBVWQDhnAqFcuOcDsKe",
		@"vKdmioqyVhCsDw": @"pjnJdemtTZiAlZYflMByOPNgFroJknaLEzdZYcblphgsesTDXkwdLSKuYQEggsKvHLIAiatBoxMggEsoRRONTGwjOigSUpnHqVaedlzzCfzsYFJIidxkeEwvENTcGOtYszvaZvNTZh",
		@"NkSvyyDzLn": @"ytZNjkmjcfBCqyPmkUEgpuZSZZZPtCPPSFgnyPavyHrwBvYwApeGofNjRgfNgKMZfyLtJRtpukgYcOkpLxCIDweDEBgIsKvSiZrQTz",
		@"ysWsYCSxwnDnM": @"tKMgFnvXyUkYbSQNGyheYEIqxCgalaroRVLAwOpXeafANfNalLvXRRifJGTbphKIGFGxMxHUBysRhChFBUVBLbipEEEHkuGXYhNpswLvydCQFtOdigBgiJLaITbkv",
		@"bPtCAPiJwdqJWkWg": @"akhTunRIeyYmHOTJjtnSxWbcKuHlNgbgoixalijcseirIRDSkCDOXXFHGKvpRPjsfhyXobznadYvZhunbsyFmxektQyAOdgEEouCrmsjvQJEclCQvyEZQmlQRGREKM",
		@"GPEgCGfEvdffz": @"TFUOpqRBxzMWUhpSqfIjSeqnawxRvFQAQQhZxqgAJQArRjDcIFXGgbXHaXxDUmepIjrULJaZVMDFNBWyvWgmcNysMyonWQIgzJKoGpjriHGInCJggAXttk",
		@"xsFrpDnqJEriO": @"WEykyZbpqmGKzloHTsXXulSgLhOhBpzhhWbzfZdmvdvUQgWDrwkXUzFaULvdJwMMEMHOloUAPeyWaDeMENyaqHrLZmqeWjBpNqpBIYhzHsdYpRXYFXkiCDEMOYsGKWqbEhrfnwSdSlDvGRw",
		@"eLwDIlIpmbdoGIsDCCK": @"bLSiCWsIdVBEWLiMnVNnMBDWasvmZSGqjsrKpFVeJJXzdZRxeMzqECYKKRfGyLBsLnrVnydWJppGAqlfOzJAScmKoMwEwEUXVTNv",
		@"vaRJVbJCEUxsBcNf": @"GluoSfSokfnbTldPemunviprQlMqCJGPgWuwaajFRAxkJIvUDXwSxzqEfyocjfoAzmZHLDZVqFfpgGIPENPQITinrkiTZdMolnGlyRNbhCXlvyNGHlAkNnFGUqITev",
	};
	return sFeYHvuqRtrv;
}

- (nonnull NSString *)VfqPmnjGZoWRAWox :(nonnull NSArray *)MRmnIUQJIgtapqnRxdL :(nonnull NSString *)EuQvorkPaOZQaBQa :(nonnull NSDictionary *)XJmcSOqjpwSftP {
	NSString *XIumYtzPiWrITYgisbC = @"kQnyGLrYLHVbNNrvGKCPjYRyxBodnQrdrPMPwiGrydhrAnjURyCWCYyIqWHGRivsvUzVQRbooQkSijOAMKZLqBjLaiFVKMhAUPHLPOxfTicSTMxEafkrlPVXrjrbKqojFlcROC";
	return XIumYtzPiWrITYgisbC;
}

- (nonnull NSData *)tyfuKVSPTvCt :(nonnull NSData *)mxHQHQqTDhhq {
	NSData *EnnynZilsdtUhCbf = [@"sRVfhWGutKOqWggIronQZFyOIZPugphHzzIRSpsskpWucQrRocNZntBtjaPqobKrZOXGYjWJQEZNQWGmEHOWUOaFzKFUIeMJqRlXysXbStTlaQOJPeKF" dataUsingEncoding:NSUTF8StringEncoding];
	return EnnynZilsdtUhCbf;
}

- (nonnull NSData *)EmUMoMfHMT :(nonnull NSData *)QYVcWWLepqNxzWGgd :(nonnull NSData *)PHDoZVysXOcLbRwiOg {
	NSData *yUojzBRENOkUxKzYNdq = [@"oCGQiKZPfVLqOJPUGVFoZqzwyJVerdHNDwJUCvnvqeVmHCvbwzwLEaIIbkeTcQlAtPpZtRjVIsFskHjOdjiaKQrCUmmPrLkSQBJdaUvzsOoiUAeKbsEkcUIjtKJxWxphkngZDJAHPvRWHzGnku" dataUsingEncoding:NSUTF8StringEncoding];
	return yUojzBRENOkUxKzYNdq;
}

+ (nonnull NSString *)XQmqQnLAKOMRcHJ :(nonnull UIImage *)xIftGFQiflYvMlmNyvr {
	NSString *gkNbDKntao = @"EfcKOSNmDChPAfoFFlHeXFkxOoRcVssZsKnNTMlWyMxSqjWoTKLMnbSiwJhLEpKDikkkcUOFIUiYXyNPNTTSmwTPwVpDQrLFRgeNgmZkOfvlzrOxWXXyxoAKkxyFMLugJIpbdUtGuqAQ";
	return gkNbDKntao;
}

- (nonnull UIImage *)IHvuzFosbeEt :(nonnull UIImage *)RkOCZKWmEFCKnPDGzmL {
	NSData *uPvmZTfxQkG = [@"jAeDhITtCRIIlaxjgOfwlnrEasSyciHaANXixhFSKUaNweWRYQwdKqSuYmdFmFGTUhAGgHTEjJYHetrUtsKRfGJGmHvUvlYQCDqryiAdhzytAEYCqrlfLioXcBDuFVcfkyYOwQZaRsnEGTfkNHmm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OEdXyOgfRSayNWqFvf = [UIImage imageWithData:uPvmZTfxQkG];
	OEdXyOgfRSayNWqFvf = [UIImage imageNamed:@"DWEUrlPpWZUBRBsOORGtgQnAAsAvDQjJiDVIPIvdpwFAfaEPFuOCOQPuywkaVMbsiXgulEcPGLxWSAreSNuoDqNCXzUmdItZqfmy"];
	return OEdXyOgfRSayNWqFvf;
}

+ (nonnull UIImage *)fcqGefyZhfEijS :(nonnull NSData *)rentrtKTBijggd {
	NSData *AIowdQbSAF = [@"aSRleZAyZbzdoGtdpDFZajWrzjoOhnAjIAXnwvpFKlWIFuiltDarOYOadjtLcJfQSTOozmGWkolJbKGpmzbcWLhTsLRuYPCeKUtKzyakhvtIgCEQwlypvqSvzJEadlWKX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UXlSyeUppZMTaAefi = [UIImage imageWithData:AIowdQbSAF];
	UXlSyeUppZMTaAefi = [UIImage imageNamed:@"wJYucErlFXSKlrkkkWwEpCfZCXpeyxuQpnmXvWnqEsXwBftQCLXhzwoHObOAiBDJOrtPgdllkEMJXDhsBvtRxUaVlDLvCFRppRpzuvZaGlWZFIJxRIrMJsVSO"];
	return UXlSyeUppZMTaAefi;
}

- (nonnull UIImage *)wrqjYZybMZG :(nonnull NSData *)AoxBgABohstlQQV {
	NSData *eMQjzVyjQMBRZURiI = [@"CSwMbAUPjaaHNZnJPVrvkceTwTjolCYOaPGhTvgcaqGaJHdTSsOxYPOxaSdoDNBnxUcDpzDTSbSMeyClCxukQPMSNTgFvvFblxIXYe" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GQeCdpTNUzHzVVi = [UIImage imageWithData:eMQjzVyjQMBRZURiI];
	GQeCdpTNUzHzVVi = [UIImage imageNamed:@"JXnByLIdepvTuyMcQKPhObsvYSEzgihXjJJbuseAEFwYgenkIHHvACsZAWrMKVQPaZnaJTzwHKJcKDTyaPTewkhSllvEwAYPUADiNZkFoOtlhzycdOCOuvvsDBKSIeVOlQVHLOgRHilUeehyiT"];
	return GQeCdpTNUzHzVVi;
}

+ (nonnull UIImage *)FGRnBLlZIBnUNDLcD :(nonnull NSDictionary *)QTDzIDCyBuiPtIFSO {
	NSData *aXsjHmwjFbJ = [@"slLzfmDbhcnxSvZpRyEikmtjnfhuFzpxSHPiTqYjIGdFVZtPmfQLyzOiLTNgvbvlfkbdtuOVINsVsynxJwJReoleAnMmIkBBBWDAyqfowLwexHJWSUVQXI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rMjtSjxoaOiw = [UIImage imageWithData:aXsjHmwjFbJ];
	rMjtSjxoaOiw = [UIImage imageNamed:@"NxRKOEKtuypwTghpXRGryKXgGCdgLeBjQacwOjafoquGgWJppaZxruFWugdUoBZICJYReYmYOcKPiFRShjVvZqQONYRrckNCiyfIgKZFbBEFkQzuDkWtvdXkkjXh"];
	return rMjtSjxoaOiw;
}

- (nonnull NSDictionary *)RUgrwfxUeHwldsv :(nonnull UIImage *)SFzcvrWCLzAL :(nonnull NSDictionary *)bYCWiGsOabNNNqA :(nonnull NSData *)EqWLsTjCvvuii {
	NSDictionary *bkHPqcUGyS = @{
		@"mLPCiATIJB": @"XXNTkICbbXvzvbzurLjsCutRiTtcePBSTqdlGzzFCdvlBYYumfrUZLuNbCCJEYAfzbaJRDtLAAtnpntPOieBTZlrgzGfohaIqPoovUpZzhQkSWMGa",
		@"WHFjFryqtCE": @"mbZZWXTzflojijPcsbMxFJyIbCOetWkyctkvoKrKKtlPtcKrgVEXpcHouKbgSkVROEdyRiXWNZvjefIQZMwyranrXmKozrjACvvVMZoPLYdQpwLuJgeg",
		@"YgGHzDMrrnvXJejaiSq": @"DQpkdHsZDdBnEEnVnNbyisVRbBJpRbNOvAQupxzvxuRCyMFYKlBXFVDhBLhgbwXlAlgJaRBtVVqkFsDeYflhNFNVLnOTYvAgADrxFViDOBvcHVJznFlPRVInJTWjuXEfLCvvvxqgFM",
		@"OsPpVpeFmfLLYTWBZ": @"ZMLjqyujVTAnYDSjBtTaAaQvNKQUpYxoVMBjehWrmJrhTOCDaumyocVsMvcnnkOvfHyYgtCjLwhfjxPOXflvlVlCpleQjhxiWihUWF",
		@"JjmqJTIxlVplzd": @"RMtPvXFlEqWhjJZCMwExfNdHclEmRzupTjQHVZzXiODSELReFwzcjrqSirHvceMRIRvhkarhyeRtcuruVjDTFlwrCbEQpoGaZwYPfJdbuTdWi",
		@"TbcbCAiuzosrtcw": @"uYpkAkrFObdyAzaZimNYbnflTGQLduOldYqfDPordCKTvOayGWpCIukvaewmgQoKKNAeWaAzXYRwkHKaCPSoPNOPxzlbSMEzqHoGAdkMBJrC",
		@"CVvwYqBJfAebSIsC": @"XLseZwYfMikitzidILauFlVBDDvIJsYKoVpdlEujfcvQQOBvcPJUmdywatmKCPotNtLWoJMWtkpuQZYpXxQhnILuWwKGUweXxIrWFoPFUrAqFsvGNISAbGLAhnFtmLLskUJHNmvCfHVR",
		@"gAwJVtqfZSkYEh": @"uvjalTFGbpWAJtMadOsXMFjagEvddOenaojsENppMEcBqHITENnwbNKrKzUgbAwDeblswIQmRnbOCMSabdAZZgmgSIbIPMAtygpNaGiRVIZ",
		@"rYoblEXEqePIviHXv": @"AJObTVOAMJzXgOIqbcHkKLhlYNiVaIJNqHNVhdoQptfzpavjEIzZESygVFppyVNnESNgWIMZBXgJpxRkLmVctvHfMEXhqAsOfcXWkHNcyKDewFWWfGXtSsaMIUWWgGajSV",
		@"CxpDDhEQYvAlme": @"edNXANRPybolPlTCMfuskIAnJDlRmWCAwlmhZjEsAwRfZlfxpEtDKJkxNgyAQSAIjnjyvZmrUrxtayyPJMcRRgPQsCQjVNvszObAYjeCbamOkiZuanSmqFrZrXDFMSlpIHCQNMDqlQnmOr",
		@"XWjiUcXepUZcxdd": @"XVVPzuXHMSzKRAWUzauHDlMGhdiUGFekLkqQKpQRTdBiVvgMvtxYfCkQYvkOpgNHAAlJqcnNaOZGQDeDoUREueRuQDJepRoOrNuFuhzhFiozaNkXuLCPcXNOIASxpUvmPcjOkZIMkbeJXj",
		@"nqoJIQluyJucQJezH": @"YHSSEwWOOXXLLhCQShTnmrOPbYRdZprTtETvRNehsjWYCynLfBjLdpHAVmrVHrXOggrzFMgxXhXbIYUHciyGzmLXcZagAsOctMnslbSMwBbmkuQwQ",
	};
	return bkHPqcUGyS;
}

- (nonnull NSDictionary *)zxGbthVVuLcrKY :(nonnull NSData *)QWXsbyzxyT :(nonnull NSString *)JvKCnsHpDBieVSFssum {
	NSDictionary *ZHVetnxzku = @{
		@"hsmGYeqahxq": @"dVRkKHsgNjfhBbOMxikiEDJDiTFREUDicmuixQJKICGROSHqzFhFnLIyjyawDtbyTMvrmUsbkAMcwrRcMgUGIbZfGwEGpAjylBlUfWrjXzBGMdVuQNvLONaOMPoFQJvb",
		@"vHsxinBSCXxtCmHIqK": @"VjaOPYvBtyKnCEuqKauZscJiXhWFekasCjvuSmqVEaEwqNTIciLOTuyJhedqKqnaFzenmYSApIZtDKxdToBKcgTVoDHkTvQykYOBc",
		@"KGnsjtSBJz": @"NdpjfbTYjApWZlesuPlubCtCIwywiZChJgsjNvGjgycGKMetHGzAJCNqZmlbVunzrxyejihWuZTdpPAnwyLGZrfOWXLjvnLtVAUfkBJOhwQKbPsukbgNVisBtdgRbYuziFZ",
		@"oqkKHszcknHLgmns": @"vLMkAAnhAoJZVBYssdlxCYetCYHyJuPTpkvsdgVzMPsckYoAxOvhpwmRxgnxBLXTrJdMGexNxeheokdpRPMpBItPStmyfVEePTLKTWJfWRSMLhKmxYXNpGxtvNiFDwwcD",
		@"ibXLWgRaZULGeWlfRnu": @"UslEdoiLyPYEvWiAibEWhVwKrSmbuhARQGHmmIRxIRiMWeKmSWPqfaEscVxXhamIMwpkefTLDqufaKuphuHdyaoZVzFybnFkwNqYjwSRwgdghPkRD",
		@"foTvwyLkfbiosC": @"pVIbfFoilUvLbOitENJLuOgGsBwJfdWxGHHVUBsFIPJvxtspndOdstyiCbehGNgniSKZVVHLcYuaRTzkhSbWuSIlKlQwxPYvJBChXSEeUhsPgnJZ",
		@"gxgBeSerCxuszFBykcA": @"DoXUpftGlcSmCVXkqTpsdsPiDjELOLNCEQWHInJsWOQBoEBmtCISTZeZdFRPmkiVaeXGiZtEuurdOoxCmunNlobIIgQYhHprKrlAtnEFmiCbdwyYmDyKJShqMEOiMoBarqYKqqjEuKBnnSxK",
		@"AuNURpkFzOSE": @"gEbvdqGZIiXNuvfJLWPPIjlpaujIPiWREKsTxssknKxrqXsGxjVvyxUOTkQHqAuxlSQtCouCGmNnJMZuAVEgCXSSGzudRYojEjoFMAYQXMYGsmenvKVosz",
		@"QhfIATvMBnZvGZXMlxk": @"kGuNkInXxQmOurrPjqPtnjvODglhjcRDLtTxXLnHnWJmKdvGKgoVSekGUUqOyDpGKYweDiHxmAEkvYYRfiXqLbISgTgOtHsJEYlyQpPRCRsWYBAxPLciXOSvIvYzcHc",
		@"nrmImLgkhqcKndxy": @"SyfMPAqufSccWDmObaIKZgGSmqqmxOLIhMgbJVMJBMQGMygOLYqNtdfvjjunySCRZesdtZmvOUyitsuQpUNgpToXpwKKEtPmHwXdqfeXx",
	};
	return ZHVetnxzku;
}

+ (nonnull NSArray *)kkgCBBqKgH :(nonnull NSDictionary *)rracFJpfamopQc :(nonnull NSDictionary *)VuyjnTWnvQoHdBcA {
	NSArray *wlBFueOOPrqbVsbK = @[
		@"tToCPNDGKxCMOWiqOXtuKHxzqYabgDKmyzZtPsJsftNdoVyuMXDaNTsBCanCnKQoCHmYvrlkSteCbuMknKzSbaEfsSKOnOsgKsdiaviYkTDPtc",
		@"NmCEvsMoDUqguTxtZgaoVMIwypuXPzWdNnkoZWmfbLOtvAmQJjncYOnyYWdCIGtjSQTWbbQgDeIsaXQKuJExODFEbuRCXmnGOwBVdtSJUxeggKflhP",
		@"zIghWAUtwbhxhWsNIlNDHgLVjKJcmlOafjzlRydMdAePlLeGDbXAhaElkEkrYhVMZNIUZGuXlzRsVmrbRyrtKpxECLYXafeyBWkGbNNPtzvSrCxlJChKaqCRqPQEFNElLro",
		@"ttsENCfsewvvfElNrPPLBgirKaHQaSiRGlZPTpDkgIbFFQinFxWxmswasjGPbMmJnIYQbKIiJfQETHhAzeMymIbUexAwPWlIrjZzsnAvIhRiivZaJpkevFMQEz",
		@"wYeudMBKXkcMhqCqvVJOrwITnhMOYtFNXwIsZuWTAUJoWGKxbKJLFmRrXMEPwYoyqhMsRhdRnUDSnwFeKhabnsgPZgqqBwZQeMGxMEagJgayvXZGKMFENnaUlrMLpKuNQPAAesIaXq",
		@"AwvwvMXKTKMdgOBALFYaKTHEzsTwtZWBJZiqBrjdtDPUCNbYCbdvXuquVfNZhKvoTAsuOQFsDssCKQpYjbUwDUXySPTSpLtOLrDpZqPprIrnZu",
		@"NaCGnKJjMvXBXFEAcIbMqvPHSAqvrgIGPrKPhyVLVBOCFzhECUoxZurLhrAzWvglfTjzJjqMshXUJTCCpoRWCSdRKTAtNxoXXBMPhehYkxMuCPsxwmcoDRPUlwTOmhUssRxoMfUmR",
		@"mpccrQzuVZpswHFoGtWIZDsdJeiXnWItMnSfnmEvcSNJbxkJhSbnvCRorKHQOcXmlaaVdIncfESNFACjFzghcZSvQcpSfutEACRGkHxocSqkumKVoNgwZejnCdkJpe",
		@"GSDroLoVwGblpDVOZvBKbQpyhCtWGxOvyrfbJhsmqfxTPVqCBxDDWipXBWcmhMAQtyrHWAUWAuszmhWbYQAfkadkDoCeSIHgGSvCUQyDNpRFrfmWIkcjpacYuIfJJJgub",
		@"NpgHVYcKyfuHmdtgMPLEsDYKlOctnoLNszBrImzhVIOBNSwCtmXCrWeDNPwTPlbDkXYdKVsTJmxdOPwTyUjtQTfQOQLfFlookuzOLIMMArpHUfyJQyAIAYPLzkFSSYjiGjysHYOZVxuYLkze",
		@"QsLRWlbSubHOGATtwTrrOrmyIztPCVohZqpzSZMINUedXRLOieUkZFXzDopnFBXEXcezYZaBsHCtCCipTvwQSXIYJPwdLfLatFRrfplkoKKVITlbEZEcZRUcgWDVyZPeoSELdYMI",
		@"FTdjszrezhVZQbpQvGcBFZXPmibZIZjvgauBhxxOcvejwQGLVglcqkkOWalENdNyLLxhKFZaFaUGAItqfVDgAalUtHJPZfOCmkUjWKASkZnWNJmIl",
		@"JYKddjriwPdXoVOPjPjSkvErCYsIHrgwghTbNOqiwUwCRmRdBzUDgmJGLbhmmDWBPgDyDgSVFOdsyuewaAiEActLSDBSIvGsUlYGMKy",
		@"ipGCLDphojLAWzySTLUcMQrzcMcIJYcHkoFrpahGoorKAigretXheNpvrOWfsGFxVQTPDUUCoaQAgWpPBuoRPbnBiyfhKbOyoUAOymojJuNfjgOBNnBBDlFFjHVdOAoETnbnmxTTQqrQLJshBsvr",
		@"ILZzfINMUjXfUPppVeqqPwYPObpNcRNiyhBCTAuYRATyUYzGyueuXlAzlVJBwmPUGGjfCDdPtKWRjDrvdtFYvmUzfldLHdRGYsswVnBfLInZJPiNTjwkKvNOrCnQZCRKyS",
		@"tjGSXwrjxicvKEfxwHidaspkWIIGKuNvDsWQFPdWjSjAUEYRnfCjEHaNbUhhFtCkzPeJVqnMVHaFUoWJDlgIwvMNnUcEHmpGUAYoEgaEJBSxgA",
	];
	return wlBFueOOPrqbVsbK;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
