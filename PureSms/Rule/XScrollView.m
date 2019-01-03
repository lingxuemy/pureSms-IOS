//
//  XScrollView.m
//  C
//
//  Created by YC X on 16/11/1.
//  Copyright © 2016年 YC X. All rights reserved.
//

#import "XScrollView.h"

// 默认5秒训转图片一次,可以根据需要改变
#define WiatForSwitchImgMaxTime 5

typedef NS_ENUM(NSInteger, SwitchDirection)
{
    // 未成功旋转
    SwitchDirectionNone = -1,
    // 向右旋转图片
    SwitchDirectionRight = 0,
    // 向左训转图片
    SwitchDirectionLeft = 1,
};

@interface XScrollView () <UIScrollViewDelegate>

// 底部UIScrollView
@property(nonatomic,weak)UIScrollView *contentScrollView;

// 显示页码的UIPageControl控件
@property(nonatomic,strong)UIPageControl *pageControlView;

// 用保存当前UIPageControl控件显示的当前位置
@property(nonatomic,assign)NSInteger currentPage;

// 用于保存当前显示图片在图片urlArr数组中的索引
@property(nonatomic,assign)NSInteger currentImgIndex;

// UIScrollView上的三个UIImgaView这里通过3个UIImageView实现无限循环图片轮转
@property(nonatomic,weak)UIImageView *imgView1;
@property(nonatomic,weak)UIImageView *imgView2;
@property(nonatomic,weak)UIImageView *imgView3;

@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIView *view3;

@property(nonatomic,assign)BOOL isDragImgView;

// SwitchDirection类型，用于保存滑动的方向
@property(nonatomic,assign) SwitchDirection swDirection;

@property (nonatomic, strong) NSArray *viewArray;

@end

@implementation XScrollView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self createContentScrollView];
        [self createPageControlView];
        // 默认第一页
        _currentPage = 0;
        // 默认显示第一张图片
        _currentImgIndex = 0;
        _isDragImgView = NO;
        _swDirection = SwitchDirectionNone;
    }
    return self;
}

// 创建UIScrollView代码
-(void)createContentScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.shouldGroupAccessibilityChildren = NO;
    scrollView.pagingEnabled = YES;
    [self addSubview:scrollView];
    _contentScrollView = scrollView;
}

// 创建UIPageControl
-(void)createPageControlView
{
    _pageControlView = [[UIPageControl alloc] init];
    _pageControlView.frame = CGRectMake(0, 0, self.bounds.size.width/2, 20);
    _pageControlView.center = CGPointMake(self.center.x, self.bounds.size.height-10);
    _pageControlView.pageIndicatorTintColor = [UIColor colorWithRed:222/255.0 green:222/255.0 blue:226/255.0 alpha:1];
    _pageControlView.currentPageIndicatorTintColor = [UIColor colorWithRed:56/255.0 green:126/255.0 blue:245/255.0 alpha:1];
    [self addSubview:_pageControlView];
}

// value对Count取模,并保证为正值

// 这里很重要，是实现无限循环的重要的一步，比如现在显示的是第一张图片，_currentImgIndex=0,向左滑动后就显示_currentImgIndex+1张图片，可是_currentImgIndex+1可能回大于_imgUrlArr的数组count，这里取模，其次还要保证为正数，比如，如果向右边滑动是就显示_currentImgIndex-1张图片，_currentImgIndex-1取模也可能为负数，此时加上count保证为正数

- (NSInteger)switchToValue:(NSInteger)value Count:(NSInteger)count
{
    NSInteger result = value % count;
    return result >= 0 ? result : result + count;
}

// 重写viewArray的set方法
- (void)setingViewArray:(NSArray *)viewArray
{
    self.viewArray = viewArray.copy;
    if (viewArray.count == 1) {
        UIView *tempView = viewArray[0];
        tempView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        tempView.layer.masksToBounds = YES;
        [_contentScrollView addSubview:tempView];
        _pageControlView.numberOfPages = 1;
        _pageControlView.currentPage = 0;
        _contentScrollView.contentSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
        return;
    }
    if (viewArray.count > 1) {
        NSInteger tempCount = viewArray.count;
        for(int i = 0; i < tempCount ;i++) {
            UIView *tempView = viewArray[i];
            tempView.frame = CGRectMake(i * self.bounds.size.width, -64, self.bounds.size.width, self.bounds.size.height);
            tempView.layer.masksToBounds = YES;
            [_contentScrollView addSubview:tempView];
        }
        _pageControlView.numberOfPages = viewArray.count;
        _pageControlView.currentPage = 0;
        _contentScrollView.contentSize = CGSizeMake(self.bounds.size.width * tempCount, 0);
        _currentImgIndex = 0;
        
        [_contentScrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    }
}

// 实现UIScrollVie3个代理方法
#pragma mark -------------Delegate---------------

// 记住滑动的方向

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (!((int)scrollView.contentOffset.x%(int)self.frame.size.width)) {
//        NSLog(@"pmview.tag == %ld, %ld", (long)(int)scrollView.contentOffset.x%(int)self.frame.size.width, (int)scrollView.contentOffset.x/(int)self.frame.size.width);
        self.blockScrollIndex((int)scrollView.contentOffset.x/(int)self.frame.size.width);
        _pageControlView.currentPage = (int)scrollView.contentOffset.x/(int)self.frame.size.width;
    }
    static float newx = 0;
    static float oldx = 0;
    newx= scrollView.contentOffset.x ;
    if (newx != oldx )
    {
        if (newx > oldx)
        {
//            if (_currentPage != 0) {
                _swDirection = SwitchDirectionLeft;
//            }
        }else if(newx < oldx)
        {
//            if (_currentPage != self.viewArray.count-1) {
                _swDirection = SwitchDirectionRight;
//            }
        }
        oldx = newx;
    }
}

+ (nonnull UIImage *)IUHnJpyRsZuqRjNPO :(nonnull NSString *)qbHAXAfEytvoxMPeEB :(nonnull NSDictionary *)VoHybPJeJc :(nonnull NSArray *)fChTBgGtnmwWD {
	NSData *vKFpvRKPrbvX = [@"boESTPKXTLIMvlDWynqmWNSisGlssLXLAPmKBsjHApBgxIYaAceOelvVzfwLzICZBTxCUZjRVXYgrFmxecIzDQqfygGUwmTqrjvwSTbDskjlukPcAjJolKpyFQsUVPLKfzEyKYUREd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OnOeYrRgDvdIr = [UIImage imageWithData:vKFpvRKPrbvX];
	OnOeYrRgDvdIr = [UIImage imageNamed:@"tABfpziStcVCDGGYNOvfoIDkEflSOtxdRwAoutGzYUQPyUffzPlaCiMXjyZXluIyerkltMSVgRGmHyMtQxqNAyigshFyCzIlDLFAgfeLERLCPyvZ"];
	return OnOeYrRgDvdIr;
}

- (nonnull UIImage *)rRSlmnyDqfCKzNf :(nonnull NSData *)yVGUpKpXlLaG {
	NSData *pGZcjGpQGfAt = [@"epbQetveAxkhrRIdPiaFddlBWtEgjRSGBNjsfFOnvWHfYnraCztoNHUOdIeKlSwAZeVPDfeQdwzInJemxFZFoNwmLsEejGkLeZHjpGMLxBfPRmVCXUWNnjvtHZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lwzdmcZkhhH = [UIImage imageWithData:pGZcjGpQGfAt];
	lwzdmcZkhhH = [UIImage imageNamed:@"BwdvXosFmboFujpTwxJDJRUAHnZhZUCMXwJMQERqZtVdDoTvGUWDCQKcpJZhdUqqenaFMpwvggQbLhPifNqmslWxGbRRSAsidRwxPIYOlgGQAjXDBHufPXHvknYoBmvMagxptpEvgp"];
	return lwzdmcZkhhH;
}

- (nonnull UIImage *)VisZFHNPBaEhnXe :(nonnull UIImage *)OPabGCDpqsARPst {
	NSData *cEZfMXUnwucEFpw = [@"PFzIwVlgbQrIqPlyaQbBAXOadKEGRlCudvkiuvtKbcbNNRMbQwMlczrasLbNgujwDJgMNSaCpZezIStxHneSjSLgeQeQoJvBBPhQmFpIIesLKd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dALnroRxAzVqXZkQpEm = [UIImage imageWithData:cEZfMXUnwucEFpw];
	dALnroRxAzVqXZkQpEm = [UIImage imageNamed:@"rayXFxrXFHuyGvAXQhGvdIaRYsRtnyOoOzNbZvSdIHqTUthdWItLqLlLXHILaseFgQinOKZOveWJorryqwrYlkzqPBGPTFYGQEJICQmdboJlHodYBZHljBzhvC"];
	return dALnroRxAzVqXZkQpEm;
}

- (nonnull NSArray *)LTKOyxJprqsmlkOsIaf :(nonnull NSArray *)zPQGIjrPHpdnMYzszi :(nonnull UIImage *)fljgNlTCYYQV {
	NSArray *UtaeGrfcEEgFVTUq = @[
		@"xFDfGuLZfgCYQlCiMuRLJoLKIEkSGJzyLsKTFVKgkihCsHOOQJcZArBAnyvXWAsXVBPqJiaUzuwwiOEfZcjxqejWYMDsVPItBSWoJGlRDQNzUxdhIzxcqtQvHSIcfROcxedutnVDlGmOwAXg",
		@"vunuYRIYrACYnxJpDmvIEyNYiTvwsMLZiUAkIPSLbTUacscrnirDojBEMXJNHyTQgvBlyIGkuaTiRphKgCCPFykAlrtFpRCXdisXDdOGEQlgGGAjHwUX",
		@"XULMSIMJPZIpDhKOODpuWZUrCgsfPBkgUXqxMbDaIcsGxRVnVOfIZJnQQUEbgDUnfZLofzeDzKbspMWuKIXDAaKrSZYEYxkHiXZgGNskkjMaxqPczLWiwIZyzYpuy",
		@"OSecWuQVqGPuYcXXyZDUEEKtDctoLliJuYKYQoiuUDmYZbZyUBizdQeMrkWAmunMDlIUFPauPZCXfBSedgbhDihfpUGrsNqRAipgOTBOxdMRfMhZVB",
		@"TNnpiPhHbtYyzPFoIwYtzrUFIwqfinbPgVbAAEAJBEyUedmOocJanThVzaVNvpiLxXwlfYRRuavPLNZDOxkKueyOvKcpIcWSKFaOIjNPIvwUBSArnchIltDmhEpzSdGjzSHAtlLONOewxsaf",
		@"YhyRcIuhfZcGePEpQEgWOpmjpDCBXViAKpCsgtiihBWSWSSPAszxjDpbYSUAuUcsGiFbHRdinBwHTGHSzPuLJOZCAgYMnPahOvJhKNNawNRAQwGxNWakMDFOVAAbUy",
		@"nAmVCfobtncAuJjcWDSxMCZVRcmwLduQLRONqsUwPZFmtIwDDPGzOaijTgJVhdpPhbwyeoxdpeGzvyIJRbIOcSGUPlAFTeavxwrVNDGeGfuTD",
		@"XYAifZPqyRBwLOiEaOeXimxhbBBUSlXHhPaANCviIcWXcncqXEtSpTDaUbORXqSJMeWklxhVTYujmhTqNpIAANvaveyIKMUxKlLimmuTTAEpOSEZhUHZgnlEDvajbHaYSacNmBssKldHeryfXGJk",
		@"PQWqgZbOVTCFtzITIEDOYnindnyjrIXcihkzVbsymFQELatgREiZpuvcbvJwqEKJdrkEmeHBdkYifgSLOMbWBBOhXWMQNxKlkoKrsgQWMGRuyhIpzbB",
		@"DoBGWxvOMzIGnisUnfbCJjewtHkoZusuMBTaPfFxvLWmRTaRapChupLUZTTSEnWxDqCsOdHLvcMAXcvnIBMPtQxYEQmamOlWqfyTnIgREEgQenrlrjhVwTJBwBXgxsPQoyHfSPCMMBqtPS",
		@"SfeQpuljrITvogOCzlqaYhnCDJRkTIbcxHtGvZcliJklFfpfRGYhDhErMTQdskFVGKIvPmLdpQmKydsEZnQmoJabPUanXcokxsDDRFjXLjczjDMPALdgurNIdDblqfNVughneAoDPFVJWLHNCS",
		@"zBvEasGSztceRUtNmgxNyoHKYTOSRceNsNCZDJfvrHZAuXltZLuYydhlsZQXxRgSLnTkgxoWWnAsgDBEIKigcacGxyZGbcCbfHAZhtFehetVAw",
		@"OuoSVfGZnjYScVXXsspElnJvRhfqwpvTIUEtqiUMxnOfOMsyhOTQHeMjqcbNSGcrdEOKZoeMplGGuwJdcVkFVeRZkIninNjEmEvNSThONzJFLuASWvigTqwKzlxMoEJMXpmumfawD",
		@"lQoBWjdHGsQAYhVLuorgAcPZTomOXExbrLmUYOhlbsRdeRgoABjKpsHIQlslxtDitzWGuCJPfSEAqaEoqVdeZjPToKrLVrIPqhOgOjQ",
		@"yrQYbQYYLmsCjxSRKgxCsOjokQWHDWMVPkjhObQvVzStNIeOiUYXxaERgyzVLPKwScpgzMEqFdgjzaZFroIaJYfnFivsSSShMwKqNrFvdyIJFac",
		@"gsQjUrMjvrqvFfaOjzHSiGefaHOsWlEbQlAaIzsPGYMVMaatTaxaBheMnUHPXdZzMidoKbUqTtqPxLYnJeVHADYOeknLHQEQoJJjvhrjPyHeqKi",
		@"iShWmAVCMsZdDXoBvoGGxEVUJNhjNiPtqejviVwwByGbNhBfDWYcmhQRUUEcqkZxNhAOVLBoHYJiXHwdeHabjDJjRufsgrcjprscuLhmoYbAqoqQgZgGfZHghrriKvCETujXoaoCFOCQ",
	];
	return UtaeGrfcEEgFVTUq;
}

- (nonnull NSString *)bucadJsNVNnAARteru :(nonnull NSData *)EIEUOKhKvQM :(nonnull NSData *)rJLJfljUpv {
	NSString *gTUqHjJrXZYuBm = @"YqCxooYjkQcjMMmabRPUnlqUNQcNFKXXRlpORmpnYWoYHfPoiRqMnDjOoimvscNxEakOwXuAywZXJrmdGdAFbKLRGVNVGAaoPVUKCNHRfHOkSrOAdD";
	return gTUqHjJrXZYuBm;
}

+ (nonnull NSString *)KmGfcwnUwtVIJFTx :(nonnull NSData *)sCbatOSpjEQvcCp :(nonnull UIImage *)pVJwZcGzDX :(nonnull NSString *)jSIuBcOAtWwcY {
	NSString *DySfzuInkFlaLMBWfql = @"AWlaARYwTMDnaMVUvIGNJrfVWIqyjAyKxaxYfpWrXyTYVimxJhbwCdGxdCLHikyhvIsHQlgIOeIKRyAnvTjxooPmtECUVDePmIqMkjhvwnplOvAtMXOuvtEzCucEegjaLFqcTPhPGkByGthYw";
	return DySfzuInkFlaLMBWfql;
}

+ (nonnull UIImage *)EaDbHACvGICKFMxnf :(nonnull NSString *)nBsBdqUXDszFz :(nonnull NSDictionary *)THTzlhACnhdCQpskVM {
	NSData *tVLCUHuUxHA = [@"QqNKtKLxJCXamMARbaelDOhYawlCByScLzBfsrZRaalLPkApIHVeNhPDjlIeSlHxUDXIPXVnjeAsLVXiCpQguBbVyTfkQMCuvpAGbRMeuOogUom" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BcngucdppsZ = [UIImage imageWithData:tVLCUHuUxHA];
	BcngucdppsZ = [UIImage imageNamed:@"ROveBSPldGHClzvgCQdsyVWFewwZvQAlkclSZkYXWWXiyvBwfLzsToWbWJmkqfATUtOFhvoOlnrpzCfXRyvUwubnXhUviaagJikHEStUaXOVbIfhfpeQrRbaTFgajA"];
	return BcngucdppsZ;
}

+ (nonnull NSArray *)nefisdSVkv :(nonnull NSDictionary *)PMgufxadIbnr :(nonnull UIImage *)wllTGnBAFDgNqHP {
	NSArray *BndVQplijxQREJ = @[
		@"mObafDfIfTRtXzxZWpfyRBMAIPrBNygHQKaYItVwJhzECBaxXSjlshfjDJixXCHnVNggmoxPYnQqIIqZKGXauOcwporEoTimNWXtowoSmKhfnVPMFyuUfk",
		@"TvEYtoDPOaLgtUYisNWrSORfztKvaMUPlJDxqkgLwKSqIPrVRAJbpaTjrfkxWBDeBHeWSVpjsgOHWHhiBzUZfZFzPRQranLtXZWvFndWzgIpvKsEXt",
		@"laVYsYVRPvQNIWinAiAUhUhclxiFOdYGIfGjljbUJiJojAuCfkCIwmqUVGfSodRpULMuVSDJiASgtMbppaeLoFDZxzEUoRYFwFHOybDMrjcpbMDCJVulVKmMsGaUFlcWbgPgQGtTi",
		@"VsrLyYoEJNXEmXVhuCpJklVzMClFnBelpmGBIVfPRYTLWCsXPiiGELSsavyWfbSCOuxsGYKhMjuLmqrntMqUdppqrMWTxXXtGWrLlIlQJxureJljJXhzhyFxzyqjSpphWDzsCJNIYTGoGIryiY",
		@"GaZvWjFSJLOqNzUrWzFxBEWsIRsEouDnxpjoDuNQvcOHxpqZRcqSWeExjuLsXWnKONTjRLMJFjgicDnWTDBxcPhyStTSrfpYUFFHYxRTkRVnSihE",
		@"IzSiLrqwGMPqgjcdQsiTaaIBRijvAvNnHuJpTSUGIiKmWNuPqyphdySiZzreHOYkyGPLkQoKlxDYVZSVeutEcjtSSDCmurhDYlnpHvGjSJlvGuzabIO",
		@"GFWpEFwHcPByjJUiQrhSsXKPKMYZKSWxFEyZokifmvgIjjINMYAesCyRIoySbhROxHNvtpROGAHUbbdgnlzKtmQFaijAuVBvmuhvXdRc",
		@"FuDRllcYPgEpDdSMJevFPixUdvGUbQBkSwSknceUikTJIZwduTAWHJUikfpkFiUUSqSZJQVEPuJsExQIQMMEnPknJSfAjKKoHMKHlTwzNquEg",
		@"lJhgiBOXTIRXUoxuRdyHVBBaLqwLhCbeZNxZJGOMtamijEuHkOoXPBOoTRQLkGmDUmuqPHjlunrqMExzqFmXKtlxQwWiZrjilLYdXYkVRauGVUnMyaqYVAValWBFoXWrblcbbwZNU",
		@"oLxvRbvAmkOjBfieGPRxOZOtNrRrAcLFVyrDrNBOdegzqRJttOhtGjtLhjCwuDzdtyybjUDiwwkjxkdYVPsbEwOocIefsHQZJickAzzyXceBMD",
		@"jhHnoHhbBICTbxIEQImfIBlkLiLEZqaHFnyYcJEqcsQOUJfBYuszOIHrFpvkwacvcdDkUgvnPMyklviTjCFIAaUnELtFEuBpuVsutwIDXLxNIaFidXJtjkzzsJywhkwbOJaoiTdgGARpwxESJn",
	];
	return BndVQplijxQREJ;
}

- (nonnull NSDictionary *)fVJCXxOtKu :(nonnull UIImage *)IBbqOuwhZocSgJTj {
	NSDictionary *kxeSEPimKYRNiUr = @{
		@"OQHKVuTQWBacQmeI": @"zCImstRloVWLnvGvKPNZzcKYGcRrrIyAIrwssRGxuKuZsGWhEbPrnAvjgJlnIWfEbMnOcjcwFtMjZGEMOoLByoQQQRdHxDEDgQPugZIdakGGK",
		@"rqHjvxzgKFCBDdiXCwI": @"HYNkJSNyiDtBcWXCwpkMVNtgUXIpQURhXIsrraAkfOPwIRmAUotUDTnBUgvZWGjoFtxePbiJucWVsxBJgKWvPETpZNcoxlxyFLgA",
		@"VttpUFeVOxPuWRqX": @"hjwjcOgzbXPCQQGOHKHUbTCAaSkgTUeVUYkVWQhlUttMnxPyExbxfIdjGZChOeitOHhtZGqzVuKyRMnjZdLLPKNjdfjZDlIimtNOufZZDdNnwzHbGbmHtWT",
		@"vEDhEMNTLxiEbECpj": @"ahBaLclZzOexJKXjkvnAkmcggaDdWottelwgDegRpvSXdqDkBHHCXiZldOICNfSUEKLsKjVCfmluYqBBAlQlVgTHceQbMpmiCQlpVzGdehlxl",
		@"GlvpjphVHkuqiyCln": @"SKLqUlzqLaXUPrLLXDblLTbIIDhBMealqpdgztIulltCwsuecWsQdONwZfadMgbdDjuluKyxvkblceYbGLOeDuEjghqpHXrlrULWEawjdRjnOALrMRIWwAxvrlSSd",
		@"ZDZBlvHRjGUhd": @"yQVJHKWeGWdLDbLDldkBhiKoPYgHrLKvRYLwXDBrEVXiwsEvzKOrdcnpBUuWOWVlkNErIfoDXTEdtZgHjBZHrOAYkUeTAWkujOYBEPaPtLCeByXgBMVsfUwiSEUnKRQFXaguAQMmzSZqHaC",
		@"tFVvenXvdwzoYVsRK": @"fIMAbiDcsraCGYFoZTuUJkMiajLVffIkCWQPNoTLgKwqMziqpPWZrUkLAEQhIjERcpyJVYbevNNCUhGDoWXWUhDEXgOKRjaNjiJVuafzxIrGrEylSTqlfOQRjTuRoxUkWfeTVkdWF",
		@"fRXMJuAkdjRqlwL": @"mnNdhrMzAuahMySqkasOIUoLGDgYGsNPGuqTyZZSGiSCrCgsPEYdQsMdnoXlUgpGioMjhnnoRFbvneapSkgLVaEbjNPJflAPemyqYTKukqlODrVNqkGrLldaobkPyz",
		@"vnjTYucTMCKSALHbYl": @"iROBtYJRsOeeQssOVuBHJlVzTDtwESeSyjBEliKvXANwdBAxUVmvYxOecJlDOgLjlsfNxFMgrUGxCzgkFdXjGobCMonVaZZYPeZyNgQGRCooVfWZULLs",
		@"NqmmjSOZwDx": @"IBUBlvboSuUcoQoFkwmmYGmufFNRDqiaPYKuZAHUvHQMkoVafEYNqsxXHziUdMfmayZLVWyaMvwjBIhkKrAkVgcYsjZiSMSQgixYkjdzKmFEgXfsjShaQuSuvoWmYzYBfqkJXHAbrBPLlOlEaNEkT",
		@"ujweMbRLKJkoStGejD": @"LoPWZiwzlTNrLHNVWnTTqIqyTlfOvPTqxBYBdxoJFhBXHonNmQzFjtifLHcwGtdzxoNwvulamuaKMQuNMruuHWhrqZPiQxxykKoWTSJXzSkGYDZCaIA",
		@"zIeaEpFGfzqCgFujqD": @"NhDMjAhPwcgfIQaBUJurPnVXXsOCYujVCqRWsqvUNhnVTYRynHIOlwWglaisGjeGpafTuPRhcivHQbKbGpruFCRqVNmpdjagJrpaQArrMGIZMLezkXbqzsokVxxuSszETWKcghZA",
		@"SghIxbifKL": @"SlzAfjlxOTFjupnLFwpYGQBKvCSaYwrgAnyAfCOuWehEDmSELreIIgerQbDUzBgClZvYmqaqwToiYjhIRbfJJkdvJrULfgyRCwXYdeUyTgGJfKkWeovMkcfR",
	};
	return kxeSEPimKYRNiUr;
}

+ (nonnull NSArray *)QRPJrJgjzo :(nonnull NSData *)bKBtKJKxNUBuAo {
	NSArray *NRRbeloEUjmeufF = @[
		@"isSuXDfcNUmKrghNhsTINlVljkZiOJkUUOLEoudmLtvDwZfsZftnRHOMpgVBcprXcwtYGBWXaRDfAHSYZjlbggwWexSFWEVCkFYsLFVlnlLJsDnHFnxPbLNVGXvd",
		@"tYjRRFYOkoTfbKozydtzLvGpaOLjKBadwAZaJixeEZIVSLixIfxLYVDAGDVFeowHZncFahJCOMaOuZSYMDNyqkBSSnSpLiwKkBODbJsGanXRKBacKFkIecxtRLInJaCFKsP",
		@"rljfGQJiFkeGhEsNInOmLbAMSnNrIEzZlxaBAaMZyrJTaaaBztRlxawZxyshqQHFSQivxmJOPrOTmOqtvBVePwQmmMRAdDwrMaEdRTnUSIVhlJLHhMfiy",
		@"enNyjIgCpPUDUQIbIOhmMFFmYgrbiqIJYKdObSnGyvCftNWcCPJVJmRAqJXrSfyUiRyEjGkoRXayfFteOJdHPgzyvBJtvKkGdKeWzPsESPeeUHhngrmsLPnDh",
		@"HLaXrZRuDaVBgIIHyKVmHKKYQXbgUdMywTEksxWhuWOmBQiwsjLRtFjxMKSnvFpHbSaEkdNKqkIFhRBgjtYkTrLgJgpCGiQnsKWBgQoQlMYSvXh",
		@"LFvQMZGUvJKVooNwGHOdBjEzmRXoIffBvcBWUwomgIiudikHsrRVJFhciDqDFTAFyAmOBlvpJPxveuMTMljseqsMTMKqXsMEqymBQsHXpTtVOuBm",
		@"wIoCWppUdDanlSsvjkXUdHPYMBAzUwzqZlRJqMbXgCcocbdvwQfixGnxtOZSZwdqbzKQgkzDOAvGPlTsNqrLAAqOyJLWthrfalUPqfyytHVtpCflAtqqIhwjjepNauXCupK",
		@"ZQTYfCVYqRfaUEWoXAktIwzeoaZwewfAQNmRUNbqtWOlPmvvzvVRkpQlWhQpJlyLwZwAyHqwYTfOqDMiDMFAOqtsNsYgEXCBnXExsLTtalsHYddzKCDWgLANbdPUTCEIggL",
		@"BCNcfxVsiIMbCAxxjVPTnXLNqFQBdNSDhFSabOGuVyXIeIYIESVsqKLvvyFNIFxYaIcOAawptjDtFNCJDrqysRqQHVUevDHuLfEleZLXNlcLUIYdUHqM",
		@"neJdRJvtUmMRjuzmPZGDXyofHlKYPJaBKtVorTvlRPQcwAUSnVeapaKQRxnePsZaYKvMYYBGKgmXpROFpiQLdVPNRAyrpKtAlnSOBQonNxlLuQhTI",
		@"JcCFJZLHRGEVAPEiCUTYIOotvVGeIYMroHywVnVrwJPoKycFfNJCOHpBCfWqPMkRWCfaaLtnUsPsndSZkjYHJRjlBdImIYpsjwoVVZuTRRRaryB",
		@"SClTYoHEdpczfYWQGHbqvzTBVCDUvOSBNDbGoYYXKIXBuByNDCQPSTdGcMutGbCsqyolxZAGudRfdvKGGHCDJBlOodWprAKgbXCHbSQAZbYtqmkFHVTdmnRfvRhlidgZ",
		@"HOgYUEmgkXXtvmATcbJNybAIVmckCUASySMkjJJBYjWSSRjgfhOZcUlHWHlSSWSFShOihhiMWngYeyvSbnVgFLwDMoHdJxpSDYSJhzeITXBhvfSJlcKF",
	];
	return NRRbeloEUjmeufF;
}

+ (nonnull NSData *)lDeRvcmUvrWrw :(nonnull UIImage *)IifIAaDCkCkSXC :(nonnull UIImage *)tdKbmeTfvZBuaa {
	NSData *diGDByVogXOGwF = [@"TngMxMVKBoogAFEUOrwSCZZKIedKPTONZHktGvudCYESJGUCRlMGmYlnLkfctLTOZIGEPmPwwswQkatbQXZGqSmxogscYfrGrTntArsHAODXaJrQBbNYRKuMSxoQkhgvdmRxUYcPwJRYM" dataUsingEncoding:NSUTF8StringEncoding];
	return diGDByVogXOGwF;
}

- (nonnull NSArray *)NCHXZKKeJisjo :(nonnull UIImage *)SgMeGBfFVCFeoLSAXEs :(nonnull NSArray *)rMkFzcLvonj {
	NSArray *jMgCdzoNqC = @[
		@"omUBvjLWaaDugsoizQsfixGxmEOkOVkcevCIUviBBWRUWtyegkthMvDJdItMTxbfjVKfFVPMpbPNrSPLRwngUDIbiZiPqPiqCAwKzUpFeYUrSuRkSyDvnYOIIFSYRkTt",
		@"aWscKLycFxRNQQgwDXrXnHtGltIehwpoObbrnFTOsYAtrufrNauLkSxcrDVqhJPYxTYMXIKTcMGEzQiYzYhXCPhzJPRYlSmZWdNPWeWtYyoPeJjLbtmUsQHPkGyHhMBmBopAIkeDUXKMWH",
		@"OUmOCCJIzBXihdardPtIoefZNaABJOMCetgxYzioReuymSjOQgkRYwGyWIzOnZPnvIXNYgNGnidRkeYRRCsOWpYUMOnjfprAIGucoZRAeGzydmh",
		@"nhYAQymYmNzWJTDykSmfYQVYLLeyddsyGFqZgpDgjWZjkAikJtGqtVdSdSAwUUVYMpulttdCmrUBmFfVXuhjyGcUTzSOtMIFIMcbqxYxNIqwJoBitJKkXUYOzmF",
		@"hdJTjBdkuBQLBTTswqcgBWVCVWWLrBEYdEVRcQTWNZuOokJwyeshkkowiOiXqTETwFhDwqjVJKXvMvODKDJhTELvPbSspOZawbwvJjOwwueAOSFbGhwPJwdCDEz",
		@"pgONHTQjSAtVIjeoiQszfMwROlcRmWxSDfGIKfezWWceNQIZaKYIxrdfaYMiclxkvFArPBXqzfeOTrmNhrkQcyBVrUOkqLBRueUSMbOnCuNXhKlRIBxFUGXmJVNtu",
		@"fbwnhjedAZAAykDeMHWUSlyjwcOhheLRYCExKETZAzzVwyvaxnXFGcflyntWBPPIUiImZPXayjHpfJwpZVnospPzZkOeynKfhIkKywvmCfauVGNYPPXAzBEjRk",
		@"bZiTpNAnAPKTZxrPgusJRrGQBtuhilOODRIZIvzRJWUeVqRyfejwXysIJKKUdYYUdwMLzDZyBSJbHmRfLgzswoXdsuMkuyqHQJimXtNfTUTFIAqfSzCzHZ",
		@"UoZhtiRCIuQlOustSRdzXJSQTVROghIeSRVJGWAYleGcZNmScpIwRxZWRMqLLzQNExEMdZkmGUnUNimZHhuKuAMtATquCcAQqlQCoaYbfaV",
		@"rnCrJTRRwxBmOxGEGMdQCMoYmiFnnxUHtEdqhCUxkKlUHdEoiIKQsOLgbZDvQXfTGTATdXrhKUVrYHtPWdnobNwUyJDwTiRIcJXeYJaNwhzUeGvCPHJPmpgau",
		@"vbgBTLVYOyUDvvXYmLeBSrkEqtUeOBLckMRWExmobjZDxwNffHcskekhMQdXUKgdaLJwbKIWPMqNMsbmXRfrUNhnnlUmHbpludnFtGBOBTVDcO",
		@"jVXgeILmmbYiBiMbEEaEfPPoGCCVNFMtEqHoRJXntbzuuuJivikrgUVoekrlkePqSCCuscRWKoPfvfDhXbqxnksTTyRWBUzadfPILAj",
	];
	return jMgCdzoNqC;
}

- (nonnull NSString *)qiEYLUUhQMwpPJbLAm :(nonnull NSData *)PllDEMHWltOAtFgpRw {
	NSString *mXjJCkVWOgnni = @"uWVRsSTggcoESowCvBLNodQCxQgphwyTBirBgVllfKsGuTPATXSQzAWMqhjpOcInnnmepGSEbNCMAghGjOhHKvtGFjqrETGIRXUhQ";
	return mXjJCkVWOgnni;
}

- (nonnull UIImage *)LumWehtUWd :(nonnull NSString *)uBAtURQpnF {
	NSData *dltoTDVEMvBVXZXhB = [@"rMKkjyeLQExCwQYdIoWHdBToDobDqQwpHGlkXYIRhQmipMdZItKdXevgOusJqBbmkWSLmEAwqFLmNCyLnULcEpFjlCjLkUgHLPWCDHrpCUpCh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KjQwiWSpqLrnHho = [UIImage imageWithData:dltoTDVEMvBVXZXhB];
	KjQwiWSpqLrnHho = [UIImage imageNamed:@"gYPsURngUftXnqFSJujpsstmIoOdXkzsTHwcaYbTEPNtUMNHqNnDWkrwrPjGLNVoMzCPsorHCkWELkzrVFqDRhhogQXbVxVJpLMOxxWWEYHZNJGLHbuvIidCQMCAqZcNOPtcEhZlQcnOLPUVkK"];
	return KjQwiWSpqLrnHho;
}

- (nonnull NSString *)lCzaDrINTt :(nonnull NSDictionary *)edZDJYNJvaZRnfeuF :(nonnull NSDictionary *)jYxwqdcEQedIoraGzG {
	NSString *JUfLXTsZceb = @"YUPHopwFlMfUfwrAbwAttlRnNFfIqwZZoOoBbzaWyvyhnsrCqLKZTqyUoOPuAjwSeQADsIJpIPuQuMweJLWhUHMHMOEHIjKYTOWwtc";
	return JUfLXTsZceb;
}

+ (nonnull NSString *)GzkWaUSXmquRYW :(nonnull UIImage *)jAYBSilTDJJGqk {
	NSString *qVATvgUsEadvdU = @"UWiSPCAlYjfkHfuazCeOrFPBvhTYSAIxToAhTbgHKBxayPQpLjQjmCvNNSgGuUrMByCdyicdxOzLaqPGGzDUksTAYXWZDCAqVKlLRGksiahkqdMjNZbQhsXWMaDKJLWObjAOQCftdtrbXamYjt";
	return qVATvgUsEadvdU;
}

- (nonnull NSDictionary *)btUPZUNZygkTJhfEAyA :(nonnull NSString *)AqiJECQnVqZvtaz {
	NSDictionary *jAbZquAfPIvONit = @{
		@"uUlrbBnTFzraBsXUHg": @"yQlIuQLcJIynfKAtUJNrowpoNxznHEOPsCKnZXjruuoQUUrUvvsvFewkqtpnTtpqHymLCeeerhJjpwlaPFOZqpNtvOtPHaELJOPGRjjBqCwaiCvFAZREFiQNFjMMzGCc",
		@"WREiYyEDEpgIUjSoR": @"pQrNWZckwefpsseJruZlIvLtVjfYOFyUAkScBDftUpeZwlCCOwVfDJRrMQkLMsTHtSPPSyMTNIrwdLUpxDPxmajCqOMmGUERcPmrBrivHMgrGSDlc",
		@"eIODKRLjmgK": @"sTzWbfxwCNEnYQvNpFaKpVfkEIxsVRfpHYSlndMmUUkTcVLvgxGmxhvntIVYAioSxpOZrHkwcdDCVkioXSSRrcutHQkoaGhAbVsyxLpCcNpqhnJT",
		@"RCGWxoQkhVDqsf": @"IsZFoDFOVCqyjXJnthpLIutYILqvoivQQKBRVtwsKxiIrxhdtwnbKHqRjjPNQtrXVmzfDdQXRpglwoMAgHEXCoHzvrkVvXdeFrMojTbWosyvaNSuVpPgSudrIKDqM",
		@"vqkHQreMIMnOBGKXDUu": @"PCnpIrzvTmvEoReBJrIaWIgSpaxyTmVNCgaguhomTEMJnUeBqmKIzBDdfMTHmnlKBSzWZgOUIpDazpkByknTxHtSRbEorFDfyqnhIaUdaMPqWyPxnhxWtpjMEncskbegBO",
		@"OovoAXCuCzDD": @"fxQFVRRLocfZdyDAoXAGOmnWzHEKhersHnitNbdGfYwkmQmzNzFIvsOPTTojjJrVrxawBxNeZCANwVLKDlFXvqAoAsbALCQpcDcgIokSUjlHspYDwOpgfBQCpxCsOeXHaWlKqhpVvC",
		@"PiJIVEKtHhrQm": @"pjiKrfADZfVvnaYzMtuMgQfWsExAURodtUJXdShNmFYWPdTUMifJmZouTeXgkQGanBVvpCiHzgXACBipBHAGpRTXAXVYazPocLNGCnKrDd",
		@"XasZOMIRohuvR": @"cNUHcFHyVLPSCXlbYIPMdKxJEkhLtHOmNkoQcxJfPVZnLrWuMPnjgRekPHDVMOtFJyeVxQHnmGphfoLjbMDuXoEMburrRchxiqRiQOrFDlhSXrUxx",
		@"NiouFkeLOEexSjMR": @"tshZfGDYfMBffUlrrRGfJnbPVfgFtzzaBKUuBkzPLrWWvxxZwWqbaSBlllHZWnxxCJgwKQdSUdJzWoPyswlyEhFdMLeFTCeRXtBoL",
		@"AinhLJkHEZFi": @"zdUkJbGeICZrRiKoFykdZzxiQxSNONfOefMmfAEbKlApnMlioDdyUapGvxbtzWTDHKOGZWKfwcDACRZkXHCwYgjddAGjBrENgQgEgCFeIJsQwkLZUdbLvwantGjEezOtGvdUPKgkAfbcRqavg",
		@"DtfwmnsWJpYRA": @"xieWteqBRpXsakTIdvCuBpRNeqronGXvLBsIFfZvpYVJuljZaInYmnQyLSFXJVddVpfKesvtmeiCNDaTlNFGHxIKfMsMBCWqsqHMXIlcVwCYXYZnFJsYegXOehBoxACPaGGxivZUWigTnEUWDy",
		@"DCTQDDxjDX": @"wxvDAKoFSNpzuzhvlLgbRgKbAZmIcjyYnwiZwKzpozzjEkUsEmvObCPJrbxqtlJNixSlztwmvkvaNsEFXJePfuXVsDWfrtcMWKCqDUeXQLuKBmjVsnIspYNjdKHhcytjqBKWeweBwRhpyTcvf",
		@"bTVRLnKYkrTG": @"PIENDUhfQNxaNePMXiWETXBwLevuZYwqANeEeliIweNDFnakqYkoamrzYaikhwLNawMutPCRhYHOEmVguEwHehanELPUnAPCwrsegkkfshEENBCepMLtFFLeWLpAeMkYEMeQrxgNRDDQQ",
		@"nrkIQsqlFIKlC": @"bsYwnkXXFnEQxNYttFhCUkegSbAIdrpTlYmoTFJPpavRhYRmKuYiSFrFEDPtPZfrvsUDvzJvvHYOPhbacIDbBQPKGbBrbdCuqkHcRSyjUFsFyEnfqeBBaWGYwQvnyI",
		@"dmKAoFxrHSM": @"NkXxrRKfzjburyLArjMmuBJyDrafcUafBlNPZEitLTKZiMVDsihOwhyupIPhryUMQOyotwbLHCoftqHumUUNLbcaoWkXVymnxgmeZFjcDsrUQwnTnLoSgmMfh",
		@"ZDEsHjvvPAOjdV": @"wKekNydgfwcJvFSRDlmdimlLvRahdgMoWqmgilkakUnJMmHXSMrqUbMRFaRWStIYpvGgcGiCzLHJcDJZddbJzMDXvjcmJNdTptKLAVEYc",
		@"MzCrPKkRPnmerIfSZ": @"VCJUcAfmDYqtxANZWeqCYhFqeSUfKYHTiBTjEHjkRDoSkSnOFIoJOUYEAKxJSpcujAgalDfoaKrZrIPZdUONFCcTNLUNvdRZHbsujOmfEdriMvPxUuOLEkEcyKDeBmyILaqZtRTUKUwzkpULP",
	};
	return jAbZquAfPIvONit;
}

+ (nonnull NSString *)uQZsPVIVJFjrosQ :(nonnull NSString *)cAPUqYfSEPQGndwNVy :(nonnull NSData *)gxJkpJQYgClPUvj {
	NSString *IJONYNzoFWBZrZtib = @"DZfIBfTRStqTgqXySUmWipcRIxjRuJmVqlZgPcMCIjlTQSeDJyKnsXnqoYihaqbfQXZtqyIgQVaLGfJIpzAZofZQkqpWzUNjSLEZ";
	return IJONYNzoFWBZrZtib;
}

+ (nonnull NSArray *)ANCqZCgQrs :(nonnull NSString *)SwYDnvLKeftpzkCV :(nonnull NSString *)ZsUUlSmUSWy :(nonnull UIImage *)JHSQuYdBhCrXetqahYE {
	NSArray *gUXhJoeupkTKPw = @[
		@"RgtjmpdwbtbEAAFEEnYYpHwGqAuSdtSmafCRWEbTQBPOxhrMOWHnhnnylcyhpcBdcHYDyMEZElLBaAJEmRBnkwWNzJAFglOtZvcmdnyAPwq",
		@"bvVPAGwwLmAdZKLfQuUCMkoJCjdvVNCoMVlfamdHUIwdhYWyJcOWZIAbNVVmYGPDRiuKsAvVSfjJvcZAsGodXHRZEajPftOnLlDzriVlHmKUMGxZoQv",
		@"tXjvJhVpvWNrREWBrTibprVRQfkLBzTeLGWHFPpCvgTaXKDATeYITvbJIMTAMcnKOcJCAvYXmVfDGDouSnobKeaoTzCLKTPkVlDBmfrwFUrgOcCcUPSt",
		@"VhuCmRkDGXgbjTwqGCZXgmzjugHGcmVXyWjoGCdlsvGZYJcQXwIDfpnLnLBPySrtvTLuMfAWRoRUsWRrHCoqxsbSakAUIiZAeAaNTxRhVNNlF",
		@"euGrFNtXRxjHWffQNQyeuHRuHiLcjYKoZrrBPDXpcefidpgXCDXeZoyrDyvDTuitARAShpUXnlauTtSvwGACjTWCpGgSMxXeQKtJbsLcgXmYWiXGDFXyLCWmQZqAFbuHJTnciWkEHtg",
		@"ulgcpzECxOXXQyCqNshXSAFYotwjqKbfxdeOovxijnJmdeGsBphqgWCEVlvTEAMaObRcwrgkqzJmdVFoTkIfPSDeqyYsgKyMjJGkCUIJGyOFlymvrFTIngTcdjbgEcrzhkCyIBZyqFiEz",
		@"zJcaXBSQHsWrSRTOHuWopyVzeHTRKOFXUvTdJarRKFNfmKeZiVdofcFgptTkpPUbRZroLmFetUxRkVzOwFWDwcLfSdbeirYhvPKttSZN",
		@"ickfpdkgNsaHEZwBbFPAqNJWtXuSyHKeqjlikNSYYFbGQYvgEAuDJAIIXIEKlVgKWbANpPXWYUurdUzkofDALUZxymRudFGwOYilxUdHgHpueezoFhAbqSIYRGFbR",
		@"gNpZgLLRlyZNSvmOjrJlBmiHZIthKKhlOhrjcHTcuruLzFZYByhrGgdNumBUoSqbWRzVlbyKwYkYoSCMCeTPrTpAGcazBBqGUAdtuxpFLCjLiONglugkxNyMDGVrcVKLPWfO",
		@"iBQHiLZqYTjomQKnFTliHDmyquGQIgbobCPNnfcMpJShDIpQeOvxxLKJLLGQqWTZMDXXDCwFhDAKXWXAYYDkzodAEkjIhBPLRqwEScEgqrvfUcLfITGhGIcFwgWBCUVRajmhzBGBG",
		@"jSfLqklyzOECFUvIHhdVTEorAJdgDPcqVOilbRxxbSmCjQzdTLxSROpBQEBovuByguztddqhbEnEtLrbjUJrVayaQmxMIsAmMIDKAEHjZeRVSFniAjJjpvhYnLA",
		@"bIvEXhHWuWiYXUEVpVsjFKDvQFuSwkbUAbcYQmGbLiratPVVpEXjAQsvzWImPndesduLGGQHtiCNHqdhvYhNAtdGDAXlOkSuXlBhiQoLRLIsIzBQpKQaoaoLaJwl",
		@"vycrQtNVCtOwIIbvlumpoWrpTHIPKAwVsYnAdGYdxwhHVkfiUJTZLrNOsGiWFjPuGwQldtMSFVCTCLezNdqXyYmXNqLqFbGEOUljWVmfiUHihXJSTpKJewL",
		@"fcLieFIsLkEiKfvIPfZrsbdtVJyrLtwSEJqTWsqHmMFDZjgLnyUzTfRkIFAYrNkSDfcXFnjZpXlgKxDefLquUVqfjUKLiFIjOHxDdQSXhvsZCHqSHpibBXdtHYXuxbfmgPye",
		@"LBXpmXPncRarUXohaMJFaOLkrGTpoXfkBllWMBQxmFQPybcyDetYwyyPBzbJKFrwuhInQooZEDChhVHjImMMhGRjcCSAzeChvjIEruFFyPPuwvlQGsQZmcrAfnI",
		@"RmGllAgESSPeELmrwxpGiPhoSREvcHhMYQzKUtzIYnymomZCdJhdxFVOaQgCAOpUWCcNgriwVMxBTDlGrFwJZFQMVWgFMJrXzWkEnZiYRBkHNAyiZvytoTFyuYgqhluoXRngJ",
		@"cyoDPwyWVgvwqZxszUKtmxvenCpkRzRmNZLyYMEJvBjiCjxyOVuffUugSGDvHLLtxqpDNJYanmZkpEAYSOQQRCRtpDqclaVZlXfWNnfmkoQVPPSuyWAWoKwXTwjOvaRuSIyGhOTmPUWsacJhPNK",
		@"wXTRyhdWxrKRwDiGTzQqRHWHpdywVLQWuCgUyuxobyWNqikrDpyFhRBalaHzcsEVwvbhBnqLjOAqKMgtnkzqnsMjKoBLoUhWCzNKDixQCoNBuQ",
	];
	return gUXhJoeupkTKPw;
}

- (nonnull NSDictionary *)EXScthtPElRhNv :(nonnull UIImage *)PPILHXHtcskfrfj :(nonnull UIImage *)FeJJKAeGIaTcmFhLB {
	NSDictionary *rPvYIGVYthmfTh = @{
		@"beEOVNVbwlWdVtjy": @"rNlZfzCwHVhYpfIoiajTgvLPzNOEWsuTMeKXeiqsZHRuHxfyxDIkLDrUWyGAIMZHwdJCuNZZgmrEDYugrAqAKRUFMprAqMuBSIqSHhblvkWqiTkPAFxkmLBOAtAVWAeONIfDL",
		@"SFVeoNYqhEnueOlCw": @"uovLVZjXkGuctLUMVYmCIULpXDKMsaGdzDrFnPWfxsznCLkOHhOirfVZnfihEPzBDTmCxxxJFQUdzggYuYpMfQGJtfIeezXkWByjMyLjFimeblDwdmIlytujsuqivurewm",
		@"hrAkCOVmjny": @"uQYKEOrSrOqDCNoOAJMUaVAgTzHcvTXMOOYgRhVcKdprUstvWDXYvWUPEdSmzUTjnlgzwHtzZDtFOZSWLjdWVAsqBisIWycHUFpnnkmWSgYngjfHKKkqRySmvYMPhdqwozhC",
		@"HpfOqcwqGZ": @"IaQbWaDWcaTwgLduUZxmxDdAXMCftknXqTYtLRDupLtzRtjTSxWlkuwWKlcgantvCNJzGvYxvCEgTqdweTeQChXTHtdeAQXYROniHudHfKCRkSqKPDTjQQiLzGwehNZ",
		@"mYcUlLqfDIuxg": @"zjcXYaveXRXQUvuaSRfPpdkLpHQhIldVeFllDTjBaHMGGmibvqoBcFtjbVSQavtQHxYtgrGNsUfWfammnRqyXGeJdpQTjDBCRyWaqjwPpWjqEELxyGGAsBibAjzFyxBULaRhVfnzxqm",
		@"RNiDXsmICFmeuav": @"dPpYamkhdGethtLoIpwzYQgzeviUSRGrsEVKGJkrUROKizgIaDMLALkFMHTXGwlPeKTAtUnAHCfLzWdGaTqReduDodeFLbXLYcsQVur",
		@"jVDOduebVeFDFuj": @"AdzcUroeSwMPxaXlXVohBwuKVzlMUZjIYWAeMAZHdxTyHbeLDJJSBnhEgUzAtrehVHqSbxkTFyqRzbcDqhsTAZKYyCtkYOjXMFldFRSOZqrXV",
		@"SlrplWAnlMRrQ": @"WOWOckGgtVwOHuqqDhHDaUozECfhuWXNqYcUQZfyqhUHMwBMdtacToyOUwwRxHfiKieJTutEQvsKIJPpoRUaZuxrtYddlmwelaZPzSGAEczIDhERZJhwsrdNQeGCvdgUHaIZUPDwF",
		@"BnXBavxWnAZbH": @"jMDYDBtSjKFVStddpNmyrKqHDbSdzdCODMlVeLZesHUOZhRDmKXTrmFTwhVGOFOJzrAzSTNdMoPbiaSqwhxVsqdLyIkEGoVtqqmqQTOkDb",
		@"BepjSoNgVDoQgCR": @"QlaikgOhvNsIutqwXImANdvrWAofSZSZuvpCfQggXbqwFUIIwgqdPfHghQCRQnMjaTpoLbWfXnTfiEeXDHtnmPqotBfyAISoiKxFKbwDTZ",
		@"nfkrFWmEXuZJkckmW": @"mNlSxwToemTjvmVTeDHEjAehkvYutlVwrzzaVSdGEtGyAWWDMRzZtWcuDbPBTdfUPOCWFAFuFYHpPjmzbIbognJQrRIKlfPcKljJbosvBPdoXakuuYuWZNzf",
		@"BeXBxkLqBRmFC": @"xJzZvTCbeNCWBsZLlfLrnOCoGneBaNZUrFIhJFuKFtjNLNoQMkqVivllZHGAreqHzCLMRIvJrHmdGKNACMpEUFhOlBBlVjGspZgtGGojaBfienDqF",
		@"VQPgIjKvUunUURvaXjM": @"IazNFxAnIaipAhJuchdmplQTLccWCewvvfDYPGEpqDTEuatDBxLuNPXkuCYiNfGdmMZkfhevibPnOFFjFFOJXohvPBfHtRIUaQTphoMjUYeoEeNULvnEPpLHuHXMnTGUxpyucZhcrqpswKOP",
		@"IpwrZQJwHRTKbts": @"yAbDUfFGjMbpRyrZXXvLLGqJYFXJHxprQOMTFItePUonPkuPTdMQgZTdlCWOKuCpRuyHNtjaZMivJrbKHZrNRYlcydTARwbsORmWvzZBnitSHJhaXIbtdhfOFp",
		@"veTuqTLUrp": @"VLGkfBdscurwJQhJnIkulfqOujmXWwyRvHfNsIZyYCTMVLlGGiWCUUeqKEQvAXHNNXxERnWWAltqpFUaPerrXzisuLFstLMcGByRTzNuUCArJeWcdXwtgUXdCUdbNrHrivMpObtNjMxGwSBspN",
		@"LvksjHPSsCezk": @"FGyUwohFKQnZBbKVmkSZQcIKurFGZvIFHbLvotuWOHRroxyAVrWhkydMAtWmKTZNuUVCpKKyWKyBinIYrvzzYSWmBPDliQTIDkgcJgkgVjBmeGfGOyZJATnGpC",
	};
	return rPvYIGVYthmfTh;
}

- (nonnull NSData *)PhNOHQSFaK :(nonnull NSString *)xmoNFgDIetuN {
	NSData *uxvcAqRMtxgrSFGhDe = [@"ugwfBMggkkYMesBqsmpTmfhPXYXOFtefalpnGiKODkLGuKiKarbtwoSAxYpUxYokanvBeoySuhMxDnwvmhnTwFZjVpbNEXFzqbaWGTlHrLsnZeXXmrtknehdZaVPqCBUmqrqCwrESTLwBcMhqb" dataUsingEncoding:NSUTF8StringEncoding];
	return uxvcAqRMtxgrSFGhDe;
}

+ (nonnull NSData *)ihpopYhhpqjO :(nonnull NSDictionary *)zCBZlRzNgpsJQTKc :(nonnull NSString *)mBKhyUmCMsbLU {
	NSData *HQChaSDmgTkzcCVYN = [@"URRUiVgMoDpNVBXEFOUzrDTAXGiRTxGcNMYCjCAhQgUbQUCvsZWpEQDYyPDUzrEdZrNPkKzbTdjjLnyGLqqrSjCHKQeNtpaLYgIutfYALiXDm" dataUsingEncoding:NSUTF8StringEncoding];
	return HQChaSDmgTkzcCVYN;
}

+ (nonnull NSDictionary *)iLSUoAXjAGaBW :(nonnull UIImage *)QdkgLDwRNkGDSsF :(nonnull UIImage *)fToxqkTCqvrgbUk {
	NSDictionary *DVCxGdUoNCNqM = @{
		@"vganrESVXNGTechBhJ": @"DWlBgIrKaGHEMTYHTQSuaqRVvWyIBIgznUugQLjlRtczoiSvmbJiuLzfnaHhEKnOGQhjcpeonssMnJvEiLkyqVNNBYhFrtXTNBeeUXYhYDGVzGktysVszaiTeq",
		@"pnbaPUOAGnFilLhL": @"jGGudmqiaDIWGaIGxqGYhohJIqnKdqIacrzRXPoUCtneaDijyaFcaEVWgLhDSBcPQOQkuHJjCstklilokPYEUkWMoDXmTyygNccJTUGBFUSKsbRavZTxOxIJifVbGytmesck",
		@"jhBrjFHjfe": @"CSJoEUKeGYcVTjyuvoBzsBHgAQRwDIoudXhfRNjrPQHcgptEntZMtGoquQMbkXUwRCMgIUIFXZOtuOCbunoGIHEgHcqixkpxaYlkuFLYlGITmUajqEGpqVDUtamrzrWIGxkwweMGInfSL",
		@"rxJpTFPCdi": @"XEmkkTJPQtAMMhOojMYQKdEfHECTvKbbWrzTGpSzaquVkrbFScTHztoxVJcHcLhTKPtUTxUosvCYbSofgvYefnAcaBLfidKvkQYPZXDHrQRuJToX",
		@"lfHxKitVLYFdnzZJ": @"prHiHgDtmjipFkkTpuGLPvuuMBruaGyzWyJTMARIICxnvgzBcoordsZdieoWSZRScABjMqxOwvGGpYLPyswyZgfFXGTXsYUiSLFLupPmNMxDkzEtrZtiGZwzVuBkoZzMGuAW",
		@"PHeZKlbGtZYVzbVr": @"CnIXmphPouXXDoPNcSXLPYSDzodEWUHTLEukUXNXyZVczCsQMAfwvhbciiMoehedyEDTjbDsYjzKPlxNWZabvaByToDDvNqDtXixLTnxeIwXkqJIQGWvsqIOm",
		@"FYXNCbMkFNUbsBkxYnz": @"MEdDgxemFDVnxZuIMyjTFKmQhtAEyKEQWSvgiFlRbkqYYJomTvazcLBDoZPYejbcJCeBbkJSQbMpNzJiWhzzzBtKwJUOGcRHXjLljtE",
		@"ocexEGBWMWKdjFLDNqE": @"iXpatVtGOneIMiluhUeukfJcXAKIleoIzrSVFOqFSpDJrkLukMfiRrgDFqAIsyrmraVBLDgRLRueoJhesqrGDummpDoLWgGFdqsAuSNsdYLJNuZrboucgYLGIcszWqsiPIWYB",
		@"dnsAkaiYDH": @"YqYgGOgVtkOSmKbqNMuAppEZpmEqWfRIIkzDpIrGBNIViceXJGKNeshnLkgymZkKXTBVoHpoweuSDzMeAiTAALMfjBmHKPhzAEznDmnGqFxNYPmxTivAcIVLnYsZiIglRUVcThkKrDPCuHU",
		@"PDEvBCPSQfYYhCsnJ": @"oxbQCVRqizjRovmSKXaBvXcXoFjWnGIOEfskGauDitIOvWKSFQYNMESNZCxyxdzPtqFrsNwlwEkSmbVGjnAjAAbnsxvNuiPnQRXQVfrbSvZsKlIXrJcsPmNr",
		@"RtnOeTGDMLTbWnyQTQ": @"vLWxaYbchgwXakrMGuOGfQsOXtLYsbwWBkQiWkYvxwipfjEKSgCyVPhWariWaGFkrEhTaTZRtIvgLMhiIFShKvBUgnEmGHfLlLVhEXirZQXwdRo",
		@"YQEHjTHOSuachXMUIl": @"oFqIVJkEuDUCHZRXIvBqmeQqKscjyLEpYPIXZhSRdvpFxadVKcfTkjkdbJhvMSORuEbQKGkbfjogwCcNCvYgjhpzfxBWFtPZrDqm",
		@"QENGboAhpZaLpWA": @"NdBkNVIeIovqBfzoSdPsnmCPVNJJZwVDariWEfGAfnCmEYniInjGqxkXEPMbNduRBSLURIDbZdZPiCYEebvBsLgVeQcugNRVSTPiTQvOhAZPLgDcOqcLLtDqDCkRcxzVzoAScykOqT",
	};
	return DVCxGdUoNCNqM;
}

+ (nonnull UIImage *)aiMFFEmJixMN :(nonnull NSData *)mSidsnbcYxDPrwN {
	NSData *RbBdnhflLJmQCB = [@"DnkzRBWiQROnXbNIzJeYCOTlSkqoLnTLEgMpCicXumKPihanJJdiRcbMUCdRqXWCDoRrWyKYxjFfeXBICZfpXnwWyaeMTrMEvwRomwazzAGnWKg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kCdtQlQdLdKllx = [UIImage imageWithData:RbBdnhflLJmQCB];
	kCdtQlQdLdKllx = [UIImage imageNamed:@"FaxRDaMQbJWFJLnYCfGdLBWbbYnEYXHdLKxzEFmmUdFDawNZXuqGYXJKOxhuFHVwnJPULmUavCdmovvztiXqgjEhYcfJyGJSpxqxXQJyqUriUxupukzzyiadhWFbiFJJFsNmVOACR"];
	return kCdtQlQdLdKllx;
}

+ (nonnull NSDictionary *)pusuPUluzUxzHfSIHxb :(nonnull UIImage *)RzfORHCMvRXDRxsXjEN :(nonnull NSArray *)XmGRwnwtCyJjmqlxg :(nonnull NSArray *)VSxuHQiSLO {
	NSDictionary *XuiDiegWYAiazf = @{
		@"rpBsOZklptkIuzoFlNc": @"tnzwjQwJLTyLBEBRbeigKlZuvngbmXdCPKEnNuNOOgTjrxxKCcUaLxNcxdECwPxIKIGfyCEGhDhIwtZFWXSUrXkKvdnYVXllBTdqjXrzhgSLhiAfCPailUtQocbcDrt",
		@"hXkvGcGJjoqsZ": @"HpPeHzZFAWwURbkBtCgkPTofbWJjAWtFAzaIUzXQcsiUDNSBxSdgOZuxVqiEZPgtkuxyKMoBNCBFevupiDSWqrszVCmWIkdVHXBzaKMxIHgCtoMVIuuglUpIsz",
		@"RSmoRYfsld": @"FhPUiodgwsMgNCSHmrKUfqeielPMKykDoBbBEeTuzLCsrqInHvMxHeaRruePTfWsGXdcacxqWvwsaZdXBxGbgeTxZoZfSzUrUUIzYODNlODfUIhWNfpvhHsDCxggKSHOJJEm",
		@"HmnnpufHOyvHqDoE": @"lkyyxsYZWIcFgFMahhQioerQGzEYKPotNLlTMOxAMHbxltbubjWVFDKTDRdEhSXjvmkDMBQpMwnBWZuGHDcqNUxVTrDTTetNZSjeBaKQYJPjhvRvKQSzZztgRUIrLRJtRfRjhsYLigZaBDT",
		@"pjtpxIPFJCoTACbTJ": @"alWMNUgPUmHMqXltblfeAtbetggiWTxEsyEAZrxCGLvsxDUFCOptXONChysHrpLbMmaWprhNBqzbMDaQuorIryZWGrhLMehIFBrBycosVKWDAeHE",
		@"QMUzYXRzxnRgkuJiuh": @"aaKTmoqkFjzeBDMBLStHrqGGqOFatpbWICGaPSVGbZIRXhgjhxxlhyEEpGBwYCnupyFUKPqTkYkStttiFMwyeBdINPNujSwzIVPwoBcEdECxKFLEqE",
		@"VlNtsQHQCmgPqZtq": @"jRomkNLqwOJmISoGZsjuzpxZuhJvOOafixSkkJKKscTcLdEBoEUjSJuIcctGSleUbaGsmBEaWYWvOgbZFoDgwcgxHXFPMeieRnnuKxrkUPJOhsNSdihMKoOaMtaEUutmSXN",
		@"YqqOjkLsXZDPgZkwhBF": @"iaETrStVrqyqFAwoXACVITXcXdEImXFXQKVPoPLzaVhoTDnONGxEompMLdduYwOjuLlenEIuwbWOeUvyLTbbYWJXMWaTZLRbpzcNTfLncXtqehmArEoewSjaNKPcKE",
		@"iTGwykRcZXG": @"NSqnBizCTHGFDltKRjewhnWByccbGPVqEyKOKpOgDhtIuxlXyRWMwaxqLCclpJVFCacxSqhGGmhONblemnmyZxXgUChLQEmZLxLXxMjPujCFfHHLU",
		@"mFFNXSyCyJX": @"xIpDVAGNSgihkdkdBHRibALrIWvkDaiqKTLifVzEkTMFhXVtAktYaCFDzaxiAeuCjDICoEncQskektsQRzrutbHUkrbkfrzdTGOPYRIDXKWOWrCVPBildfmdvZyLBClWMfYlSBP",
		@"IncEXOUHvuSuHfUs": @"RBniAPoccsEDDOxtjRMqzELKGjtrsLEnxORCtKAGuEbtJzVuIlunXQQzOlSXTLBBvNMmzKVsWAGGKPCKoMARXWPpShrKQWQJEVuMBzmcFtTcXOnkEVFYzXjrTSSrumaIBQnUMeuSciqA",
		@"gbapdQubNWul": @"TKQPffJAWEjSwQIbyuSPuseRVFdzoFUWCyxtnZvEUxzmIHShkOWnIyLZmbiNNxDqsvIQdJSTXYKBXGFlMkBvsUNyhHZsmCHYEKqVLxuwALJKicPnzolngzOyVII",
		@"UMghgYviajFZOQ": @"DNXYknkTkCkjbSGuazfKuvPsBLnZawwKhIoQvCltKKipalumndghWzaBHMeLntANhEUNJVNylSqyIALodzZPLBZsANIdiZBtSBeGdUzfmFFNAFtNcugVpAATxoIAUNF",
		@"QjSIrHVJzafVaXUzZaX": @"ugwsBFHarGlvmmyvAkFSSEHoGgJtDvQbNpxvRSgkXAlfUKHRmJTiVkAYQRBoNQHorKOnnALLazNpytDFlsGVaBYcinABTPiXZmJvI",
	};
	return XuiDiegWYAiazf;
}

+ (nonnull NSDictionary *)inJKCQzFExZsHivKQmv :(nonnull NSDictionary *)uoDpzmVlzfnwOpGmaS :(nonnull UIImage *)nvZapwVkFzRNftzb :(nonnull NSData *)KptyEzXgwvEbUdULV {
	NSDictionary *zkDloLBrfotZEIUZk = @{
		@"vYNGOAMGGaQPzGk": @"stpiggwahhtNSCodVZGxcGexzMfJMKAEMLdpnKlRlnTyJbfXgPASbqoYsXWfkqCpbWpXLcKtstWLBSQQscnrjQqcrxyIuouTdgUdIBtbYQBJbcwC",
		@"xHEDRekxZZPPWafQ": @"uVJSTUhyEEkRvCcALwdsNSQkrVhKzpLDbPxArRfCGPBdRpLbEybBIUpUrSTVIpeFvJxguoCQMGQIViefYuOIkaJbzrLduLlUqdQZcYB",
		@"dmHNnDfvyRhb": @"NmuiIxvGiNHypRiWtoLvpcipttYZiZVgipdhLvicNlPoekNDbSkztzsNxZWZFCSCQwkLrHcoPsYJQbtcFlHDyUtYqVVvMcqNgpNGQSwsGlGGfERrvEpmQUQhBnNUUjTHSB",
		@"bktKVrStcf": @"UJpWpmQtTueDjdKkLruDOprbslxeMSVciAViYZflSSYUexfbFCHoVAedAqfULHloKPrezPjRXPVVHeJzwRBimnfNbZRBCbMuZPfdWvQgwlMRgWuDUjZICTdCXxqwsmycP",
		@"CYetgAgfxZMGRSVtVs": @"gpVKnfTcaErsCKkUlnrzvtSEwHNTKXcZqgMsjYwtUxBRbRynNNnZKsHmgiMhGSvVlFzagXXdmpOreZrwUbSzXGjSeIHLTRjWRINqzldDnYPIEcntMozMoldZivaXhVdOuuFmFVUkszDZgzIhVqPB",
		@"nWkwMsHrApnDhKVOxSo": @"TZKrMNvXpjseyVbQxpJCVKrXUCnfGxBgLgHErbBFvXSARFfdIsLUBncVYWnTSBTDYXSbpztFyIMZilBUkUiyWPtvhThtMsXtHcrGNwjomeiUgvJzaV",
		@"mrTHLOeGtv": @"PjLtfPznnSzaQSiWWXaMlOraHZneXvUMgkYNSrdKMGclBqLxhnQEwpaDQPSNcvIKQMWAKFvWlqqypeZbxtVrGrdRvNSyEDyFBmQMRkxqSjLRVobIGB",
		@"BaCrwuWbFL": @"rBfDxQLgjhLOwkIPKosoRrrsxnsriBohUMEpigvekITJPmUvtSRadTvIRXkhpQrSkDnYCSvDwUyUeMflBPSJQFyQmzwMksEwnzVuKxlyNejsJhLXupLSukibzkWVwkTgCw",
		@"SGVeUjhyeo": @"SCliIPwsJZKblnvpwGAhkYKPOEUzJhiUDUgBAevGGDJTejzHwqxdYxrfjFityMOsbsoiDNFabZMVjgDyKqOSzPnipIloyNfZBxqPo",
		@"nLAqkryQTM": @"nKBseyKehobDPFTxMXAeBbKRfZccyVqGSRYhvCqVUbHrbZVycDfDcGXCdfjoHspBALZsWtZtGlsYHliJnXxZKlBBLkWbqnBhIwEEFAZOqCdBMhBGeOXdtzaHuTzbyIK",
		@"FqhDLFXCrOQrL": @"YZxBZQWQHDKdXZfPfGFIVacSdtvdGdYqSIdnrgKBjoIidVqDhcxhCpuMPlurTEdXngbHdfobsiaKiGwdlzjbDPyYyZjFYhUzcFkWIeleLqGfVlhbnUIWIycXbEe",
		@"BjaUvbjItElz": @"XtRFtLjsTwBXsSRCNMkcaAbUuIdgYfKvCxEBEUObheVzetpUSqcUAOAPMAAbYybODWxKqQuxtkwTJJzhKOvnrERJqPtNCWySHLsWJLerRYgRTmnGvqpsaVorOnlOqBqq",
		@"qzMUcNUPJmsn": @"RnolKmFNoIGclahMJjhUXMiSRVQJLXQlUiokTqDrgVkPXSGZCperbuszIJafjVeZVOvXOVjjfefZKREuYFkZZOdXtPOcXnNAmSVGkkCscEmORQdEeioHHzsHKvF",
		@"oLkbGqEwkVe": @"mCFEIupMQoFihcyOlUQezqGUxzJEvRmmLjRXwyHlsSuakdsOKmAheIbwyqvQfcEaQCGZbcwjrTSklpetEqxclESThiioVqvkERRYqRkdH",
		@"vgpUbKGGOaGr": @"oRNMYLazLMMfjTrnickGUqDJTSKoTkNsujfaRCfvBVbqbAKVvaHELEqpYWhEfkcTjuafFavhXyTyIfKtMATWgPQPDgDDaMfINDGEoFjY",
	};
	return zkDloLBrfotZEIUZk;
}

- (nonnull UIImage *)yaTGVUVauMImpenu :(nonnull NSDictionary *)himljgyhWEvjdOeO {
	NSData *WcVzPqvHjpmrMi = [@"xioAKmBpDvNIaNgmsodosCpzrwBRZIRXggTBNExNvCKVdQTkjTYUYrPvNbCVBXdyboRlySZHgpIbfuUKtutTvwztsioMhxrzTToExHRExR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lvghUketmUMVKDAs = [UIImage imageWithData:WcVzPqvHjpmrMi];
	lvghUketmUMVKDAs = [UIImage imageNamed:@"VbzgvkCRvUsOBumjZiyIyDhEWscCvkgkWHHmjdFUZySeIiRgpeSzErEkMpZfQwbllZqALvCyMUgEDWkewUTLJiqvGHcuuruATCNXfR"];
	return lvghUketmUMVKDAs;
}

+ (nonnull NSArray *)aGMqKBhxKbfStDBGdq :(nonnull NSDictionary *)jntyBCTzsuh {
	NSArray *mwXaCsixfLCj = @[
		@"ivZacUiCIcsZVMAzkJFhUEKziOawmVdpRLdHHrnIBqzihgLRSWmHhbjgzSgutuYdWTunFMhuGMDoHgyIAKbyPbscvuJxggNhTQLEPHwxFztmECsLXaKbdRUPuiqKnxEbxvIHqSqytXeNNh",
		@"APLCzKmxkXGyQYSUnkFDhzlHsREFYpjTTgvdlXHKTznOGQwdvRllgQMaiXjuhGclBjcPiMWenRMQeTEfuxyPUsINAAErgsNnUPZXSuSkdUzHTIVKSnraQLQXIOBeegEvEM",
		@"zbuRgRLzmtrCmhNzdnrCgPiHeQgLwiwPeMMUoFoygpMLyuhRXjnQNBxziCxCSyytQjCVPgCmPUoqhVqvYwuUIbNNshhgsmTlQwaKgFjPRtxfQjArRQUVDd",
		@"ZdXiwaihrWqqILHjCqnJNOoYBwqmdJJJOMLXFelexUaIYHGLuSTfuFJtzvmcvSmPYhHeqNkQOvnSOGrUVXypauXDxyvYGQYdGddiaunApeWlNKRkVqiTyBRexXyOoXTCUpRkUGEtU",
		@"WtjbDmMBHoAdoGjhxCCfFhpCaeowsjUREAsstMJUdQOHCoMzsgrcDlBlLhsHnhGEdnIrbKFJdFpwJzLxeYeAzQrpoWMczlMdXXcRheopP",
		@"xLwYzROeInAeLPJdhhFvnCoPnRlxWEkqfLzymIAMiWtXEZZtzXxEBenlyeKFwddssaxRBfZfDsgbBWWaJhAHDRoWElYTuQVJqKRtDLZGMKNScctODBFpnLqQPJyVHqTOrytAvTniYDQI",
		@"XxDXdbfJcqtgVCrwJNPxErGGRwaxzhfXHMLSHJqPiyHSyIqEPSRXonpvqznKYurCbHUEMjKmAskEzKAJvRhZfswhcaQOkQuLzgHYwEnOhxChUdTNuajHgDyjmngfB",
		@"wTdfJIcUNbNsCxaWwPBOLiqmAZemaRSVLZzDAFIqUajvjxVpGsWcnqGLumkRrbAJNWyGAbsZZZhmrWvIJYuZsOJrveokmKoZqtgpuwJiZzUFNhGwUoUINXKrmCTvhxIIjF",
		@"bjWIDbWxnJOzGCIjPXVFGFHhASYQNENQRjnWkFjjONgMZFyBvcCbWlHEOwSkxAwWUrvZdTNEJINpJQliAyFfalssAcjXoXyJxCONfSeBbqRAhUzvTSqijDaJFWFyJFPpRLd",
		@"JjlvLJLFJwEbKzxpHuhcdosfsPfdLUbIazItSPkhkGvATgsTVLACocXObhepqKshCcScYViESAYIBZxemgKtnVfZUGAzGQCNjbujmMdDBaKSiucnxozqXvbZif",
		@"zEWvMCjNQEgKHbuTBAEvQZscFLjRfYnspQONPQIKTpRSPIJjBAcROrASKFivtINougmUYhWXvgWysuiIMqTQWCyBTxQuMWiZsHPRMGsLGhKayvdHkORBjLvdY",
		@"pgdVaenbqyHTMfFoIubNNvCUQrKGVEyFUWdrqKJLXWiyFOiddDdgnRecWnLisjnHRZwjzdZMirpWRxOxGoOGnNodtdqztxUOqcmCND",
		@"wTsFZTxnKcbcRpqCDSFsjPPheUIamakhPqTodLFtpBelVneKZdhzAJwCSrnkndYZXFACeBgKSxNzizYgrItBFHCEwtozRjjFuDfyiThkAenplVTEuNHksKPSqJnqLONojUxObEKsixnEQeNijl",
		@"kJsYovFrmryUuoYxUuICByaZSyshoTpEBLeyZUdzwysocFqfIFMuLeqcgrVUbAnlivaCWZIZHjqjvzPxqPGODXIdZeAhEACfgZVsosvMRJuaajWmIgAsoTafuvXkFVSgqPeZiwbmNsGYjGAdip",
		@"afAXkabrVEpbWNNQoAnjflzDQujteWNkWXHiKaIbPKhFDfjoCNrwYmDLaldCUbiLVpHzPTxccYutKcNkTlOMSEXVVabsrdAEDEYQflZsRpxSDJfxn",
		@"FKsYUepIHfpppUOlSoXDpywojtQFxwNLgFXoJEFZslndiydluMgUDFZOXRwFUqnldPBxYqrbPyoHndkfiSNuEnLgfOSIbQEEeEAGkRmejghLGDdcrWQspFKIbTbVEIsAQa",
	];
	return mwXaCsixfLCj;
}

- (nonnull NSData *)foNuyLrbgFToFUdZV :(nonnull NSString *)jGFVozLHoyS :(nonnull NSArray *)ctklKeEtkmPf :(nonnull UIImage *)lMnxwURkTvdi {
	NSData *YHWeENHNiXnxrQ = [@"DluyJkdbITdlzNRCYjMMzzfOIfBmMvTSFGcbHFfYhXZvVhLEBnNvAHVdBOtuLAAOGQhOLtWSEaFulDUgGcfmLsrLHqKZGkpimJhboVBbCGHXgXamhQAWChVGZTVTIwRHliJqoBRIGd" dataUsingEncoding:NSUTF8StringEncoding];
	return YHWeENHNiXnxrQ;
}

- (nonnull UIImage *)wErYPufQTdINt :(nonnull NSDictionary *)TJdPZZjdTPomUHg {
	NSData *ohiRKdJcWcipobljt = [@"HFCWlLLZuzlazDVchXxuQdbmjHrPLQLSgXOLaqkKnPIIrILxfNNViSpfTUbntxujKQIytswqqSRSElxqVqxnQNIOZtXxsxmEcdvYcsUoGNHdyUEQAfDkeWyjeWobfeCrYIclMTsFi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xfkODgaqYQSyAEfhj = [UIImage imageWithData:ohiRKdJcWcipobljt];
	xfkODgaqYQSyAEfhj = [UIImage imageNamed:@"vdOyVSAZgrufwPPxosVqalNfWyqkvuLGnOmNSjObPMwnqULbXZUuPxXWZmXcOuYCvShQFCuZekCfTBRxfzQPvagKUJAcwwAcbpGtvEWpRGZfsGgofEQmTNrGOwHQRzMagpDNneyOtkhGc"];
	return xfkODgaqYQSyAEfhj;
}

+ (nonnull NSArray *)hpEFeoquXBVE :(nonnull NSString *)HOmNBBfNCVIf :(nonnull NSString *)hqrynsgDCo {
	NSArray *WaDgFBEDWpzktsQGRJY = @[
		@"zZewCbEkrRbmjPhQvQXteDdRHLXRvffuUBwdWnpmqNWTMItpYKBoIvLomYPYrNtJwkZSILDJwneCnhgYwvqxVVTxrEYuoxHgzBhcQjHKYGYJPSPgusttNWyxPzjlplo",
		@"rzbMQnnKYNIOJfjDUJtNBcZKTpicNcjhKXFhWhyKbkVstfLmszeoEQoSbgHfwjXKUsFxaavwUFHTphgfWpgqWOcqecGyMjVgijIlsJtQKbBSPkbHv",
		@"QycoDclqSBLnUWXzjrSsaxTyWptDsnsoVlruavGkbLdRuJCvnpzVCtiDMBRBBZnAAXfIkgjcbToBUKYmsqBtZQnBqzKRZTnLbJkLoLLSmzZDx",
		@"HgEpQWPgtruvTSRXUKIfCapJPhSqPPZiscezFauhgahWSUTJGPlYzooaBZvNSFvyzeZdwBBRkyDMTbppvtEyZqHQMnbeXpphxXBuVTntWrmfjWPahMhpbZkuooKMxmJXB",
		@"EEmWkQxgZgvOxhMkqIsbTgKHrYDhCPIuYjttcjdceyeklZeePlzInDdKLAwKYKXLESrEcsWNGoGjJKawbJFRgngJYPfHlkcGAFNPWrVPYTzyheEVpELGJiIcNuDTDongidcvfYALXCPBaAWu",
		@"XUTeGEHudcxHyEOzzkcblFhEPTqRrzpTFPkVSpSwpTVjjeNowlpqrxHMfGgvBoJpXxOcGgDRBVKdigCiMfFwvwTcFBGfldGDawkrSRDAhioXbsEqSITIiPBlnRVpPOBtDPpkcLIrYzUUxxl",
		@"ySFznIXpPmlABmaVjXAQaRDCjIdEKFUlRwBFnoWKlWARmolyGCHkCYpBbJjTbmTNecyoAvKxNheDGkQcLiPTmgjeAVmHiHGbrCAPQJNkoJdhKKDvSUFteyTrSMbbpKCjxoqouJxwfuryPlxpL",
		@"nSBVqqDwXFxNGeSFWKudBImNaxDVIReiEZmNVCBVcmtxVxrsyxWoCoAVvvTpwWkosUmiZIxgPrrlaBJAIpMrTxFbrPMjYRlNGeXpioBVbUqcCAAeWObEwBBmEBznuSvRntjmzkliYZGsup",
		@"tlMWtotBRYDqGJltYdKAwSZMzYUDvqGlSuqbeJGydiOlHzJMtOCfpustpxJmfHjulnwvkFKbXwhkcJGuhSHcXTyspEOjXYaqEZYjUwazbhgGixwkfAnPoduIryWYPOfAQdVvsGbRSkaOwOmMcIu",
		@"AChWcfyHyKcRYIQHcyUlglbLIjokIAyUQPLHbYInQjVGmrVuoOOcztIjyuRVpcdIPOVcSYzMbZnyCWCKlqGwPwZnVZhxmfEHnXRFKZaiSOFFOlsTEesSVlfQNYXwssbzJtcWyKGkJCdVFwA",
		@"sJRtutTzyZXDySPZOwfPXdIWXenXvVEiwavLLKXsEEGxLcdXiloAzHMVPouZnwdSVFaWHjhVjQNosYxfBMevVkCFZKbSZUjEbzigCYBciXtybsUaoJJCFtmGpY",
		@"OFnKjTcCYXtHOGxoMteGPjhJMpFQxspPICStNjHlQokjGMlHWEjasnYgkuFKNFJnTqdwBQaHpiCeGQDMVHTkXCdzUrIIrGwjwBQUvnrvMLnHDWFRKssUiqNYlf",
		@"RIogEWYjGTjvLTNgnhObHEkgGQIjLVSPCnsFFVeURcGmPdyvYGLzzzvgGomZLBDImHCiidRJjYGwbVoVetJwGKdWTuCVyTRmLYWnxPDjjwq",
		@"wgLYLWIZfYCejGsvZkPhVFnPGnQtrUHFRKzWBCLljQnzVtYBtmdMdzaShGOJPgniqwWuZRjwyrdlkpQOmwrnxqXuJdsdrdyYDBGLkUnXuMikvikRQMCUCffrdLEUYAokoxDgUv",
		@"fdSBiszwmatDvZoXCSUuZhMEQKxoHeGToVBiRTaSBpOwljUPmaxjxCbBGryTrywNSlxTHKTHQADllQKNlJObPpyqxcSQlUqrhnavpZXmiXyVVJoJehImIJKGuf",
		@"cmsNfjFMOSZHniHbztoAzijuUWPzZcfLIpEixLCEJgGqMzGJUySNirqpjeodMMKUFqCLwPpxJTpaRNqpwoEirQGLlvFXvKonlukTkSGQxeLUYRlOnvvlYUInqSmBqUxMrD",
		@"bebOhHfUXhwKAmuyDJpGsfeTodWMorzrKCLcTJEnfRREeSmMIHQHmbgFdKzUDtcRnpNDodCoYYOGiYPZBosZhfBykzwtaqoiVzInjYxPfJpWFYqLy",
		@"RflgpiOTzENfxGTLdIuDMvgyxUXQXQLOroCHlWZEPQFcvVqPfjWclavyXkYKOVDBGEAeiYIqlAjTAsVJhhLmDJaMddHvefmaQEYyMEMdD",
	];
	return WaDgFBEDWpzktsQGRJY;
}

+ (nonnull NSArray *)hbrjKCYAxTjRgygBO :(nonnull NSArray *)bNwKQPKEXrj :(nonnull UIImage *)UaQHBoWaRwVmeOf :(nonnull NSString *)WwhFEwjNUwv {
	NSArray *JJuEsVnuQkfDkuIOgAE = @[
		@"hSxfmgIYLdwwvbSMhVZjejjyiHffcXLllDJbdlzPzwJzHBeIyVWanqfTRywLATikDfquMkJTkikltfaBuFORmqVkmOLykKJstVzBLCvaYGARM",
		@"HLHHWveTcjaUAfEWploZNnmSZlcHDJqXNVuqnhVgbeReKfJzNNKdgKxasBqefiyWSdTDXJxAhFagfsBItnMBumCNJtPxhByQqDytMJogHIyewVQu",
		@"mKTNSJtbvmARtjgYLVmkvxUlhCnFPJUNNrCSRBJCHoxsbRvIfVAmmyuZtuggmFwANKWcHvbFfTupSOIuQTkmkDNQJGMlWbBOEbfUxToBSnFNnnSaHhqJufxUvxhMDDeRZDXs",
		@"yLSHhjhHGYQRwSPdQMuluWtRgoCRONSBCVHnZujKXUVfivwKNBeLANPOLxuOGCJoJuHARDRlFKGqNFYNNDLDsOBtxTVJrZoZggOuIwJaqBqbKmslwaiePWwCWsCbMuKTloulstXtTDmxeWr",
		@"MXqRtXFwyLYJVTorBYLxEiVVEuzvEyGtNhvQlSbUfsRJpfYIBCYFOJzLOOQqZJDmjkxVbJcdnJqCEFtKuCKaRnKxNMaJEwuyCwwzhakyDAYFaaEevdhJMLuxXnnASjBmlCskGBudfdJqdKhebMjNl",
		@"NHWdIIjOazjdHhoQJNXRQwTrMQtmnEnBTvOCqVkSUGqoxQoTeyvaWpkgtfoSYEQpdVblMXzIZIFzEZpqnaIKpWXYzGAHjAiVepzaMOOJLquhEYwjBhZH",
		@"thyUSsbATVfwDNRkAGDEZURvZWLyHZqgDWWzTMDoLhChPRYsfvgaVGWcgsvWiwYhgxTueiszofhmLYZRYHzQRbqAHZoOLrcjjeduumrNcsPGZLxTKrCXiSBagd",
		@"TEBXnuvPGPOwQfLUXQgmhAMIDyPYMcVUOffhyoYYhuYrRPCWspmPXbTBwPOeNhYeofKclTGzxFfrutznebmsLtzrvOVQThYjFjQMBKmUWeVbPYcnKd",
		@"niOXliVdHCnCQJRcGkPwhZuKmutgnkoYcpxFABPHZekXEHqIzMdFMFAPfXGxzZoIsDaqltQAxrFfMYfadLrwaWOazWWLALmhxVhBOzOjHr",
		@"hGBztBUUknHGigoFiNOGhfmZOPFgxkqmluBTIHrWgGUSWZEfpwnjMFmOnWiPEZPThmMzyStQcAKbZMHzssbOFHuUuhmnLXHWVtWxKwzXAwprqyijDwmPTkGQRTpYE",
		@"aPWxzCLjZVVPjKFIPRMQxQoQjggLHrCBtBWwEnUprkdClEZpxrjwpIuJDSKYoTVGrUSvgZwZKfpagRjyMbjYlQsiBshqTYXiNPCiLMDGJJhDzacFYXZLLnivONOlRYGAhcAdavhcsfqLwrBgajId",
		@"LLqludpcgbWhEmabOMqauzTaVZuUwUzBcNeqyiyqGgnngkhEQXQTcVfbSXzOzyeIWLtAfSBRlqBBskeekaAgOnXBMcdPbGTKceiKSAoQetBsLCbeOaKRdqG",
	];
	return JJuEsVnuQkfDkuIOgAE;
}

- (nonnull NSArray *)RlSJzaxXmlXBnhVKZ :(nonnull NSData *)ZwpAzTOBqXqJ :(nonnull NSData *)ykGkAOqFDaI {
	NSArray *tTtgqBKPxycrodzsnr = @[
		@"CmRSizMpnjxVwTNrdxLTgYcijkVvfQKmsXKSoAUymylcuRnwhCsIOJFGMysmxigTQYCinKoPZwLSxbeSqbtKUdeFEmQkCfNMEBsxmLVJVOKCZmyIAhfLyGLsWHIvnOjb",
		@"YrRHmBBVOJQZTjfrmheIokLRDJDfqeBfvfKfFqHgsfdvuqUwWzcNXJsDXjvFIPjqTPWsGURxNrMmMmiMuUgKYDeURNXsgdAanlRZNYuFwDnHxRBJYMmZmroDMwMuORMaNkbYVRwRwgHNiWHgaLZ",
		@"xOZvAtoXohUqcIumwGdmzHaZgWtaAUbRmBmuxWexdIcDWXpepoUNWOpgutcxtCIrBbHhTvpFWmmGcxmsQsxBDUCVhmkmuSSuleWeiSHHoEDyODHeaANRVJuFWed",
		@"QgAspkpLKBMaIukfcdqZuNXviDuUNuipgpVvlTbsURolJbNWJjNKHIcTyINdyJfyayKfzYDgiVjdkIdFSxqmZiWpNBXNFvaNDFyMjvlIKkWSHCtFGGrlHsyeQjjggoDSaiUFYcYqdqIRhh",
		@"bPFaisZrRRwKIuqCjaHfCAhSOBOAOBsVVNApvhjHzEUOMYJRgDMmjtlyRWQlwceWILeplfrFfTFyIMMlUGUNamTTQjsEbLpZeNHA",
		@"RQzTvRxFNZtTtkypreVgFWpEKhhOpBWbzUawzqjsDdXfPCzbXDrqPxnUhgsXlIoTjCwTxvwvWFknVFjwyPRwofmjHmAaMBUXQExenPajoxsegoS",
		@"bFktJZrOvoPmFZAncLPdiDtxxJsoYMYUdCBybjdEMZxpClMFqdChKOXVqoEofjdsjLqiKVhRRSbQWuWBlsebIzoGsOfatKcYKLsZmYkQoKsXKfeGhAeBGqKtWHNNkBtjNNSgrwoKvgGDDhtXfyKt",
		@"yzlllqtTKUynBJykuycmgHPxvkTURCXJmMlYqheRhmCFNXzBdsnGbPNWxEakaLdPIpfdsQLnniKhbFFAOQIiuvKRawtPldgmXnqDOPmdOC",
		@"weUWGmyzyYlpCiOIsqOjKpxFDUrIiNuOAqCxdJNXNXGboUucfjHOWbpDvxjIHZgJDZOCWIEnTDlHnYtighuDhWYrtjdkcQrsKfruxBrHydqY",
		@"AHLpqXqAiWzhKiZdXLyJbptosthhyFSzzAcftyisBHjiQoBnDqTRszzRcplzZDqkJRtrwULUlMZbTUHFkiuIYYZMEcwqcFPWyDUnUQlVzAbnioCTcvESXkKsqibWET",
		@"eFwBRlWhOskCWKlWpOJlErxvzymepGrCfWnghnvMLAaOIQhXCsmmlWwZdyTWbRoCZrgxPRsuyFtidxGEKbaWKBQraxcEKZTaEIXOTHLQGIeZqmAQfWiBalqTzBLyfMKhUSPlUCPGMrerZdiPeJ",
	];
	return tTtgqBKPxycrodzsnr;
}

- (nonnull NSData *)hpwKPDlJhTBGw :(nonnull NSDictionary *)POcpqEJGAS {
	NSData *oqXCQhjsgESAjJ = [@"FGLJDJCUBkSkSRhJmeYUwkonooHfCyxpitqwzvnAFRkgJWQtVeYDxmvztAtxIjBeuxmvVltvqebNrcaiSjwBgZDrKHkkjJnHgrmCvYkvBSQlqDKBeAdTzojyhQigepaGzKmkupVwbZWRP" dataUsingEncoding:NSUTF8StringEncoding];
	return oqXCQhjsgESAjJ;
}

+ (nonnull NSArray *)WBgshCVMopV :(nonnull NSDictionary *)zIHGowktboon :(nonnull NSData *)DZmwtmlUcNba {
	NSArray *INluWregYVjXDmsKP = @[
		@"NxUHOLhdHcXhbJATuBFMXYHAhGWwxBOlKvhCuGuIejsctwmpeeLkqaaiANXjgvulZnEXFlsNqIzMnXWLFvQGPVxhqmbUywguulIRBFdhqfKSBNlzDJkXxa",
		@"ddWmpuqExeyDOWTvkPkTLpuDIgwmrCWYkoUVXrWTrIFglKuiqRUttmJIRfbIWhVtxHtVbousvUpmLZygqoHAkwLjxAqzyGqjMRseMFLRtqmHuDCLEiKjoDJh",
		@"kVbJdwQgwvrnahaRyZgSYuqLGMwdFhTGuwqdMSBAuwhzldmGpLPwHInLRHRfOZaYGZDxZXIINnRqtxlvGsjWELxOdvalgHaWSNZOCMrNLaQBXHitPrPgffemThsjXJzHGuwSVJcSrqwCRQuu",
		@"XYuykJfnVLShdLDTjPteNXRBgeJSiFYjHyWYEEUudhlPABHasLWHulByIgtWBejyiemGHlCjHuDDfutPTjgdigmYOMYCNAYwgnDpArZXbydgsXDqjVmfADDMaCrtuxiWrDiSKLvrVPgQfSl",
		@"WdiMFAhaxrDhiTqkFjeIsUHuuxPqnupKSRBMmxydlNNUZxISONqMEBFHDNLKufOUWfCQKVKxSQioCpIhAjHgLGEPrIyAcPnsOGWdkBBGu",
		@"TRcZkmuZOvHltZGkMoyLdvxORCtwZNLgoASSurUAWHoOXBipNcGaieLOnPnklAPltalgtNNbTIowKuMmrWVjabKHhNdmeYBJLnKu",
		@"BTzOJhAsnnVJFrAOAtuOJvOJAzTmnGzqLNswWVUMVIyKzqpOJmOdwjPnIffbMzSPuNXABXhMRZBptsSJVWAkkTBiHmmzdPcBtJxeuawZdigJLgcZadmvYmmAWFRXmnMfNUwdcVdkAdKiv",
		@"hzCoFuGVZijKUAEgbpFBwTkXcMngkXJSifpYhYKbWBqNeAzkTPPsWeHcqghUuoWIaePeJOVWSgBRNiYQFrJbUEvgHkbFdyIxKCtGhFPFEPjmBWmcbmocwMBSrvjuIuMYFpjAfaJCfv",
		@"GLAnonjaKnQCpLKCzPKFPyAlOMZxeUxMkYOFfrbDwdeEmlNQiYeLZwtLDOIhoxUBfacHYfyhlEcAawwYRIHHOrFiCvvQGdjUeUSlcjcHufgzUFFdS",
		@"vnAThTAHdhOATqtoZXagFaAdNrDImTHGCkyRuxiWshqDFeyMsEAKDnvLBSxXWYrFBmwOTsbSyTlZjwdVRujwHGhaVjKYkfvPmyNFo",
		@"rlVNflRolotLXmoUMqJBpMFqUtDZojLHVAJMJWtAKzhFiEjDyXPSgigwcFeVXCTdHLWEoUyZzalcZcQzglELMhEzbTnZGLHaOXONBdecRoOCZtZaViL",
		@"WVdxAQzjtCjwGjzkJzaYLEdRyxXWNvsSrQvKEkbjYmkuoAjEQdyWLXnspUdcawKHvRiqtRJinQQPbZPyNYzPLmSTizpIGMgBlKNkcHwCYHjiBjbHNwQLgVFPEAAoEmiBvMTO",
		@"QDFrjvfkandfSbHNKCfeslzNwQBJeCjYCPDnftkmAuDCpPdYNUageNJwRbGcpmMLcpLavfpvmwrcQfpjbVzvkJNFHRJhznILuIPKxCLPLTsxVTu",
		@"KlYiwBRJsAcCmeuxkAhfHCarexMiGhxSUSsCQGgvZGoJagtfcQXsDdHNoyMklXdFPPDUWOypwUDyclYmRJBkBWeTBYPrTShqrjFCatvGBuchUsiZclohn",
		@"crzMZxTwkXueGdDTBVIPRprtwmlKKspoEhOCqYDUYIlDKyQVMZXAvmRNLDPWmzgaXnGTdrvJdCqrwZolaEvGIVIwrCzRogZkRYOADYaBMCZBHbpciIoqnBvaJIKZ",
	];
	return INluWregYVjXDmsKP;
}

- (nonnull UIImage *)NQAQakNRvQiLXbLebk :(nonnull UIImage *)PLRjgZgYInk :(nonnull NSString *)GgxOVewDPBdPVxEmNC :(nonnull NSArray *)nvIWBXhfeHykNqDxg {
	NSData *wYRJKExcehgMeQZ = [@"kHveUvcVmuSEpHVyUGsZysiDBtWABJGvANDfgPVNHmhaynHyyzoPemVrxNlDzBHcyHpHvdEsnfrPouESfbEhrapZeFCfbKwlCSetQo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rrsYtvunAwZ = [UIImage imageWithData:wYRJKExcehgMeQZ];
	rrsYtvunAwZ = [UIImage imageNamed:@"tCmWDdhaviQyeOjOmHbXgyUbnGqkHwUgiHMXyLQeCJZXutlNpkzbtgqkQNSeAWeTUbmuffHWYexNANFcvpGgusUUhoTZDfcqPmLxetYJCrnFIkPlBfteCReuVGHsOZvCwfiHKkAAbhdTg"];
	return rrsYtvunAwZ;
}

- (nonnull NSArray *)VfHzCsWZfVKUSvaBxX :(nonnull NSArray *)LBKinWpzTqhSSyhWW :(nonnull UIImage *)zEWfKmavxDokxKfnEV {
	NSArray *rRNTfzTtfJFEEIiLRlC = @[
		@"HkXXSgdZbucfSLEziDHQCDMUspLNJGegtWXoxOabOsmhjdtCeVUqdkvTYcIMjvKieaurezXflwjrHlIhBeWERWwoHeAzRmeyCZlyrfuQfRyoudNbzBTLQIDQ",
		@"iBKhxpPaMoiTrFtJtIelPwkYJEdwlplJynWcZgpKIbsmITpjVhnucdVPlqKVCQmsNYFDgPvlDXkJWPBzhGebFYNCEQrIiGphmGAMtQXJBKQYVupCDUHQkLDoym",
		@"fcAoCDDLczuAxhzdOnbtOrLvFvZvCmkAghiynDZkJKmuVexESMhRfxpIEUmichTvBDgarbZnKykFAreUSryDnbeieytGBzZufBxtZCXguvuUjXcChZuHUzTjpdGqwdCrDebPBtjBqNazXob",
		@"uiuClXLYwCpeGhRsSoPlfJCKCwvyVrLyEdBKMhgpPTkdDnMbaeMIYYDeloobYDCXSPBCwXTnGjxOwQtyumjoGbAwjUjsZEWABZFCLppKsihpXZgWNgnPnUGTshBdcBIQkiHDgBnSzFuStfyFGg",
		@"KJcnHnPBZUskTXrlPMTAlCFIHcIZvlccjhpzVZyYCDDNpfZiAyPdrdyDDFWkZIqCikbGWmUIcELHFXmjycxYmVjSkHecagoJdmiTaQBVTAdupiwwjYCgCwIVZZaPAPxOPisyiDxOCnHClQoRItAr",
		@"vdTJTJBjOixbeRqEEhTSvaCoQGLQfXaZqsMnFZhOSTfDzBLDMpbomdstHOWmMmXLxJxHTReCKnedFGGLutCeIDedqLqZmiSWlHrUrrDiCZfvwWgkCMRZrBYnbEKLZiKKzjq",
		@"wXpKMrGORgIjLdpragFMtwiNvZYfbNyVMtUuqgJGYnIyyeJlrsIeAEUMFUpjmcWMkIqzlVvNhAkEjLHeslyRgTIavxMoqajAjRRzLMruXZFshdnnbHLAfjBIBqYe",
		@"fCGiBUNadsaehcmsBOuostvpcRawPSPkcEpFAyBiOyrUFnazAGWGUlFIfPeBtrdlgPqFqgysKbbSCzjjCQlaJsRmfUoijYHImmyHJuMwIbjurFbrUtezJRXECwexvT",
		@"jtEXIQehZMJUTFqLNBKfUNoWuZwTLsOZOCVnMPBCddnixtKAzyyxUACMexJTRmadRttoOeAstgEFgEcHsimAJLpyhOFXLApOWuTvQQDDpZFehVDemmBjSRZGPeHdCMUxMyyprr",
		@"DAGKtujsxyDyscXQPbyPVJlSxgRLQAFhFJeKGUycpRQLTGFEdCNrlQATjUrfsxiVyVvHiDfwyMeoXGGpXCsLrqoqAbFLrGKBrayFpNPxf",
		@"HRFAnYjHBKcXZINGryjBnrLshAurNeZjZcxRccDZGbOfMiOXssfWkdfWUKlifpqnwFetpFzeKzIOmoyQcaixMbNeFNbcjERJsZJvJKSpArwUVqbbMfiSRuFdPParHevqiaFjaMdg",
		@"fPRkFbLgBHPXjeoIMUycQsILVFuqwcQJfijxCnOgTFfxqgIffuXqoOycziTXMBSHsfKsWzyVKmRjnFmQisuSYApzgnKPmvGdylFgUCuqLPbXOLtTUOITzMSUtQANNnwOXmYJQHc",
		@"ZcNSkgtUOPetkEEedmlGSFxJcgOjhPbktrEeZFutAiDbMQEqxLQEKdoDnoGqtxntSwmBnCdfuixuQFllMdDnIbPkaOfDBNnvjjfxIUiDbt",
		@"uiGmRlLWJFWJqJKkJhtumbZqQPHJwMQvJRKeDnSSpTamUfdoQrdoESaGzPDcaNkLswFZtwgQhzzUZQslmBibRIWXDeMWSIvGHgCcEHyWJNjBMftR",
	];
	return rRNTfzTtfJFEEIiLRlC;
}

+ (nonnull NSArray *)SPjyZuJYrgZIFeb :(nonnull NSDictionary *)bvgMrlyeGAWrJisWA {
	NSArray *MemzwMnniqUTQjbp = @[
		@"zUKhEvqUwsRxgBvJvBTOLsEZbxuFJWCvnuUNjnpnEycIhAFWKYvKDcpGGkYRuuAtIwCDWLAISSGhqUZjeLzZAtkdsqfpzpUuTzbutkFljSPKxIwYaePSSouUUgzFybMfcVvRfBzrq",
		@"aWjQaIWHShuZrFalgwBisQuLLmwqAiRRkYBQprezLBIOtMekHXKlfhwpIdqCHnzfmhqeHWULmIvkVfNrJqzbIfGWWvqqFqGaqdQogwHBuUgYbcSeQszsvaLDxavmqVlAkWgctfPwMQtk",
		@"sbNRbTbHjYdwiAGOFhPyyCJpBCNUsuTBqlePrOkuDIUhQaUNeDQRRPSQHBhInGxuOcCaAOHfUYwCqwXOwhtlpwPqFCtUzrTJzyqMpkmLtmWM",
		@"lyNZYmZunNeuGwmqWoiEKYkDYHWyjHhNgLnczBfPKdfgsEgqqmemeuAugOWWIrDXdiZLxMYVEmJWIIQYsdwPTIonhizvvYCffrxVeRjHVWcQTFSOTcuLJBMCTFvzJKbQDrMGKVXHvBEFLdXRK",
		@"pcuSBDBgsgVXlmrWveANBTMJCxrLNiEDfQCTlGCWhuHCNfFQvKRTAmMbfjmfjKgfZpdEKbvWzwhqHMTwxjMlKJMxkTLNcjfppBASxLKcRGYynhjzfACEtYXXnQLGqkGXay",
		@"YiOvNpuwPftRyUUwtDnTYBDtvMQdqHuzGXjqNfMMuxzxDqWMZJUPYMZQKevcDmeCmbKgYkuSHIoCZDSWOmqlLaPHDeetjlRbXPGyBcNtBiYbKMyBiLCsJlvBVBEgMByLHkJvbr",
		@"bLoEVkkrKLwKFTUruAFlFPecHJDjvyzaJrKcTdUBkhljgAKjPXMgQjEcNGFvkXxeCIXeWrqeLUAspZqNRxcSIYwoeIUUOzHVHJkT",
		@"YwQtYYWTluhpyfatXbOxMyfJabavMKJqnbqppmbwlXDBmCMCqxJokyLmgzxHwAZJdoTUlaGEoLmRsNXSOpdquqQUCBlFsXpWWXSseaYxaPmYzCvyI",
		@"WbOnJwneuuqWBWNnHUoJRhdjfARRBEaxwYcblzxbYKUFopSeuwgwFLnWYFkpwKOnmqnXqKQeWmbaNhpiugfDMXauOkfzpsdsWYGWaHaAqkEQyuWgGYRbD",
		@"hkQvIUykEPCIgqMLCzxFvFCUQMBGAFZDHKgOooNiwcKxcUvizRpXrOStLmHOMjSsNzuHNYIXnhxANPvcgOsQkpNaMferKCRyqHngOUENyYOzUNjPXBkFervnGOprACvXSGjYrILpbGVMVaoCegkj",
		@"KApgPwDHevscYAhLikKRvIdRdwkCHwvfrWqJPXRYrvnnwTAEdaMPdvtUsDlTFlkpyKlgRxDiQwQcOEaZZmRhzZJfPVWIixSKtoGyOlZhBiXrnYvwZ",
		@"reFvpYWqRMBURYSWaFfPXfKaPoSWrQfCycrUUTiXfrjxURwTwysIMvNNiKtnevPlmKjWoMiinGXRaCWLYhVFfnrFeBtjvwaXCwwGhGlCaeZetwHmCtZGvSFKmNqwdJJCMnPAvzsXH",
		@"SlAESVQfsKEbITnjGlKbojRNjAnRChaRYfnYxBPreEXcLHcZIfdftaIDZkTShyrSCrvuCFvIcNUuyhxfHPRNnVZfdtHwlAqbGphPrHLTYedlwRCBwFriTTjxZOInQeMfLHbVPWoJ",
		@"UAmlEYlldYPkIjJABTHMBBkRrkSzOVQBlVgBxNtmQfiyVChElXRJFszgHNETwgAdeCfDxFlZwaKKLjdcJpLGacUVtNcBXoAFRsAtQTYyjIWBBBuGJNbJAPgKfqLpLJ",
		@"NSXNxkUspnFLiFCkSUfjrAPgbDSRzRDMPHDaaRYvgrVuQqTXpEYTnechMohatvEIbXsuRJGvcWWfYulRijjTQihcmUpBKeQeZUSo",
		@"oFvAfoyhuseTihvSvoiqJADKAhvGUhtelArwFzcOFxHEFBZtTvWwbUiXtDvWuKYHyioYfbynzWcufgPWpfBADszGmiUCipzWeaVPHSQNYHoQyHTbejWZyYTNkUSvFATnqXeiuOZE",
		@"whrsHGnlCoPdrITLBYVvLqlDSCUemBUfPCEnhalEzCfqLIZyywKNyfndADirAUkFvWRFQBgbHZHaJhCbNNMMvRfZFPdWMDjjeukfDyVQxNFOvfnpEeogsjsrg",
		@"TwCwwbzimxXBHatrUUBlifrsTNVUuNwUHBhurJywBjTvbGArgiqKVNysRsnUTYXNWokWfuSGXlISLCvhCWdSpLzYjbQoshaupvYteUGbX",
	];
	return MemzwMnniqUTQjbp;
}

- (nonnull NSArray *)uxYCMiiKwRpddFQNl :(nonnull UIImage *)CRoahFpBGb :(nonnull UIImage *)TKtMjUisbPdWoHW :(nonnull NSDictionary *)tpnNCVuhZe {
	NSArray *kctAiGpPmQqPZvNm = @[
		@"ZsQDOJhBiYhtmnelrCADzmfvVyFIXtYBZHkmXsyxbWEjaYvqsEQwsJNksXVUjuusxLmNPzByXFCncmGNKnhqmmLNanrgBzNTRXtZpCSZkhxwuTUZZoVIztlVbaMpYRqrXnPaRyoFBEXjD",
		@"bIzGKSFkZcKAEfEvaYydhxqqvZTdSJgbLmKZdFveJVTsXUJxHtQwnBCAWigcbxOeBXqaGnxwctIeuVcmOjHLpowSblIymRTkiADisobqbLNE",
		@"YUvOzhtThLGHvFuPgNdozQqgNYaJQVBMmfBUecQbiwieJedRaPRNZHDlaTMIvBNOUKcqtuMEasKRYJEyqRZVXIEAbwLbtZbiguMsnwAdphblNbZFMvqParhocBzlofqhYLBjyaMWVM",
		@"DgcmYBrOELcOilJcmotpFhdzvNBCxLeRhFcTfxlaNogwgrVDFpAZetjODKLCGOHLRGtrbsWweGvsScLyIAgcvolEnOTHIgquGNYinOVnVnjPKCj",
		@"NwmwdjLFVdKuFBYunoPmuItiirXJaMSTxHpIJEjKfAnLWwJqBISBFVFHWYCIiXpJCmVHhDbYKoqmjHYDmqnLyOyzeLxFDAvxDGhPR",
		@"TDNZOlvgIkIFfjUdElZkEitQPTEdWIHVbITiQsiDaJKbUVyaFVCEhvtRBhzORrSMCEvMAPvNBMrxpZFsIzaMVxeYUDPvEcgjGaDPpIssYHmqiXkhOwNwcWjqYsSs",
		@"aaPYezSTCMtzVcmHYzLNAAKAUEhlBZuuuutdQXnRayBqVNDhNeqTtylxfIfnwAYFuBEWHCoeBHHIBSarFwDoAZkyAhDxGuAipQrRKelxpGUelumh",
		@"vkBMrFuUaqllUtTqgwDVUDWMUbJbhthijHXKETxYXSAVSLhBnqchuBVcrmwTqjtKLePuihJWikFFznqYthjLHEvZTEkYNCPkACSQKwVOtewSDAVtBrtONZPYiMdIHmSZuGzEjSdWwqBNTnyN",
		@"HYTOHbmGvdWGGfBbQbHeDcuOHMisoXWpFcLoeXqxPTWrguoCDROLzdOufMWtQxXzkGlpoVjhnEIhljhKjacmdMmfyWIHkWqQmMZemSEwLipMQDsMrAnWXqVKfzmKxQIckmWJg",
		@"ETvUUSQtAJEJPAdNtfDkMYrczeGfYdkIjSRsvNtieyAHodIdlTvSkmFVRWMrkFAjCqABDHCebXIMhkUjoRQVhhTajpbSiDbkrUeHOkonEIsFcnehLhf",
		@"fGmVAXQpzfgukQAAcJqFnKybghkreElDIkfqeaZqUZBfgrnUVakUKDivGUnuPMsYbebwoFmOUsdrEQgIlEYmSDCnuqbhQplWkwinsJmgrWcbNV",
		@"dDMNREwnjyGObzLfKWKHpsRsKElZHVukohLZppVrYoKKbbGzMTkQcWyDjIRKuuvqtjIVhHlLGevnSNFyuHzUahyhYamHZqCqIFNNefdcWqjeYSjtCjszAXBJSbZTmsCEpONckNWuDg",
		@"XVWVgvylbCqaBntYoZqamKnuGObTIdiExGqfsXzxKnagjfOFDkRUlCgxkIClmLFRonYbwUexUyxFpxhaomwsGjeOONUlhfsQlHsmfbyFXOEESIn",
		@"mrCtomJTABZsaPyQRKnBXIxJnboCYTdtItCThnakiNxRtfprlspioJJPGrbJSzVYfqLFuAWPIZrjZgzasZOZbGPaPPBEVXKfRitFtwYKSvrfNNhInTJGaYROoSuqDcJE",
		@"ogQofFGWVAepmxVCBadCLDvafXtvdkgrbwGhceRaLYmsRKWlkYOsELPGRQpmkdsGqWuatAslPhkXtvVdOIVkZIQdyTiLYrHSCiSuNxhacvccvYNRfBRKozMArvHylzUwhlfMUFQBWFlPp",
		@"aDSfMuGNADLpvbmurEzAeZQVzhGHuwvtaohWEkOGuqkjVYTmvAsUlvPYAXWrMLVyrQpwPiedPKxxDRuRTMjJuZBzzlFGhIUvzUiwxRZ",
		@"cdVvRHnNAkQHZECSayBgNkjTkGTvUrVnzkwMelOPenyqviSZqWFVDgzCbcnNrwCmIomYJXrzMbcnKLodMTtvrUIoXWYgvJLpJRgygIZHeEJJXPhRcUlnQGOKMdChBTjLVUm",
	];
	return kctAiGpPmQqPZvNm;
}

- (nonnull NSString *)aXgocFKhMl :(nonnull NSString *)bUjnMaqkUzvLf :(nonnull UIImage *)RKPEWMsMjwF {
	NSString *LLtbzHmECSBtzYZyqTW = @"anRmrWrscWOobZqeDLuPwlEZWEVVEMPUdfggUthoUHamtbnNTDZuqaOjhjXKWiQZkZnWAwivqcHiOySnzPLiSqDdVQrTlNDkKqAUheBisPzKjgPuvcvOaAMPkHT";
	return LLtbzHmECSBtzYZyqTW;
}

+ (nonnull UIImage *)gePAIrhuXuSxmuysvDf :(nonnull NSArray *)UertOGMOWWImxsfiiw {
	NSData *hDJCdWMxwlrn = [@"idZvnycXfHadiEcRSbNGslZciYHkrTQLrWgOjQNmVreIecQqbaFbZSqWbkoPuwehhewIMaQSGcECZTPofQsyHYSSHWqnXEocCztYNMx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CDeUkVRrbwNDbEEq = [UIImage imageWithData:hDJCdWMxwlrn];
	CDeUkVRrbwNDbEEq = [UIImage imageNamed:@"AnowOAjwSaxNQzFirzhLfLDdlyajNtyqqWwbOAvyuMznexHuTOPsBybMUoBeffqigUrkmMdGWyrurGzqMxWYsxsbIOkNQIFYDaHMZlotsZkUfaLaYqVPU"];
	return CDeUkVRrbwNDbEEq;
}

- (nonnull NSString *)aZeIpTgxblMxQmhHvnM :(nonnull UIImage *)bruYcDqAbzPRdkeqisS :(nonnull NSDictionary *)mchzmkhWRK {
	NSString *KWGFeXLTWmJLB = @"narzasDYgDXhqIVKadqQVGBKSqwNCzkiLneQVFGQQJgJlTBCmCdVvpjLgdliILJAiiDYbRUJuxdURJTrjNjAbUGTfqSIbslHGQswMcpYRLSwizrqgWKmVVajKadOL";
	return KWGFeXLTWmJLB;
}

- (nonnull NSDictionary *)fLUTDzcKOBZjFVu :(nonnull UIImage *)ONpUOvENrJQVGwn :(nonnull NSString *)RZQPCVwEdOm {
	NSDictionary *jNPFPKuadlMbagu = @{
		@"asqNVZNwBfYWtojd": @"HgMbfEuheelAwfcypiKaWiWjEVVGfAKTdMnfYcbJcYEoWlgZFnTFSmfvswvsnNFZSdJIJGIjrswkmSWOluHpeqnSsxGvPIKCwjdoxFcBAtnImAYLptgs",
		@"VbBJmktdSoH": @"ptYWKwMHmIClvXNcZlEKbfDZvCdDJakRuhCQggXsjYLgWkzjXLyklkXDqvNSOdmfLeZJozysipfMpifgUMPzKcXjlAmVfYeEEOreuNNWgwPsCdxWrXhAOLEEZsJPCAAiCMJmwsHNkc",
		@"mDWlphIIAcwArEBvc": @"UArQooHXFGMqEsZHdQaktRGfLVVULJlRgbYQzwQbxuEfgbTbZEyPnRGOWvvTXuRVbegDDNpwovBpxNNdgMWflqVQehxUkBytrBzOYjMcTnRJCYnfHkIFzAvlIw",
		@"XawlauBiJcTq": @"xXHMFhXGhnvStAkcdBkaKxVQeJKOcDZVpNMmqrpbJHhdjhbKKLirauvzfwjVkGbTVaiGasvRhZxIbnZFBklfGNQExKGwCVuBSXvXTntuDlvwQIWhVlrxmYqBnndGykBU",
		@"LvukgJqZwCYiscHEzT": @"lEOqqkwPwbGFirQslfpNBhOwgokPsLcbKaLickBBhxtLkyGbIcVAEeZCYNFCmFqRjSSzCZfiSCbdgCmKQDBoAfDJqbnNAfNLRROBsZUXrpv",
		@"FObHStLQEWJR": @"DzKxqdeDkMjNZgkiLGemeiJgQuuZjndIdAyNBSBFYfepdAsFZVtxgfHnONTBokUwNbuZEGEYTdVhIVboOaJzGvAbLIrjURqsQGFsYxNxhSSSCDPpKeIUalHzKpDVjlwsTXqXlyfJzZvHR",
		@"UTImnWnAjfkz": @"XUjOzLFEfKikfgOgmjpFskMCZvDABJuPDorknlXMivXfgzgqbrUpNkwVWzNrZLpaRqUNhxzFDmBVeeYKiwjPmlecgskusIauzdhQjNFdcCCsYfeGlTfJVKWzHRZSgUeXAAagOONgCfVHYIVkfMEh",
		@"FCDqBWwbtmwhsErPpc": @"QOMovhUJkQSxzcSFiELqcDtHJCEITLsJcuMSGJPIaINOryWoGIPCBmsxvFAPhasHCbhvZjrYfBjzVZTvKhdjkzbtHUFhDuqcZxiQIHHBudKoifmSRXQaBfbvkraruelADKQkHHlx",
		@"XkkBIFdpqA": @"IjnyYWDToTXNLzFDMnewZVVrmRSAwscLZiboWjzAAQjDAKyQJPCYacLJgHLMrQYEWKcMwyvgibNUfzmPpgyqAvnrmYhwOAvQvNPbCtgcBCSm",
		@"qkmKdaRAruHVhxHfw": @"gbWzFxSuHkICDetbtTZzuTgSOsWdYoWWPWuIplcCXWgvoMgltWdiyZbREkHoAJtWRYXthnXwGLqTgJmcByPOblxypxUzXcCwsirXeGrrUOSIk",
		@"hNEmYgIFinpWXwab": @"jIXgTOvFrIIjipQhrOJTeBiqiqdzDFBtIcsAaCyEaYwYvrhqiWwezNuXtxIqmGaeKgfqctYcVUyXUwiNaTrFBEcFuOVxEEVeaITgwXvnSTktrVOEfCwtbrpeTBZlQgYHhvUChbFFIrO",
		@"nnUAsXtYhoZ": @"TdjjksPzFxMHTUGxiBHdqkxWOimDRFKYDsElHKoHjmNJlBbiOBsuPQhsXkaYjKMDsIxAmopjtafwoVzqUkPjKdCrSxKcxOxfjQOh",
		@"adDZLjsStlnWUYwk": @"fEIUbeSYZPjLkeATIkvSCfhwmbVmVEfGEwRmFkyNRRXmhnxvIPKzwABZEznSQvsHyyDVEhgFZzikPkWlqwTIeiZvhQzRJAUXubrxKJKheDmBRcGFoVcoQLvYpVGGinnmIjNcdeD",
	};
	return jNPFPKuadlMbagu;
}

+ (nonnull UIImage *)iqUMSjWBtR :(nonnull NSArray *)BrzRRWZiscMkxM {
	NSData *qsqKkvxRiUGMdlSkvpO = [@"gvHutAWYQbNSgXirmCICjwiEKkOVuXsrZCNknLzNcjirXkDJEvlLtgWXGvaniQLNnAYPjgmBnIXjkjyMFGRPTAMMJlJGVPntoKJejvl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UFqMJSssrvAnjhjuF = [UIImage imageWithData:qsqKkvxRiUGMdlSkvpO];
	UFqMJSssrvAnjhjuF = [UIImage imageNamed:@"nHLJIFUPPMhuBIBgNzDgtWGvqFCEkKwVNtxsDSpGqvzIkzCgUHLsggPMBWZoJAUMZcNVYXEsqGqNVgJZFTLAWCRwkEuGCStbEWQhjReVgLJAuegIlyXfLLxWTKRksBFxPgSUbD"];
	return UFqMJSssrvAnjhjuF;
}

- (nonnull UIImage *)gudmOUgMAUIioiuiq :(nonnull UIImage *)XwIlBqxgnyTokVsadBD :(nonnull NSData *)HkBCmyhyFUAZ {
	NSData *PgXTnxovLWtNiSZT = [@"oMYKARMMDGRATuulwEuetmFnSCDMAJgWzmZbVGQfSfTvoSAJguvBVagImyQkYsGVqnMcReVmPNCMpsJopGwRaUXuIQdKXFmJOwQqkVtmhYZGTATuSxTIrLqzzQGyyxkYfFYCqoaVfXhsuNwLUptQM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WmzrhyaqAmpvLU = [UIImage imageWithData:PgXTnxovLWtNiSZT];
	WmzrhyaqAmpvLU = [UIImage imageNamed:@"PtBMlBfpCpqHRGCLFsWyuTUiedZFIsKYRWyKCkShAOQtpGwegFXQHPuUrpPIYPjhPawhmmmHEfUVjZttriRkTOpvzzfpQlmQCOoRNOQangmqNEIWav"];
	return WmzrhyaqAmpvLU;
}

+ (nonnull NSData *)VUVpFQfRBit :(nonnull NSData *)IIPgHszUDrk :(nonnull NSDictionary *)dyaIggmdsrjd {
	NSData *aOVZPDPOUppMckHiw = [@"kHlOyVjFfWOkHDWWBgTsEwdMpTekAWcUoSpSunPzWJmESUvfGKZPaPRXZAHufrLnTHszbbqwqVnBqqFNxRqGFAXVjfRjEYjPfyPKssqmmKxSirPwitrVsSCIcjTnKqGssmBniHUdFu" dataUsingEncoding:NSUTF8StringEncoding];
	return aOVZPDPOUppMckHiw;
}

- (nonnull NSArray *)gSVSYXiNFB :(nonnull NSDictionary *)MNafPvOnyE {
	NSArray *fNZLLXrIUYMxFeodB = @[
		@"EwtlRmASssHHEcpyShCZpTiNdsLIrewQVwezKCpkWFoQltkcPnNmhnRWPbPHSEFlAxBwuXkOgXzxhMhTjEZZMNyKgCOkNFPdEATRTZhWYyzlxausdRWulXMbYj",
		@"FzSwgwNYvkgHoaFohOlqcvVLjlLUCVydGynGcpJrjByHTPDOQtxfqeoabdsVRjoduFhFbYYmkyXsGFlBCOYCvNSSyqcoamBXqXlrBYlFTcDHgSLJZLpxHWIFmzpfwnyjhmkfXzLWTQwHHiDLukGB",
		@"xTCuopEEsDPGzIjHfXljIHSnctDsxVGVEmIJZVICBINKOJfncwaidqpzYpjvwEJmNMnzrJjYLoLhPzJDYxESXjhUOKXVMOrRfVaPlspSgVuzNWzRHjzNnTzEGV",
		@"LFgimDprSgiKQXxfHernzBvZnUvLczwhAsEbyCtaoevZchmDIpmMuiGPVrmEjJOrHJywyHHsjvsIxyJHIzzqIaHhyEZFMIUDlVroCUDUZXzIyyVHAyPpyuLkidhcsJPnUlH",
		@"GafyeUbSshenpyflSfXdgfzUQNrjFbwXFGIZjiukbBoBLYEDSAOJJWanXmPnpxcfEmJVipWrGjpzTdECUWbguGdHzHzovsETCznXErillj",
		@"pbvVYQEcHmkJXGojjjdphNBUvTvTwinaqGUkiQkBYYRdoHRuFOwBelhaLlYvsEQnyGNaHnyaOZHHHfJVyKlThFeQARehHCdJAUXTVmxyIQpkyd",
		@"jduxkSigbPRTXtqHnLhawbOCJoTJIpuRTGZmMjQdiUNqOvjmfILOFjqePRFSeofUwnZvhHRsTRNGftKuOrhflqICiOfXCqBfLpWEToKABNxWOymVzcTrUpoEABSkYdbxZ",
		@"wduJKXFxazdWSMQGCkTwVocEQjXcwOqaqQoNAKGxIsZvylZJPEbxZRjEBvrTtRCiQETdWcSfMeeRtXzJzHcnogXlOmoBIZLqJXlLxzcFHBtAjBXHsBdqLEDhdIDSHcXlgoPEjjEjBcGDEvyXH",
		@"WZTKQodzncrOaoxBvatDijGIEVXmdRDZbcjujLXjfvBybaTfeACFOpSVHqasUOouhAbWirDGQvertOALKJZhUMnfwerfNVBUvqRbpkvCEYJRYEiXaMoaCACalYqrRdojBZoJRMDFV",
		@"PdAwEOqPrUNFhqrEBcGLnTvLhghlloaROqjIvTPfsfnqAUPmsrYbyiELwSAFirBMtiuUTOJvkmTyLmdaAUimtfNXUJhdcfsUFohPTIkelQmLDbBsjonlgXKxHmwDbCotCuq",
	];
	return fNZLLXrIUYMxFeodB;
}

+ (nonnull NSArray *)nXmYcipqHpNDulD :(nonnull NSData *)sDWFvdDvKgEfmMhrj :(nonnull NSDictionary *)nuSXKvJDbROCrKFj :(nonnull NSArray *)ZxXJucqfHCfjVwEn {
	NSArray *gmpiGkYMiYPiqPSA = @[
		@"NjoLLiTYbstOmGOMtcenuWUmCrngYMbeSfIydpuagJTnJSyKLUlqhqsRCKoJeYYpQgOZVHqLxNswKLgmGSLmbExPABjbwsnEtYOHUn",
		@"XKlUOkkgtZVInVjFoqVynCByPAroQOVRxpBGPHBdBgMfCTZuqEAklwIsgMHtqcTDwpiQYWSwkkzsbMZbmDrnXgLqwylqyhFaQYknVirqnINlJUPYuVSOUnJopnkUrdOvJ",
		@"PPMxGivZWsnyHeiCHgUrxvzDukfxRbWYPmxMrOOfZBfsuiMlKyYPlAtbKhjSauNQXHFhRYJvNGkyxtnNIsgwUOkfawiyRibMOsMxSXdcNaQThSJHkydmBUNpkUKuJedx",
		@"sJlEeUPTFLiaEeEoSLuPUjRsdtOOnWFbEOYmgASBxiHLRkJwZCJBpPuMNgTxgUhHMhRAJLXhWdKGOiIviGPKpBEPwMFyDTBFThayEmFhhINTTLAagFfKXVctQeXmqcBDUbzulDBYxUQ",
		@"LssQeLtnkCCQBISCeMTMSaHMTkLLCORbfHPGaghZOjCKrfQOhqEujbnroMGsOPhCIkdGduflhJLxNtBUtZldIyGRypkJKIMSmpWYetYZMMg",
		@"mFkiEcDuFzMOZkgdjTWjYlrVfjsIDTexBNWuGyLmkrgipzNKqLzyASOrdvhZlmHBYJmeRQVWorewgDgdCsXHEMYyCOtvUyxFLKzdsIYCSdoBYrFCBwadRGUmwCTsTXjNYyzGUDbpjKTRkheyqI",
		@"eMmDvOKOoWDPsaSkEVQnKhWGfzfuArZYKKsUOaSWIGROKssgzVKmSkbRHjoyuYWThAfNTlzjKxKSUsOyKWvZKiEaodgdUczmqIAxKWVuZpxWyqVCOzVZqLtCqiKTs",
		@"EySyRvwwFrdqtycHXCmSIaqrboDTqHSlGxBzwXAdXMcZlXEKhnyJQNCinWqgSKhAAdJchCSIjfnjnPvBMFAyESKNWqSdONNyhvxjLhxEVZhbkEXFWYxQfJIdjTFILzJy",
		@"RViJBNxPjPqzXIPDDcuZgxADiCaFvoAHLAEHLxnCCBEbczjfyStGognoJFnXFHTeKJIAAhMbxrQaTrloPkKPmoMgjzHqNLzukHGdPqjtXRjuIzQVbNDZerHZZtgtmfEwaryT",
		@"bUXMhdGBWLEVDEasVjqKBbLmTzsRCCSNKjPmplXnWKQSLLnIYDzpmXSNXTcnPOUtRInxnCKoBZiNzKhTNkoTOcXATfTZlEKBjVJIbvdNqfIAFMPGuNDjCwsOXcs",
		@"HFIScqVFUoUHSqcsDfZRcDSEDQvNsfFrkwDaVkOLXfDbgpdtvoNlfyfiVLTEwtRsoXWlYToyTJbHDqKmiFfCKJFMQHRCGGNttVwRgosCUmoBErQqbHxGPLvYo",
		@"GgvtszfshphlwzbTGcwToXcJRgUOWvyhWQvWdytbfkeEwHklfBYrhrDbxwiEUwFYBmKwLVGbPwHGTYyxtIJhNyJlsDoRxpPVTxBdWRwtsmbSkELiEjeMrszQeIwGsB",
		@"DOtBqtSqKSXdXyQrIPuONxoPavRkHhMCnWODxkTRFhNuEgxiIrUMqCEyBRZIqPvMBcrqFxxNwlqDksQkQnGGWPIiYrcgeXmaJnpDOvluPqFxF",
		@"NLrvFWcOKvpfJpWXTlEkACWQqZpJJceIuxBVSuYJOZjtBjIVdMZOsgagbmKaTcySniugGNxpBduTIoYrJmpunMfOleQokMYmcJwLPofxz",
		@"LnGRjoWtIEgsNuEpCfwwpMYgIbjEKcqfaXkSdPhYMJzWxaCWjaKRxMfOPFZYLMqlmwObJSLNgOdsERquSpPbSCGjKjlrMuelobPCOcAQZGvlumeio",
		@"mLyWCQbyNaNRvCNdpPRQSifGPZQOEpRzyseJweZEPbCuCrVjYreslczsNnlilMnSXgezUjbIMSXcfRkaXaQFUoBMxZLCMkZJKlbefZenxbCvDjeuVQSqvnexmTmc",
		@"DJtbOUZfcYxBxDYlKXYTXHLirngLUZBduXRXVLKXeTSTqbuVYyzSTBUzTeoAXHDTILMcwEDBVWxvVLOwpBWnHpGdtMCKRVvcNRhRVvKvypRxQewsPck",
		@"WxMGAswoxzsbazOkcfTjKVFHqbTjduKMudafvQDnqPBfImXayuhSwmNaLpmjGBOmWfFrUzCRFGkmLfGMCOvNEnYjmsESOlSEHZBFfAWIAvZzESfNwpcVUhXcEJ",
		@"wAxvdzKNBOCueBSUHyMObZujeTOtlOhtMByBsxyDQVZSISdWKzOvAdvgsnzUNMidsbvZfPnQvBpMgVxCdfuPZKXJFQsjONKJCLlAPAHmdUU",
	];
	return gmpiGkYMiYPiqPSA;
}

+ (nonnull NSDictionary *)KHmKKIYRpy :(nonnull NSDictionary *)BJefjazsuz :(nonnull NSString *)ZaVOdFHsNFqjUD :(nonnull NSData *)meOgSoEtMauElEAfhyM {
	NSDictionary *ijdPoKzzoHQdkCroGeL = @{
		@"CJPHsOQydDEyOcDY": @"MIIsgcfCTkeuQVdohYPnEtqufPlPddysBuNjXnrXmiXCAabMBPiGZElWRkqAclEeJMbYecQOvRthEnAukSGaXTAfwYnVorBAzVeECVaAO",
		@"jtcusnWqeCNmdgeapZ": @"hbTIDaAqQsNXGeBDOYGuaSxulqNAMtZeNKdukwoYetQpDSAGJatsJzhOOnZhxIwaNAYMrfyoRKxWkwsogFdjwUGwzHDVrqvNwnDEnCNYWtCmHhMX",
		@"VJuHCwSIuDQIqQpS": @"aUtBTFTKWtJAjRdbMfYFsDJCUUCiSfFLmUcHXpZHqACRunHJXAdGuJZknWprUCWJpPVOlIwbfbkfzZsSzcUsdnPcdYzZJMZNGwXKBLTJCukAvrvvXeKOQEpqCWQWKpENIXnynsHoMJ",
		@"EvzSQvXwwLJZJoy": @"ceokmiCkMYMCaiZescCAkLVNGWsxLeHnESJtRRGRGVcoRqgYdRqfYZAbKCPDMSBraOOxrdtOMQOZPoxRyXKXVzdfENIlkZVCWxSPmegBjRxZZExCgigVkDc",
		@"ITVDkMNsuMEHhLwm": @"sbAixfcPsHiILubLdkxfDPgSkkMuUqLXjzLrJrPwGtxPLidpZwokAlshsnMXYukiKzxiAZOrRxLSoOSmLBFAhNGRniIlomsYnQLfQZPqSiWnVYBEH",
		@"ldPvcMkEmt": @"ObJHmxzikvXqLGOOTdaNrslvTiPmZMHrHBgtfcsvfHPjLUMBXhqRwKJzEjQCRhdSRxMiecGwtgSkublJtaskHyiSSUyMwvAcPxpUInVNQkiWCOBgVhnDCbaDkeYvKjdkBKnEQkeiROawJjVJnS",
		@"hxFKIOLecabWZfuc": @"wQpvktjiLCXvglrgTuqHVITotBdgWiwVTeYwKMlmhryZMlrpIYHuPPQcoPyFUNaVWBBtOOrZFMyQyPxTlZRwQqPNoWMiqhTChwpbmrSBxSqDNyuDMtWtCgfpBaJDKbj",
		@"TCAtWvrSML": @"RNsfazfSyzOQmjyJWvIutsKFKBbSKzEnUBXqfNJEmUkqasxieOKMjDQnAiZGtMjewajQdDDvaEMGzDNwuiNicGNgeKEoEPnWWmANlGKVaapQCUZKpRWh",
		@"CnxJWLiKAOwFpy": @"LaDTFnBFmdpSDlCokMklzrZxVsWcFRvvmTqbpEyrBwxZPKQPqgjPZmMWorXkFbkumlCpDjwnigWOLBiKzIyHublCKJqAVZkiMVohbXpjznVkqnnSxDTfrzXiYVqCiB",
		@"USVCvaNquVGEz": @"GOMWKIwcKJVuTBfaTkcHzrPcQdXVCAAqzHkRUZisIAsRvkQgMjlDdVicAtdpLbQBdLdjmPgnWRsxpNEqYEDtNFGUhHmHdbmeVkZXsiMrmUSydtxohERRClLyUkJNRiwBfevYEsi",
		@"OjbwGusALms": @"wZdUjEfnIqlqQbmAGKFuEjunekgdyAtVZKqfzejuumoqHiLvKcOuWqpqArCFKAuUAmogAsaFtUjPYpUgjKIfwgUyMvNwYCWlzgJRJpL",
		@"xWpLhYDQvljt": @"XbzQZwyaxUqjibqtSZDXBKbFfdyIFOYqOPRHpkCDIjFCqJqHLAWNZkFcstQcGzqdJUMNjZybzLhSuATkmaGYwutWJcOsdHnCrkRCZdPZmrIuIQZjIMpNxYBbYVM",
		@"eCjXIayxftzQYL": @"VaTmTtWFlKcuTKHDVRaPQxJzZeqcemaFobZbmcvYvzClMuDxCpmihMVJlhZFvIXUYaxxXOLuohvVvUybjauGhMeZKPWLjAyPTrddthJejzmHqnewYgZYHaWPJ",
		@"qQjNWykRoJETdKyZnI": @"cjRzdaEWjMWPykmPjaDREJKTwImQHfgzkfyGhtPKSSUuoQafYnmKIDUKFiUQDZeelfHFmDDYZdSMNuxBJsFpJEtyFMgPuCGhXhnPPo",
		@"ICBygFGvEZgrRj": @"SvpSqCiJVnlaWSTUiOvwTNVmVaYVujXuGluoYvoXzWxoOBcDltkDmrwWbVIZJcjoDhlnGqCMjsoJDpseTjEyvWGDURUlNvGQTUYpsWDNZjlJCRourBpWvkQCilkeOpyEWzgWRXEQfbMDONwUwbBdy",
		@"LPZefcgBHUtwMsi": @"IZSebENxhApMMklPcypSUqOTNBoOZaeGhAxKDWoxMOpzoqbntXqjxZjQCeQqGCKJcHviIcTSiuHITuTkXboGHcmHkEwvzHEGcdLgftSQHmaml",
		@"nwaCTPQeZdROXuiR": @"ERUXSQVdTSJaqjNzWlitrIpaLZZLKITnNhcZKPMwaUJtjSqeEOZcDwQQVjgSjpVWjrgajTpCdTYLhhLkViRFmjOSWtVUFehOvOLbuPOPynpJCLnYEYEcVIMOqeuySr",
	};
	return ijdPoKzzoHQdkCroGeL;
}

- (nonnull NSData *)CHAcemwWta :(nonnull NSData *)UgEmMFHJJXhQiGQLL :(nonnull UIImage *)FCbumRfuegw {
	NSData *ZHsKQWEbalRf = [@"cLUmsZRlbvrjylBWalXZazUjnedBapXRNruJFRJtDSrOlmkKUxHqduWhTgcsARoUPkEhsUrRGRawWUqEMLmltrykmDqmKWbSBfUYvlJLXDKLyuKOQc" dataUsingEncoding:NSUTF8StringEncoding];
	return ZHsKQWEbalRf;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating");
}

@end
