//
//  ZYYingSiViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/19.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYYingSiViewController.h"

@interface ZYYingSiViewController ()

@end

@implementation ZYYingSiViewController

- (void)viewWillAppear:(BOOL)animated
{
     self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置界面标题
    self.title = @"隐私政策";
    
       //    设置导航条标题颜色
          [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
          self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
          
      //设置导航栏颜色
       self.navigationController.navigationBar.barTintColor = RGB(44, 48, 52);
  
    //设置左边点击返回
     UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
     [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
     [btn addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
     //适应大小
     [btn sizeToFit];
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
}
//左边返回
-(void)leftClick
{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
