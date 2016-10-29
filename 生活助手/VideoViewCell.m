//
//  VideoViewCell.m
//  生活助手
//
//  Created by heimale on 16/10/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "VideoViewCell.h"

#import "TRImageView.h"
@implementation VideoViewCell

- (UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc]init];
        _titleLb.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:16];
        //_titleLb.font = [UIFont flatFontOfSize:16];
        _titleLb.textColor  = [UIColor whiteColor];
        _titleLb.numberOfLines = 0;
        //设置字体居中
        _titleLb.textAlignment = UITextAlignmentCenter;
        
    }
    return _titleLb;
}
#pragma mark - lazyLoad
- (UILabel *)durationLb
{
    if (!_durationLb) {
        _durationLb = [[UILabel alloc]init];
        _durationLb.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:13];
        //_durationLb.font = [UIFont flatFontOfSize:13];
        _durationLb.textColor  = [UIColor whiteColor];
        //设置字体居中
        _durationLb.textAlignment = UITextAlignmentCenter;
    }
    return _durationLb;
}

#pragma mark - lazyLoad
- (TRImageView *)imgView
{
    if (!_imgView) {
        _imgView = [[TRImageView alloc]init];
    }
    return _imgView;
}

#pragma mark - lazyLoad

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView addSubview:self.imgView];
        [self.imgView addSubview:self.titleLb];
        [self.imgView addSubview:self.durationLb];
        
        //图片width等于view.width ，中心X对齐高度为
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(0);
        }];
        
        
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(kWindowW * 0.6);
            make.center.mas_equalTo(0);
        }];
        
        [self.durationLb mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(2);
            make.centerX.mas_equalTo(self.titleLb);
            make.width.mas_equalTo(kWindowW * 0.3);
        }];
        
        
    }
    return self;
}


- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
}

@end
