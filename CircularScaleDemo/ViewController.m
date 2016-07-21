//
//  ViewController.m
//  CircularScaleDemo
//
//  Created by liujianjian on 16/7/21.
//  Copyright © 2016年 rdg. All rights reserved.
//

#import "ViewController.h"
#import "CPAnnulusView.h"
#import "CPArcModel.h"

/**
 *  屏幕的宽度
 */
#define k_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
/**
 *  屏幕的高度
 */
#define k_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
/**
 *  随机颜色
 */
#define UIColorWithRandom [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CPAnnulusView *cycleView = [[CPAnnulusView alloc] initWithFrame:CGRectMake(0, 0, k_SCREEN_WIDTH, 220)];
    cycleView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:cycleView];
    
    //    NSArray *progresses = @[@"0.2", @"0.1", @"0.4", @"0.1", @"0.2"];
    NSArray *progresses = @[@"0.3", @"0.3", @"0.1", @"0.3"];
    
    NSMutableArray *mutArr = [NSMutableArray array];
    
    for (int i = 0; i < progresses.count; i++) {
        CPArcModel *model = [[CPArcModel alloc] init];
        model.color       = UIColorWithRandom;
        model.width       = 20.0;
        model.progress    = [progresses[i] floatValue];
        model.radius      = 75.0;
        [mutArr addObject:model];
    }
    [cycleView setArcs:mutArr];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    
}




@end
