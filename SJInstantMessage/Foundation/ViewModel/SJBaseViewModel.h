//
//  SJBaseViewModel.h
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/11/28.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import <Foundation/Foundation.h>
// 第三方
#import <ReactiveObjC/ReactiveObjC.h>
#import <ReactiveObjC/RACEXTScope.h>
#import <HyphenateLite/HyphenateLite.h>

//Private
#import "SJBaseViewController.h"

@interface SJBaseViewModel : NSObject
/**  控制器 **/
@property (nonatomic, weak) SJBaseViewController *controller;

/*
 *  初始化方法
 *  @param  controller    控制器
 */
- (instancetype)initWithController:(SJBaseViewController *)controller;
@end
