//
//  ZYHangYeViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYHangYeViewController.h"
#import "ZYHangYeTableViewCell.h"

@interface ZYHangYeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *Tableview;

@end

@implementation ZYHangYeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Tableview.delegate = self;
    self.Tableview.dataSource = self;
         //设置导航栏颜色
             self.navigationController.navigationBar.barTintColor = RGB(47, 50, 55);
        //设置背景颜色
          self.view.backgroundColor = RGB(44, 48, 52);
          self.Tableview.backgroundColor  = RGB(44, 48, 52);
    //设置cell标识
     [self.Tableview registerNib:[UINib nibWithNibName:NSStringFromClass([ZYHangYeTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"FengBao"];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row <= 5) {
      ZYHangYeTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"FengBao"];
      [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
      self.Tableview.rowHeight = 154;
      return cell;
        }
        return [UITableViewCell new];
 
}

@end
