//
//  SJAddFriendsViewModel.h
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/12/4.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJBaseViewModel.h"
// Private
#import "SJAddFriend.h"

@interface SJAddFriendsViewModel : SJBaseViewModel
@property (nonatomic, strong) SJAddFriend *addFriend;

/**  是否允许点击按钮 **/
@property (nonatomic, strong) RACSignal *addFriendEnableSignal;
/**  添加命令 **/
@property (nonatomic, strong) RACCommand *addFriendCommand;
@end
