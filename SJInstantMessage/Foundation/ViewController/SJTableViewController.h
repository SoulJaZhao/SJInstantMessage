//
//  SJTableViewController.h
//  SDPPushClientObjC
//
//  Created by SDPMobile on 2017/11/27.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJBaseViewController.h"
//Private
#import "SJLoginViewController.h"
#import "SJNavigationController.h"

@interface SJTableViewController : SJBaseViewController
/**  tableView **/
@property (nonatomic, strong) UITableView *tableView;

#pragma mark - 唤起登录
- (void)gotoLogin;
@end
