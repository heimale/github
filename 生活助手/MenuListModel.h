//
//  MenuListModel.h
//  生活助手
//
//  Created by heimale on 16/9/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "BaseModel.h"

@class MenuListPagingModel;
@interface MenuListModel : BaseModel
@property(nonatomic,strong)MenuListPagingModel *paging;
@property(nonatomic,strong)NSArray *result;
@property(nonatomic,strong)NSString  *status;
@end
@interface MenuListPagingModel : BaseModel
@property(nonatomic,strong)NSString *next;
@property(nonatomic)NSInteger offset;
@property(nonatomic)NSInteger *start;
@end
@interface MenuListResultModel : BaseModel
@property(nonatomic,strong)NSString *cookingDifferent;
//烹饪时间
@property(nonatomic,strong)NSString *cookingTime;
@property(nonatomic,strong)NSString *id;
//点赞
@property(nonatomic,strong)NSString *likes;
@property(nonatomic,strong)NSString *publishAt;
//口味
@property(nonatomic,strong)NSString *taste;
//详情
@property(nonatomic,strong)NSString *thumbnail;
//标题
@property(nonatomic,strong)NSString *title;
@end