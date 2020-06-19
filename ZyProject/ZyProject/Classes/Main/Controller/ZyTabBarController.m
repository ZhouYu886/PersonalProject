//
//  ZyTabBarController.m
//  ZyProject
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZyTabBarController.h"
#import "ZYMyViewController.h"
#import "ZYShouYeViewController.h"
#import "ZYSheQuViewController.h"
#import "ZYZiXunViewController.h"
#import "ZYNavigationController.h"


@interface ZyTabBarController ()<UITabBarControllerDelegate>

@end
#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define kScaleFrom_iPhone6_Desgin(_X_) (_X_ * (SCREEN_WIDTH/375))

@implementation ZyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self add];
//    设置tabbar的字体颜色
//    self.tabBar.tintColor = [UIColor colorWithRed:242 / 255.0 green:202 / 255.0 blue:140 / 255.0 alpha:1];
    
    self.delegate = self;

}

-(void)add{
    
    ZYShouYeViewController *V1 = [[ZYShouYeViewController alloc] init];
        ZYNavigationController *Naviga = [[ZYNavigationController alloc]initWithRootViewController:V1];
        Naviga.tabBarItem.title = @"首页";
        Naviga.tabBarItem.image = [UIImage imageNamed:@"ic_shouye"];
        Naviga.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_shouye_sel"];
    //    TGNavController *nav = [[TGNavController alloc]initWithRootViewController:V1];
        [self addChildViewController:Naviga];
        
        ZYSheQuViewController *V2 = [[ZYSheQuViewController alloc] init];
        ZYNavigationController *Naviga2 = [[ZYNavigationController alloc]initWithRootViewController:V2];
        Naviga2.tabBarItem.title = @"社区";
        Naviga2.tabBarItem.image = [UIImage imageNamed:@"ic_shequ"];
        Naviga2.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_shequ_sel"];
        [self addChildViewController:Naviga2];
       
        
        ZYZiXunViewController *V4 = [[ZYZiXunViewController alloc] init];
    ZYNavigationController *Naviga3 = [[ZYNavigationController alloc]initWithRootViewController:V4];

        Naviga3.tabBarItem.title = @"资讯";
        Naviga3.tabBarItem.image = [UIImage imageNamed:@"ic_zixun"];
        Naviga3.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_zixun_sel"];
    //    TGNavController *nav4 = [[TGNavController alloc]initWithRootViewController:V4];
        [self addChildViewController:Naviga3];
        
        ZYMyViewController *V5 = [[ZYMyViewController alloc] init];
        ZYNavigationController *Naviga4 = [[ZYNavigationController alloc]initWithRootViewController:V5];
        Naviga4.tabBarItem.title = @"我的";
        Naviga4.tabBarItem.image = [UIImage imageNamed:@"ic_wode"];
        Naviga4.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_wode_sel"];
        [self addChildViewController:Naviga4];
        
        //    设置tabbar的背景颜色
        [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    //    设置tabbar的字体颜色
            self.tabBar.tintColor = [UIColor colorWithRed:242 / 255.0 green:202 / 255.0 blue:140 / 255.0 alpha:1];
    
}







@end
