//
//  MenuViewController.m
//  生活助手
//
//  Created by heimale on 16/9/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "MenuViewController.h"
#import "iCarousel.h"
#import "MenuViewModel.h"
#import "TRImageView.h"
#import "MenuListTableViewController.h"
@interface MenuViewController ()<iCarouselDelegate,iCarouselDataSource>
@property(nonatomic,strong)iCarousel *ic;
@property(nonatomic,strong)MenuViewModel *menuVM;
@end

@implementation MenuViewController
-(MenuViewModel *)menuVM{
    if (!_menuVM) {
        _menuVM=[MenuViewModel new];
    }
    return _menuVM;
}
-(iCarousel *)ic{
    if (!_ic) {
        _ic=[[iCarousel alloc]init];
        [self.view addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _ic.delegate=self;
        _ic.dataSource=self;
        _ic.type=1;
        //自动滚屏速度
        _ic.autoscroll=.5;
        
    }
    return  _ic;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //通过懒加载方式创建MenuViewModel对象, 并请求数据
    [self.menuVM getDataFromNetCompleteHandle:^(NSError *error) {
        //通过懒加载方法创建iCarousel旋转木马效果视图
        self.ic.pagingEnabled=YES;
    }];
    //添加左上角按钮弹出左菜单栏
    [Factory addMenuItemToVC:self];
}
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    //修改缝隙
    if (option==iCarouselOptionSpacing) {
        return value*1.5;
    }
    if (option==iCarouselOptionWrap) {
        return YES;
    }
    
    return value;
    
}
//通过协议方法设置旋转木马的item个数
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.menuVM.imageURLs.count;
    
}
//设置carousel的item
-(UIView*)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    //如果view不存在,创建view
    if (!view) {
        view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW-10, kWindowH/2+50)];
        //创建自定义TRImageView对象,并设置tag,方便后面复用
        TRImageView *imageView=[TRImageView new];
        imageView.tag=100;
        [view addSubview:imageView];
        //设置item中imageView的约束
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            //左 右 下 0
            make.left.right.bottom.mas_equalTo(0);
            //上 40
            make.top.mas_equalTo(40);
        }];
        UILabel *textLabel=[UILabel new];
        textLabel.tag=200;
        [view addSubview:textLabel];
        //textLabel添加约束
        [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            //高 40
            make.height.mas_equalTo(40);
            //上 左 右 0
            make.top.left.right.mas_equalTo(0);
        }];
        textLabel.numberOfLines=0;
        textLabel.font=[UIFont boldSystemFontOfSize:22];
        //label文字居中 UITextAlignmentCenter ios6.0以后不再使用这个枚举类型
        textLabel.textAlignment = NSTextAlignmentCenter;
    }
    //如果view存在, 从view中取出tag为100的TRImageView对象
    TRImageView *imageView=(TRImageView *)[view viewWithTag:100];
    [imageView.imageView setImageWithURL:self.menuVM.imageURLs[index]];
    UILabel *label=(UILabel *)[view viewWithTag:200];
    label.text=[self.menuVM textForRow:index];
    return view;
}
//两个cell之间的距离
-(CGFloat)carouselItemWidth:(iCarousel *)carousel{
    return kWindowW-10;
}
//用于跳转 并把标题内容传给下一个控制器用于请求数据
-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    MenuListTableViewController *vc=kVCFromSb(@"MenuListVC", @"Main");
    vc.text=[self.menuVM textForRow:index];
    vc.title=[self.menuVM textForRow:index];
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
