//
//  SOKeywordModelExt.h
//  PureSms
//
//  Created by YC X on 2018/4/15.
//  Copyright © 2018年 YC X. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SOKeywordModelExt : NSObject

@property (nonatomic, copy) NSString *keywordStr;   //关键词
@property (nonatomic, assign) BOOL isOpen;          //YES:打开关键词。NO:关闭关键词
@property (nonatomic, assign) BOOL isBlack;         //YES:黑名单。NO:白名单

@end
