//
//  VideoNetManager.m
//  生活助手
//
//  Created by heimale on 16/10/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "VideoNetManager.h"

#import "VideoModel.h"
@implementation VideoNetManager



+(id)GetVideoDataFromNetWithPage:(NSInteger)page type:(VideoInfoType)infoType CompletionHandle:(void(^)(id  responseObj,NSError *error))completionHandle;
{
    //NSString *path = [NSString stringWithFormat:@"http://baobab.wandoujia.com/api/v1/videos?start=%ld&num=10&categoryName=%%E6%%97%%85%%E8%%A1%%8C&strategy=date&vc=125&t=MjAxNTExMTQxMTAyNDk0MDYsNzI2Mg%%3D%%3D&u=bdf848ea0fa2c8fc2d60741d78c8ffc973c485cc&net=wifi&v=1.8.1&f=iphone",page];
    NSString *path = nil;
    //安装SCXcodeSwitchExpander插件，可以自动添加所有case
    switch (infoType) {
        case VideoInfoTypeChuangyi: {
            path = [NSString stringWithFormat:@"http://baobab.wandoujia.com/api/v1/videos?start=%ld&num=10&categoryName=创意&strategy=date&vc=125&t=MjAxNTExMTQxMTAyNDk0MDYsNzI2Mg%%3D%%3D&u=bdf848ea0fa2c8fc2d60741d78c8ffc973c485cc&net=wifi&v=1.8.1&f=iphone",page];
            break;
        }
        case VideoInfoTypeYundong: {
            path = [NSString stringWithFormat:@"http://baobab.wandoujia.com/api/v1/videos?start=%ld&num=10&categoryName=运动&strategy=date&vc=125&t=MjAxNTExMTQxMTAyNDk0MDYsNzI2Mg%%3D%%3D&u=bdf848ea0fa2c8fc2d60741d78c8ffc973c485cc&net=wifi&v=1.8.1&f=iphone",page];
            break;
        }
        case VideoInfoTypeLvxing: {
            path = [NSString stringWithFormat:@"http://baobab.wandoujia.com/api/v1/videos?start=%ld&num=10&categoryName=旅行&strategy=date&vc=125&t=MjAxNTExMTQxMTAyNDk0MDYsNzI2Mg%%3D%%3D&u=bdf848ea0fa2c8fc2d60741d78c8ffc973c485cc&net=wifi&v=1.8.1&f=iphone",page];
            break;
        }
        case VideoInfoTypeJuqing: {
            path = [NSString stringWithFormat:@"http://baobab.wandoujia.com/api/v1/videos?start=%ld&num=10&categoryName=剧情&strategy=date&vc=125&t=MjAxNTExMTQxMTAyNDk0MDYsNzI2Mg%%3D%%3D&u=bdf848ea0fa2c8fc2d60741d78c8ffc973c485cc&net=wifi&v=1.8.1&f=iphone",page];
            break;
        }
        case VideoInfoTypeDonghua: {
            path = [NSString stringWithFormat:@"http://baobab.wandoujia.com/api/v1/videos?start=%ld&num=10&categoryName=动画&strategy=date&vc=125&t=MjAxNTExMTQxMTAyNDk0MDYsNzI2Mg%%3D%%3D&u=bdf848ea0fa2c8fc2d60741d78c8ffc973c485cc&net=wifi&v=1.8.1&f=iphone",page];
            break;
        }
        case VideoInfoTypeGuangGao: {
            path = [NSString stringWithFormat:@"http://baobab.wandoujia.com/api/v1/videos?start=%ld&num=10&categoryName=广告&strategy=date&vc=125&t=MjAxNTExMTQxMTAyNDk0MDYsNzI2Mg%%3D%%3D&u=bdf848ea0fa2c8fc2d60741d78c8ffc973c485cc&net=wifi&v=1.8.1&f=iphone",page];
            break;
        }
        case VideoInfoTypeYingyue: {
            path = [NSString stringWithFormat:@"http://baobab.wandoujia.com/api/v1/videos?start=%ld&num=10&categoryName=音乐&strategy=date&vc=125&t=MjAxNTExMTQxMTAyNDk0MDYsNzI2Mg%%3D%%3D&u=bdf848ea0fa2c8fc2d60741d78c8ffc973c485cc&net=wifi&v=1.8.1&f=iphone",page];
            break;
        }
        case VideoInfoTypeKaiwei: {
            path = [NSString stringWithFormat:@"http://baobab.wandoujia.com/api/v1/videos?start=%ld&num=10&categoryName=开胃&strategy=date&vc=125&t=MjAxNTExMTQxMTAyNDk0MDYsNzI2Mg%%3D%%3D&u=bdf848ea0fa2c8fc2d60741d78c8ffc973c485cc&net=wifi&v=1.8.1&f=iphone",page];
            break;
        }
        case VideoInfoTypeYuGao: {
            path = [NSString stringWithFormat:@"http://baobab.wandoujia.com/api/v1/videos?start=%ld&num=10&categoryName=预告&strategy=date&vc=125&t=MjAxNTExMTQxMTAyNDk0MDYsNzI2Mg%%3D%%3D&u=bdf848ea0fa2c8fc2d60741d78c8ffc973c485cc&net=wifi&v=1.8.1&f=iphone",page];
            break;
        }
        case VideoInfoTypeZhonghe: {
            path = [NSString stringWithFormat:@"http://baobab.wandoujia.com/api/v1/videos?start=%ld&num=10&categoryName=综合&strategy=date&vc=125&t=MjAxNTExMTQxMTAyNDk0MDYsNzI2Mg%%3D%%3D&u=bdf848ea0fa2c8fc2d60741d78c8ffc973c485cc&net=wifi&v=1.8.1&f=iphone",page];
            break;
        }
        case VideoInfoTypeJilu: {
            path = [NSString stringWithFormat:@"http://baobab.wandoujia.com/api/v1/videos?start=%ld&num=10&categoryName=记录&strategy=date&vc=125&t=MjAxNTExMTQxMTAyNDk0MDYsNzI2Mg%%3D%%3D&u=bdf848ea0fa2c8fc2d60741d78c8ffc973c485cc&net=wifi&v=1.8.1&f=iphone",page];
            break;
        }
        case VideoInfoTypeShishang: {
            path = [NSString stringWithFormat:@"http://baobab.wandoujia.com/api/v1/videos?start=%ld&num=10&categoryName=时尚&strategy=date&vc=125&t=MjAxNTExMTQxMTAyNDk0MDYsNzI2Mg%%3D%%3D&u=bdf848ea0fa2c8fc2d60741d78c8ffc973c485cc&net=wifi&v=1.8.1&f=iphone",page];
            break;
        }
        default: {
            break;
        }
    }
    
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@" path : %@", path);
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([VideoModel objectWithKeyValues:responseObj],error);
    }];
}
@end
