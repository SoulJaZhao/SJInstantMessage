//
//  SJCircleView.m
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/12/4.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJCircleView.h"
@interface SJCircleView()

@end

@implementation SJCircleView
#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initCircle:self.bounds];
    }
    return self;
}

#pragma mark - 设置Circle
- (void)initCircle:(CGRect)rect {
    // 设置子视图
    CAShapeLayer *shaperLayer = [CAShapeLayer layer];
    shaperLayer.fillColor = [UIColor clearColor].CGColor;
    shaperLayer.strokeColor = [UIColor greenColor].CGColor;
    shaperLayer.lineWidth = 1.0f;
    shaperLayer.frame = rect;
    
    // 构建路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    shaperLayer.path = path.CGPath;
    // 起始点
    shaperLayer.strokeStart = 0.0;
    // 结束点
    shaperLayer.strokeEnd = 0.0;
    [self.layer addSublayer:shaperLayer];
    _shapeLayer = shaperLayer;
}

#pragma mark - 设置圆弧
- (void)setStrokeEndValue:(CGFloat)strokeEndValue {
    if (strokeEndValue <= 0.0) {
        strokeEndValue = 0.0;
    } else if (strokeEndValue >= 1) {
        strokeEndValue = 1;
    }
    _shapeLayer.strokeEnd = strokeEndValue;
}

#pragma mark - 添加旋转动画
- (void)addRotationAnimation {
    _shapeLayer.strokeEnd = 0.8;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.duration = 5.0f; //设定动画持续时间
    animation.repeatCount = MAXFLOAT; // 重复次数
    animation.byValue = @(M_PI * 2); //设定旋转角度，单位是弧度
    animation.fillMode = kCAFillModeForwards; //设定动画结束后，不恢复初始状态之设置一
    animation.removedOnCompletion = NO; //设定动画结束后，不恢复初始状态之设置二
    [_shapeLayer addAnimation:animation forKey:nil];
}
@end
