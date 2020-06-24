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
@property(nonatomic,strong)NSArray *HangQingArray;
@property(assign,nonatomic)int ZJSJ;

@end

@implementation ZYHangQingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tt];
    [self shuaxin];
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

-(void)tt{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://data.api51.cn/apis/integration/rank/?market_type=index&limit=38&order_by=desc&fields=prod_name%2Cprod_code%2Clast_px%2Cpx_change%2Cpx_change_rate%2Chigh_px%2Clow_px%2Cupdate_time&token=3f39051e89e1cea0a84da126601763d8" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dada = responseObject[@"data"];
        NSArray *arr = dada[@"candle"];

        self.HangQingArray= arr;
       [[NSOperationQueue mainQueue] addOperationWithBlock:^{
           [self.TableView reloadData];
       }];
//        weakSelf.sArray= arr;
//        weakSelf.Tableview.reloadData;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"@");
    }];
        
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.HangQingArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
      ZYMingChengTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"JiaGe"];
      [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
      self.TableView.rowHeight = 80;
        
    cell.BiZhong.text = _HangQingArray[indexPath.row][0];
    
    cell.JQ.text = [NSString stringWithFormat:@"%f",[_HangQingArray[indexPath.row][5]floatValue]];
    
        
    cell.XJ.text = [NSString stringWithFormat:@"%.2f",[_HangQingArray[indexPath.row][2] floatValue]];
    cell.ZF.text = [NSString stringWithFormat:@"%.2f%%",[_HangQingArray[indexPath.row][4] floatValue]];
    if ([cell.ZF.text floatValue] < 0) {
        cell.ZF.textColor = RGB(65, 215, 93);
    }else if ([cell.ZF.text floatValue] > 0){
        cell.ZF.textColor = RGB(255, 88, 88);
    }
        
      return cell;
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
    
    if (_HangQingArray != nil && ![_HangQingArray isKindOfClass:[NSNull class]] && _HangQingArray.count != 0) {
          [header setTitle:@"刷新成功" forState:MJRefreshStateRefreshing];
          [header endRefreshing];
        
        
    }else{
        [header setTitle:@"刷新失败" forState:MJRefreshStateRefreshing];
        [header endRefreshing];
    }

}

-(void)delayMethod{
 self.TableView.mj_footer.alpha = 0.01;
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
