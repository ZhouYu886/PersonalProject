//
//  ZYJingXuanXiangQingViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/23.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYJingXuanXiangQingViewController.h"
#import "ZYJingXuanXiangQingTableViewCell.h"

@interface ZYJingXuanXiangQingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ZYJingXuanXiangQingViewController


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
   self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //设置tableView分割线不显示
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    self.title = @"详情";
         //设置导航栏颜色
             self.navigationController.navigationBar.barTintColor = RGB(47, 50, 55);
        //设置背景颜色
          self.view.backgroundColor = RGB(44, 48, 52);
          self.tableView.backgroundColor  = RGB(44, 48, 52);
    //设置左边点击返回
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    //适应大小
    [btn sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
}

-(void)setZiXunJingXuanM:(ZYZiXunJingXuanM *)ZiXunJingXuanM
{
    _ZiXunJingXuanM = ZiXunJingXuanM;
      [self.tableView reloadData];
    
}

-(void)leftClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYJingXuanXiangQingTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"ZYJingXuanXiangQingTableViewCell" owner:nil options:nil]firstObject];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ZYJingXuanXiangQingTableViewCell"];
    }
     [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.ZiXunM = _ZiXunJingXuanM;
     return cell;
}




@end
