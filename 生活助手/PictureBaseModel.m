//
//  PictureBaseModel.m
//  生活助手
//
//  Created by heimale on 16/10/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "PictureBaseModel.h"

@implementation PictureBaseModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [PicDataModel class]};
}
@end
@implementation PicDataModel

+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}

@end
