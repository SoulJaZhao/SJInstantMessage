//
//  SJTabBarController.m
//  SDPPushClientObjC
//
//  Created by SDPMobile on 2017/11/24.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJTabBarController.h"
// Private
#import "SJAppFunc.h"
#import "SJNavigationController.h"
#import "SJLoginViewController.h"
#import "SJFriendsViewController.h"
#import "SJSettingViewController.h"

@interface SJTabBarController () <EMClientDelegate>

@end

@implementation SJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置子页面
    [self initSubviews];
    
    // 监听
    [[EMClient sharedClient] addDelegate:self delegateQueue:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

#pragma mark - 设置子页面
- (void)initSubviews {
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:SJ_RGB(106, 186, 63)} forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:SJ_RGB(100, 100, 100)} forState:UIControlStateNormal];
    
    SJFriendsViewController *friendsVC = [[SJFriendsViewController alloc] init];
    friendsVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:[[UIImage imageNamed:@"tabbar_friends"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_friends_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    SJNavigationController *friendsNav = [[SJNavigationController alloc] initWithRootViewController:friendsVC];
    
    SJSettingViewController *settingVC = [[SJSettingViewController alloc] init];
    settingVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:[[UIImage imageNamed:@"tabbar_setting"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_setting_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    SJNavigationController *settingNav = [[SJNavigationController alloc] initWithRootViewController:settingVC];
    
    self.viewControllers = @[friendsNav, settingNav];
}

#pragma mark - 登录出错
- (void)autoLoginDidCompleteWithError:(EMError *)error {
    if (error) {
        [self.tabBarController setSelectedIndex:0];
        SJLoginViewController *loginVC = [[SJLoginViewController alloc] initWithNibName:@"SJLoginViewController" bundle:nil];
        SJNavigationController *loginNav = [[SJNavigationController alloc] initWithRootViewController:loginVC];
        [self presentViewController:loginNav animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
