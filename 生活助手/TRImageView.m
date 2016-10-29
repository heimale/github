//
//  TRImageView.m
//  生活助手
//
//  Created by heimale on 16/9/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "TRImageView.h"

@implementation TRImageView
-(id)init
{
    if (self = [super init]) {
        
        UIImageView *iv = [[UIImageView alloc]init];
        
        _imageView = [UIImageView new];
        [self addSubview:_imageView];
        //按比例放大,充满
        if(_imageView.frame.size.height >= kWindowH && _imageView.frame.size.width <= 320){
            _imageView.contentMode = UIViewContentModeScaleAspectFit;
        }
        if(_imageView.frame.size.width > 320){
            _imageView.contentMode = 2;
        }
        
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        //当前视图减掉超出自身区域的视图
        self.clipsToBounds = YES;
    }
    return self;
}

@end
