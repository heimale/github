//
//  VideoViewModel.h
//  生活助手
//
//  Created by heimale on 16/10/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "BaseViewModel.h"

#import "VideoNetManager.h"
@interface VideoViewModel : BaseViewModel

@property (nonatomic,assign) VideoInfoType infoType;

@property (nonatomic , assign) NSInteger page;

@property (nonatomic , assign) NSInteger rowNumber;

-(instancetype)initWithType:(VideoInfoType)type;


-(NSURL *)coverImageURLWithIndexPath:(NSIndexPath *)indexPath;

-(NSString *)titleNameWithIndexPath:(NSIndexPath *)indexPath;

-(NSString *)durationWithIndexPath:(NSIndexPath *)indexPath;

-(NSURL*)webUrlWithIndexPath:(NSIndexPath*)indexPath;

-(NSURL*)playUrlWithIndexPath:(NSIndexPath*)indexPath;

@end
