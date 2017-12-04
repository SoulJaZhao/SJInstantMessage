//
//  SJCircleView.h
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/12/4.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJCircleView : UIView
/**  弧度结束 **/
@property (nonatomic, assign) CGFloat strokeEndValue;

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

/**  添加旋转动画 **/
- (void)addRotationAnimation;
@end
