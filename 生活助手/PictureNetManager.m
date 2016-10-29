//
//  PictureNetManager.m
//  生活助手
//
//  Created by heimale on 16/10/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "PictureNetManager.h"

@implementation PictureNetManager

+(id)getDataWithType:(PicInfoType)infoType Page:(NSInteger)page CompletionHandle:(void (^)(id responseObj,NSError *error))completionHandle
{
    NSString *path = nil;
    //安装SCXcodeSwitchExpander插件，可以自动添加所有case
    switch (infoType) {
        case PicInfoTypeFengGuang: {
            path = [NSString stringWithFormat:@"http://mapp.tiankong.com/search?key=%%E6%%97%%85%%E6%%B8%%B8&pageNum=%ld&pageSize=50",page];
            break;
        }
        case PicInfoTypeMeiShi: {
            path = [NSString stringWithFormat:@"http://mapp.tiankong.com/search?key=%%E7%%BE%%8E%%E9%%A3%%9F&pageNum=%ld&pageSize=50",page];
            break;
        }
        case PicInfoTypeShiShang: {
            path = [NSString stringWithFormat:@"http://mapp.tiankong.com/search?key=%%E6%%97%%B6%%E5%%B0%%9A&pageNum=%ld&pageSize=50",page];
            break;
        }
        case PicInfoTypeHuaChao: {
            path = [NSString stringWithFormat:@"http://mapp.tiankong.com/search?key=%%E8%%8A%%B1%%E8%%8D%%89&pageNum=%ld&pageSize=50",page];
            break;
        }
        case PicInfoTypeMeiNv: {
            path = [NSString stringWithFormat:@"http://mapp.tiankong.com/search?key=%%E7%%BE%%8E%%E5%%A5%%B3&pageNum=%ld&pageSize=50",page];
            break;
        }
        case PicInfoTypeYiShu: {
            path = [NSString stringWithFormat:@"http://mapp.tiankong.com/search?key=%%E8%%89%%BA%%E6%%9C%%AF%%E7%%94%%BB%%E5%%BB%%8A&pageNum=%ld&pageSize=50",page];
            break;
        }
        case PicInfoTypeQinXing: {
            path = [NSString stringWithFormat:@"http://mapp.tiankong.com/search?key=%%E5%%B0%%8F%%E6%%B8%%85%%E6%%96%%B0&pageNum=%ld&pageSize=50",page];
            break;
        }
        default: {
            break;
        }
    }
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([PictureBaseModel objectWithKeyValues:responseObj],error);
    }];
}

@end
