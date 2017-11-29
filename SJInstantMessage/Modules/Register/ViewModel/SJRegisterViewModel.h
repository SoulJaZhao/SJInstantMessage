//
//  SJRegisterViewModel.h
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/11/29.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJBaseViewModel.h"

@interface SJRegisterViewModel : SJBaseViewModel
/**  登录操作 **/
@property (nonatomic, strong) RACCommand *registerCommand;
@end
