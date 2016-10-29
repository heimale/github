//
//  VideoNetManager.h
//  生活助手
//
//  Created by heimale on 16/10/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "BaseNetManager.h"

typedef NS_ENUM(NSUInteger, VideoInfoType) {
    VideoInfoTypeChuangyi,
    VideoInfoTypeYundong,
    VideoInfoTypeLvxing,
    VideoInfoTypeJuqing,
    VideoInfoTypeDonghua,
    VideoInfoTypeGuangGao,
    VideoInfoTypeYingyue,
    VideoInfoTypeKaiwei,
    VideoInfoTypeYuGao,
    VideoInfoTypeZhonghe,
    VideoInfoTypeJilu,
    VideoInfoTypeShishang,
    
};

@interface VideoNetManager : BaseNetManager
+(id)GetVideoDataFromNetWithPage:(NSInteger)page type:(VideoInfoType)infoType CompletionHandle:(void(^)(id  responseObj,NSError *error))completionHandle;
@end
