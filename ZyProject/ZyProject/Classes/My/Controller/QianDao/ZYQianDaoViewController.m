//
//  ZYQianDaoViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/19.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYQianDaoViewController.h"
#import "ZYQDCGViewController.h"

@interface ZYQianDaoViewController ()
@property (weak, nonatomic) IBOutlet UIButton *QDBtn;

@end

@implementation ZYQianDaoViewController

- (void)viewWillAppear:(BOOL)animated{

    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = NO;
    
    self.navigationController.navigationBar.translucent = NO;

}

- (void)viewWillDisappear:(BOOL)animated{

  self.tabBarController.tabBar.hidden = NO;

}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    //设置界面标题
    self.title = @"签到";
    
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



- (IBAction)QD:(UIButton *)sender
{
    ZYQDCGViewController *QDCG = [[ZYQDCGViewController alloc]init];
    [self presentViewController:QDCG animated:YES completion:nil];
    
}


- (IBAction)YiCi:(UIButton *)sender
{
    self.QDBtn.enabled = NO;
    
}

@end
