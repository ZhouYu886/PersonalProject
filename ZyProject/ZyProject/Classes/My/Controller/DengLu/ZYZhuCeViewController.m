//
//  ZYZhuCeViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/19.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYZhuCeViewController.h"
#import "ZYTXYZMViewController.h"
#import "MBProgressHUD+XMG.h"
#import "LCPNetWorkManager.h"
#import "ZYusModel.h"
#import <MJExtension/MJExtension.h>
#import "ZYMyViewController.h"

@interface ZYZhuCeViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *ZhuCe;
@property (weak, nonatomic) IBOutlet UITextField *PhonTetx;
@property (weak, nonatomic) IBOutlet UITextField *YanZhenMaText;
@property (weak, nonatomic) IBOutlet UITextField *MiMaText;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UIButton *YangJing;
@property (weak, nonatomic) IBOutlet UIButton *ZC;




@end

@implementation ZYZhuCeViewController

- (void)viewWillAppear:(BOOL)animated{

    self.tabBarController.tabBar.hidden = YES;

}

- (void)viewWillDisappear:(BOOL)animated{

  self.tabBarController.tabBar.hidden = NO;

}



- (void)viewDidLoad {
    [super viewDidLoad];

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"LOGIN" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 40],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:104/255.0 blue:79/255.0 alpha:1.0]}];

        _ZhuCe.attributedText = string;
    
    
    UIColor *color = [UIColor lightGrayColor];
    
    _PhonTetx.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号..." attributes:@{NSForegroundColorAttributeName: color}];
    
        _YanZhenMaText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入验证码" attributes:@{NSForegroundColorAttributeName: color}];
    
        _MiMaText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请设置密码..." attributes:@{NSForegroundColorAttributeName: color}];
    
    
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
        [_MiMaText addTarget:self action:@selector(editChange) forControlEvents:UIControlEventEditingChanged];
        //写方法
        [_PhonTetx addTarget:self action:@selector(edingChange) forControlEvents:UIControlEventEditingChanged];
    
    [self.PhonTetx becomeFirstResponder];
    [self.ZC addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    self.PhonTetx.delegate = self;

}


-(void)push{
    
    [self log];
    
}

-(void)log
{
    [MBProgressHUD showMessage:@"正在登录..." toView:self.view];


    NSDictionary *dict = @{
          @"phone" : self.PhonTetx.text,
          @"password" : self.MiMaText.text,
          @"confirmPassword": self.MiMaText.text,
          @"project" : @"futures",
          @"code" : self.YanZhenMaText.text,
          @"type" : @(1)
      };

       [LCPNetWorkManager postWithPathUrl:@"/system/register" parameters:nil queryParams:dict Header:nil success:^(BOOL success, id result)
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
             [MBProgressHUD showError:@"账号或验证码错误"];
        }];
    }

-(void)swipeGes:(UISwipeGestureRecognizer *)swipe
{
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        [self.navigationController popViewControllerAnimated:YES];
    }

}

- (IBAction)YangJing:(UIButton *)sender
{
    self.YangJing.selected = !self.YangJing.selected;
    if (self.YangJing.selected){
        self.MiMaText.secureTextEntry = NO;
        [self.YangJing setImage:[UIImage imageNamed:@"ic_kejian"] forState:UIControlStateNormal];
    }else{
        self.MiMaText.secureTextEntry = YES;
        [self.YangJing setImage:[UIImage imageNamed:@"ic_bukejian"] forState:UIControlStateNormal];
    }
}



-(void)edingChange
{
    if(self.PhonTetx.text.length ==0 ) {
        self.ZC.enabled = NO;
    }else if (self.PhonTetx.text.length >11){
        self.PhonTetx.text = [self.PhonTetx.text substringToIndex:11];
    }else {
        self.ZC.enabled = YES;
    }
}

//实现方法输入框最多多少字
- (void)editChange {
        if(self.MiMaText.text.length ==0 ) {
            self.ZC.enabled = NO;
        }else if (self.MiMaText.text.length >16){
            self.MiMaText.text = [self.MiMaText.text substringToIndex:16];
        }else {
            self.ZC.enabled = YES;
        }
}

- (IBAction)TxYanZhengMa:(UIButton *)sender
{
   ZYTXYZMViewController *TxYzM = [ZYTXYZMViewController new];
   ZYusModel *userm = [[ZYusModel alloc]init];
   userm.phone = _PhonTetx.text;
   userm.projectKey = _Project;
   TxYzM.userM = userm;
   TxYzM.logType = @"1";
   [self presentViewController:TxYzM animated:YES completion:nil];
    
}

//点击空白退出键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


@end
