//
//  SJAddFriendsViewModel.m
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/12/4.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJAddFriendsViewModel.h"

@implementation SJAddFriendsViewModel
#pragma mark - 初始化绑定
- (void)initialBind {
    [super initialBind];
    
    _addFriend = [[SJAddFriend alloc] init];
    
    _addFriendEnableSignal = [RACSignal combineLatest:@[RACObserve(self.addFriend, username), RACObserve(self.addFriend, message)] reduce:^id (NSString *username){
        return @(username.length);
    }];
    
    _addFriendCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [[EMClient sharedClient].contactManager addContact:self.addFriend.username message:self.addFriend.message completion:^(NSString *aUsername, EMError *aError) {
                if (aError) {
                    [subscriber sendNext:aError.errorDescription];
                } else {
                    [subscriber sendNext:nil];
                }
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }];
}
@end
