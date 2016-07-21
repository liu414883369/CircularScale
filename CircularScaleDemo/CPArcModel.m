//
//  CPSpaceModel.m
//  CopyrightProtection
//
//  Created by liujianjian on 16/7/21.
//  Copyright © 2016年 rdg. All rights reserved.
//

#import "CPArcModel.h"

@implementation CPArcModel


/**
 *  设置弧度的宽和实际显示的宽2：3，设置2实际显示3
 */
- (void)setWidth:(CGFloat)width {
    _width = width * 2.0 / 3.0;
}
/**
 *  这个比例有点问题 不影响使用
 */
- (void)setRadius:(CGFloat)radius {
    _radius = radius * 2.0 / 3.0;
}


@end
