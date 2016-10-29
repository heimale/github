//
//  QuanjingViewController.h
//  生活助手
//
//  Created by heimale on 16/10/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "WMPageController.h"


//继承 网易导航栏翻页 控制器
@interface QuanjingViewController :WMPageController
//内容页的首页应该是单例的，每次进程都只初始化一次
+ (UINavigationController *)standardTuWanNavi;
@end
