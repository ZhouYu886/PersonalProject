//
//  ZYJuBaoViewController.m
//  ZyProject
//
//  Created by apple on 2020/7/2.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYJuBaoViewController.h"
#import "ZYSelectPhotoManager.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "talkListModel.h"
#import "ZYTuiJianTableViewCell.h"
#import "ZYSheQuM.h"
#import "ZYSheQuB.h"
#import "MBProgressHUD+XMG.h"

@interface ZYJuBaoViewController ()<ZYselectPhotoDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;

@property (weak, nonatomic) IBOutlet UIView *AView;

@property (weak, nonatomic) IBOutlet UIView *BView;
@property (weak, nonatomic) IBOutlet UIImageView *Aimage;

@property (weak, nonatomic) IBOutlet UIImageView *Bimage;
@property (weak, nonatomic) IBOutlet UIButton *JUbao;
@property (nonatomic,strong)ZYSelectPhotoManager *photoManger;
@property (nonatomic,strong)UIView *tempView;
@property(nonatomic,strong)NSString *jubaotalk;


@end

@implementation ZYJuBaoViewController

- (void)viewWillAppear:(BOOL)animated{

    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = NO;
    
    self.navigationController.navigationBar.translucent = NO;
    
    
        //设置左边返回
         UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
         [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
//        [btn setTitle:@"返回" forState:UIControlStateNormal];
         [btn addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
         //适应大小
         [btn sizeToFit];
         self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];

}

- (void)viewWillDisappear:(BOOL)animated{

  self.tabBarController.tabBar.hidden = NO;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTextView];
   
    self.title = @"举报";
       //    设置导航条标题颜色
                  [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
                  self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
       
                       //设置导航栏颜色
               self.navigationController.navigationBar.barTintColor = RGB(44, 48, 52);

    
       // 通过运行时，发现UITextView有一个叫做“_placeHolderLabel”的私有变量
       unsigned int count = 0;
       Ivar *ivars = class_copyIvarList([UITextView class], &count);
       
       for (int i = 0; i < count; i++) {
           Ivar ivar = ivars[i];
           const char *name = ivar_getName(ivar);
           NSString *objcName = [NSString stringWithUTF8String:name];
           NSLog(@"%d : %@",i,objcName);
       }
       
      
    
       //设置图片点击手势
       self.Aimage.userInteractionEnabled = YES;
       UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
          [self.Aimage addGestureRecognizer:tap];
       
       //设置隐藏View
       _BView.hidden = YES;
    
}

- (void)tapClick{
    _Aimage.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(photoClick:)];
    [_Aimage addGestureRecognizer:tap];
    UIImage *img = [UIImage imageWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"photoView"]];
    if (img) {
        _Aimage.image = img;
    }
}

-(void)selectPhotoManagerDidFinishImage:(UIImage *)image
{
     _BView.hidden = NO;
}

- (void)photoClick:(UITapGestureRecognizer *)recognizer{
    
   if (!_photoManger) {
       _photoManger = [[ZYSelectPhotoManager alloc]init];
       _photoManger.delegate =self;
   }
      [_photoManger startSelectPhotoWithImageName:@"选择头像"];
           __weak typeof (self)mySelf = self;
           _photoManger.successHandle = ^(ZYSelectPhotoManager *manager, UIImage *image) {
               mySelf.Aimage.image = image;
           };
}



 
- (void)setupTextView
{
    
    // _placeholderLabel
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = @"举报详细说明...";
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = [UIColor lightGrayColor];
    [placeHolderLabel sizeToFit];
    [_textView addSubview:placeHolderLabel];

    // same font
    _textView.font = [UIFont systemFontOfSize:14.f];
    placeHolderLabel.font = [UIFont systemFontOfSize:14.f];

    [_textView setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    
    
}


//左边返回
-(void)leftClick
{
    [self.navigationController popViewControllerAnimated:YES];

}

//点击空白退出键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}

-(void)setShequM:(ZYSheQuM *)shequM
{
    _shequM = shequM;
    
}

-(void)setTalk:(NSString *)talk
{
    _jubaotalk = talk;
    
}

- (IBAction)JuBao:(UIButton *)sender
{
        [MBProgressHUD showMessage:@"举报成功" toView:self.view];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSNumber *dd = [userDefaults objectForKey:@"id"];
        NSDictionary *dict = @{
            @"userId" : dd,
            @"talkId" : self.jubaotalk,
            @"content" : self.textView.text,
        };
        [LCPNetWorkManager postWithPathUrl:@"/user/talk/reportTalk" parameters:nil queryParams:dict Header:nil success:^(BOOL success, id result) {
            [MBProgressHUD hideHUDForView:self.view];
            self.textView.text = @"";
        } failure:^(BOOL failuer, NSError *error) {
            [MBProgressHUD showError:@"举报失败"];
            [MBProgressHUD hideHUDForView:self.view];
        }];
        
}
    



@end
