//
//  DuWenNetManager.h
//  生活助手
//
//  Created by heimale on 16/9/8.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "BaseNetManager.h"
#import "DuWenModel.h"

typedef NS_ENUM(NSInteger,DuWenType){
    DuWenTypeShiShi,
    DuWenTypeLvYou,
    DuWenTypeGaoXiao,
    DuWenTypeHuLianWang,
    DuWenTypeJianKang,
};
@interface DuWenNetManager : BaseNetManager

+(id)getNewDataWithType:(NSInteger)type OldTimestamp:(NSInteger)oldTimestamp completionHandle:(void(^)(id model, NSError *error))completionHandle;

@end
