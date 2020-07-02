//
//  ZYGxQmViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/29.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYGxQmViewController.h"
#import "ZYGxQmModel.h"

@interface ZYGxQmViewController ()
@property (weak, nonatomic) IBOutlet UITextField *QmText;

@end

@implementation ZYGxQmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    
    //写方法
    [_QmText addTarget:self action:@selector(editChange) forControlEvents:UIControlEventEditingChanged];
    
    //昵称模型传值
    self.QmText.text = self.ContactM.name;
}

//实现方法输入框最多多少字
- (void)editChange {
        if(self.QmText.text.length == 0 ) {
//            self.QueDing.enabled = NO;
        }else if (self.QmText.text.length >10){
            self.QmText.text = [self.QmText.text substringToIndex:10];
        }else {
//            self.QueDing.enabled = YES;
        }
}


- (IBAction)QuXiao:(UIButton *)sender
{
     [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)QueDing:(UIButton *)sender
{
        ZYGxQmModel *contactM =[ZYGxQmModel ContactModelWithname:self.QmText.text];
        
        if ([self.delegate respondsToSelector:@selector(GaiGXqmViewController:GxQmModel:)]==YES) {
            [self.delegate GaiGXqmViewController:self GxQmModel:contactM];
        }
    //    else if ([self.delegate  respondsToSelector:@selector(gainichengVC:NCModel:)]== YES){
    //        [self.delegate gainichengVC:self NCModel:contactM];
    //    }
        NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
            NSDictionary *dict = @{
                @"uuid": [userdefault objectForKey:@"uuid"],
                @"id": [userdefault objectForKey:@"id"],
                @"nickName": [userdefault objectForKey:@"nickName"],
                @"signature": [userdefault objectForKey:@"signature"],
                @"type": [userdefault objectForKey:@"type"]
            };
            [LCPNetWorkManager putWithPathUrl:@"/user/personal/updateUser" parameters:dict queryParams:nil Header:nil success:^(BOOL success, id result) {
                NSLog(@"updata is success");
            } failure:^(BOOL failuer, NSError *error) {
                 NSLog(@"updata is bad");
            }];
        [userdefault setObject:self.QmText.text forKey:@"signature"];
        [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

@end
