//
//  LoadMaskHelper.m
//  ZiPeiYi
//
//  Created by 刘成利 on 16/6/14.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "LoadMaskHelper.h"
#import "SingleMaskView.h"

#import "UIView+SetRect.h"



#define MaskVersiomKey       @"MaskVersiomKey"

#define HomePageKey          @"HomePage2.3.5"          // 主页 可用资产
#define RealIncomeKey        @"RealIncome2.3.5"        // ISM完成期详情 实际收益
#define StockTimesharingKey  @"StockTimesharing2.3.5"  // 股票分时图 



@implementation LoadMaskHelper

+ (void)showMaskWithType:(PageTye)pageType onView:(UIView*)view delay:(NSTimeInterval)delay{
    
    
    // 处理是否加载蒙版
    switch (pageType) {
            
            // 个人主页
        case HomePage:
        {
            NSString *KeyStr = [[NSUserDefaults standardUserDefaults] objectForKey:HomePageKey];
            if(KeyStr.length <=0)
            {
            
                [[NSUserDefaults standardUserDefaults] setObject:@"haveShown" forKey:HomePageKey];
            
            }else{
                
                // 测试用，让蒙版再次显示，任务完成后注释掉下面代码
                [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:HomePageKey];
                return;
            
            }
        
        }
           
        break;
            
            
            
   
            
        case RealIncome:
        {
            NSString *KeyStr = [[NSUserDefaults standardUserDefaults] objectForKey:RealIncomeKey];
            if(KeyStr.length <=0)
            {
                
                [[NSUserDefaults standardUserDefaults] setObject:@"haveShown" forKey:RealIncomeKey];
                
            }else{
                // 测试用，让蒙版再次显示，任务完成后注释掉下面代码
                [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:RealIncomeKey];
                return;
                
            }
            
        }

            break;
            
            
            
        case StockTimesharing:
        {
            NSString *KeyStr = [[NSUserDefaults standardUserDefaults] objectForKey:StockTimesharingKey];
            if(KeyStr.length <=0)
            {
                
                [[NSUserDefaults standardUserDefaults] setObject:@"haveShown" forKey:StockTimesharingKey];
                
            }else{
                
                // 测试用，让蒙版再次显示，任务完成后注释掉下面代码
                [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:StockTimesharingKey];
                return;
                
            }
            
        }
            
            break;
            
        default:
          break;
    }

    
    
    
    
    
    /*
     以下 项目真实使用案例
     */
    
    
    
    SingleMaskView *maskView = [SingleMaskView new];
    
    // 加载蒙版
    switch (pageType) {
        
          // 主页
        case HomePage:
        {
           
           // 添加第一个蒙版透明区
            [maskView addTransparentRect:CGRectMake(view.width-180, 205, 170, 50) withRadius:10];
            [maskView addImage:[UIImage imageNamed:@"首页引导"] withFrame:CGRectMake(view.width-220, 270, 210, 83)];
            
            // 添加第二个蒙版透明区
            [maskView addTransparentRect:CGRectMake(view.width/10, 400, view.width*4/5, 145) withRadius:10];
            [maskView addImage:[UIImage imageNamed:@"分时引导"] withFrame:CGRectMake((view.width-103)/2, 560, 267 , 83)];
        }
            break;
       
            
            
        // 实际收益
        case RealIncome:
        {
            [maskView addTransparentRect:CGRectMake(view.width/5, 100, view.width/5*3, 60) withRadius:10];
            [maskView addImage:[UIImage imageNamed:@"组合收益"] withFrame:CGRectMake((view.width)/4, 170, 172 , 83)];
        }
            break;
          
            
        // 曲线分时
        case StockTimesharing:
        {
            [maskView addTransparentRect:CGRectMake(view.width/10, 305, view.width*4/5, 145) withRadius:10];
            [maskView addImage:[UIImage imageNamed:@"分时引导"] withFrame:CGRectMake((view.width-103)/2, 460, 267 , 83)];
        }
            break;

            
            
        default:
            break;
    }
    
    
    // GCD 延时，非阻塞主线程 延时时间：delay
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC));
    
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        
        [maskView showMaskViewInView:view];
        
    });
        
    
   
    
   


}


// 由于每一版app蒙版不一样，新版app自己删除旧版app蒙版代码，即可不用下面的方法
+ (void)checkAPPVersion{

    
    /*
     
     
    // 启动时候检测，版本升级   (在app delegate 调用此类的方法);
     
    NSString *KeyStr = [[NSUserDefaults standardUserDefaults] objectForKey:MaskVersiomKey];
    if (KeyStr.length <=0) {
        
        // 头一次安装
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        [[NSUserDefaults standardUserDefaults] setObject:appVersion forKey:MaskVersiomKey];
        
        return;
    }else{
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        
        if ([KeyStr isEqualToString:appVersion])
        {
            return;
            
        }else{
            // 版本升级的情况
            [[NSUserDefaults standardUserDefaults] setObject:appVersion forKey:MaskVersiomKey];
            
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:HomePageKey];
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:VtSIAIKey];
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:VtISMKey];
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:VtSIAIKeyListKey];
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:VtISMKeyListKey];
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:SIAIInstructionKey];
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:ISMInstructionKey];
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:StockCurveKey];
            
        }
        
    }
    
     
     
     */


}
@end
