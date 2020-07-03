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
#import "ZYYingSiViewController.h"
#import "ZYDengluViewController.h"
#import "talkListModel.h"
#import "userModel.h"
#import <MJExtension/MJExtension.h>
#import "ZYNameModel.h"
#import "ZYGxQmModel.h"
#import "ZYQieHuanZhangHaoViewController.h"
#import "ZYXiuGaiMiMaViewController.h"



@interface ZYMyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property (nonatomic, strong) ZYWoDeHeaDerview *header;
@property (nonatomic, strong) talkListModel *talkM;
@property (nonatomic, strong) NSArray *GuanZhuArry;
@property(nonatomic,strong)userModel *UM;
@property(nonatomic, strong)ZYNameModel *nichengM;
@property(nonatomic,strong)ZYGxQmModel *ContM;

@end

@implementation ZYMyViewController



- (void)viewWillAppear:(BOOL)animated
{
    [self loadData];
    self.navigationController.navigationBar.hidden = YES;
    
    WEAKSELF
    weakSelf.didSureBtnBlock = ^{
        [weakSelf loadData];
    };
}


-(void)loadData{
    
    NSUserDefaults *userDefautlt = [NSUserDefaults standardUserDefaults];    if([userDefautlt objectForKey:@"id"]){
        _header.DT.text  =  [NSString stringWithFormat:@"%@",[userDefautlt objectForKey:@"talkCount"]];
        _header.FS.text = [NSString stringWithFormat:@"%@",[userDefautlt objectForKey:@"fansCount"]];
        _header.GZ.text = [NSString stringWithFormat:@"%@",[userDefautlt objectForKey:@"followCount"]];
        _header.NameLabel.text = [NSString stringWithFormat:@"%@",[userDefautlt objectForKey:@"nickName"]];
        _header.GxQmLabel.text = [NSString stringWithFormat:@"%@",[userDefautlt objectForKey:@"signature"]];
        NSData *data = [userDefautlt objectForKey:@"headerImage"];
        _header.imagePush.image = [UIImage imageWithData:data];
    }else{
        _header.DT.text  =  [NSString stringWithFormat:@"100"];
        _header.FS.text = [NSString stringWithFormat:@"100"];
        _header.GZ.text = [NSString stringWithFormat:@"100"];
        _header.NameLabel.text = [NSString stringWithFormat:@"还没登录哟～"];
        _header.GxQmLabel.text = [NSString stringWithFormat:@"点击头像立即登录～"];
        _header.imagePush.image = [UIImage imageNamed:@"pic_geren"];
    }
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
    //  self.TableView.separatorStyle = UITableViewCellSelectionStyleNone;
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
    
    //加载XIB个人界面的顶部headerView
    self.header = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([ZYWoDeHeaDerview class]) owner:nil options:nil]firstObject];
    //设置headerView的位置，和样式缺一不可
    self.TableView.tableHeaderView = self.header;
    self.header.autoresizingMask = UITableViewScrollPositionNone;
    [self.TableView reloadData];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
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
    }
    return [UITableViewCell new];
}

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 230;
//}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    //加载XIB个人界面的顶部headerView
//    self.header = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([ZYWoDeHeaDerview class]) owner:nil options:nil]firstObject];
//    //       [self.TableView reloadData];
//    //设置headerView的位置，和样式缺一不可
//    //        self.TableView.tableHeaderView = self.header;
//
//    self.header.autoresizingMask = UITableViewScrollPositionNone;
//    return _header;
//}

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
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        if([userDefault objectForKey:@"id"]){
            ZYBianJiViewController *pushBJ = [[ZYBianJiViewController alloc]init];
            pushBJ.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:pushBJ animated:YES];
        }else{
            ZYDengluViewController *PushDl = [[ZYDengluViewController alloc]init];
            PushDl.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:PushDl animated:YES];
        }
        
    }//隐私政策
    else if(indexPath.row == 7){
        ZYYingSiViewController *ys = [ZYYingSiViewController new];
        ys.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:ys animated:YES];
    }//退出登录
    else if(indexPath.row == 5){
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        if([userDefault objectForKey:@"id"]){
            UIAlertController *aletVC  = [UIAlertController alertControllerWithTitle:@"退出的话，下次将重新登录" message:@"确定要退出吗" preferredStyle:(UIAlertControllerStyleActionSheet)];
            //第2步:创建按钮
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
                //点击按钮执行的代码
            }];
            UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:( UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
                //点击按钮执行的代码
                NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
                [userDefault removeObjectForKey:@"phone"];
                [userDefault removeObjectForKey:@"id"];
                [userDefault removeObjectForKey:@"password"];
                if (self.didSureBtnBlock) {
                    self.didSureBtnBlock();
                }
            }];
            //第3步:添加按钮
            [aletVC addAction:action1];
            [aletVC addAction:action2];
            //第4步:显示弹框（相当于show操作）
            [self presentViewController:aletVC animated:YES
                             completion:nil];
            
        }else{
            UIAlertController *aletVC  = [UIAlertController alertControllerWithTitle:@"你还没有登录快去登录吧～" message:@"" preferredStyle:(UIAlertControllerStyleActionSheet)];
            //第2步:创建按钮
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
                //点击按钮执行的代码
                
                
            }];
            UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"立即登录" style:( UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                //点击按钮执行的代码
                ZYDengluViewController *pushDL = [[ZYDengluViewController alloc]init];
                pushDL.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:pushDL animated:YES];
            }];
            //第3步:添加按钮
            [aletVC addAction:action1];
            [aletVC addAction:action2];
            //第4步:显示弹框（相当于show操作）
            [self presentViewController:aletVC animated:YES
                             completion:nil];
            
        }
        
    }else if (indexPath.row == 4){
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        if([userDefault objectForKey:@"id"]){
            ZYQieHuanZhangHaoViewController *PushuQhZh = [ZYQieHuanZhangHaoViewController new];
            PushuQhZh.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:PushuQhZh animated:YES];
        }else{
            UIAlertController *aletVC  = [UIAlertController alertControllerWithTitle:@"你还没有登录快去登录吧～" message:@"" preferredStyle:(UIAlertControllerStyleActionSheet)];
            //第2步:创建按钮
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
                //点击按钮执行的代码
                
                
            }];
            UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"立即登录" style:( UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                //点击按钮执行的代码
                ZYDengluViewController *pushDL = [[ZYDengluViewController alloc]init];
                pushDL.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:pushDL animated:YES];
            }];
            //第3步:添加按钮
            [aletVC addAction:action1];
            [aletVC addAction:action2];
            //第4步:显示弹框（相当于show操作）
            [self presentViewController:aletVC animated:YES
                             completion:nil];
        }

    }else if (indexPath.row == 3){
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        if([userDefault objectForKey:@"id"]){
         ZYXiuGaiMiMaViewController *XiuGaiMiMa = [ZYXiuGaiMiMaViewController new];
            XiuGaiMiMa.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:XiuGaiMiMa animated:YES];
        }else{
            UIAlertController *aletVC  = [UIAlertController alertControllerWithTitle:@"你还没有登录快去登录吧～" message:@"" preferredStyle:(UIAlertControllerStyleActionSheet)];
            //第2步:创建按钮
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
                //点击按钮执行的代码
                
                
            }];
            UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"立即登录" style:( UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                //点击按钮执行的代码
                ZYDengluViewController *pushDL = [[ZYDengluViewController alloc]init];
                pushDL.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:pushDL animated:YES];
            }];
            //第3步:添加按钮
            [aletVC addAction:action1];
            [aletVC addAction:action2];
            //第4步:显示弹框（相当于show操作）
            [self presentViewController:aletVC animated:YES
                             completion:nil];
        }
    }
    
}


@end
