//
//  UITableView+Animations.h
//  DemoUITableViewAnimation
//
//  Created by Phan Anh Duy on 8/18/15.
//  Copyright (c) 2015 Phan Anh Duy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    AnimationNone = 0,
    AnimationBottomToTop,
    AnimationTopToBottom,
    AnimationRightToLeft,
    AnimationAwesome1,
    AnimationAwesome2,
} UITableViewAnimation;

@interface UITableView (Animations)

/*!
 *  @perform animations
 */
- (void)performAnimation:(UITableViewAnimation)animation finishBlock:(void (^)(bool finished))block;

@end
