//
//  ZYKuaiXunViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYKuaiXunViewController.h"
#import "ZYKuaiXunTableViewCell.h"
#import "ZYZiLiaoTableViewCell.h"
#import "ZYKxM.h"
#import "YYModel.h"
@interface ZYKuaiXunViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property(nonatomic,strong)NSArray *kxArray;
@property(assign,nonatomic)int ZJSJ;
@end

@implementation ZYKuaiXunViewController

-(void)viewWillAppear:(BOOL)animated
{
    [self tt];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self shuaxin];
    self.TableView.delegate =self;
    self.TableView.dataSource =self;
    self.ZJSJ = 1;
    //设置tableView分割线不显示
    self.TableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    //设置导航栏颜色
             self.navigationController.navigationBar.barTintColor = RGB(47, 50, 55);
    //设置背景颜色
          self.view.backgroundColor = RGB(44, 48, 52);
          self.TableView.backgroundColor  = RGB(44, 48, 52);
    
    //设置cell标识
     [self.TableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYKuaiXunTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"KuaiXun"];
    
    //设置cell标识
     [self.TableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYZiLiaoTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"ZiLiao"];
    
}

-(void)tt
{
        
        NSDate *date=[NSDate date];
    
    //    http://api.yysc.online/admin/getFinanceTalk?pageNum =RequestParam&pageSize=
    //    http://api.yysc.online/admin/getFinanceAffairs
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:@"http://api.yysc.online/admin/getFinanceTalk" parameters:@{@"date":date,@"pageSize":@(self.ZJSJ*10)} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *dada = responseObject[@"data"];
            
            NSMutableArray *arrayN = [NSMutableArray array];
           for (NSDictionary *dict in dada) {
            [arrayN addObject:[ZYKxM yy_modelWithDictionary:dict]];
               
            }
            
            self.kxArray= arrayN;
            
            [self.TableView reloadData];

            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"@");
        }];

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
        return self.kxArray.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 ) {
              ZYKuaiXunTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"KuaiXun"];
          [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
          self.TableView.rowHeight = 124;
          return cell;
    }
    else if (indexPath.section == 1 ){
            ZYZiLiaoTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"ZiLiao"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.TableView.rowHeight = 120;
        cell.KxM = self.kxArray[indexPath .row];
        return cell;
    }
        return [UITableViewCell new];

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
        [self tt];
//        [self JsonTocaijin];

}

-(void)loadNewData:(MJRefreshNormalHeader *)header{
    [self tt];
//    [self JsonTocaijin];
    
    if (_kxArray != nil && ![_kxArray isKindOfClass:[NSNull class]] && _kxArray.count != 0) {
          [header setTitle:@"刷新成功" forState:MJRefreshStateRefreshing];
          [header endRefreshing];
        [self tt];
        
    }else{
        [header setTitle:@"刷新失败" forState:MJRefreshStateRefreshing];
        [header endRefreshing];
    }

}

-(void)delayMethod{
 self.TableView.mj_footer.alpha = 0.01;
}


@end
