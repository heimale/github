//
//  MenuViewModel.m
//  生活助手
//
//  Created by heimale on 16/9/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "MenuViewModel.h"
#import "MenuNetManager.h"
#import "MenuModel.h"
@implementation MenuViewModel
-(NSInteger)rowNumber{
    return self.dataArr.count;
    
}
-(NSArray *)imageURLs{
    if (!_imageURLs) {
        _imageURLs=[NSArray new];
    }
    return _imageURLs;
}
//获取数据
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask=[MenuNetManager getMenuWithCompletionhandle:^(MenuModel *model, NSError *error) {
        [self.dataArr addObjectsFromArray:model.links];
        NSMutableArray *imgUrls=[NSMutableArray new];
        //把数据中的图片路径转成url, 并添加到imageURLs数组中
        for (int i=0;i<self.dataArr.count;i++) {
            [imgUrls addObject:[self iconUrlForRow:i]];
        }
        self.imageURLs=[imgUrls copy];
        completionHandle(error);
    }];
}
-(MenuLinksModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
    
}
-(NSString*)textForRow:(NSInteger)row{
    return [self modelForRow:row].text;
}

-(NSURL *)iconUrlForRow:(NSInteger)row{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://cookbook-cn.appcookies.com/%@",[self modelForRow:row].thumb]];
}
@end
