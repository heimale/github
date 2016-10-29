//
//  MenuListTableViewController.m
//  生活助手
//
//  Created by heimale on 16/9/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "MenuListTableViewController.h"

@interface MenuListTableViewController ()

@end

#import "MenuListTableViewController.h"
#import "MenuListViewModel.h"
#import "MenuListCell.h"
#import "MenuListDetailViewController.h"
@interface MenuListTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)MenuListViewModel *menuListVM;
@end

@implementation MenuListTableViewController
//懒加载创建MenuListViewModel对象
-(MenuListViewModel *)menuListVM{
    if (!_menuListVM) {
        _menuListVM=[[MenuListViewModel alloc]initWithText:self.text];
    }
    return _menuListVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //下拉刷新
    self.tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //懒加载创建MenuListViewModel模型对象,并刷新请求数据
        [self.menuListVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
        }];
    }];
    //上拉刷新
    self.tableView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.menuListVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView.footer endRefreshing];
        }];
    }];
    [self.tableView.header beginRefreshing];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.menuListVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //复用storyboard中注册的cell
    MenuListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2" forIndexPath:indexPath];
    //标题
    cell.titleLB.text=[self.menuListVM titleForRow:indexPath.row];
    cell.titleLB.textColor=[UIColor greenSeaColor];
    UILabel *label=cell.titleLB;
    //设置标题为发光字体
    FBShimmeringView *sv=[FBShimmeringView new];
    [cell.contentView addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(3);
        make.right.mas_equalTo(label.mas_right).mas_equalTo(0);
        make.bottom.mas_equalTo(label.mas_bottom).mas_equalTo(0);
    }];
    sv.contentView=label;
    sv.shimmering=YES;
    //时间label
    cell.timeLB.text=[self.menuListVM cookingTimeForRow:indexPath.row];
    //口味label
    cell.tasteLB.text=[self.menuListVM tasteForRow:indexPath.row];
    cell.likesLB.text=[self.menuListVM likesForRow:indexPath.row];
    //点赞
    //    cell.likesLB.text=[self.menuListVM IDForRow:indexPath.row];
    UIImageView *iv1=(UIImageView *)[cell.contentView viewWithTag:100];
    iv1.image=[UIImage imageNamed:@"c"];
    UIImageView *iv2=(UIImageView *)[cell.contentView viewWithTag:200];
    iv2.image=[UIImage imageNamed:@"a"];
    UIImageView *iv3=(UIImageView *)[cell.contentView viewWithTag:300];
    NSString *path3=[[NSBundle mainBundle]pathForResource:@"3" ofType:@"jpg"];
    iv3.image=[UIImage imageWithContentsOfFile:path3];
    return cell;
}
//跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MenuListDetailViewController *vc=[MenuListDetailViewController new];
    vc.ID=[self.menuListVM IDForRow:indexPath.row];
    vc.title=[self.menuListVM titleForRow:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
    
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
