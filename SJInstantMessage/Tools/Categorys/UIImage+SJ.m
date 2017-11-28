//
//  UIImage+SJ.m
//  SDPPushClientObjC
//
//  Created by SDPMobile on 2017/11/27.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "UIImage+SJ.h"

@implementation UIImage (SJ)

#pragma mark - 通过颜色创建图片
+ (UIImage *)sj_imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // 开启上下文
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
