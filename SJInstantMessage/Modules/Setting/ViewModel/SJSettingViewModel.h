//
//  SJSettingViewModel.h
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/12/1.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJBaseViewModel.h"

@interface SJSettingViewModel : SJBaseViewModel <UITableViewDataSource>
/**  执行退出操作 **/
@property (nonatomic, strong) RACCommand *logoutCommand;
@end
