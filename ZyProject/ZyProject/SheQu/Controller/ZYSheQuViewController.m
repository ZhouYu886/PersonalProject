//
//  ZYSheQuViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYSheQuViewController.h"
#import "ZYReBangTableViewCell.h"
#import "ZYTuiJianTableViewCell.h"
#import "ZYFaBuViewController.h"
#import "ZYXaiangQingViewController.h"

@interface ZYSheQuViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *TableView;

@end

@implementation ZYSheQuViewController


- (void)viewWillAppear:(BOOL)animated
{
     self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //设置界面标题
    self.title = @"社区";
    
    self.TableView.delegate = self;
    self.TableView.dataSource =self;

         //    设置导航条标题颜色
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
            self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
      
            
                 //设置导航栏颜色
         self.navigationController.navigationBar.barTintColor = RGB(44, 48, 52);

      
    //设置背景颜色
      self.view.backgroundColor = RGB(44, 48, 52);
      self.TableView.backgroundColor  = RGB(44, 48, 52);
    
    
    //设置cell标识
     [self.TableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYReBangTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"ReTui"];
    
    //设置cell标识
     [self.TableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYTuiJianTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"TuiJian"];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else{
        return 3;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0 && indexPath.row == 0) {
            ZYReBangTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"ReTui"];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.TableView.rowHeight = 151;
            return cell;
    }else if (indexPath.section==1 && indexPath.row <= 3){
        ZYTuiJianTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"TuiJian"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.TableView.rowHeight = 209;
        return cell;
    }
    return [UITableViewCell new];
}

//设置cell间隔的颜色
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = RGB(44, 48, 52);
    return header;
}

//设置cell之间的间隔
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  if (section == 0) {
        return 13;
  }else{
      return 12.5;
  }

}

- (IBAction)PushFaBu:(UIButton *)sender
{
    ZYFaBuViewController *PushaFaBu = [ZYFaBuViewController new];
    
    [self.navigationController pushViewController:PushaFaBu animated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1 && indexPath.row <= 3){
        ZYXaiangQingViewController *pushXq = [[ZYXaiangQingViewController alloc]init];
            pushXq.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:pushXq animated:YES];
    }
    
}

@end
