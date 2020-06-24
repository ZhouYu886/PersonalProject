//
//  ZYFanKuiViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/18.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYFanKuiViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface ZYFanKuiViewController ()
@property (weak, nonatomic) IBOutlet UITextField *ShouJi;

@property (weak, nonatomic) IBOutlet UITextView *tetxView;

@property (weak, nonatomic) IBOutlet UIButton *FanKuibtn;

@end

@implementation ZYFanKuiViewController

- (void)viewWillAppear:(BOOL)animated{

//    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = NO;
    
//    self.navigationController.navigationBar.opaque = YES;
    self.navigationController.navigationBar.translucent = NO;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTextView];
    [self Fankui];
    
    //设置界面标题
    self.title = @"反馈";
    
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
    UIColor *color = [UIColor lightGrayColor];

    _ShouJi.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号码" attributes:@{NSForegroundColorAttributeName: color}];

    [self.ShouJi addTarget:self action:@selector(Fankui) forControlEvents:UIControlEventEditingChanged];
//    [self.tetxView addTarget:self action:@selector(Fankui) forControlEvents:UIControlEventEditingChanged];
    
    // 通过运行时，发现UITextView有一个叫做“_placeHolderLabel”的私有变量
     unsigned int count = 0;
     Ivar *ivars = class_copyIvarList([UITextView class], &count);
     
     for (int i = 0; i < count; i++) {
         Ivar ivar = ivars[i];
         const char *name = ivar_getName(ivar);
         NSString *objcName = [NSString stringWithUTF8String:name];
         NSLog(@"%d : %@",i,objcName);
     }
    
    
    
}

- (void)setupTextView
{
//    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 100)];
//    [textView setBackgroundColor:[UIColor greenColor]];
//    [self.view addSubview:textView];
    
    // _placeholderLabel
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = @"请输入反馈内容";
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = [UIColor lightGrayColor];
    [placeHolderLabel sizeToFit];
    [_tetxView addSubview:placeHolderLabel];

    // same font
    _tetxView.font = [UIFont systemFontOfSize:14.f];
    placeHolderLabel.font = [UIFont systemFontOfSize:14.f];

    [_tetxView setValue:placeHolderLabel forKey:@"_placeholderLabel"];

}

//设置左边点击返回上一级
-(void)leftClick
{
    //返回上一级
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)FanKui:(UIButton *)sender
{

        //当用户名与密码同时有值时,登录按钮才能够点击
        if (self.ShouJi.text.length && self.tetxView.text.length) {
            self.FanKuibtn.enabled = YES;
        }else {
            self.FanKuibtn.enabled = NO;
        }
    
//    self.FanKuibtn.enabled = self.ShouJi.text.length && self.tetxView.text.length;
}

-(void)Fankui
{
    //当用户名与密码同时有值时,登录按钮才能够点击  && self.tetxView.text.length
    if (self.ShouJi.text.length) {
        self.FanKuibtn.enabled = YES;
    }else {
        self.FanKuibtn.enabled = NO;
    }
}



@end
