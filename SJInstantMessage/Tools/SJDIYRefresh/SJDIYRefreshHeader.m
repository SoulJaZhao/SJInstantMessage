//
//  SJDIYRefreshHeader.m
//  SJInstantMessage
//
//  Created by SDPMobile on 2017/12/4.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJDIYRefreshHeader.h"
#import "SJCircleView.h"

typedef NS_ENUM(NSInteger, SJDIYRefreshHeaderRefreshedStatus) {
    SJDIYRefreshHeaderRefreshedStatusNone = 0, // 未曾刷新过
    SJDIYRefreshHeaderRefreshedStatusRefreshed = 1 // 已经刷新过
};

@interface SJDIYRefreshHeader()
/**  绘制圆环图 **/
@property (nonatomic, strong) SJCircleView *drawCircleView;

/**  滚动的圆环图 **/
@property (nonatomic, strong) SJCircleView *animationCircleView;

/**  是否刷新过 **/
@property (nonatomic, assign) SJDIYRefreshHeaderRefreshedStatus refreshedStatus;
@end

@implementation SJDIYRefreshHeader
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare {
    [super prepare];
    // 添加组件
    [self initSubviews];
}

#pragma mark - 添加组件
- (void)initSubviews {
    _drawCircleView = [[SJCircleView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    _drawCircleView.shapeLayer.strokeColor = [UIColor colorWithRed:106/255.0 green:186/255.0 blue:63/255.0 alpha:1.0].CGColor;
    [self addSubview:_drawCircleView];
    
    _animationCircleView = [[SJCircleView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    _animationCircleView.shapeLayer.strokeColor = [UIColor colorWithRed:106/255.0 green:186/255.0 blue:63/255.0 alpha:1.0].CGColor;
    [self addSubview:_animationCircleView];
    
    self.refreshedStatus = SJDIYRefreshHeaderRefreshedStatusNone;//初始化的时候，肯定是没有刷新过的
}

#pragma mark - 放置组件的位置
-(void)placeSubviews {
    [super placeSubviews];
    _drawCircleView.center = CGPointMake(self.mj_w / 2.0, self.mj_h / 2.0);
    _animationCircleView.center = CGPointMake(self.mj_w / 2.0, self.mj_h / 2.0);
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state {
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            self.drawCircleView.hidden = NO;
            self.animationCircleView.hidden = YES;
            break;
        case MJRefreshStatePulling:
            break;
        case MJRefreshStateRefreshing:
            // 关闭隐式动画
            [CATransaction begin];
            [CATransaction setDisableActions:YES];
            self.drawCircleView.hidden = YES;
            [CATransaction commit];
            self.animationCircleView.hidden = NO;
            [_animationCircleView addRotationAnimation];
            // 刷新过
            self.refreshedStatus = SJDIYRefreshHeaderRefreshedStatusRefreshed;
            break;
        default:
            break;
    }
}

- (void)setPullingPercent:(CGFloat)pullingPercent
{
    if (self.refreshedStatus == SJDIYRefreshHeaderRefreshedStatusRefreshed) {
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        [_drawCircleView setStrokeEndValue:1.0];
        [CATransaction commit];
        self.refreshedStatus = SJDIYRefreshHeaderRefreshedStatusNone;
    } else {
        self.drawCircleView.strokeEndValue = pullingPercent;
    }    
}

- (void)endRefreshing{
    [self.animationCircleView.layer removeAllAnimations];
    [super endRefreshing];
}

@end
