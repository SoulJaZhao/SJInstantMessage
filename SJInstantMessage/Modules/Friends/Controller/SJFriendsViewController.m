//
//  SJFriendsViewController.m
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/12/1.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJFriendsViewController.h"
// Private
#import "SJFriendsViewModel.h"

@interface SJFriendsViewController () <UITableViewDelegate>
/**  ViewModel **/
@property (nonatomic, strong) SJFriendsViewModel *friendsViewModel;
@end

@implementation SJFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"好友";
    // 初始化子视图
    [self initSubviews];
    
    // 绑定信号
    [self initBind];
}

#pragma mark - 初始化子视图
- (void)initSubviews {
    _friendsViewModel = [[SJFriendsViewModel alloc] init];
    
    self.tableView.dataSource = _friendsViewModel;
    self.tableView.delegate = self;
}

#pragma mark - 绑定信号
- (void)initBind {
   // 请求好友回调参数
    [_friendsViewModel.requestFreidnsCommand.executionSignals.switchToLatest subscribeNext:^(NSString *errorDescription) {
        if (errorDescription) {
            [self showToastWithMessage:errorDescription];
        } else {
            [self.tableView reloadData];
        }
    }];
    // 发送请求指令
    [_friendsViewModel.requestFreidnsCommand execute:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
