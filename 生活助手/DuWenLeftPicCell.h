//
//  DuWenLeftPicCell.h
//  生活助手
//
//  Created by heimale on 16/9/8.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DuWenImageView.h"
@interface DuWenLeftPicCell : UITableViewCell

@property(nonatomic,strong)UILabel *titileLabel;
@property(nonatomic,strong)UILabel *hotLabel;
@property(nonatomic,strong)UILabel *dateLabel;
@property(nonatomic,strong)DuWenImageView *picImageView;
@property(nonatomic,strong)DuWenImageView *hotImageView;

@end