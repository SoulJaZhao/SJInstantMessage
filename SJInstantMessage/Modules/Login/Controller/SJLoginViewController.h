//
//  SJLoginViewController.h
//  SDPPushClientObjC
//
//  Created by SDPMobile on 2017/11/27.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJBaseViewController.h"

@interface SJLoginViewController : SJBaseViewController
/**  登录操作 **/
@property (nonatomic, strong) RACCommand *loginCommand;
@end
