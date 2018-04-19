//
//  XScrollView.h
//  C
//
//  Created by YC X on 16/11/1.
//  Copyright © 2016年 YC X. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XScrollView : UIView

@property (nonatomic, strong) void (^blockScrollIndex)(NSInteger scrollIndex);

- (void)setingViewArray:(NSArray *)viewArray;

@end
