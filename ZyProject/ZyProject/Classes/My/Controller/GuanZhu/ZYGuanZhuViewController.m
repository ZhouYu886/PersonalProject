//
//  ZYGuanZhuViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/19.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYGuanZhuViewController.h"
#import "ZYGuanZhuTableViewCell.h"
#import "userModel.h"
#import <MJExtension/MJExtension.h>
#import "ZYFenSiDTViewController.h"

@interface ZYGuanZhuViewController ()<UITableViewDelegate,UITableViewDataSource,ZYGuanZhuDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *GuanZhuArry;
@end

@implementation ZYGuanZhuViewController

- (void)viewWillAppear:(BOOL)animated{

    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = NO;
    
//    self.navigationController.navigationBar.opaque = YES;
    self.navigationController.navigationBar.translucent = NO;

}

- (void)viewWillDisappear:(BOOL)animated{

  self.tabBarController.tabBar.hidden = NO;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self get];
      //设置界面标题
      self.title = @"我的关注";
    
    //设置tableView分割线不显示
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
      
      self.tableView.delegate = self;
      self.tableView.dataSource = self;
      
      //控制器navigationController顶部是否显示
  //    [self.navigationController setNavigationBarHidden:NO animated:YES];
      
         //    设置导航条标题颜色
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
            self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
 
        //设置导航栏颜色
         self.navigationController.navigationBar.barTintColor = RGB(52, 56, 61);

    //设置背景颜色
      self.view.backgroundColor = RGB(44, 48, 52);
      self.tableView.backgroundColor  = RGB(44, 48, 52);
    
    //设置cell标识
     [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYGuanZhuTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"GuanZhu"];
    
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


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.GuanZhuArry.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
      ZYGuanZhuTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"GuanZhu"];
      [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
      self.tableView.rowHeight = 60;
    cell.UM = self.GuanZhuArry[indexPath.row];
        cell.delegate = self;
      return cell;
}


-(void)remove:(ZYGuanZhuTableViewCell *)cell
{
        UIAlertController *aletVC  = [UIAlertController alertControllerWithTitle:@"" message:@"确定不再关注？" preferredStyle:(UIAlertControllerStyleActionSheet)];
       //第2步:创建按钮
       UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
 
    
       }];
       UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:( UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
           
           //点击按钮执行的代码
            NSIndexPath *Remove = [self.tableView indexPathForCell:cell];
              [self.GuanZhuArry removeObjectAtIndex:Remove.row];
              // 刷新表格
              [self.tableView reloadData];
           
       }];
       //第3步:添加按钮
       [aletVC addAction:action1];
       [aletVC addAction:action2];
       //第4步:显示弹框（相当于show操作）
       [self presentViewController:aletVC animated:YES
                        completion:nil];
}

-(void)BuZaiGuanZhu
{

}
- (void)get
{
    NSUserDefaults *userDefautlt = [NSUserDefaults standardUserDefaults];
    NSNumber *dd  = [userDefautlt objectForKey:@"id"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://api.yysc.online/user/follow/getUserFollowList" parameters:@{
        @"userId": dd,
        @"type" : @1,
        @"pageNumber" : @1,
        @"pageSize" : @41
    }
        progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(responseObject != nil){
            self.GuanZhuArry = [userModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
            [self.tableView reloadData];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure--%@",error);
    }];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row >= 0){
        ZYFenSiDTViewController *pushFSDt = [[ZYFenSiDTViewController alloc]init];
        pushFSDt.fensiModel = self.GuanZhuArry[indexPath.row];
        pushFSDt.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:pushFSDt animated:YES];
    }
}

@end
