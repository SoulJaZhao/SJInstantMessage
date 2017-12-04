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
#import "SJDIYRefreshHeader.h"
#import "SJAddFriendViewController.h"

@interface SJFriendsViewController () <UITableViewDelegate, EMContactManagerDelegate>
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
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(tapAddFriend)];
    
    [[EMClient sharedClient].contactManager addDelegate:self delegateQueue:nil];
}

#pragma mark - 刷新TableView
- (void)refreshFriends {
    // 发送请求指令
    [_friendsViewModel.requestFreidnsCommand execute:nil];
}

#pragma mark - 绑定信号
- (void)initBind {
   // 请求好友回调参数
    [_friendsViewModel.requestFreidnsCommand.executionSignals.switchToLatest subscribeNext:^(NSString *errorDescription) {
        if (errorDescription) {
            [self showToastWithMessage:errorDescription];
        } else {
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
        }
    }];
    // 发送请求指令
    [_friendsViewModel.requestFreidnsCommand execute:nil];
    
    // 刷新控件
    self.tableView.mj_header = [SJDIYRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshFriends)];
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - 点击添加
- (void)tapAddFriend {
    SJAddFriendViewController *vc = [[SJAddFriendViewController alloc] initWithNibName:@"SJAddFriendViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - EMContactManagerDelegate
- (void)friendRequestDidReceiveFromUser:(NSString *)aUsername message:(NSString *)aMessage {
    NSLog(@"%@-%@",aUsername,aMessage);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
