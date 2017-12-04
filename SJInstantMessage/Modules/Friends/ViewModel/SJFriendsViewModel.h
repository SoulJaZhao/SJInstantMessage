//
//  SJFriendsViewModel.h
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/12/1.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJBaseViewModel.h"

@interface SJFriendsViewModel : SJBaseViewModel <UITableViewDataSource>
/**  请求数据接口 **/
@property (nonatomic, strong) RACCommand *requestFreidnsCommand;
/**  获取朋友 **/
@property (nonatomic, strong, readonly) NSArray *friends;
@end
