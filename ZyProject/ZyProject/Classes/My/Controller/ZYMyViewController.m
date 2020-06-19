//
//  ZYMyViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYMyViewController.h"
#import "ZYWoDeHeaDerview.h"
#import "ZYWoDeTableViewCell.h"
#import "ZYGuanYuWoMenViewController.h"
#import "ZYFanKuiViewController.h"
#import "ZYBianJiViewController.h"


@interface ZYMyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property (nonatomic, strong) ZYWoDeHeaDerview *header;

@end

@implementation ZYMyViewController



- (void)viewWillAppear:(BOOL)animated
{
     self.navigationController.navigationBar.hidden = YES;
}



- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.cyanColor;
          
          self.TableView.delegate = self;
          self.TableView.dataSource =self;

               //    设置导航条标题颜色
                  [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
                  self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
            //设置tableView分割线不显示
//            self.TableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.TableView setSeparatorColor : RGB(77, 84, 98)];
    
                  
                       //设置导航栏颜色
               self.navigationController.navigationBar.barTintColor = RGB(47, 50, 55);

            
          //设置背景颜色
            self.view.backgroundColor = RGB(44, 48, 52);
            self.TableView.backgroundColor  = RGB(44, 48, 52);
        //设置tableView分割线不显示
        self.TableView.separatorStyle = UITableViewCellSelectionStyleNone;

    
    
    //设置cell标识
     [self.TableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYWoDeTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"SheZhi"];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0){
        ZYWoDeTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"SheZhi"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.TableView.rowHeight = 55;
        cell.SheZhi.text = @"关于我们";
        return cell;
    }    if (indexPath.row == 1){
        ZYWoDeTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"SheZhi"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.TableView.rowHeight = 55;
        cell.SheZhi.text = @"反馈中心";
        return cell;
    }
    if (indexPath.row == 2){
        ZYWoDeTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"SheZhi"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.TableView.rowHeight = 55;
        cell.SheZhi.text = @"编辑资料";
        return cell;
    }
    if (indexPath.row == 3){
        ZYWoDeTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"SheZhi"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.TableView.rowHeight = 55;
        cell.SheZhi.text = @"修改密码";
        return cell;
    }
    if (indexPath.row == 4){
        ZYWoDeTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"SheZhi"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.TableView.rowHeight = 55;
        cell.SheZhi.text = @"切换账号";
        return cell;
    }
    if (indexPath.row == 5){
        ZYWoDeTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"SheZhi"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.TableView.rowHeight = 55;
        cell.SheZhi.text = @"退出登录";
        return cell;
    }    if (indexPath.row == 6){
        ZYWoDeTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"SheZhi"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.TableView.rowHeight = 55;
        cell.SheZhi.text = @"用户协议";
        return cell;
    }
    if (indexPath.row == 7){
        ZYWoDeTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"SheZhi"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.TableView.rowHeight = 55;
        cell.SheZhi.text = @"隐私政策";
        return cell;
    }
    return [UITableViewCell new];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 230;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
            //加载XIB个人界面的顶部headerView
        self.header = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([ZYWoDeHeaDerview class]) owner:nil options:nil]firstObject];
        
        //设置headerView的位置，和样式缺一不可
//        self.TableView.tableHeaderView = self.header;
        self.header.autoresizingMask = UITableViewScrollPositionNone;
    return _header;
}

//监听点击事件，点击的是哪一组那一行cell实现界面的跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{//点击跳转关于我们界面
    if (indexPath.row == 0){
        ZYGuanYuWoMenViewController *pushGYWM = [[ZYGuanYuWoMenViewController alloc]init];
               pushGYWM.hidesBottomBarWhenPushed = YES;
               [self.navigationController pushViewController:pushGYWM animated:YES];
    }//点击跳转反馈界面
    else if (indexPath.row == 1){
           ZYFanKuiViewController *pushFK = [[ZYFanKuiViewController alloc]init];
                  pushFK.hidesBottomBarWhenPushed = YES;
                  [self.navigationController pushViewController:pushFK animated:YES];
       }//点击跳转编辑资料
       else if (indexPath.row == 2){
              ZYBianJiViewController *pushBJ = [[ZYBianJiViewController alloc]init];
                     pushBJ.hidesBottomBarWhenPushed = YES;
                     [self.navigationController pushViewController:pushBJ animated:YES];
          }
    
    
}




@end
