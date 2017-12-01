//
//  SJLoginViewModel.h
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/11/28.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJBaseViewModel.h"
// Private
#import "SJLoginModel.h"

@interface SJLoginViewModel : SJBaseViewModel
/**  登录信号 **/
@property (nonatomic, strong) RACCommand *loginCommand;

/**  登录模型 **/
@property (nonatomic, strong) SJLoginModel *loginModel;

/**  是否允许登录 **/
@property (nonatomic, strong) RACSignal *loginEnableSignal;
@end
