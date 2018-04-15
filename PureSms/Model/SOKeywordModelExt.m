//
//  SOKeywordModelExt.m
//  PureSms
//
//  Created by YC X on 2018/4/15.
//  Copyright © 2018年 YC X. All rights reserved.
//

#import "SOKeywordModelExt.h"

@implementation SOKeywordModelExt

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.keywordStr = [aDecoder decodeObjectForKey:@"keywordStr"];
        self.isOpen = [aDecoder decodeBoolForKey:@"isOpen"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.keywordStr forKey:@"keywordStr"];
    [aCoder encodeBool:self.isOpen forKey:@"isOpen"];
}


@end
