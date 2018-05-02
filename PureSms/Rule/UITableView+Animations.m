//
//  UITableView+Animations.m
//  DemoUITableViewAnimation
//
//  Created by Phan Anh Duy on 8/18/15.
//  Copyright (c) 2015 Phan Anh Duy. All rights reserved.
//

#import "UITableView+Animations.h"

@implementation UITableView (Animations)

/*!
 *  @perform animations
 */
- (void)performAnimation:(UITableViewAnimation)animation finishBlock:(void (^)(bool finished))block {
    // disable scroll when tableview appearing
    [self setUserInteractionEnabled:NO];
    
    __weak UITableView *weakSelf = self;
    
    switch (animation) {
        case AnimationBottomToTop:
        {
            [self performAnimationBottomToTop:^(bool finished) {
                // enable scroll
                if (finished == YES && weakSelf != nil) {
                    [weakSelf setUserInteractionEnabled:YES];
                }
            }];
        }
            break;
            
        case AnimationTopToBottom:
        {
            [self performAnimationTopToBottom:^(bool finished) {
                // enable scroll
                if (finished == YES && weakSelf != nil) {
                    [weakSelf setUserInteractionEnabled:YES];
                }
            }];
        }
            break;
            
        case AnimationRightToLeft:
        {
            [self performAnimationRightToLeft:^(bool finished) {
                // enable scroll
                if (finished == YES && weakSelf != nil) {
                    [weakSelf setUserInteractionEnabled:YES];
                }
            }];
        }
            break;
            
        case AnimationAwesome1:
        {
            [self performAnimationAwesome1:^(bool finished) {
                // enable scroll
                if (finished == YES && weakSelf != nil) {
                    [weakSelf setUserInteractionEnabled:YES];
                }
            }];
        }
            break;
        
        case AnimationAwesome2:
        {
            [self performAnimationAwesome2:^(bool finished) {
                // enable scroll
                if (finished == YES && weakSelf != nil) {
                    [weakSelf setUserInteractionEnabled:YES];
                }
            }];
        }
            break;
            
        default:
        {
            // enable scroll
            [self setUserInteractionEnabled:YES];
        }
            break;
    }
}

/*!
 *  @discussion perform animation bottom to top
 */
- (void)performAnimationBottomToTop:(void (^)(bool finished))block {
    NSArray *cells = self.visibleCells;
    CGFloat tableHeight = self.bounds.size.height;
    
    NSInteger iCount = cells.count;
    for (NSInteger i = 0; i < iCount; i++) {
        UITableViewCell *cell = (UITableViewCell *)[cells objectAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(0, tableHeight);
    }
    
    NSInteger index = 0;
    
    dispatch_group_t groupQueue = dispatch_group_create();
    
    for (UITableViewCell *cell in cells) {
        dispatch_group_enter(groupQueue);
        [UIView animateWithDuration:1.5 delay:0.05 * index usingSpringWithDamping:0.8 initialSpringVelocity:0.0 options:0 animations:^{
            cell.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:^(BOOL finished) {
            dispatch_group_leave(groupQueue);
        }];
        
        index += 1;
    }
    
    dispatch_group_notify(groupQueue, dispatch_get_main_queue(), ^{
        if (block) {
            block (YES);
        }
    });
}

/*!
 *  @discussion perform animation top to bottom
 */
- (void)performAnimationTopToBottom:(void (^)(bool finished))block {
    NSArray *cells = self.visibleCells;
    CGFloat tableHeight = self.bounds.size.height;
    
    NSInteger iCount = cells.count;
    for (NSInteger i = 0; i < iCount; i++) {
        UITableViewCell *cell = (UITableViewCell *)[cells objectAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(0, -(tableHeight + cell.bounds.size.height));
    }
    
    NSInteger index = 0;
    
    dispatch_group_t groupQueue = dispatch_group_create();
    
    for (UITableViewCell *cell in cells) {
        dispatch_group_enter(groupQueue);
        [UIView animateWithDuration:1.5 delay:0.05 * index usingSpringWithDamping:0.8 initialSpringVelocity:0.0 options:0 animations:^{
            cell.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:^(BOOL finished) {
            dispatch_group_leave(groupQueue);
        }];
        
        index += 1;
    }
    
    dispatch_group_notify(groupQueue, dispatch_get_main_queue(), ^{
        if (block) {
            block (YES);
        }
    });
}

/*!
 *  @discussion perform animation Right to Left
 */
- (void)performAnimationRightToLeft:(void (^)(bool finished))block {
    NSArray *cells = self.visibleCells;
    CGFloat tableWidth = self.bounds.size.width;
    
    NSInteger iCount = cells.count;
    for (NSInteger i = 0; i < iCount; i++) {
        UITableViewCell *cell = (UITableViewCell *)[cells objectAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(tableWidth, 0);
    }
    
    NSInteger index = 0;
    
    dispatch_group_t groupQueue = dispatch_group_create();
    
    for (UITableViewCell *cell in cells) {
        dispatch_group_enter(groupQueue);
        [UIView animateWithDuration:1.5 delay:0.05 * index usingSpringWithDamping:0.7 initialSpringVelocity:0.3 options:0 animations:^{
            cell.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:^(BOOL finished) {
            dispatch_group_leave(groupQueue);
        }];
        
        index += 1;
    }
    
    dispatch_group_notify(groupQueue, dispatch_get_main_queue(), ^{
        if (block) {
            block (YES);
        }
    });
}

/*!
 *  @discussion perform animation awesome1
 */
- (void)performAnimationAwesome1:(void (^)(bool finished))block {
    NSArray *cells = self.visibleCells;
//    CGFloat tableHeight = self.bounds.size.height;
    CGFloat tableWidth = self.bounds.size.width;
    
    NSInteger iCount = cells.count;
    for (NSInteger i = 0; i < iCount; i++) {
        UITableViewCell *cell = (UITableViewCell *)[cells objectAtIndex:i];
        if (i % 2 == 0) {
            // left to right
            cell.transform = CGAffineTransformMakeTranslation(tableWidth, 0);
        } else {
            // right to left
            cell.transform = CGAffineTransformMakeTranslation(-tableWidth, 0);
        }
    }
    
    NSInteger index = 0;
    
    dispatch_group_t groupQueue = dispatch_group_create();
    
    for (UITableViewCell *cell in cells) {
        dispatch_group_enter(groupQueue);
        [UIView animateWithDuration:1.5 delay:0.05 * index usingSpringWithDamping:0.7 initialSpringVelocity:0.3 options:0 animations:^{
            cell.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:^(BOOL finished) {
            dispatch_group_leave(groupQueue);
        }];
        
        index += 1;
    }
    
    dispatch_group_notify(groupQueue, dispatch_get_main_queue(), ^{
        if (block) {
            block (YES);
        }
    });
}

/*!
 *  @discussion perform animation awesome2
 */
- (void)performAnimationAwesome2:(void (^)(bool finished))block {
    NSArray *cells = self.visibleCells;
    CGFloat tableHeight = self.bounds.size.height;
    CGFloat tableWidth = self.bounds.size.width;
    
    NSInteger iCount = cells.count;
    for (NSInteger i = 0; i < iCount; i++) {
        UITableViewCell *cell = (UITableViewCell *)[cells objectAtIndex:i];
        if (i % 2 == 0) {
            // left to right
            cell.transform = CGAffineTransformMakeTranslation(tableWidth, tableHeight);
        } else {
            // right to left
            cell.transform = CGAffineTransformMakeTranslation(-tableWidth, tableHeight);
        }
    }
    
    NSInteger index = 0;
    
    dispatch_group_t groupQueue = dispatch_group_create();
    
    for (UITableViewCell *cell in cells) {
        dispatch_group_enter(groupQueue);
        [UIView animateWithDuration:1.5 delay:0.05 * index usingSpringWithDamping:0.7 initialSpringVelocity:0.3 options:0 animations:^{
            cell.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:^(BOOL finished) {
            dispatch_group_leave(groupQueue);
        }];
        
        index += 1;
    }
    
    dispatch_group_notify(groupQueue, dispatch_get_main_queue(), ^{
        if (block) {
            block (YES);
        }
    });
}

@end
