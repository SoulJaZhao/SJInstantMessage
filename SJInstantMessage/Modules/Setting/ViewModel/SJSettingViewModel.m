//
//  SJSettingViewModel.m
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/12/1.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJSettingViewModel.h"

// Private
#import "SJLogoutTableViewCell.h"

@implementation SJSettingViewModel
#pragma mark - 绑定信号
- (void)initialBind {
    [super initialBind];
    _logoutCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [[EMClient sharedClient] logout:YES completion:^(EMError *aError) {
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

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *kLogoutCellID = kSJLogoutTableViewCellIdentifier;
    
    SJLogoutTableViewCell *logoutCell = [tableView dequeueReusableCellWithIdentifier:kLogoutCellID];
    
    if (logoutCell == nil) {
        logoutCell = [[[NSBundle mainBundle] loadNibNamed:@"SJLogoutTableViewCell" owner:self options:nil] lastObject];
    }
    
    return logoutCell;
}
@end
