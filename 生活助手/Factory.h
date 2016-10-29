//
//  Factory.h
//  生活助手
//
//  Created by heimale on 16/9/8.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory : NSObject
/** 向某个控制器上，添加菜单按钮 */
+ (void)addMenuItemToVC:(UIViewController *)vc;

/** 向某个控制器上，添加返回按钮 */
+(void)addBackItemToVC:(UIViewController*)vc;

//新闻添加的
/** 向控制器添加菜单按钮 */
+(void)addMenuItemToVC1:(UIViewController *)vc;

/** 向控制器添加收藏按钮 */
+(void)addCollectItemToVC1:(UIViewController *)vc newsPicURL:(NSURL *)picURL newsURL:(NSURL *)url newsTitle:(NSString *)title;

/** 向控制器添加返回按钮 */
+(void)addBackItemToVc1:(UIViewController *)vc;
//自己添加的属性，用于收藏和删除信息
@property(nonatomic,getter=isSelected)BOOL selected1;

+(void)addCollectItemToVC2:(UIViewController *)vc;


@end
