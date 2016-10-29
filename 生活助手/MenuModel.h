//
//  MenuModel.h
//  生活助手
//
//  Created by heimale on 16/9/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "BaseModel.h"

@interface MenuModel : BaseModel
@property(nonatomic,strong)NSArray *links;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *slug;
@end
@interface MenuLinksModel : BaseModel
@property(nonatomic,strong)NSString *href;
//标题
@property(nonatomic,strong)NSString *text;
//图片路径
@property(nonatomic,strong)NSString *thumb;
@end