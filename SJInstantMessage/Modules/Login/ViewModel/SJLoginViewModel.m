//
//  SJLoginViewModel.m
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/11/28.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJLoginViewModel.h"

@implementation SJLoginViewModel

#pragma mark - 初始化方法
- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialBind];
    }
    return self;
}

#pragma mark - 绑定操作
- (void)initialBind {
    _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSArray *input) {
        NSString *username = [input objectAtIndex:0];
        NSString *password = [input objectAtIndex:1];
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            // 登录
            [[EMClient sharedClient] loginWithUsername:username password:password completion:^(NSString *aUsername, EMError *aError) {
                // 登录失败
                if (aError) {
                    [subscriber sendNext:aError.errorDescription];
                }
                // 登录成功
                else {
                    // 自动登录
                    [[EMClient sharedClient].options setIsAutoLogin:YES];
                    [subscriber sendNext:nil];
                }
                [subscriber sendCompleted];
            }];
            
            return nil;
        }];
    }];
}
@end
