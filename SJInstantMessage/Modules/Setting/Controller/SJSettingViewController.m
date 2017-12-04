//
//  SJSettingViewController.m
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/12/1.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJSettingViewController.h"

// Private
#import "SJSettingViewModel.h"

@interface SJSettingViewController () <UITableViewDelegate>
/**  ViewModel **/
@property (nonatomic, strong) SJSettingViewModel *settingViewModel;
@end

@implementation SJSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置";
    // 初始化子视图
    [self initSubviews];
    
    // 绑定信号
    [self initBind];
}

#pragma mark - 初始化子视图
- (void)initSubviews {
    _settingViewModel = [[SJSettingViewModel alloc] init];
    
    self.tableView.dataSource = _settingViewModel;
    self.tableView.delegate = self;
}

#pragma mark - 绑定信号
- (void)initBind {
    [_settingViewModel.logoutCommand.executionSignals.switchToLatest subscribeNext:^(NSString *errorDescription) {
        if (errorDescription) {
            [self showToastWithMessage:errorDescription];
        } else {
            [self gotoLogin];
        }
    }];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [_settingViewModel.logoutCommand execute:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
