//
//  CollectViewController.h
//  生活助手
//
//  Created by heimale on 16/9/8.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectViewController : UIViewController
/** 单例创建收藏 */
+(UINavigationController *)standatdNavi;
//声明增加按钮方法
-(void)addCollectItemToVC3;
+(void)removeSaveDate;
@end

