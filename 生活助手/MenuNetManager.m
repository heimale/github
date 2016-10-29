//
//  MenuNetManager.m
//  生活助手
//
//  Created by heimale on 16/9/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "MenuNetManager.h"
#import "MenuModel.h"

//http://cookbook-cn.appcookies.com/article/link_container/com.appcookies.CookBook.json

@implementation MenuNetManager
+(id)getMenuWithCompletionhandle:(void(^)(id model,NSError *error))completionhandle{
    NSString *path=@"http://cookbook-cn.appcookies.com/article/link_container/com.appcookies.CookBook.json";
    return [BaseNetManager GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionhandle([MenuModel objectWithKeyValues:responseObj],error);
    }];
    
}

@end
