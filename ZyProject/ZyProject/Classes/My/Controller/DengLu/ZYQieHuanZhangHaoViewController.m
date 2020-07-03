//
//  ZYQieHuanZhangHaoViewController.m
//  ZyProject
//
//  Created by apple on 2020/7/1.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYQieHuanZhangHaoViewController.h"
#import "ZYDengluViewController.h"

@interface ZYQieHuanZhangHaoViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *txImage;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *gxqmlabel;

@end

@implementation ZYQieHuanZhangHaoViewController

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
    
    self.title = @"切换账号";
    self.txImage.layer.cornerRadius = 20;
   //设置左边返回
      UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
      [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
      [btn addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
      //适应大小
      [btn sizeToFit];
      self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    NSUserDefaults *userDefautlt = [NSUserDefaults standardUserDefaults];    if([userDefautlt objectForKey:@"id"]){
        self.NameLabel.text = [NSString stringWithFormat:@"%@",[userDefautlt objectForKey:@"nickName"]];
        self.gxqmlabel.text = [NSString stringWithFormat:@"%@",[userDefautlt objectForKey:@"signature"]];
        NSData *data = [userDefautlt objectForKey:@"headerImage"];
            self.txImage.image = [UIImage imageWithData:data];
}
    
}

- (IBAction)TianJiaZhangHao:(UIButton *)sender
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault removeObjectForKey:@"phone"];
//    [userDefault removeObjectForKey:@"id"];
    [userDefault removeObjectForKey:@"password"];
    ZYDengluViewController *Dl = [ZYDengluViewController new];
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController pushViewController:Dl animated:YES];
}

//左边返回
-(void)leftClick
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (IBAction)TuiChuBtn:(UIButton *)sender
{
    //点击按钮执行的代码
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault removeObjectForKey:@"phone"];
    [userDefault removeObjectForKey:@"id"];
    [userDefault removeObjectForKey:@"password"];
    ZYDengluViewController *Dl = [ZYDengluViewController new];
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController pushViewController:Dl animated:YES];
    
}

@end
