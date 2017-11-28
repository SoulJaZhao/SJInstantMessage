//
//  SJBaseViewController.h
//  SDPPushClientObjC
//
//  Created by SDPMobile on 2017/11/24.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import <UIKit/UIKit.h>
//第三方库
#import <ReactiveObjC/ReactiveObjC.h>
#import <ReactiveObjC/RACEXTScope.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <YYModel/YYModel.h>

//引入宏
#import "SJAppFunc.h"

@interface SJBaseViewController : UIViewController

/**
 *  显示纯文本Toast
 *
 *  @param message 文本内容
 *
 */
- (void)showToastWithMessage:(NSString *)message;

/**
 *  显示Loading视图(普通样式:菊花)
 */
- (void)showLoadingHUD;

/**
 *  隐藏Loading视图
 */
- (void)hideLoadingHUD;

/**
 *  显示带文案的Loading视图 参数可为空
 *
 *  @param title       普通文案
 *  @param detailTitle 详细文案
 *
 */
- (void)showLoadingHUDWithTitle:(NSString *)title
                    detailTitle:(NSString *)detailTitle;

/**
 *  显示环形Loading视图 可以控制持续时间 单位:秒
 *
 *  @param duration    持续时间 单位:秒
 *  @param title       普通文案
 *  @param detailTitle 详细文案
 *
 */
- (void)showLoadingHUDWithDuration:(NSTimeInterval)duration
                             Title:(NSString *)title
                       detailTitle:(NSString *)detailTitle;

/**
 *  显示条状Loading视图 可以控制持续时间 单位:秒
 *
 *  @param duration    持续时间 单位:秒
 *  @param title       普通文案
 *  @param detailTitle 详细文案
 *
 */
- (void)showBarLoadingHUDWithDuration:(NSTimeInterval)duration
                                Title:(NSString *)title
                          detailTitle:(NSString *)detailTitle;
@end
