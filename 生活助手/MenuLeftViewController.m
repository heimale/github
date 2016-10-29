//
//  MenuLeftViewController.m
//  生活助手
//
//  Created by heimale on 16/9/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "MenuLeftViewController.h"
#import "MenuViewModel.h"
#import "MenuListTableViewController.h"
@interface MenuLeftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)MenuViewModel *menuVM;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation MenuLeftViewController
//添加表视图
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[UITableView new];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor = [UIColor greenSeaColor];
        [self.view addSubview:_tableView];
        //给表视图添加约束 充满父view
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}
-(MenuViewModel *)menuVM{
    if (!_menuVM) {
        _menuVM=[MenuViewModel new];
    }
    return _menuVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"食遍天下";
    //    [Factory addMenuItemToVC:self];
    //model层通过AFNetWorking请求数据 并创建menuVM对象
    [self.menuVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self.tableView reloadData];
    }];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell3"];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.menuVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell3"];
    UILabel *label=[UILabel new];
    [cell.contentView addSubview:label];
    cell.accessoryType=1;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.left.mas_equalTo(100);
    }];
    label.text=[self.menuVM textForRow:indexPath.row];
    //设置标题为发光字体
    FBShimmeringView *sv=[FBShimmeringView new];
    [cell.contentView addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(100);
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.right.mas_equalTo(-10);
    }];
    sv.contentView=label;
    sv.shimmering=YES;
    UIImageView *iconIV=[UIImageView new];
    [cell.contentView addSubview:iconIV];
    [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.height.width.mas_equalTo(80);
        make.bottom.mas_equalTo(-10);
    }];
    [iconIV setImageWithURL:[self.menuVM iconUrlForRow:indexPath.row]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    MenuListTableViewController *vc=kVCFromSb(@"MenuListVC", @"Main");
    vc.text=[self.menuVM textForRow:indexPath.row];
    vc.title=[self.menuVM textForRow:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
    
}
@end
