//
//  MenuViewModel.h
//  生活助手
//
//  Created by heimale on 16/9/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "BaseViewModel.h"

@interface MenuViewModel : BaseViewModel
@property(nonatomic)NSInteger rowNumber;
-(NSString*)textForRow:(NSInteger)row;
-(NSURL *)iconUrlForRow:(NSInteger)row;
@property(nonatomic,strong)NSArray *imageURLs;
@end

