//
//  SJBaseViewModel.m
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/11/28.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJBaseViewModel.h"

@implementation SJBaseViewModel
#pragma mark - 初始化方法
- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialBind];
    }
    return self;
}

- (void)initialBind {
    
}
@end
