//
//  SJNavigationController.m
//  SDPPushClientObjC
//
//  Created by SDPMobile on 2017/11/24.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJNavigationController.h"
// Privare
#import "SJAppFunc.h"
#import "UIImage+SJ.h"

@interface SJNavigationController ()

@end

@implementation SJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置子视图
    [self initSubviews];
}

#pragma mark - 设置子视图
- (void)initSubviews {
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage sj_imageWithColor:SJ_RGB(106, 186, 63)] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
