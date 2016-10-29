//
//  PictureNetManager.h
//  生活助手
//
//  Created by heimale on 16/10/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "BaseNetManager.h"
#import "PictureBaseModel.h"


typedef NS_ENUM(NSUInteger, PicInfoType) {
    PicInfoTypeFengGuang,
    PicInfoTypeMeiShi,
    PicInfoTypeShiShang,
    PicInfoTypeHuaChao,
    PicInfoTypeMeiNv,
    PicInfoTypeYiShu,
    PicInfoTypeQinXing
};


@interface PictureNetManager : BaseNetManager

+(id)getDataWithType:(PicInfoType)infoType Page:(NSInteger)page CompletionHandle:(void (^)(id responseObj,NSError *error))completionHandle;

@end

