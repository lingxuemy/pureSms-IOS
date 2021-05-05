//
//  SOBlackCollectionViewCell.h
//  PureSms
//
//  Created by YC X on 2021/4/28.
//  Copyright © 2021 YC X. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SOBlackCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UILabel *keyLab;

@end

NS_ASSUME_NONNULL_END
