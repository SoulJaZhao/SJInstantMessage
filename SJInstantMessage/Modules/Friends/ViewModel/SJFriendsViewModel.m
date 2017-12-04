//
//  SJFriendsViewModel.m
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/12/1.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJFriendsViewModel.h"

@implementation SJFriendsViewModel
#pragma mark - 绑定数据
- (void)initialBind {
    [super initialBind];
    _requestFreidnsCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [[EMClient sharedClient].contactManager getContactsFromServerWithCompletion:^(NSArray *aList, EMError *aError) {
                if (aError) {
                    [subscriber sendNext:aError.errorDescription];
                } else {
                    [self setValue:aList forKey:@"friends"];
                    [subscriber sendNext:nil];
                }
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}
@end
