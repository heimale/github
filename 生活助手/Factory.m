//
//  Factory.m
//  生活助手
//
//  Created by heimale on 16/9/8.
//  Copyright © 2016年 chenhao. All rights reserved.
//


#import "Factory.h"
#import <Foundation/Foundation.h>
@implementation Factory
/** 向某个控制器上，添加菜单按钮 */
+ (void)addMenuItemToVC:(RESideMenu *)vc
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 30, 30);
    [btn setBackgroundImage:[UIImage imageNamed:@"zone_post_red.png"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"zone_post_red.png"] forState:UIControlStateHighlighted];
    [btn bk_addEventHandler:^(id sender) {
        
        /**这里写一些btn响应的代码*/
        [vc.sideMenuViewController presentLeftMenuViewController];
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    //使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -10;
    vc.navigationItem.leftBarButtonItems = @[spaceItem,menuItem];
    
}

/** 向某个控制器上，添加返回按钮 "< 返回" */
+(void)addBackItemToVC:(UIViewController*)vc
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0,45,44);
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_back_n.png"] forState:UIControlStateNormal];
    
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_back_h.png"] forState:UIControlStateHighlighted];
    [btn bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    vc.navigationItem.leftBarButtonItems = @[btnItem,spaceItem];
}


//新闻添加的
//添加按钮到控制器
+(void)addMenuItemToVC1:(UIViewController *)vc{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"windows_32px"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 32, 32);
    //使用blockkit三方库添加事件
    [btn bk_addEventHandler:^(id sender) {
        [vc.sideMenuViewController presentLeftMenuViewController];
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -6;
    vc.navigationItem.leftBarButtonItems = @[spaceItem,menuItem];
}

+(void)addCollectItemToVC1:(UIViewController *)vc newsPicURL:(NSURL *)picURL newsURL:(NSURL *)url newsTitle:(NSString *)title{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"Vote_32px"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 32, 32);
    [btn bk_addEventHandler:^(id sender) {
       
        if (btn.selected ==NO) {
            [btn setImage:[UIImage imageNamed:@"heart_32px"] forState:UIControlStateNormal];
            btn.selected =YES;
            //保存绝对的字符串
            [self saveDataWithPicURL1:[picURL absoluteString] Title:title URL:[url absoluteString]];
        }
        else if (btn.selected == YES){
            [btn setImage:[UIImage imageNamed:@"Vote_32px"] forState:UIControlStateNormal];
            btn.selected =NO;
            [self removeSaveDate];
        }
        
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = 10;
    vc.navigationItem.rightBarButtonItems = @[menuItem,spaceItem];
}

+(void)addBackItemToVc1:(UIViewController *)vc{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"outgoing_32px"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 32, 32);
    [btn bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    //使用小木棍控制缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -6;
    vc.navigationItem.leftBarButtonItems = @[spaceItem,menuItem];
}

+(void)saveDataWithPicURL1:(NSString *)picURL Title:(NSString *)title URL:(NSString *)url{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *plistPath = [path stringByAppendingPathComponent:@"collect.plist"];
    NSMutableArray *arr = [NSMutableArray new];
    //    BOOL isexist = [[NSBundle mainBundle] pathForResource:@"collect" ofType:@"plist"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        arr = [[NSMutableArray arrayWithContentsOfFile:plistPath] mutableCopy];
    }
    NSDictionary *newInfo = @{@"newsPicURL":picURL,@"newsTitle":title,@"newsURL":url};
    [arr addObject:newInfo];
    [arr writeToFile:plistPath atomically:YES];
    //    NSLog(@"%@",plistPath);
    
   }
//自己添加移除收藏
+(void)removeSaveDate
{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *plistPath = [path stringByAppendingPathComponent:@"collect.plist"];
    NSMutableArray *arr = [NSMutableArray new];
    if ([[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        arr = [[NSMutableArray arrayWithContentsOfFile:plistPath] mutableCopy];
    }
   
    [arr removeLastObject];
    [arr writeToFile:plistPath atomically:YES];
    //    NSLog(@"%@",plistPath);
    

}
//移除收藏
+(void)addCollectItemToVC2:(UIViewController *)vc{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"heart_32px"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 32, 32);
    [btn bk_addEventHandler:^(id sender) {
        
        if (btn.selected == YES) {
            [btn setImage:[UIImage imageNamed:@"Vote_32px"] forState:UIControlStateNormal];
            [self removeSaveDate];
             btn.selected =NO;
        }
        else if (btn.selected == NO){
            
          [btn setImage:[UIImage imageNamed:@"heart_32px"] forState:UIControlStateNormal];
        btn.selected = YES;
        }
        
        
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = 10;
    vc.navigationItem.rightBarButtonItems = @[menuItem,spaceItem];
}


@end