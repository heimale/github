
//
//  CollectViewController.m
//  生活助手
//
//  Created by heimale on 16/9/8.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "CollectViewController.h"
#import "Factory.h"
#import "CollectViewModel.h"
#import "CollectViewCell.h"
#import "DuWenDetailViewController.h"

@interface CollectViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) CollectViewModel *collectVM;
@end

@implementation CollectViewController
//创建导航控制器视图   单例
+(UINavigationController *)standatdNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CollectViewController *vc = [CollectViewController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[CollectViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [_tableView reloadData];
            [_tableView.header endRefreshing];
        }];
        
        _tableView.separatorStyle = UITableViewCellAccessoryDisclosureIndicator;
    }
    return _tableView;
}

-(CollectViewModel *)collectVM{
    //从沙盒缓存中读取收藏历史
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *plistPath = [path stringByAppendingPathComponent:@"collect.plist"];
    //因为根节点是 NSArray类型，所以要用NSArray来读(通过PlistPath转化成数据数组)
    NSArray *plistArr=[NSArray arrayWithContentsOfFile:plistPath];
    //初始化后上面读取出来的数组字典已经转化成模型，存入到预先设置的数组中
    _collectVM = [[CollectViewModel alloc]initWithDataArr:plistArr];
    return _collectVM;
}

#pragma mark - UITableView DataSource Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.collectVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CollectViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.titileLabel.text = [self.collectVM titleForRow:indexPath.row];
    
    //AFNetWorking中通过URL路径创建imageView的方法
    [cell.picImageView.imageView setImageWithURL:[self.collectVM picURLForRow:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    DuWenDetailViewController *vc = [[DuWenDetailViewController alloc]initWithPicURL:[self.collectVM picURLForRow:indexPath.row] URL:[self.collectVM urlForRow:indexPath.row] newsTitle:[self.collectVM titleForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}
/*
 这个方法用于返回一个 cell 的预估高度，如果在程序中实现了这个方法，tableview 首次加载的时候就不会调用heightForRowAtIndexPath 方法，而是用 estimatedHeightForRowAtIndexPath 返回的预估高度计算 tableview 的总高度，然后 tableview 就可以显示出来了，等到 cell 可见的时候，再去调用heightForRowAtIndexPath 获取 cell 的正确高度
 */
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.tableView reloadData];
    [Factory addMenuItemToVC:self];
    [self addCollectItemToVC3];
    
    self.title = @"收藏";
    [_tableView reloadData];
    // Do any additional setup after loading the view.
}
//解决方案 从工厂方法中拿出来
-(void)addCollectItemToVC3{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"heart_32px"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 32, 32);
    [btn bk_addEventHandler:^(id sender) {
        
        if (btn.selected == YES) {
            [btn setImage:[UIImage imageNamed:@"Vote_32px"] forState:UIControlStateNormal];
            [self removeSaveDate];
            btn.selected =NO;
        }
        else if (btn.selected == NO){
            
            [btn setImage:[UIImage imageNamed:@"heart_32px"] forState:UIControlStateNormal];
            btn.selected = YES;
        }
        
        [self.tableView reloadData];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = 10;
    self.navigationItem.rightBarButtonItems = @[menuItem,spaceItem];
}

-(void)removeSaveDate
{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *plistPath = [path stringByAppendingPathComponent:@"collect.plist"];
    NSMutableArray *arr = [NSMutableArray new];
    if ([[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        arr = [[NSMutableArray arrayWithContentsOfFile:plistPath] mutableCopy];
    }
    
    [arr removeLastObject];
    [arr writeToFile:plistPath atomically:YES];
    //    NSLog(@"%@",plistPath);
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
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
