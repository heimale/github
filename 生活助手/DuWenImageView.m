//
//  DuWenImageView.m
//  生活助手
//
//  Created by heimale on 16/9/8.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "DuWenImageView.h"

@implementation DuWenImageView
-(instancetype)init{
    if (self = [super init]) {
        _imageView = [UIImageView new];
        [self addSubview:_imageView];
        //按比例放大充满
        _imageView.contentMode = 2;
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        //当前视图减去超出自身区域的视图
        self.clipsToBounds = YES;
    }
    return self;
}
@end
