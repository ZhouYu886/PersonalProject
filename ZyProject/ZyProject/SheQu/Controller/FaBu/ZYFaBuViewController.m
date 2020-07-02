//
//  ZYFaBuViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/17.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYFaBuViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "ZYSelectPhotoManager.h"
#import "MBProgressHUD+XMG.h"
@interface ZYFaBuViewController ()<UITextViewDelegate,UIAlertViewDelegate,ZYselectPhotoDelegate>

@property (nonatomic,strong)ZYSelectPhotoManager *photoManger;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;

@property (weak, nonatomic) IBOutlet UIView *AView;

@property (weak, nonatomic) IBOutlet UIView *BView;
@property (weak, nonatomic) IBOutlet UIImageView *Aimage;

@property (weak, nonatomic) IBOutlet UIImageView *Bimage;
@property(nonatomic, strong) NSString *saveURL;

@end

@implementation ZYFaBuViewController

- (void)viewWillAppear:(BOOL)animated{

    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = NO;
    
    self.navigationController.navigationBar.translucent = NO;
    
    
        //设置左边返回
         UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //     [btn setImage:[UIImage imageNamed:@"ic_back"] forState:UIControlStateNormal];
        [btn setTitle:@"返回" forState:UIControlStateNormal];
         [btn addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
         //适应大小
         [btn sizeToFit];
         self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
        
        
          //设置右边发布
          UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    //      [btn1 setImage:[UIImage imageNamed:@"ic_share it_homepage"] forState:UIControlStateNormal];
        [btn1 setTitle:@"发表" forState:UIControlStateNormal];
          [btn1 addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
          //适应大小
          [btn1 sizeToFit];
          //设置右边rightBarButtonItem的自定义btn
          self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    
    
}

- (void)viewWillDisappear:(BOOL)animated{

  self.tabBarController.tabBar.hidden = NO;

}




- (void)viewDidLoad
{
    [super viewDidLoad];
     [self setupTextView];
    //    设置导航条标题颜色
               [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
               self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
                    //设置导航栏颜色
            self.navigationController.navigationBar.barTintColor = RGB(44, 48, 52);

//    //设置左边返回
//     UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
////     [btn setImage:[UIImage imageNamed:@"ic_back"] forState:UIControlStateNormal];
//    [btn setTitle:@"返回" forState:UIControlStateNormal];
//     [btn addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
//     //适应大小
//     [btn sizeToFit];
//     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
//
//
//      //设置右边发布
//      UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
////      [btn1 setImage:[UIImage imageNamed:@"ic_share it_homepage"] forState:UIControlStateNormal];
//    [btn1 setTitle:@"发表" forState:UIControlStateNormal];
//      [btn1 addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
//      //适应大小
//      [btn sizeToFit];
//      //设置右边rightBarButtonItem的自定义btn
//      self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    
    
    
    
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
//    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 100)];
//    [textView setBackgroundColor:[UIColor greenColor]];
//    [self.view addSubview:textView];
    
    // _placeholderLabel
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = @"分享新鲜事...";
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = [UIColor lightGrayColor];
    [placeHolderLabel sizeToFit];
    [_textView addSubview:placeHolderLabel];

    // same font
    _textView.font = [UIFont systemFontOfSize:14.f];
    placeHolderLabel.font = [UIFont systemFontOfSize:14.f];

    [_textView setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    
    
}

//右边发表
-(void)rightClick
{
    [self TuPian];
    
    
}

-(void)TuPian
{
    NSDictionary *dict = @{
        @"file" : self.Aimage.image
    };
    [NetworkTool.shared postReturnString:@"http://image.yysc.online/upload" fileName:@"headerImage" image:self.Aimage.image viewcontroller:nil params:dict  success:^(id _Nonnull response) {
        self.saveURL = response;
        [self WenZi];
    } failture:^(NSError * _Nonnull error) {

        [MBProgressHUD showError:@"上传图片失败"];
    }];
    
}

-(void)WenZi
{

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSNumber *dd = [userDefaults objectForKey:@"id"];
    
    NSDictionary *dict = @{
        @"userId" : dd,
        @"content" : self.textView.text,
        @"picture" : self.saveURL,
    };
    
    [LCPNetWorkManager postWithPathUrl:@"/user/talk/publishTalk" parameters:nil queryParams:dict Header:nil success:^(BOOL success, id result) {
        NSLog(@"%@",result);
    } failure:^(BOOL failuer, NSError *error) {
        NSLog(@"发布出错");
    }];
 
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


@end
