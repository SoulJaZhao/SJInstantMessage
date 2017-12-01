//
//  SJLoginViewModel.m
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/11/28.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJLoginViewModel.h"

@implementation SJLoginViewModel
#pragma mark - 绑定操作
- (void)initialBind {
    [super initialBind];
    
    _loginModel = [[SJLoginModel alloc] init];
    
    // 是否允许登录
    _loginEnableSignal = [RACSignal combineLatest:@[RACObserve(self.loginModel, username),RACObserve(self.loginModel, password)] reduce:^id (NSString *username, NSString *password){
        if (username.length >0 && password.length >0) {
            return @(YES);
        } else {
            return @(NO);
        }
    }];
    
    // 登录操作
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
