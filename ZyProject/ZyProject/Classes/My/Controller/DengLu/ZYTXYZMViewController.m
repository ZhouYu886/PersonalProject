//
//  ZYTXYZMViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/20.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYTXYZMViewController.h"
#import "MBProgressHUD+XMG.h"
#import "LCPNetWorkManager.h"
#import "ZYusModel.h"


@interface ZYTXYZMViewController ()
@property (weak, nonatomic) IBOutlet UIButton *QuXiao;
@property (weak, nonatomic) IBOutlet UIButton *QueDing;
@property (weak, nonatomic) IBOutlet UIImageView *TxYzM;
@property (weak, nonatomic) IBOutlet UITextField *YaZmTxt;
@end

@implementation ZYTXYZMViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self TxYZm];
    
    UIColor *color = [UIColor lightGrayColor];
    
    _YaZmTxt.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入验证码" attributes:@{NSForegroundColorAttributeName: color}];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
    
    //写方法
    [_YaZmTxt addTarget:self action:@selector(edingChange) forControlEvents:UIControlEventEditingChanged];
    
}

-(void)edingChange
{
    if(self.YaZmTxt.text.length == 0 ) {
        self.QueDing.enabled = NO;
    }else if (self.YaZmTxt.text.length >4){
        self.YaZmTxt.text = [self.YaZmTxt.text substringToIndex:4];
    }else {
        self.QueDing.enabled = YES;
    }
}

-(void)getVerification
{

    [LCPNetWorkManager getWithPathUrl:@"/system/sendVerify" parameters:nil queryParams:nil Header:nil success:^(BOOL success, id result) {
        NSData *data = [[NSData alloc]initWithBase64EncodedData:result[@"data"] options:NSDataBase64DecodingIgnoreUnknownCharacters];
        self.TxYzM.image = [UIImage imageWithData:data];
    } failure:^(BOOL failuer, NSError *error) {
    [MBProgressHUD showError:@"验证码加载错误，请重试"];
    }];
}

-(void)TxYZm
{
    NSURL *url  = [NSURL URLWithString:@"http://api.yysc.online/system/sendVerify"];
  
  NSURLSession *session = [NSURLSession sharedSession];
  
  [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
      NSError *newError;
      NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
      if (error) {
          NSLog(@"%@",newError);
      }
      
      NSString * ImageStr = dic[@"data"];
      
      NSData *ImageData =[[NSData alloc]initWithBase64EncodedString:ImageStr options:NSDataBase64DecodingIgnoreUnknownCharacters];

      UIImage *testImage = [UIImage imageWithData:ImageData];
      
      [[NSOperationQueue mainQueue] addOperationWithBlock:^{
          
          self.TxYzM.image = testImage;
          
         }];
      
  }] resume] ;
    
}


- (IBAction)QuXiao:(UIButton *)sender
{
   [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (IBAction)QueDing:(UIButton *)sender
{
    NSDictionary *dict = @{
           @"phone": self.userM.phone,
           @"type": self.logType,
           @"project": @"futures",
           @"code": self.YaZmTxt.text
       };
    
    [LCPNetWorkManager postWithPathUrl:@"/system/sendCode" parameters:nil queryParams:dict Header:nil success:^(BOOL success, id result) {
    
        [MBProgressHUD showSuccess:@"短信已发送..."];
    } failure:^(BOOL failuer, NSError *error) {
    
        [MBProgressHUD showError:@"验证码错误"];
    }];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    

    
}
- (IBAction)HuanYiZhang:(UIButton *)sender
{
   [self TxYZm];
}

@end
