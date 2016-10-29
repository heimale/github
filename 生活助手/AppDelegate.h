//
//  AppDelegate.h
//  生活助手
//
//  Created by heimale on 16/9/7.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RESideMenu.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic,getter=isOnLine) BOOL onLine; //网络状态

@property (nonatomic,strong) RESideMenu *sideMeun;
@end
//
