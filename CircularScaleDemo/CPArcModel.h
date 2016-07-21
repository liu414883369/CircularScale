//
//  CPSpaceModel.h
//  CopyrightProtection
//
//  Created by liujianjian on 16/7/21.
//  Copyright © 2016年 rdg. All rights reserved.
//  弧度模型

#import <UIKit/UIKit.h>

@interface CPArcModel : NSObject
/**
 *  颜色
 */
@property (nonatomic, strong)UIColor *color;
/**
 *  宽度
 */
@property (nonatomic, assign)CGFloat width;
/**
 *  比例
 */
@property (nonatomic, assign)CGFloat progress;
/**
 *  半径
 */
@property (nonatomic, assign)CGFloat radius;


@end
