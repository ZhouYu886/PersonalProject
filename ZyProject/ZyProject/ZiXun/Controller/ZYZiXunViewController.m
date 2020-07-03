//
//  ZYZiXunViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYZiXunViewController.h"
#import "ZYZiXunTableViewCell.h"
#import "ZYZiXunJingXuanM.h"
#import "YYModel.h"
#import "ZYJingXuanXiangQingViewController.h"

@interface ZYZiXunViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property(nonatomic,strong)NSArray *ZiXunArray;
@property(assign,nonatomic)int ZJSJ;
@property(assign,nonatomic)int gg;

@end

@implementation ZYZiXunViewController

- (void)viewWillAppear:(BOOL)animated
{
     self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewDidLoad
{
    self.gg = 1;
    self.ZJSJ = 1;
    [self shuaxin];
    [super viewDidLoad];
    [self ZiXunJingXuna];
    
    self.view.backgroundColor = UIColor.brownColor;
    
    //设置tableView分割线不显示
    self.TableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    //设置界面标题
       self.title = @"资讯";
       
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
     [self.TableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYZiXunTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"ZiXun"];

    
    
}

-(void)ZiXunJingXuna{    
     [LCPNetWorkManager getWithPathUrl:@"/news/getNewListByProject.do?project" parameters:@{@"pageNumber": @(self.gg),@"pageSize" :@(self.ZJSJ *10),
     } queryParams:nil Header:nil success:^(BOOL success, id result) {

        NSDictionary *dada = result[@"data"][@"list"];
                   NSMutableArray *arrayN = [NSMutableArray array];
                  for (NSDictionary *dict in dada) {
                   [arrayN addObject:[ZYZiXunJingXuanM yy_modelWithDictionary:dict]];

                   }
                   self.ZiXunArray= arrayN;

                   [self.TableView reloadData];

     } failure:^(BOOL failuer, NSError *error) {

     }];
    
    
    
//        NSDate *date=[NSDate date];
//        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//        [manager GET:@"http://api.yysc.online/news/getNewListByProject.do?pageSize&pageNum&project" parameters:@{@"date":date,} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSDictionary *dada = responseObject[@"data"][@"list"];
//
//            NSMutableArray *arrayN = [NSMutableArray array];
//
//           for (NSDictionary *dict in dada) {
//            [arrayN addObject:[ZYZiXunJingXuanM  yy_modelWithDictionary:dict]];
//            }
//
//            self.ZiXunArray = arrayN;
//            [self.TableView reloadData];
//
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSLog(@"@");
//        }];
}






-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.ZiXunArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
            ZYZiXunTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"ZiXun"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.TableView.rowHeight = 175;
        cell.ZiXunM = self.ZiXunArray[indexPath.row];
        return cell;
    

}

//设置cell之间的间隔
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 11.5;
}

//设置cell间隔的颜色
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = RGB(44, 48, 52);
    return header;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >= 0){
        ZYJingXuanXiangQingViewController *pushJX = [ZYJingXuanXiangQingViewController new];
               pushJX.ZiXunJingXuanM = self.ZiXunArray[indexPath.row];
               [self.navigationController pushViewController:pushJX animated:YES];
    }
    
    
}


- (void)shuaxin{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData:)];
              // 设置文字
              [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
              [header setTitle:@"即将刷新" forState:MJRefreshStatePulling];
              [header setTitle:@"正在刷新 ..." forState:MJRefreshStateRefreshing];
              
              // 设置字体
              header.stateLabel.font = [UIFont systemFontOfSize:15];
              header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];

              // 设置颜色
              header.stateLabel.textColor = [UIColor whiteColor];
              header.lastUpdatedTimeLabel.textColor = [UIColor grayColor];

              // 马上进入刷新状态
        //      [header beginRefreshing];

              // 设置刷新控件
              self.TableView.mj_header = header;
        
    // 上拉加载
        
        MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData:)];
          
          // 设置文字
          [footer setTitle:@"上拉加载" forState:MJRefreshStateIdle];
          [footer setTitle:@"正在加载 ..." forState:MJRefreshStateRefreshing];
          [footer setTitle:@"No more data" forState:MJRefreshStateNoMoreData];

          // 设置字体
          footer.stateLabel.font = [UIFont systemFontOfSize:15];

          // 设置颜色
          footer.stateLabel.textColor = [UIColor grayColor];

          // 设置footer
          self.TableView.mj_footer = footer;
}

-(void)loadMoreData:(MJRefreshAutoNormalFooter *)footer{
    [footer beginRefreshing];
    self.TableView.mj_footer.alpha = 1;
    self.ZJSJ++;

    int64_t delayInSeconds = 2.0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
     [footer setTitle:@"加载成功" forState:MJRefreshStateIdle];
      [self performSelector:@selector(delayMethod) withObject:nil afterDelay:1.0];
     [footer endRefreshing];
    });
        [self ZiXunJingXuna];
//        [self JsonTocaijin];

}

-(void)loadNewData:(MJRefreshNormalHeader *)header{
    self.gg++;
    self.ZJSJ = 1;
    [self ZiXunJingXuna];
//    [self JsonTocaijin];
    
    if (_ZiXunArray != nil && ![_ZiXunArray isKindOfClass:[NSNull class]] && _ZiXunArray.count != 0) {
          [header setTitle:@"刷新成功" forState:MJRefreshStateRefreshing];
          [header endRefreshing];
          [self ZiXunJingXuna];
        
    }else{
        [header setTitle:@"刷新失败" forState:MJRefreshStateRefreshing];
        [header endRefreshing];
    }

}

-(void)delayMethod{
 self.TableView.mj_footer.alpha = 0.01;
}


@end
