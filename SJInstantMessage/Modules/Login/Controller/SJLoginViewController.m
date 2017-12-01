//
//  SJLoginViewController.m
//  SDPPushClientObjC
//
//  Created by SDPMobile on 2017/11/27.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJLoginViewController.h"
// Private
#import "SJLoginViewModel.h"
#import "SJRegisterViewController.h"

@interface SJLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tfUsername;

@property (weak, nonatomic) IBOutlet UITextField *tfPassword;

@property (nonatomic, strong) SJLoginViewModel *loginViewModel;
@end

@implementation SJLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // 设置Nav
    [self initNav];
    
    // 绑定模型
    [self bindModel];
}

#pragma mark - 设置Nav
- (void)initNav {
    self.title = @"登录";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(tapLoginBtn)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStyleDone target:self action:@selector(tapRegisterBtn)];
}

#pragma mark - 绑定模型
- (void)bindModel {
    _loginViewModel = [[SJLoginViewModel alloc] init];
    
    RAC(_loginViewModel.loginModel,username) = _tfUsername.rac_textSignal;
    RAC(_loginViewModel.loginModel,password) = _tfPassword.rac_textSignal;
    
    // 绑定登录按钮是否可以点击
    RAC(self.navigationItem.rightBarButtonItem,enabled) = _loginViewModel.loginEnableSignal;
}

#pragma mark - 监听登录
- (void)tapLoginBtn {
    [self.view endEditing:YES];
    [self showLoadingHUD];
    @weakify(self);
    [[self.loginViewModel.loginCommand execute:@[self.tfUsername.text,self.tfPassword.text]] subscribeNext:^(NSString *errorDescription) {
        @strongify(self);
        [self hideLoadingHUD];
        if (errorDescription) {
            [self showToastWithMessage:errorDescription];
        } else {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
}

#pragma mark - 点击注册
- (void)tapRegisterBtn {
    SJRegisterViewController *registerVC = [[SJRegisterViewController alloc] initWithNibName:@"SJRegisterViewController" bundle:nil];
    [self.navigationController pushViewController:registerVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
