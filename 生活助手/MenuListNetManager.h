//
//  MenuListNetManager.h
//  生活助手
//
//  Created by heimale on 16/9/13.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "BaseNetManager.h"

@interface MenuListNetManager : BaseNetManager
+(id)getWithText:(NSString *)text offset:(NSInteger)offset start:(NSInteger)start completionhandle:(void(^)(id model,NSError *error))completionhandle;
@end
