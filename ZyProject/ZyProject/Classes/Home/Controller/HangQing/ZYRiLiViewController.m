//
//  ZYRiLiViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYRiLiViewController.h"

@interface ZYRiLiViewController ()
@property (weak, nonatomic) IBOutlet UITableView *TabelView;

@end

@implementation ZYRiLiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       //设置导航栏颜色
             self.navigationController.navigationBar.barTintColor = RGB(47, 50, 55);
        //设置背景颜色
          self.view.backgroundColor = RGB(44, 48, 52);
          self.TabelView.backgroundColor  = RGB(44, 48, 52);
}



@end
