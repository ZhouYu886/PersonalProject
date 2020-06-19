//
//  ZYGuanYuWoMenViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/18.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYGuanYuWoMenViewController.h"
#import "ZYGenXinViewController.h"
#import "ZYFanKuiViewController.h"

@interface ZYGuanYuWoMenViewController ()
@property (weak, nonatomic) IBOutlet UIView *GengXin;
@property (weak, nonatomic) IBOutlet UIView *FanKui;

@end

@implementation ZYGuanYuWoMenViewController


- (void)viewWillAppear:(BOOL)animated{

//    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = NO;
    
//    self.navigationController.navigationBar.opaque = YES;
    self.navigationController.navigationBar.translucent = NO;

}

//- (void)viewWillDisappear:(BOOL)animated{
//
//  self.tabBarController.tabBar.hidden = NO;
//
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置界面标题
    self.title = @"关于我们";
    
    //添加点击方法
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GengXinPsuh)];
    
    //添加点击
    self.GengXin.userInteractionEnabled = YES;
    
    //imagePush添加到tap中
    [self.GengXin addGestureRecognizer:tap];
    
    //添加点击方法
    UITapGestureRecognizer *tapa = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(FanKuiPsuh)];
    
    //添加点击
    self.FanKui.userInteractionEnabled = YES;
    
    //imagePush添加到tap中
    [self.FanKui addGestureRecognizer:tapa];
    
    
    
    //    设置导航条标题颜色
       [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
       self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //设置左边返回
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    //适应大小
    [btn sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
}

//设置左边点击返回上一级
-(void)leftClick
{
    //返回上一级
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)GengXinPsuh
{
        ZYGenXinViewController *GX = [[ZYGenXinViewController alloc]init];

     [self presentViewController:GX animated:YES completion:nil];
}

-(void)FanKuiPsuh
{
    ZYFanKuiViewController *pushfk = [ZYFanKuiViewController new];
    [self.navigationController pushViewController:pushfk animated:YES];
    
}


@end
