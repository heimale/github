//
//  PictureViewModel.h
//  生活助手
//
//  Created by heimale on 16/10/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "BaseViewModel.h"

#import "PictureNetManager.h"
@interface PictureViewModel : BaseViewModel
@property (nonatomic , assign) NSInteger indexPicNumber;


@property (nonatomic , assign) NSInteger page;

@property (nonatomic , assign) PicInfoType type;

-(instancetype)initWithType:(PicInfoType)type;

@property (nonatomic , assign) NSInteger rowNumber;

-(NSURL *)urlImageWithRow:(NSInteger)row;

-(NSInteger)widthWithRow:(NSInteger)row;

-(NSInteger)heightWithRow:(NSInteger)row;

//获取picDataModel对象
-(PicDataModel*)picDataModelWith:(NSInteger)row;

-(NSMutableArray *) urlImageArrayWith:(NSInteger)row;

@end
