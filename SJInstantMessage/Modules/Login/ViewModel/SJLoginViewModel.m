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
- (instancetype)initWithController:(SJBaseViewController *)controller {
    self = [super initWithController:controller];
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
    
    // 监听登录时候产生的数据
    @weakify(self);
    [_loginCommand.executionSignals.switchToLatest subscribeNext:^(NSString *errorDescription) {
        @strongify(self);
        [self.controller hideLoadingHUD];
        if (errorDescription) {
            [self.controller showToastWithMessage:errorDescription];
        } else {
            [self.controller dismissViewControllerAnimated:YES completion:^{
                [self.controller showToastWithMessage:@"登录成功"];
            }];
        }
    }];
    
    [[_loginCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        @strongify(self);
        if ([x isEqual:@(YES)]) {
            // 正在执行
            [self.controller showLoadingHUD];
        }
    }];
}
@end
