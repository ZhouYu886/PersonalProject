//
//  ZYHangYeViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYHangYeViewController.h"
#import "ZYHangYeTableViewCell.h"
#import "ZYHangYeViewController.h"
#import "ZYHangYeFBM.h"
#import "YYModel.h"
//#import "ZYHyFbXqViewController.h"


@interface ZYHangYeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *Tableview;

@property(nonatomic,strong)NSArray *HangYeFEngBaoArray;
@property(assign,nonatomic)int ZJSJ;
@property(assign,nonatomic)int gg;

@end

@implementation ZYHangYeViewController

//即将显示
- (void)viewWillAppear:(BOOL)animated
{
    [self tt];
     [self shuaxin];
}
    


- (void)viewDidLoad {
    [super viewDidLoad];

    self.Tableview.delegate = self;
    self.Tableview.dataSource = self;
    self.ZJSJ = 1;
    self.gg = 1;
         //设置导航栏颜色
             self.navigationController.navigationBar.barTintColor = RGB(47, 50, 55);
        //设置背景颜色
          self.view.backgroundColor = RGB(44, 48, 52);
          self.Tableview.backgroundColor  = RGB(44, 48, 52);
    //设置cell标识
     [self.Tableview registerNib:[UINib nibWithNibName:NSStringFromClass([ZYHangYeTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"FengBao"];
    //设置tableView分割线不显示
    self.Tableview.separatorStyle = UITableViewCellSelectionStyleNone;
    
}

-(void)tt
{
    NSDate *date=[NSDate date];
      NSDateFormatter* dayFormatter= [[NSDateFormatter alloc]init];
      [dayFormatter setDateFormat:@"yyyy-MM-dd"];
      NSString* strDate =[dayFormatter stringFromDate:date];
      NSLog(@"%@",strDate);
      
      
      AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
      [manager GET:@"http://api.yysc.online/admin/getFinanceTalk" parameters:@{ @"date":date,@"pageSize":@(self.ZJSJ*10)} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          
          NSDictionary *dada = responseObject[@"data"];
          
          NSMutableArray *arrayN = [NSMutableArray array];
         for (NSDictionary *dict in dada) {
          [arrayN addObject:[ZYHangYeFBM yy_modelWithDictionary:dict]];
          }
          
          self.HangYeFEngBaoArray= arrayN;
          
          [self.Tableview reloadData];
      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          NSLog(@"@");
      }];
          
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.HangYeFEngBaoArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
      ZYHangYeTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"FengBao"];
      [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
     cell.Hm = self.HangYeFEngBaoArray[indexPath.row];
    
      self.Tableview.rowHeight = 154;
      return cell;
}


//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.row >= 0) {
//        ZYHyFbXqViewController *pushXQ = [ZYHyFbXqViewController new];
//        pushXQ.hangM = self.HangYeFEngBaoArray[indexPath.row];
//        [self.navigationController pushViewController:pushXQ animated:YES];
//    }
//    
//}

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
              self.Tableview.mj_header = header;
        
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
          self.Tableview.mj_footer = footer;
}

-(void)loadMoreData:(MJRefreshAutoNormalFooter *)footer{
    [footer beginRefreshing];
    self.Tableview.mj_footer.alpha = 1;
    self.ZJSJ++;

    int64_t delayInSeconds = 2.0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
     [footer setTitle:@"加载成功" forState:MJRefreshStateIdle];
      [self performSelector:@selector(delayMethod) withObject:nil afterDelay:1.0];
     [footer endRefreshing];
    });
        [self tt];
//        [self JsonTocaijin];

}

-(void)loadNewData:(MJRefreshNormalHeader *)header{
    self.gg++;
    [self tt];
//    [self JsonTocaijin];
    
    if (_HangYeFEngBaoArray != nil && ![_HangYeFEngBaoArray isKindOfClass:[NSNull class]] && _HangYeFEngBaoArray.count != 0) {
          [header setTitle:@"刷新成功" forState:MJRefreshStateRefreshing];
          [header endRefreshing];
          [self tt];
        
    }else{
        [header setTitle:@"刷新失败" forState:MJRefreshStateRefreshing];
        [header endRefreshing];
    }

}

-(void)delayMethod{
 self.Tableview.mj_footer.alpha = 0.01;
}

@end
