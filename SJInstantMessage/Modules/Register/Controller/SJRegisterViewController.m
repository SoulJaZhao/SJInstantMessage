//
//  SJRegisterViewController.m
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/11/29.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJRegisterViewController.h"
// Private
#import "SJRegisterViewModel.h"

@interface SJRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tfUsername;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;

/**  ViewModel **/
@property (nonatomic, strong) SJRegisterViewModel *registerViewModel;
@end

@implementation SJRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // 设置Nav
    [self initNav];
    
    // 绑定模型
    [self bindModel];
}

#pragma mark - 懒加载
- (SJRegisterViewModel *)registerViewModel {
    if (_registerViewModel == nil) {
        _registerViewModel = [[SJRegisterViewModel alloc] init];
    }
    return _registerViewModel;
}

#pragma mark - 设置Nav
- (void)initNav {
    self.title = @"注册";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(tapRegisterBtn)];
    
}

#pragma mark - 绑定模型
- (void)bindModel {
    // 监听确定按钮点击状态
    RAC(self.navigationItem.rightBarButtonItem, enabled) = [RACSignal combineLatest:@[self.tfUsername.rac_textSignal,self.tfPassword.rac_textSignal] reduce:^id (NSString *username, NSString *password){
        if (username.length && password.length) {
            return @(YES);
        } else {
            return @(NO);
        }
    }];
}

#pragma mark - 点击注册按钮
- (void)tapRegisterBtn {
    [self showLoadingHUD];
    @weakify(self);
    [[self.registerViewModel.registerCommand execute:@[self.tfUsername.text, self.tfPassword.text]] subscribeNext:^(NSString *errorDescription) {
        @strongify(self);
        [self hideLoadingHUD];
        if (errorDescription) {
            [self showToastWithMessage:errorDescription];
        } else {
            [self showToastWithMessage:@"注册成功"];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
