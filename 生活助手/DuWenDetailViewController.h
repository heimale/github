//
//  DuWenDetailViewController.h
//  生活助手
//
//  Created by heimale on 16/9/8.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DuWenDetailViewController : UIViewController
@property (nonatomic,strong) NSString *newstitle;
@property (nonatomic,strong) NSURL *url;
@property (nonatomic,strong) NSURL *picURL;
-(instancetype)initWithPicURL:(NSURL *)picURL URL:(NSURL *)url newsTitle:(NSString *)newstitle;
@end
