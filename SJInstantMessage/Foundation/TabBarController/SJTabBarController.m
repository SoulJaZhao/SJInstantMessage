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

@interface SJTabBarController ()

@end

@implementation SJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置子页面
    [self initSubviews];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // 判断是否登录
    SJLoginViewController *loginVC = [[SJLoginViewController alloc] initWithNibName:@"SJLoginViewController" bundle:nil];
    
    SJNavigationController *nav = [[SJNavigationController alloc] initWithRootViewController:loginVC];
    
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark - 设置子页面
- (void)initSubviews {
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:SJ_RGB(106, 186, 63)} forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:SJ_RGB(100, 100, 100)} forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
