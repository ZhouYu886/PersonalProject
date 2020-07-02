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
#import "ZYSelectPhotoManager.h"
#import "ZYNameModel.h"
#import "ZYGxQmViewController.h"
#import "ZYGxQmModel.h"
#import "ZYDengluViewController.h"


@interface ZYBianJiViewController ()<ZyNameVCDelegate,ZYselectPhotoDelegate,ZYQmDelegate>
@property (weak, nonatomic) IBOutlet UILabel *gxqm;
@property (weak, nonatomic) IBOutlet UIView *NiChengView;
@property (weak, nonatomic) IBOutlet UIView *XingBieView;
@property (weak, nonatomic) IBOutlet UIView *ShengRiView;
@property (weak, nonatomic) IBOutlet UIView *GXQMView;
@property (weak, nonatomic) IBOutlet UIView *TuiChuDengLu;
@property (weak, nonatomic) IBOutlet UIImageView *TxImage;
@property (nonatomic,strong)ZYSelectPhotoManager *photoManger;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property(nonatomic, strong)ZYNameModel *nichengM;
//@property(nonatomic, strong)ZYGxQmModel *GXQM;

@end

@implementation ZYBianJiViewController

- (void)viewWillAppear:(BOOL)animated{
    [self bianji];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = NO;
    
//    self.navigationController.navigationBar.opaque = YES;
    self.navigationController.navigationBar.translucent = NO;

}

- (void)viewWillDisappear:(BOOL)animated{

  self.tabBarController.tabBar.hidden = NO;

}


-(void)bianji
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    if([userDefault objectForKey:@"id"]){
        self.gxqm.text = [NSString stringWithFormat:@"%@",[userDefault objectForKey:@"signature"]];
    self.NameLabel.text = [NSString stringWithFormat:@"%@",[userDefault objectForKey:@"nickName"]];
    NSData *data = [userDefault objectForKey:@"headerImage"];
    self.TxImage.image = [UIImage imageWithData:data];
        
    } 
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置界面标题
    self.title = @"编辑资料";
        
       //    设置导航条标题颜色
          [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
          self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    self.TxImage.layer.cornerRadius = 51;
    
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

- (IBAction)HuanTouXiang:(UIButton *)sender
{
    if (!_photoManger) {
        _photoManger =[[ZYSelectPhotoManager alloc]init];
    }
    [_photoManger startSelectPhotoWithImageName:@"选择头像"];
    __weak typeof(self)mySelf=self;
    //选取照片成功
    _photoManger.successHandle=^(ZYSelectPhotoManager *manager,UIImage *image){
        mySelf.TxImage.image = image;
        //保存到本地
        NSData *data = UIImagePNGRepresentation(image);
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"headerImage"];
    };
}



-(void)NiChengViewPush
{
    ZYNiChengViewController *NiChen = [[ZYNiChengViewController alloc]init];
    NiChen.delegate = self;
    [self presentViewController:NiChen animated:YES completion:nil];
    
}

-(void)GXQMViewpush
{
    ZYGxQmViewController *gxqm = [ZYGxQmViewController new];
    gxqm.delegate = self;
    [self presentViewController:gxqm animated:YES completion:nil];
    
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

-(void)GainichengViewController:(ZYNiChengViewController *)VC NichengModel:(ZYNameModel *)ContactModel;
{
    self.NameLabel.text = ContactModel.name;
}


-(void)TuiChuDengLuPush
{
    UIAlertController *aletVC  = [UIAlertController alertControllerWithTitle:@"退出的话，下次将重新登录" message:@"确定要退出吗" preferredStyle:(UIAlertControllerStyleActionSheet)];
    //第2步:创建按钮
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮执行的代码
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:( UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮执行的代码
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault removeObjectForKey:@"phone"];
        [userDefault removeObjectForKey:@"id"];
        [userDefault removeObjectForKey:@"password"];
        ZYDengluViewController *Dl = [ZYDengluViewController new];
        self.navigationController.navigationBar.hidden = YES;
        [self.navigationController pushViewController:Dl animated:YES];
        
        
//        if (self.didSureBtnBlock) {
//            self.didSureBtnBlock();
//        }
    }];
    //第3步:添加按钮
    [aletVC addAction:action1];
    [aletVC addAction:action2];
    //第4步:显示弹框（相当于show操作）
    [self presentViewController:aletVC animated:YES
                     completion:nil];
    
}



-(void)GaiGXqmViewController:(ZYGxQmViewController *)VC GxQmModel:(ZYGxQmModel *)gxqmM
{
    self.gxqm.text = gxqmM.name;
}

//-(void)GaiGXqmViewController:(ZYGxQmViewController *)VC GxQmModel:(ZYGxQmModel *)gxqmM
//{
//    self.gxqm.text = gxqmM.name;
//}





//左边返回
-(void)leftClick
{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
