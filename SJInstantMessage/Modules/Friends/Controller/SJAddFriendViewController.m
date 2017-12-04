//
//  SJAddFriendViewController.m
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/12/4.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJAddFriendViewController.h"
//Private
#import "SJAddFriendsViewModel.h"

@interface SJAddFriendViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tfUsername;
@property (weak, nonatomic) IBOutlet UITextField *tfMessage;

@property (nonatomic, strong) SJAddFriendsViewModel *addFriendsViewModel;
@end

@implementation SJAddFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化子视图
    [self initSubviews];
    // 绑定信号
    [self initBind];
}

#pragma mark - 初始化子视图
- (void)initSubviews {
    self.title = @"添加好友";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(tapAdd)];
}

#pragma mark - 点击添加按钮
- (void)tapAdd {
    [self showLoadingHUD];
    [_addFriendsViewModel.addFriendCommand execute:nil];
}

#pragma mark - 初始化绑定
- (void)initBind {
    _addFriendsViewModel = [[SJAddFriendsViewModel alloc] init];
    
    RAC(_addFriendsViewModel.addFriend, username) = _tfUsername.rac_textSignal;
    RAC(_addFriendsViewModel.addFriend, message) = _tfMessage.rac_textSignal;
    
    RAC(self.navigationItem.rightBarButtonItem, enabled) = _addFriendsViewModel.addFriendEnableSignal;
    
    [_addFriendsViewModel.addFriendCommand.executionSignals.switchToLatest subscribeNext:^(NSString *errorDescription) {
        if (errorDescription) {
            [self showToastWithMessage:errorDescription];
        } else {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
