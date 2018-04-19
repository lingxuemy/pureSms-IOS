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
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = NO;
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
            tempView.frame = CGRectMake(i * self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height);
            tempView.layer.masksToBounds = YES;
            [_contentScrollView addSubview:tempView];
        }
        _pageControlView.numberOfPages = viewArray.count;
        _pageControlView.currentPage = 0;
        _contentScrollView.contentSize = CGSizeMake(self.bounds.size.width * tempCount,   self.bounds.size.height);
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

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating");
}

@end
