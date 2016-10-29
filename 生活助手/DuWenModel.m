//
//  DuWenModel.m
//  生活助手
//
//  Created by heimale on 16/9/8.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "DuWenModel.h"

@implementation DuWenModel
@end


@implementation DuWenDataModel
+(NSDictionary *)objectClassInArray{
    return @{@"feedlist":[DuWenDataFeedlistModel class]};
}
@end

@implementation DuWenDataBannerModel
+(NSDictionary *)objectClassInArray{
    return @{@"items":[DuWenDataBannerItemsModel class]};
}


@end

@implementation DuWenDataBannerItemsModel
@end

@implementation DuWenDataFeedlistModel
+(NSDictionary *)objectClassInArray{
    return @{@"items":[DuWenDataFeedlistItemsModel class]};
}
@end


@implementation DuWenDataFeedlistItemsModel
@end

