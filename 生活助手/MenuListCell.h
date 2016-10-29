//
//  MenuListCell.h
//  生活助手
//
//  Created by heimale on 16/9/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuListCell : UITableViewCell
//标题
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
//时间
@property (weak, nonatomic) IBOutlet UILabel *timeLB;
//口味
@property (weak, nonatomic) IBOutlet UILabel *tasteLB;
//点赞
@property (weak, nonatomic) IBOutlet UILabel *likesLB;

@end

