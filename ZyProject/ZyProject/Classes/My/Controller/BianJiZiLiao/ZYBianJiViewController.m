//
//  ZYBianJiViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/18.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYBianJiViewController.h"
#import "ZYNiChengViewController.h"
#import "ZYBJXbViewController.h"
#import <BRPickerView.h>

@interface ZYBianJiViewController ()
@property (weak, nonatomic) IBOutlet UIView *NiChengView;
@property (weak, nonatomic) IBOutlet UIView *XingBieView;
@property (weak, nonatomic) IBOutlet UIView *ShengRiView;
@property (weak, nonatomic) IBOutlet UIView *GXQMView;
@property (weak, nonatomic) IBOutlet UIView *TuiChuDengLu;


@end

@implementation ZYBianJiViewController

- (void)viewWillAppear:(BOOL)animated
{
     self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置界面标题
    self.title = @"编辑资料";
    
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
    
    //添加点击方法昵称
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(NiChengViewPush)];
    //添加点击
    self.NiChengView.userInteractionEnabled = YES;
    //imagePush添加到tap中
    [self.NiChengView addGestureRecognizer:tap];
    
    
    //添加点击方法性别
    UITapGestureRecognizer *tapA = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(XingBieViewPush)];
    //添加点击
    self.XingBieView.userInteractionEnabled = YES;
    //imagePush添加到tap中
    [self.XingBieView addGestureRecognizer:tapA];
    
    
    
    //添加点击方法生日
    UITapGestureRecognizer *tapB = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ShengRiViewPush)];
    //添加点击
    self.ShengRiView.userInteractionEnabled = YES;
    //imagePush添加到tap中
    [self.ShengRiView addGestureRecognizer:tapB];
    
    
    //添加点击方法个性签名
    UITapGestureRecognizer *tapC = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GXQMViewpush)];
    //添加点击
    self.GXQMView.userInteractionEnabled = YES;
    //imagePush添加到tap中
    [self.GXQMView addGestureRecognizer:tapC];

    
    //添加点击方法退出登录
    UITapGestureRecognizer *tapD = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TuiChuDengLuPush)];
    //添加点击
    self.TuiChuDengLu.userInteractionEnabled = YES;
    //imagePush添加到tap中
    [self.TuiChuDengLu addGestureRecognizer:tapD];
}

-(void)NiChengViewPush
{
    ZYNiChengViewController *NiChen = [[ZYNiChengViewController alloc]init];
    [self presentViewController:NiChen animated:YES completion:nil];
    
}

-(void)XingBieViewPush
{
    ZYBJXbViewController *XB = [[ZYBJXbViewController alloc]init];
    [self presentViewController:XB animated:YES completion:nil];
}

-(void)ShengRiViewPush
{
    
    // 1.创建日期选择器
    BRDatePickerView *datePickerView = [[BRDatePickerView alloc]init];
    // 2.设置属性
    datePickerView.pickerMode = BRDatePickerModeYMD;
    datePickerView.title = @"选择年月日";
    // datePickerView.selectValue = @"2019-10-30";
    datePickerView.selectDate = [NSDate br_setYear:2019 month:10 day:30];
    datePickerView.minDate = [NSDate br_setYear:1949 month:3 day:12];
    datePickerView.maxDate = [NSDate date];
    datePickerView.isAutoSelect = YES;
    datePickerView.resultBlock = ^(NSDate *selectDate, NSString *selectValue) {
        NSLog(@"选择的值：%@", selectValue);
    };
    // 设置自定义样式
    BRPickerStyle *customStyle = [[BRPickerStyle alloc]init];
    customStyle.pickerColor = BR_RGB_HEX(0xd9dbdf, 1.0f);
    customStyle.pickerTextColor = [UIColor redColor];
    customStyle.separatorColor = [UIColor redColor];
    datePickerView.pickerStyle = customStyle;

    // 3.显示
    [datePickerView show];
    
    
}

-(void)GXQMViewpush
{
    
}

-(void)TuiChuDengLuPush
{
    
}

//左边返回
-(void)leftClick
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
