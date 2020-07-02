//
//  ZYFenSiViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/19.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYFenSiViewController.h"
#import "ZYFenSiTableViewCell.h"
#import "userModel.h"
#import <MJExtension/MJExtension.h>
#import "ZYFenSiDTViewController.h"



@interface ZYFenSiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray *FengSiArry;
@end

@implementation ZYFenSiViewController

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
    [self get];
        //设置界面标题
        self.title = @"我的粉丝";
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    
    //设置tableView分割线不显示
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
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
       [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYFenSiTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"FS"];
      
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
    return self.FengSiArry.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
      ZYFenSiTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"FS"];
      [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
      self.tableView.rowHeight = 60;
      cell.UM = self.FengSiArry[indexPath.row];
      return cell;
}
  


- (void)get
{
    NSUserDefaults *userDefautlt = [NSUserDefaults standardUserDefaults];
    NSNumber *dd  = [userDefautlt objectForKey:@"id"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://api.yysc.online/user/follow/getUserFollowList" parameters:@{
        @"userId": dd,
        @"type" : @2,
        @"pageNumber" : @1,
        @"pageSize" : @10
    }
        progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(responseObject != nil){
            self.FengSiArry = [userModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
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
        
        pushFSDt.fensiModel = self.FengSiArry[indexPath.row];
        pushFSDt.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:pushFSDt animated:YES];
    }
}



@end
