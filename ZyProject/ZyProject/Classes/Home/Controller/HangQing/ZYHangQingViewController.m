//
//  ZYHangQingViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYHangQingViewController.h"
#import "ZYMingChengTableViewCell.h"
#import "ZYHangQingHeaderView.h"

@interface ZYHangQingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property (nonatomic, strong) ZYHangQingHeaderView *header;

@end

@implementation ZYHangQingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.TableView.delegate = self;
    self.TableView.dataSource = self;
    
     //设置导航栏颜色
         self.navigationController.navigationBar.barTintColor = RGB(47, 50, 55);
    //设置背景颜色
      self.view.backgroundColor = RGB(44, 48, 52);
      self.TableView.backgroundColor  = RGB(44, 48, 52);
    
//    //设置cell标识
//     [self.TableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYHangQingTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"DingBu"];
    
    //设置cell标识
     [self.TableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYMingChengTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"JiaGe"];
    



    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return 8;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row <= 8){
      ZYMingChengTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"JiaGe"];
      [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
      self.TableView.rowHeight = 80;
      return cell;
    }
    return [UITableViewCell new];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
        //加载XIB个人界面的顶部headerView
    self.header = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([ZYHangQingHeaderView class]) owner:nil options:nil]firstObject];
    //设置headerView的位置，和样式缺一不可
//    self.TableView.tableHeaderView = self.header;
    self.header.autoresizingMask = UITableViewScrollPositionNone;
    return _header;
}


@end
