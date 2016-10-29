//
//  VideoViewModel.m
//  生活助手
//
//  Created by heimale on 16/10/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "VideoViewModel.h"

#import "VideoNetManager.h"
#import "VideoModel.h"


@implementation VideoViewModel


-(instancetype)initWithType:(VideoInfoType)type
{
    if (self = [super init]) {
        self.infoType = type;
    }
    return self;
    
}
//获取更多
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    self.page +=10;
    [self getDataFromNetCompleteHandle:completionHandle];
}
//刷新
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    self.page = 10;
    [self getDataFromNetCompleteHandle:completionHandle];
}
//获取数据
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    
    self.dataTask = [VideoNetManager GetVideoDataFromNetWithPage:_page type:_infoType CompletionHandle:^(VideoModel * responseObj, NSError *error) {
        if (self.page == 10) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr  addObjectsFromArray:responseObj.videoList];
        completionHandle(error);
    }];
}

-(NSInteger)rowNumber
{
    return self.dataArr.count;
}

-(VideolistModel*)videoListModelWithIndexPath:(NSIndexPath *)indexPath
{
    return self.dataArr[indexPath.row];
}

-(NSURL *)coverImageURLWithIndexPath:(NSIndexPath *)indexPath
{
    NSURL *url = [NSURL URLWithString:[self videoListModelWithIndexPath:indexPath].coverForFeed];
    return url;
}

-(NSString *)titleNameWithIndexPath:(NSIndexPath *)indexPath
{
    return [self videoListModelWithIndexPath:indexPath].title;
}

-(NSString *)durationWithIndexPath:(NSIndexPath *)indexPath
{
    NSInteger time =[self videoListModelWithIndexPath:indexPath].duration;
    return [NSString stringWithFormat:@"%ld”%ld”",time/60,time%60];
}

-(NSURL*)webUrlWithIndexPath:(NSIndexPath*)indexPath
{
    return [NSURL URLWithString:[self videoListModelWithIndexPath:indexPath].rawWebUrl];
}

-(NSURL*)playUrlWithIndexPath:(NSIndexPath*)indexPath;
{
    NSString *videoString = [self videoListModelWithIndexPath:indexPath].playUrl;
    NSLog(@"videoString:%@",videoString);
    return [NSURL URLWithString:videoString];
}


@end
