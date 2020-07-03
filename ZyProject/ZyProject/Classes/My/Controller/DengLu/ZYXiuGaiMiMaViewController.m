//
//  ZYXiuGaiMiMaViewController.m
//  ZyProject
//
//  Created by apple on 2020/7/2.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYXiuGaiMiMaViewController.h"
#import "ZYChongZhiMiMaViewController.h"
#import "userModel.h"
#import "ZYusModel.h"
#import "MBProgressHUD+XMG.h"
#import <MJExtension/MJExtension.h>

@interface ZYXiuGaiMiMaViewController ()
@property (weak, nonatomic) IBOutlet UILabel *loginllabel;
@property (weak, nonatomic) IBOutlet UITextField *zhanghaoTextf;
@property (weak, nonatomic) IBOutlet UITextField *YanZhengMaTxteF;

@property (weak, nonatomic) IBOutlet UITextField *MimaTetxF;
@property (weak, nonatomic) IBOutlet UITextField *QueRenMimatextF;
@property (weak, nonatomic) IBOutlet UIButton *YanJing;
@property (weak, nonatomic) IBOutlet UIButton *BYanJing;
@property (weak, nonatomic) IBOutlet UIButton *TxYanZhengMa;

@property (weak, nonatomic) IBOutlet UIButton *DengLu;
@end

@implementation ZYXiuGaiMiMaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //写方法
    [_zhanghaoTextf addTarget:self action:@selector(editChange) forControlEvents:UIControlEventEditingChanged];
    //写方法
    [_MimaTetxF addTarget:self action:@selector(editChangeA) forControlEvents:UIControlEventEditingChanged];
    
    //写方法
    [_QueRenMimatextF addTarget:self action:@selector(editChangeB) forControlEvents:UIControlEventEditingChanged];
    
}
- (void)editChange {
        if(self.zhanghaoTextf.text.length == 0 ) {
//            self.QueDing.enabled = NO;
        }else if (self.zhanghaoTextf.text.length >11){
            self.zhanghaoTextf.text = [self.zhanghaoTextf.text substringToIndex:11];
        }else {
//            self.QueDing.enabled = YES;
        }
}

-(void)editChangeA{
    if(self.MimaTetxF.text.length == 0 ) {
    //            self.QueDing.enabled = NO;
            }else if (self.MimaTetxF.text.length >10){
                self.MimaTetxF.text = [self.MimaTetxF.text substringToIndex:10];
            }else {
    //            self.QueDing.enabled = YES;
            }
}

-(void)editChangeB{
    if(self.QueRenMimatextF.text.length == 0 ) {
    //            self.QueDing.enabled = NO;
            }else if (self.QueRenMimatextF.text.length >10){
                self.QueRenMimatextF.text = [self.QueRenMimatextF.text substringToIndex:10];
            }else {
    //            self.QueDing.enabled = YES;
            }
}



- (IBAction)yanJing:(UIButton *)sender
{
    self.YanJing.selected = !self.YanJing.selected;
    if (self.YanJing.selected){
        self.MimaTetxF.secureTextEntry = NO;
        [self.YanJing setImage:[UIImage imageNamed:@"ic_kejian"] forState:UIControlStateNormal];
    }else{
        self.MimaTetxF.secureTextEntry = YES;
        [self.YanJing setImage:[UIImage imageNamed:@"ic_bukejian"] forState:UIControlStateNormal];
    }
    
}
- (IBAction)DengLu:(UIButton *)sender
{
    [MBProgressHUD showMessage:@"正在登录..." toView:self.view];
    
      NSDictionary *dict = @{
            @"phone" : self.zhanghaoTextf.text,
            @"newPassword" : self.MimaTetxF.text,
            @"confirmPassword" : self.QueRenMimatextF.text,
            @"project" : @"futures",
            @"code" : self.YanZhengMaTxteF.text,
            @"type" : @(3)
        };

         [LCPNetWorkManager postWithPathUrl:@"/system/resetPassword" parameters:nil queryParams:dict Header:nil success:^(BOOL success, id result)
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
              [self.navigationController popViewControllerAnimated:YES];
          } failure:^(BOOL failuer, NSError *error) {
              NSLog(@"ERROR:%@",error);
               [MBProgressHUD hideHUDForView:self.view];
               [MBProgressHUD showError:@"验证码或账号错误"];
          }];
    
}


- (IBAction)BYanJing:(UIButton *)sender
{
    self.BYanJing.selected = !self.BYanJing.selected;
    if (self.BYanJing.selected){
        self.QueRenMimatextF.secureTextEntry = NO;
        [self.BYanJing setImage:[UIImage imageNamed:@"ic_kejian"] forState:UIControlStateNormal];
    }else{
        self.QueRenMimatextF.secureTextEntry = YES;
        [self.BYanJing setImage:[UIImage imageNamed:@"ic_bukejian"] forState:UIControlStateNormal];
    }
}

- (IBAction)TXyanzhengMa:(UIButton *)sender
{
    ZYChongZhiMiMaViewController *ChongZhi = [ZYChongZhiMiMaViewController new];
       ZYusModel *userm = [[ZYusModel alloc]init];
    userm.phone = _zhanghaoTextf.text;
    userm.projectKey = _Project;
    ChongZhi.userM = userm;
    ChongZhi.logType = @"3";
    [self presentViewController:ChongZhi animated:YES completion:nil];
}


@end
