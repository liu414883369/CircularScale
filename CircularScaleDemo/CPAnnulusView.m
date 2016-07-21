//
//  CPCycleScaleView.m
//  CopyrightProtection
//
//  Created by liujianjian on 16/7/21.
//  Copyright © 2016年 rdg. All rights reserved.
//

#import "CPAnnulusView.h"
#import "CPArcModel.h"

/**
 *  角度转换成弧度
 */
#define k_DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
/**
 *  弧度转角度
 */
#define k_RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))

#define k_ProgressLabel_Width  80.0
#define k_ProgressLabel_Height 20.0
// 调整圆环和文字距离
#define k_Radius_Coefficient   1.1

@interface CPAnnulusView()
@property (nonatomic, strong)UIBezierPath *bezierPath;

@end

@implementation CPAnnulusView

- (UIBezierPath *)bezierPath {
    if (!_bezierPath) {
        CPArcModel *model = self.arcs[0];
        _bezierPath = [UIBezierPath bezierPathWithArcCenter:self.center
                                                     radius:model.radius
                                                 startAngle:0
                                                   endAngle:M_PI * 2
                                                  clockwise:NO];
    }
    return _bezierPath;
}
- (void)setArcs:(NSArray<CPArcModel *> *)arcs {
    _arcs = arcs;
    CGFloat strokeStart = 0.0f;
    for (CPArcModel *model in arcs) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = self.bezierPath.CGPath;
        shapeLayer.strokeColor = model.color.CGColor; // 弧度颜色
        shapeLayer.fillColor = [UIColor clearColor].CGColor; // 内部填充色
        shapeLayer.lineWidth = model.width; // 线宽
        shapeLayer.lineCap = kCALineCapButt;
        shapeLayer.strokeStart = strokeStart;
        shapeLayer.strokeEnd = model.progress + strokeStart; // 占圆环的比例
        [self.layer addSublayer:shapeLayer];
        
        [self setupLabelWithModel:model strokeStart:strokeStart]; // 添加label
        
        strokeStart = shapeLayer.strokeEnd;
    }
}

- (void)setupLabelWithModel:(CPArcModel *)model strokeStart:(CGFloat)strokeStart {
    
    CGFloat angle = 360 * (strokeStart + model.progress / 2.0); // 角度
    CGFloat radius = model.radius * k_Radius_Coefficient;
    CGFloat radians = 0; // 初始化弧度
    CGFloat x = 0;
    CGFloat y = 0;
    CGPoint point = self.center;
    NSTextAlignment textAlignment = NSTextAlignmentLeft;
    
    if (angle <= 90) {
        textAlignment = NSTextAlignmentLeft;
        radians = k_DEGREES_TO_RADIANS(angle); // 角度转成弧度
        CGFloat currentX = cos(radians) * radius;
        CGFloat currentY = sin(radians) * radius;
        x = point.x + currentX;
        y = point.y - currentY - k_ProgressLabel_Height;
        
    } else if (angle <= 180) {
        textAlignment = NSTextAlignmentRight;
        radians = k_DEGREES_TO_RADIANS(180 - angle);
        CGFloat currentX = cos(radians) * radius;
        CGFloat currentY = sin(radians) * radius;
        x = point.x - currentX - k_ProgressLabel_Width;
        y = point.y - currentY - k_ProgressLabel_Height;
        
    } else if (angle <= 270) {
        textAlignment = NSTextAlignmentRight;
        radians = k_DEGREES_TO_RADIANS(angle - 180);
        CGFloat currentX = cos(radians) * radius;
        CGFloat currentY = sin(radians) * radius;
        x = point.x - currentX - k_ProgressLabel_Width;
        y = point.y + currentY;
        
    } else {
        textAlignment = NSTextAlignmentLeft;
        radians = k_DEGREES_TO_RADIANS(360 - angle);
        CGFloat currentX = cos(radians) * radius;
        CGFloat currentY = sin(radians) * radius;
        x = point.x + currentX;
        y = point.y + currentY;
    }
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, k_ProgressLabel_Width, k_ProgressLabel_Height)];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = textAlignment;
    label.textColor = model.color;
    label.text = [NSString stringWithFormat:@"比例：%.2f%%", model.progress * 100.0];
    label.font = [UIFont systemFontOfSize:10];
    [self addSubview:label];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
