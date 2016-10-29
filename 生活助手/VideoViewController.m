//
//  VideoViewController.m
//  生活助手
//
//  Created by heimale on 16/10/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoViewCell.h"
#import "PlayViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>

@interface VideoViewController ()
@property (nonatomic,strong) VideoViewModel * videoVM;


@end

@implementation VideoViewController




#pragma mark - lazyLoad
- (VideoViewModel *)videoVM
{
    if (!_videoVM) {
        _videoVM = [[VideoViewModel alloc]initWithType:self.infoType];
    }
    return _videoVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册自定义cell
    [self.tableView registerClass:[VideoViewCell class] forCellReuseIdentifier:@"videoCell"];
    
    //下拉刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.videoVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
            //NSLog(@"....................");
        }];
    }];
    
    //上拉刷新
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.videoVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView.footer endRefreshing];
        }];
    }];
    
    //进入界面先刷新一次
    [self.tableView.header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"videoCell" forIndexPath:indexPath];
    [cell.imgView.imageView setImageWithURL:[self.videoVM coverImageURLWithIndexPath:indexPath]];
    cell.titleLb.text = [self.videoVM titleNameWithIndexPath:indexPath];
    cell.durationLb.text = [self.videoVM durationWithIndexPath:indexPath];
    return cell;
}



#pragma mark - Table view delegate
//只要点击了该行的Cell就会触发该方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //松手后，去掉高亮状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PlayViewController *playVC = [[PlayViewController alloc]init];
    playVC.webUrl = [self.videoVM webUrlWithIndexPath:indexPath];
    [self.navigationController pushViewController:playVC animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kWindowW * 180/300.0;
}


-(AVPlayerViewController*) sharedInstance
{
    static AVPlayerViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [AVPlayerViewController new];
    });
    return nil;
}

@end