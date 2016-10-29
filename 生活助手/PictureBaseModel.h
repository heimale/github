//
//  PictureBaseModel.h
//  生活助手
//
//  Created by heimale on 16/10/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "BaseModel.h"

@class PicDataModel;
@interface PictureBaseModel : BaseModel

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, strong) NSArray<PicDataModel *> *data;

@property (nonatomic, assign) BOOL success;

@property (nonatomic, copy) NSString *msg;

@end
@interface PicDataModel : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *bgcolor;

@property (nonatomic, assign) NSInteger height;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, assign) NSInteger width;

@end
