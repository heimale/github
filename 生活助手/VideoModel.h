//
//  VideoModel.h
//  生活助手
//
//  Created by heimale on 16/10/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "BaseModel.h"


@class VideolistModel,ConsumptionModel,ProviderModel,PlayinfoModel;
@interface VideoModel : BaseModel

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, copy) NSString *nextPageUrl;

@property (nonatomic, strong) NSArray<VideolistModel *> *videoList;

@end
@interface VideolistModel : NSObject

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger idx;

@property (nonatomic, strong) NSArray<PlayinfoModel *> *playInfo;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, copy) NSString *playUrl;

@property (nonatomic, strong) ProviderModel *provider;

@property (nonatomic, strong) ConsumptionModel *consumption;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) long long date;

@property (nonatomic, copy) NSString *coverForFeed;

@property (nonatomic, copy) NSString *coverForSharing;

@property (nonatomic, copy) NSString *coverBlurred;

@property (nonatomic, assign) NSInteger duration;

@property (nonatomic, copy) NSString *rawWebUrl;

@property (nonatomic, copy) NSString *webUrl;

@property (nonatomic, copy) NSString *coverForDetail;

@end

@interface ConsumptionModel : NSObject

@property (nonatomic, assign) NSInteger collectionCount;

@property (nonatomic, assign) NSInteger shareCount;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, assign) NSInteger playCount;

@end

@interface ProviderModel : NSObject

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *name;

@end

@interface PlayinfoModel : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, assign) NSInteger height;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *type;

@end
