//
//  BaseModel.m
//  生活助手
//
//  Created by heimale on 16/9/7.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
MJCodingImplementation
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID": @"id", @"desc": @"description",@"typeName":@"typename"};
}

@end
