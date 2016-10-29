//
//  VideoModel.m
//  生活助手
//
//  Created by heimale on 16/10/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel


+ (NSDictionary *)objectClassInArray{
    return @{@"videoList" : [VideolistModel class]};
}
@end
@implementation VideolistModel

+ (NSDictionary *)objectClassInArray{
    return @{@"playInfo" : [PlayinfoModel class]};
}

+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"desc":@"description"};
}

@end


@implementation ConsumptionModel

@end


@implementation ProviderModel

@end


@implementation PlayinfoModel

@end
