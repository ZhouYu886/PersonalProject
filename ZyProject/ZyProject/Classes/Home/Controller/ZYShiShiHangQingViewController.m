//
//  ZYShiShiHangQingViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYShiShiHangQingViewController.h"
#import "ZJScrollPageView.h"
#import "ZYRiLiViewController.h"
#import "ZYHangQingViewController.h"
#import "ZYHangYeViewController.h"
#import "ZYKuaiXunViewController.h"
//#import "DLHCalendarDataVC.h"


@interface ZYShiShiHangQingViewController ()<ZJScrollPageViewDelegate>

@property(strong, nonatomic)NSArray<NSString *> *titles;
@property (nonatomic, strong) ZJScrollPageView *scrollPageView;

@end

@implementation ZYShiShiHangQingViewController

- (void)viewWillAppear:(BOOL)animated{

    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = NO;
    
//    self.navigationController.navigationBar.opaque = YES;
    self.navigationController.navigationBar.translucent = NO;

}

- (void)viewWillDisappear:(BOOL)animated{

  self.tabBarController.tabBar.hidden = NO;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏颜色
        self.navigationController.navigationBar.barTintColor = RGB(47, 50, 55);
    //必要的设置, 如果没有设置可能导致内容显示不正常
    self.automaticallyAdjustsScrollViewInsets = NO;
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
//去掉透明后导航栏下边的黑边
[self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
self.navigationController.navigationBar.translucent = YES;
       self.titles = @[
                      @"实时行情",
                      @"日历数据",
                      @"行业风暴",
                      @"7X24快讯",
                      ];

  
       //显示滚动条
       style.showLine = YES;
       style.scrollLineColor = (RGB(213, 25, 19));
       style.scrollLineHeight = 2;
       style.gradualChangeTitleColor = YES;
       style.autoAdjustTitlesWidth=YES;

       style.normalTitleColor = (RGB(45, 52, 69));

       style.selectedTitleColor = (RGB(251, 251, 251));

       style.titleFont = [UIFont systemFontOfSize:18];
       style.titleBigScale = 1.2;
       style.scaleTitle=YES;

     // 初始化
    _scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0,0,kScreenWidth,kScreenHeight-kStatusBarHeight-kTabBarHeight) segmentStyle:style titles:self.titles parentViewController:self delegate:self];
      [self.view addSubview:_scrollPageView];
       // [self.view addSubview:scrollPageView];
    
    
//设置背景颜色
    _scrollPageView.segmentView.backgroundColor = [UIColor colorWithRed:23 / 255.0 green:26 / 255.0 blue:36 /255.0 alpha:1];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification1) name:@"Butten1" object:nil];
    
    //设置左边返回
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    //适应大小
    [btn sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    


}

//设置左边点击返回上一级
-(void)leftClick
{
    //返回上一级
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods {
    return NO;
}
- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}

- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    UIViewController<ZJScrollPageViewChildVcDelegate> *childVc = reuseViewController;
    if (index == 0) {
      
     }
    if (!childVc)
        if (index == 0) {
             childVc = [[ZYHangQingViewController alloc] init];
            childVc.title = self.titles[index];
        }if (index == 1) {
             childVc = [[ZYRiLiViewController alloc] init];
                       childVc.title = self.titles[index];
        }if (index == 2) {
             childVc = [[ZYHangYeViewController alloc] init];
                       childVc.title = self.titles[index];
        }if (index == 3) {
             childVc = [[ZYKuaiXunViewController alloc] init];
                       childVc.title = self.titles[index];
        }
    
    return childVc;
}
-(void)notification1{
    
}



@end
