//
//  ViewController.m
//  SingleMask
//
//  Created by 刘成利 on 2016/6/13.
//  Copyright © 2016年 刘成利. All rights reserved.
//

#import "ViewController.h"
#import "LoadMaskHelper.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    // 蒙版透明区和图片适配根据个人项目适配方式添加（个人是乘以比率，未加入代码中）
    
    
    // 主页蒙版
    [LoadMaskHelper showMaskWithType:HomePage onView:self.view delay:0.5];
    
//    // 其他页面蒙版1
//    [LoadMaskHelper showMaskWithType:RealIncome onView:self.view delay:0.5];
//    
//    // 其他页面蒙版2
//    [LoadMaskHelper showMaskWithType:StockTimesharing onView:self.view delay:1.5];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
