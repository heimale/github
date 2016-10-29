//
//  VideoPageViewController.m
//  生活助手
//
//  Created by heimale on 16/10/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "VideoPageViewController.h"
#import "VideoViewController.h"
@interface VideoPageViewController ()

@end

@implementation VideoPageViewController

//单例模式创建controller对象
+ (UINavigationController *)standardTuWanNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        VideoPageViewController *vc = [[VideoPageViewController alloc] initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        /** 提供每个VC对应的key值数组 */
        vc.keys = [self vcKeys];
        /** 提供每个VC对应的values值数组 */
        vc.values = [self vcValues];
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
    
}

/** 提供每个VC对应的values值数组 */
+ (NSArray *)vcValues{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i <[self itemNames].count; i++) {
        //数值上，vc的infoType的枚举值 恰好和i值相同
        [arr addObject:@(i)];
    }
    return arr;
}
/** 提供每个VC对应的key值数组 */
+ (NSArray *)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:@"infoType"];
    }
    return [arr copy];
}

/** 提供题目数组 */
+ (NSArray *)itemNames{
    return @[@"创意",@"运动",@"旅行",@"剧情",@"动画",@"广告",@"音乐",@"开胃",@"预告",@"综合",@"记录",@"时尚"];
}
/** 提供每个题目对应的控制器的类型。题目和类型数量必须一致 */
+ (NSArray *)viewControllerClasses{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames])
    {
        [arr addObject:[VideoViewController class]];
    }
    return [arr copy];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"微视";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
