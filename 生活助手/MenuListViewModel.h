//
//  MenuListViewModel.h
//  生活助手
//
//  Created by heimale on 16/9/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "BaseViewModel.h"

@interface MenuListViewModel : BaseViewModel
//
@property(nonatomic,strong)NSString *text;
-(instancetype)initWithText:(NSString *)text;
@property(nonatomic)NSInteger start;
@property(nonatomic)NSInteger offset;
@property(nonatomic)NSInteger rowNumber;
-(NSURL*)thumbnailForRow:(NSInteger)row;
-(NSString *)titleForRow:(NSInteger)row;
-(NSString *)cookingTimeForRow:(NSInteger)row;
-(NSString *)tasteForRow:(NSInteger)row;
-(NSString *)likesForRow:(NSInteger)row;
-(NSString *)IDForRow:(NSInteger)row;
@end