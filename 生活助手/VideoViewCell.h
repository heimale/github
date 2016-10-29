//
//  VideoViewCell.h
//  生活助手
//
//  Created by heimale on 16/10/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TRImageView.h"
@interface VideoViewCell : UITableViewCell
@property (nonatomic,strong) TRImageView * imgView;

@property (nonatomic,strong) UILabel * titleLb;

@property (nonatomic,strong) UILabel * durationLb;

@property (nonatomic,strong) FUIButton * btn;
@end
