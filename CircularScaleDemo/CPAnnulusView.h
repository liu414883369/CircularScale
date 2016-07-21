//
//  CPCycleScaleView.h
//  CopyrightProtection
//
//  Created by liujianjian on 16/7/21.
//  Copyright © 2016年 rdg. All rights reserved.
//  环形

#import <UIKit/UIKit.h>
@class CPArcModel;

@interface CPAnnulusView : UIView

/**
 *  弧度模型数组
 */
@property (nonatomic, strong)NSArray<CPArcModel *> *arcs;

@end
