//
//  ZYDengluViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/19.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYDengluViewController.h"
#import "ZYZhuCeViewController.h"
#import "LCPNetWorkManager.h"
#import "ZYZhuCeViewController.h"
#import "ZYusModel.h"
#import "MBProgressHUD+XMG.h"
#import <MJExtension/MJExtension.h>
#import "ZYDengLuModel.h"

@interface ZYDengluViewController ()
@property (weak, nonatomic) IBOutlet UILabel *DLlabel;
@property (weak, nonatomic) IBOutlet UITextField *ZhangHao;

@property (weak, nonatomic) IBOutlet UITextField *MiMA;

@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UIButton *YanJing;
@property (weak, nonatomic) IBOutlet UIButton *DengLuBtn;

@end

@implementation ZYDengluViewController

- (void)viewWillAppear:(BOOL)animated{

    self.tabBarController.tabBar.hidden = YES;

}

- (void)viewWillDisappear:(BOOL)animated{

  self.tabBarController.tabBar.hidden = NO;

}


- (void)viewDidLoad {
    [super viewDidLoad];
 
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"LOGIN" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 40],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:104/255.0 blue:79/255.0 alpha:1.0]}];

        _DLlabel.attributedText = string;
    
    UIColor *color = [UIColor lightGrayColor];
    
    _ZhangHao.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入账号..." attributes:@{NSForegroundColorAttributeName: color}];
    
        _MiMA.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入密码..." attributes:@{NSForegroundColorAttributeName: color}];

     self.ImageView.userInteractionEnabled = YES;
    
    //1.创建清扫手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGes:)];
    //默认是向右清扫
    //设置清扫的方向
    //一个清扫手势只能对应一个方向
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    //2.添加手势
       [self.ImageView addGestureRecognizer:swipe];
    
    
    //写方法
    [_ZhangHao addTarget:self action:@selector(edingChange) forControlEvents:UIControlEventEditingChanged];
    
    //写方法
    [_MiMA addTarget:self action:@selector(editChange) forControlEvents:UIControlEventEditingChanged];

        NSUserDefaults *UserDefault = [NSUserDefaults standardUserDefaults];
        self.ZhangHao.text = [UserDefault objectForKey:@"phone"];
        self.MiMA.text = [UserDefault objectForKey:@"password"];
        if(self.ZhangHao.text.length == 0 || self.MiMA.text.length ==0){
    //        [MBProgressHUD showMessage:@"输入账号或密码"];
        }else{
            self.DengLuBtn.enabled = YES;
    //        [self LoginBtn:self];
        }
    

}

-(void)swipeGes:(UISwipeGestureRecognizer *)swipe
{
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        ZYZhuCeViewController *zc = [ ZYZhuCeViewController new];
        [self.navigationController pushViewController:zc animated:YES];
        
    }
    
    
}
- (IBAction)POP:(UIButton *)sender
{
    
//    [self.navigationController popViewControllerAnimated:YES];
    
}


- (IBAction)YanJing:(UIButton *)sender
{
    
    self.YanJing.selected = !self.YanJing.selected;
    if (self.YanJing.selected){
        self.MiMA.secureTextEntry = NO;
        [self.YanJing setImage:[UIImage imageNamed:@"ic_kejian"] forState:UIControlStateNormal];
    }else{
        self.MiMA.secureTextEntry = YES;
        [self.YanJing setImage:[UIImage imageNamed:@"ic_bukejian"] forState:UIControlStateNormal];
    }
}



- (IBAction)DengLu:(UIButton *)sender
{
      [MBProgressHUD showMessage:@"正在登录..." toView:self.view];
      
        NSDictionary *dict = @{
            @"phone" : self.ZhangHao.text,
            @"password" : self.MiMA.text,
            @"project" : @"future",
            @"code" : @"000000"
        };

        [LCPNetWorkManager getWithPathUrl:@"/system/login" parameters:dict queryParams:nil Header:nil success:^(BOOL success, id result)
         {
            [MBProgressHUD hideHUDForView:self.view];
            if ([result[@"success"] isEqualToNumber:@0]) {
                [MBProgressHUD hideHUDForView:self.view];
                [MBProgressHUD showError:result[@"msg"]];
            }
            
            ZYusModel *userM = [ZYusModel mj_objectWithKeyValues:result[@"data"]];
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:userM.album forKey:@"album"];
            [userDefaults setObject:userM.fansCount forKey:@"fansCount"];
            [userDefaults setObject:userM.followCount forKey:@"followCount"];
            [userDefaults setObject:userM.head forKey:@"head"];
            [userDefaults setObject:userM.id forKey:@"id"];
            [userDefaults setObject:userM.nickName forKey:@"nickName"];
            [userDefaults setObject:userM.password forKey:@"password"];
            [userDefaults setObject:userM.phone forKey:@"phone"];
            [userDefaults setObject:userM.projectKey forKey:@"projectKey"];
            [userDefaults setObject:userM.signature forKey:@"signature"];
            [userDefaults setObject:userM.talkCount forKey:@"talkCount"];
            [userDefaults setObject:userM.type forKey:@"type"];
            [userDefaults setObject:userM.uuid forKey:@"uuid"];
            NSLog(@"%@",userM.phone);
            
            self.tabBarController.selectedIndex = 3;
//          [self.navigationController popToRootViewControllerAnimated:self.tabBarController.selectedIndex =1];
        } failure:^(BOOL failuer, NSError *error) {
             [MBProgressHUD hideHUDForView:self.view];
             [MBProgressHUD showError:@"账户或密码错误"];
        }];
}



-(void)edingChange
{
    if(self.ZhangHao.text.length == 0 ) {
        self.DengLuBtn.enabled = NO;
    }else if (self.ZhangHao.text.length >11){
        self.ZhangHao.text = [self.ZhangHao.text substringToIndex:11];
    }else {
        self.DengLuBtn.enabled = YES;
    }
}

-(void)editChange
{
    if(self.MiMA.text.length == 0 ) {
        self.DengLuBtn.enabled = NO;
    }else if (self.MiMA.text.length >16){
        self.MiMA.text = [self.MiMA.text substringToIndex:16];
    }else {
        self.DengLuBtn.enabled = YES;
    }
}


@end
