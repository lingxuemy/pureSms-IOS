//
//  SOBlackTableViewCell.m
//  PureSms
//
//  Created by YC X on 2018/4/15.
//  Copyright © 2018年 YC X. All rights reserved.
//

#import "SOBlackTableViewCell.h"

@implementation SOBlackTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.cellDelete.layer.cornerRadius = 15;
    self.cellDelete.layer.borderWidth = 1;
    self.cellDelete.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
