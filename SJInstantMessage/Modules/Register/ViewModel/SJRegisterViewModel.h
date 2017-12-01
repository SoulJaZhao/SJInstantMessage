//
//  SJRegisterViewModel.h
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/11/29.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJBaseViewModel.h"
//Private
#import "SJRegisterModel.h"

@interface SJRegisterViewModel : SJBaseViewModel
/**  登录操作 **/
@property (nonatomic, strong) RACCommand *registerCommand;
/**  注册模型 **/
@property (nonatomic, strong) SJRegisterModel *registerModel;
/**  是否允许登录 **/
@property (nonatomic, strong) RACSignal *registerEnableSignal;
@end
