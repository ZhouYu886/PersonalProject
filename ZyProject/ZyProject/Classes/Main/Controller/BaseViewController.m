//
//  BaseViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 123123. All rights reserved.
//

#import "BaseViewController.h"
#import "ZYDengluViewController.h"
#import "ZyTabBarController.h"

@interface BaseViewController ()<UITabBarControllerDelegate>
@property (nonatomic, strong) ZyTabBarController *tabbarVC;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    //这里我判断的是当前点击的tabBarItem的标题
    if ([viewController.tabBarItem.title isEqualToString:@"社区"]) {
        //如果用户ID存在的话，说明已登陆
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        if ([userDefault objectForKey:@"id"]) {
            return YES;
        }
        else
        {
            //跳到登录页面
            ZYDengluViewController *login = [[ZYDengluViewController alloc] init];
          [((UINavigationController *)tabBarController.selectedViewController) presentViewController:login animated:YES completion:nil];
            login.hidesBottomBarWhenPushed = YES;
                       //在登陆界面判断登陆成功之后发送通知,将所选的TabbarItem传回,使用通知传值
                        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(logSelect:) name:@"logSelect" object:nil];
            return NO;
        }
    }
    else
        return YES;
}

- (void)logSelect:(NSNotification *)text
{
    _tabbarVC.selectedIndex = [text.userInfo[@"logSelect"] integerValue];
    
}

@end
