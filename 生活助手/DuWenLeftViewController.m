//
//  DuWenLeftViewController.m
//  生活助手
//
//  Created by heimale on 16/9/8.
//  Copyright © 2016年 chenhao. All rights reserved.
//


#import "DuWenLeftViewController.h"
#import "DuWenViewController.h"
#import "CollectViewController.h"

@interface DuWenLeftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *itemNames;
@end

@implementation DuWenLeftViewController

-(NSArray *)itemNames{
    return @[@"读文",@"收藏"];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
        _tableView.backgroundColor = [UIColor clearColor];
        
        //MASConstraintMaker 添加约束的三方库
        /*
         masequalTo 和 equalTo 区别：
         masequalTo 比equalTo多了类型转换操作，一般来说，大多数时候两个方法都是 通用的，但是对于数值元素使用mas_equalTo。对于对象或是多个属性的处理，使用equalTo
         
         */
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWindowW/2, kWindowH/2));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(0);
        }];
        
        //间隔线
        _tableView.separatorStyle = UITableViewCellAccessoryNone;
    }
    return _tableView;
}

#pragma mark -UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemNames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.accessoryType = 1;
    cell.textLabel.text = self.itemNames[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont italicSystemFontOfSize:17];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    switch (indexPath.row) {
        case 0:
            //根据他的特性所以隐藏界面就好了， 应为他是RESideMenu的左视图控制器，所以才这样。
            [self.sideMenuViewController setContentViewController:[DuWenViewController standatdNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 1:
            [self.sideMenuViewController setContentViewController:[CollectViewController standatdNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
            
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
