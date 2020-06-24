//
//  ZYZiXunPushTableViewCell.m
//  ZyProject
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYZiXunPushTableViewCell.h"
#import "ViewController+CurrentVC.h"
#import "ZYShiShiHangQingViewController.h"

@interface ZYZiXunPushTableViewCell ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *SSHQ;
@property (weak, nonatomic) IBOutlet UIButton *RlSJ;
@property (weak, nonatomic) IBOutlet UIButton *KX;
@property (weak, nonatomic) IBOutlet UIButton *HYFB;
@property(nonatomic,weak)UITableView *tableView;

@end

@implementation ZYZiXunPushTableViewCell

- (void)layoutSubviews{
    [super layoutSubviews];
    self.tableView.dataSource = self;
    
    CGFloat ZW = SCREEN_WIDTH - 168;
    CGFloat w = ZW / 3;
    self.RlSJ.frame = CGRectMake(w + 40, 0, 64, 84);
    
    self.HYFB.frame = CGRectMake(2*w+ 64, 0, 64, 84);

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYZiXunPushTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"ZYZiXunPushTableViewCell"];
}


- (void)awakeFromNib {
    [super awakeFromNib];
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (IBAction)PushHangQing:(UIButton *)sender
{
    ZYShiShiHangQingViewController *PushHangQing = [[ZYShiShiHangQingViewController alloc]init];
    [[UIViewController jsd_getCurrentViewController].navigationController pushViewController:PushHangQing animated:YES];
}
- (IBAction)PUSH:(UIButton *)sender
{
    ZYShiShiHangQingViewController *PushHangQing = [[ZYShiShiHangQingViewController alloc]init];
    [[UIViewController jsd_getCurrentViewController].navigationController pushViewController:PushHangQing animated:YES];
}


- (IBAction)Push:(UIButton *)sender
{
    ZYShiShiHangQingViewController *PushHangQing = [[ZYShiShiHangQingViewController alloc]init];
    [[UIViewController jsd_getCurrentViewController].navigationController pushViewController:PushHangQing animated:YES];
}
- (IBAction)PushHang:(UIButton *)sender
{
    ZYShiShiHangQingViewController *PushHangQing = [[ZYShiShiHangQingViewController alloc]init];
    [[UIViewController jsd_getCurrentViewController].navigationController pushViewController:PushHangQing animated:YES];
    PushHangQing.hidesBottomBarWhenPushed = YES;
    
}

@end
