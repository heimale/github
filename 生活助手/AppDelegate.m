//
//  AppDelegate.m
//  生活助手
//
//  Created by heimale on 16/9/7.
//  Copyright © 2016年 chenhao. All rights reserved.
//


#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "DuWenViewController.h"
#import "DuWenLeftViewController.h"
//增加的头文件
#import "MenuLeftViewController.h"
#import "PictureViewController.h"
#import "QuanjingViewController.h"
#import "VideoPageViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //电池条显示网络活动  检测网络状态
    [self initializeWithApplication:application];
    
    //对self.window进行设置
    self.window  = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UITabBarController *tabBarControl = [[UITabBarController alloc]init];
    
    //创建侧滑视图控制器对象  不可以推送 tabBar上有的视图控制器会起冲突
    RESideMenu *vc1 = _sideMeun = [[RESideMenu alloc]initWithContentViewController:[DuWenViewController standatdNavi] leftMenuViewController:[DuWenLeftViewController new] rightMenuViewController:nil];
    vc1.backgroundImage = [UIImage imageNamed:@"backgroud"];
    //        _sideMeun.menuPrefersStatusBarHidden = YES;

    //设置不能水平滑动
    vc1.bouncesHorizontally = NO;
    vc1.tabBarItem.title  = @"首页";
    vc1.tabBarItem.image = [UIImage imageNamed:@"TabBarIconFeaturedNormal"];
    vc1.tabBarItem.selectedImage = [UIImage imageNamed:@"TabBarIconFeatured"];
    vc1.view.backgroundColor = kRGBColor(70, 110, 166);
    
    //全景界面
    UINavigationController *vc=kVCFromSb(@"Navi1", @"Main");
    UINavigationController *navi=[[UINavigationController alloc]initWithRootViewController:[MenuLeftViewController new]];
    RESideMenu *vc2 = [[RESideMenu alloc]initWithContentViewController:vc leftMenuViewController:navi rightMenuViewController:nil];
    vc2.backgroundImage=[UIImage imageNamed:@"backgroud"];
    //可以让出现时菜单不显示状态栏
    vc2.menuPrefersStatusBarHidden=YES;
    //不允许菜单栏缩小到了边缘还可以缩小,也就是不允许水平滑动
    vc2.bouncesHorizontally=NO;
    [vc2.tabBarItem setTitle:@"美食"];
    vc2.tabBarItem.image = [UIImage imageNamed:@"TabBarIconDestinationNormal"];
    vc2.tabBarItem.selectedImage = [UIImage imageNamed:@"TabBarIconDestination"];
    vc2.view.backgroundColor = kRGBColor(164,164,164 );
    
   //美图
    UINavigationController *vc3 = [QuanjingViewController standardTuWanNavi];
    
    [vc3.tabBarItem setTitle:@"美图"];
    vc3.tabBarItem.image = [UIImage imageNamed:@"TabBarIconDestinationNormal"];
    vc3.tabBarItem.selectedImage = [UIImage imageNamed:@"TabBarIconDestination"];
    vc3.view.backgroundColor = kRGBColor(164,164,164 );
    
    
    UINavigationController  *vc4 = [VideoPageViewController standardTuWanNavi];
    vc4.tabBarItem.title  = @"微视";
    vc4.tabBarItem.image = [UIImage imageNamed:@"TabBarIconMyNormal"];
    vc4.tabBarItem.selectedImage = [UIImage imageNamed:@"TabBarIconMy"];
    vc4.view.backgroundColor = kRGBColor(arc4random_uniform(255), arc4random_uniform(0), arc4random_uniform(255));
    
    /**tabBarController里面包含4个控制器*/
    tabBarControl.viewControllers = @[vc1,vc2,vc3,vc4];
    
    self.window.rootViewController  = tabBarControl;
    [self.window makeKeyAndVisible];
    //配置全局UINavigationBar样式
    [self configGlobalUIStyle];
    return YES;
}

-(UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}

/** 配置全局UI的样式 */
-(void)configGlobalUIStyle{
    /** 导航栏不透明 */
    [[UINavigationBar appearance] setTranslucent:NO];
    // iOS5及其以后提供了一个比较强大的工具UIAppearance，我们通过UIAppearance设置一些UI的全局效果，这样就可以很方便的实现UI的自定义效果又能最简单的实现统一界面风格。
    // + (id)appearance  这个方法是统一全部改
    [[UINavigationBar appearance] setBackgroundColor:[UIColor greenSeaColor]];
    //greenSeaColor 扁平化界面风格框架提供的UIColor分类
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldFlatFontOfSize:24.0], NSForegroundColorAttributeName: [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]}];
}

/** 配置侧滑控制器 */
//MMDrawerController 配置普通的侧滑界面
-(RESideMenu *)sideMeun{
    if (!_sideMeun) {
        _sideMeun = [[RESideMenu alloc]initWithContentViewController:[DuWenViewController standatdNavi] leftMenuViewController:[DuWenLeftViewController new] rightMenuViewController:nil];
        _sideMeun.backgroundImage = [UIImage imageNamed:@"backgroud"];
        //        _sideMeun.menuPrefersStatusBarHidden = YES;
    }
    //设置不能水平滑动
    _sideMeun.bouncesHorizontally = NO;
    return _sideMeun;
}

@end