//
//  SJBaseViewController.m
//  SDPPushClientObjC
//
//  Created by SDPMobile on 2017/11/24.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJBaseViewController.h"

static NSInteger const kHUDDelayTime = 2.0;

@interface SJBaseViewController ()
/** hud对象 */
@property (nonatomic, strong) MBProgressHUD *progressHUD;
@end

@implementation SJBaseViewController

#pragma mark - progressHUD懒加载
- (MBProgressHUD *)progressHUD {
    
    if (!_progressHUD) {
        _progressHUD = [[MBProgressHUD alloc] initWithView:self.view];
    }
    
    return _progressHUD;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 显示纯文本Toast
- (void)showToastWithMessage:(NSString *)message {
    
    [self.view addSubview:self.progressHUD];
    self.progressHUD.mode = MBProgressHUDModeText;
    self.progressHUD.label.text = message;
    [self.progressHUD showAnimated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kHUDDelayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideLoadingHUD];
    });
    
}

#pragma mark - 显示Loading视图(普通样式:菊花)
- (void)showLoadingHUD {
    [self.view addSubview:self.progressHUD];
    [self.progressHUD showAnimated:YES];
    
}

#pragma mark - 显示环形Loading视图 可以控制持续时间 单位:秒
- (void)showLoadingHUDWithDuration:(NSTimeInterval)duration Title:(NSString *)title detailTitle:(NSString *)detailTitle {
    
    if (title.length > 0) {
        self.progressHUD.label.text = title;
    }
    
    if (detailTitle.length > 0) {
        self.progressHUD.detailsLabel.text = detailTitle;
    }
    
    [self.view addSubview:self.progressHUD];
    
    //环形模式
    self.progressHUD.mode = MBProgressHUDModeAnnularDeterminate;
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        [self calculateProgressWithDuration:duration];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self hideLoadingHUD];
        });
    });
    
    [self.progressHUD showAnimated:YES];
    
}

#pragma mark - 显示条状Loading视图 可以控制持续时间 单位:秒
- (void)showBarLoadingHUDWithDuration:(NSTimeInterval)duration Title:(NSString *)title detailTitle:(NSString *)detailTitle {
    
    if (title.length > 0) {
        self.progressHUD.label.text = title;
    }
    
    if (detailTitle.length > 0) {
        self.progressHUD.detailsLabel.text = detailTitle;
    }
    
    [self.view addSubview:self.progressHUD];
    
    //条形模式
    self.progressHUD.mode = MBProgressHUDModeDeterminateHorizontalBar;
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        [self calculateProgressWithDuration:duration];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self hideLoadingHUD];
        });
    });
    
    [self.progressHUD showAnimated:YES];
}

#pragma mark - 计算规定时间的进度显示
- (void)calculateProgressWithDuration:(NSTimeInterval)duration {
    float progress = 0.0f;
    while (progress < 1.0f) {
        progress += 0.01f;
        dispatch_async(dispatch_get_main_queue(), ^{
            _progressHUD.progress = progress;
        });
        usleep(duration * 10000);
    }
}

#pragma mark - 隐藏Loading视图
- (void)hideLoadingHUD {
    
    [self.progressHUD removeFromSuperview];
    [self.progressHUD hideAnimated:YES];
    
}

#pragma mark - 显示带文案的Loading视图 参数可为空
- (void)showLoadingHUDWithTitle:(NSString *)title detailTitle:(NSString *)detailTitle {
    
    if (title.length > 0) {
        self.progressHUD.label.text = title;
    }
    
    if (detailTitle.length > 0) {
        self.progressHUD.detailsLabel.text = detailTitle;
    }
    
    [self.view addSubview:self.progressHUD];
    [self.progressHUD showAnimated:YES];
    
}

@end
