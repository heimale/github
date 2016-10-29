//
//  PlayViewController.m
//  生活助手
//
//  Created by heimale on 16/10/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "PlayViewController.h"
#import "MediaPlayer/MediaPlayer.h"
@interface PlayViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView * webView;

@end

@implementation PlayViewController

-(UIWebView*)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc]init];
    }
    return _webView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //添加返回按钮
    [Factory addBackItemToVC:self];
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    NSURLRequest * request  = [NSURLRequest requestWithURL:self.webUrl];
    [self.webView loadRequest:request];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
