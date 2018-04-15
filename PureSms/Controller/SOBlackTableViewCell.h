//
//  SOBlackTableViewCell.h
//  PureSms
//
//  Created by YC X on 2018/4/15.
//  Copyright © 2018年 YC X. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SOBlackTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UISwitch *cellSwitch;
@property (weak, nonatomic) IBOutlet UIButton *cellDelete;
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;

@end
