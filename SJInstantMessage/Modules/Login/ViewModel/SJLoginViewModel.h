//
//  SJLoginViewModel.h
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/11/28.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJBaseViewModel.h"

@interface SJLoginViewModel : SJBaseViewModel
/**  登录信号 **/
@property (nonatomic, strong) RACCommand *loginCommand;
@end
