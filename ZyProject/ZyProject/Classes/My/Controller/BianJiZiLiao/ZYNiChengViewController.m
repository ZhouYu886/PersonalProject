//
//  ZYNiChengViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/18.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYNiChengViewController.h"

@interface ZYNiChengViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *NiCheng;
@property (weak, nonatomic) IBOutlet UIButton *QueDing;

@end

@implementation ZYNiChengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    
    //写方法
    [_NiCheng addTarget:self action:@selector(editChange) forControlEvents:UIControlEventEditingChanged];
    
}

//实现方法输入框最多多少字
- (void)editChange {
        if(self.NiCheng.text.length ==0 ) {
            self.QueDing.enabled = NO;
        }else if (self.NiCheng.text.length >10){
            self.NiCheng.text = [self.NiCheng.text substringToIndex:10];
        }else {
            self.QueDing.enabled = YES;
        }
}


//点击取消
- (IBAction)POP:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

  




@end
