//
//  PicViewController.m
//  生活助手
//
//  Created by heimale on 16/10/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "PicViewController.h"

#import "PictureViewModel.h"
#import "TRImageView.h"
#import "iCarousel.h"
#import "PictureViewModel.h"
#import "PicDetailViewController.h"

@interface PicViewController ()<UIScrollViewDelegate,PSCollectionViewDelegate,PSCollectionViewDataSource>
@property(nonatomic,strong) PSCollectionView *collectionView;
@property(nonatomic,strong) PictureViewModel *picVM;

@end

@implementation PicViewController

#pragma mark - lazyLoad
- (PictureViewModel *)picVM
{
    if (!_picVM) {
        //主要辨别是哪个path
        _picVM = [[PictureViewModel alloc]initWithType:self.infoType];
    }
    return _picVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.collectionView = [[PSCollectionView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];
    self.collectionView.delegate = self;
    self.collectionView.collectionViewDelegate = self;
    self.collectionView.collectionViewDataSource = self;
    [self.view addSubview:self.collectionView];
    //
    self.collectionView.numColsPortrait = 2;
    
    //头部刷新
    self.collectionView.header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.picVM refreshDataCompletionHandle:^(NSError *error) {
            //AF的回调 是在主线程中
            //self.collectionView.headerView = [self headerView];
            NSLog(@".......................");
            [self.collectionView reloadData];
            [self.collectionView.header endRefreshing];
        }];
    }];
    //尾部刷新
    self.collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.picVM getMoreDataCompletionHandle:^(NSError *error) {
            //self.collectionView.headerView = [self headerView];
            [self.collectionView reloadData];
            [self.collectionView.footer endRefreshing];
        }];
    }];
    [self.collectionView.header beginRefreshing];
}

#pragma mark - PSCollectionViewDelegate/DataSource

- (NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView
{
    return self.picVM.rowNumber;
}
- (CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index
{
    CGFloat width =(CGFloat) [self.picVM widthWithRow:index];
    CGFloat height = (CGFloat)[self.picVM heightWithRow:index];
    return (kWindowW/2-12)*height/width;
}



- (PSCollectionViewCell *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index
{
    PSCollectionViewCell *cell = [collectionView dequeueReusableViewForClass:[PSCollectionViewCell class]];
    if (!cell) {
        cell = [[PSCollectionViewCell alloc] initWithFrame:CGRectZero];
        //TRImageView *imgView=[TRImageView new];
        UIImageView *imgView=[UIImageView new];
        [cell addSubview:imgView];
        imgView.tag = 100;
    }
    
    //TRImageView *igView = (TRImageView *)[cell viewWithTag:100];
    
    
    
    UIImageView *iv = (UIImageView *)[cell viewWithTag:100];
    
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    //iv.frame = CGRectMake(0, 0, kWindowW/2 -12, [self collectionView:collectionView heightForRowAtIndex:index]);
    [iv setImageWithURL:[self.picVM urlImageWithRow:index]];
    
    //[igView.imageView setImageWithURL:[self.picVM urlImageWithRow:index]];
    
    
    
    return cell;
}

- (void)collectionView:(PSCollectionView *)collectionView didSelectCell:(PSCollectionViewCell *)cell atIndex:(NSInteger)index
{
    
    PicDetailViewController  *vc = [PicDetailViewController new];
    vc.firstURL = [self.picVM urlImageWithRow:index];
    vc.urlArr = [self.picVM urlImageArrayWith:index];
    [self.navigationController pushViewController:vc animated:YES];
}

- (Class)collectionView:(PSCollectionView *)collectionView cellClassForRowAtIndex:(NSInteger)index {
    return [PSCollectionViewCell class];
}



@end
