//
//  DuWenNetManager.m
//  生活助手
//
//  Created by heimale on 16/9/8.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "DuWenNetManager.h"



@implementation DuWenNetManager

+(id)getNewDataWithType:(NSInteger)type OldTimestamp:(NSInteger)oldTimestamp completionHandle:(void(^)(id model, NSError *error))completionHandle{
    NSString *ID = nil;
    switch (type) {
            //时事
        case 0:
            ID = @"-1";
            break;
            //旅游
        case 1:
            ID = @"9";
            break;
            //搞笑
        case 2:
            ID = @"7";
            break;
            //互联网
        case 3:
            ID = @"8";
            break;
        case 4:
            //健康
            ID = @"46";
            break;
        default:
            break;
    }
    NSString *path = [NSString stringWithFormat:@"http://interfacev5.vivame.cn/x1-interface-v5/json/newdatalist.json?type=1&id=%@&ot=%ld&nt=0",ID,(long)oldTimestamp];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([DuWenModel objectWithKeyValues:responseObj],error);
    }];
}

@end
