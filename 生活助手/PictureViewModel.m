//
//  PictureViewModel.m
//  生活助手
//
//  Created by heimale on 16/10/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "PictureViewModel.h"
#import "PictureNetManager.h"
@implementation PictureViewModel

-(NSInteger)rowNumber
{
    return self.dataArr.count;
}

-(instancetype)initWithType:(PicInfoType)type
{
    if (self = [super init]) {
        self.type = type;
        self.indexPicNumber = type;
    }
    return self;
    
}

//获取picDataModel对象
-(PicDataModel*)picDataModelWith:(NSInteger)row
{
    return self.dataArr[row];
}

-(NSURL *)urlImageWithRow:(NSInteger)row
{
    return [NSURL URLWithString:[self picDataModelWith:row].url];
}

-(NSInteger)widthWithRow:(NSInteger)row
{
    return [self picDataModelWith:row].width;
}

-(NSInteger)heightWithRow:(NSInteger)row
{
    return [self picDataModelWith:row].height;
}

-(NSArray *) urlImageArrayWith:(NSInteger)row
{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        if (i == 0) {
            [arr addObject:[self urlImageWithRow:row]];
        }else{
            [arr addObject:[self urlImageWithRow:arc4random_uniform(50)]];
        }
    }
    return [arr copy];
}

//获取更多
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    _page +=1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
//刷新
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _page = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
    
}
//获取数据 根据infoType
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [PictureNetManager getDataWithType:self.type Page:_page CompletionHandle:^(PictureBaseModel* responseObj, NSError *error) {
        if (_page == 1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:responseObj.data];
        completionHandle(error);
    }];
}



@end
