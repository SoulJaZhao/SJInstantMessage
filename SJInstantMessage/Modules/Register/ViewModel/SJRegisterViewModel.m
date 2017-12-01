//
//  SJRegisterViewModel.m
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/11/29.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJRegisterViewModel.h"

@implementation SJRegisterViewModel
#pragma mark - 初始化绑定
- (void)initialBind {
    [super initialBind];
    _registerModel = [[SJRegisterModel alloc] init];
    
    // 是否允许注册
    _registerEnableSignal = [RACSignal combineLatest:@[RACObserve(self.registerModel, username), RACObserve(self.registerModel, password)] reduce:^id (NSString *username, NSString *password){
        return @(username.length && password.length);
    }];
    
    // 注册操作
    _registerCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSArray *input) {
        NSString *username = [input objectAtIndex:0];
        NSString *password = [input objectAtIndex:1];
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [[EMClient sharedClient] registerWithUsername:username password:password completion:^(NSString *aUsername, EMError *aError) {
                // 注册失败
                if (aError) {
                    [subscriber sendNext:aError.errorDescription];
                }
                // 注册成功
                else {
                    [subscriber sendNext:nil];
                }
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }];
}
@end
