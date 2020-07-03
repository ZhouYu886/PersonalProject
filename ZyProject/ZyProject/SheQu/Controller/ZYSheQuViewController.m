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
#import "ZYSheQuM.h"
#import "YYModel.h"
#import "ZYPingLunTableViewCell.h"
#import "ZYDengluViewController.h"

@interface ZYSheQuViewController ()<UITableViewDataSource,UITableViewDelegate,ZYTuiJianDelegate>
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property(nonatomic,strong)NSMutableArray *SheQuArray;
@property(assign,nonatomic)int ZJSJ;
@property (nonatomic,strong)UIView *tempView;
@property(assign,nonatomic)int gg;
@end

@implementation ZYSheQuViewController


- (void)viewWillAppear:(BOOL)animated
{
    [self tt];
    [self shuaxin];
     self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
}

-(void)setSQarray:(NSMutableArray *)SQarray
{
    _SheQuArray = SQarray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.ZJSJ = 1;
    self.gg = 1;
    //设置界面标题
    self.title = @"社区";
    //设置tableView分割线不显示
    self.TableView.separatorStyle = UITableViewCellSelectionStyleNone;
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
        return self.SheQuArray.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0 && indexPath.row == 0) {
            ZYReBangTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"ReTui"];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.TableView.rowHeight = 151;
            return cell;
    }else if (indexPath.section==1 ){
        ZYTuiJianTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"TuiJian"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.SqM = self.SheQuArray[indexPath.row];
        self.TableView.rowHeight = 209;
        cell.delegate = self;
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
    if (indexPath.section == 1 && indexPath.row >= 0){
        ZYXaiangQingViewController *pushXq = [[ZYXaiangQingViewController alloc]init];
        pushXq.SheQuM = self.SheQuArray[indexPath.row];
        pushXq.hidesBottomBarWhenPushed = YES;
        pushXq.SQarray = self.SheQuArray;
        [self.navigationController pushViewController:pushXq animated:YES];
    }
    
}

//if (indexPath.row >= 0) {
//    ZYHyFbXqViewController *pushXQ = [ZYHyFbXqViewController new];
//    pushXQ.hangM = self.HangYeFEngBaoArray[indexPath.row];
//    [self.navigationController pushViewController:pushXQ animated:YES];
//}


-(void)tt
{
    [LCPNetWorkManager getWithPathUrl:@"/user/talk/getTalkListByProject?project" parameters:@{@"pageNumber": @(self.gg),@"pageSize" :@(self.ZJSJ *10),
    } queryParams:nil Header:nil success:^(BOOL success, id result) {
        
        NSDictionary *dada = result[@"data"][@"list"];
        NSMutableArray *arrayN = [NSMutableArray array];
        for (NSDictionary *dict in dada) {
            [arrayN addObject:[ZYSheQuM SheQu:dict]];
            
        }
        self.SheQuArray= arrayN;
        
        [self.TableView reloadData];
        
    } failure:^(BOOL failuer, NSError *error) {
        
    }];
//    NSURL *url = [NSURL URLWithString:@"http://api.yysc.online/user/talk/getTalkListByProject?pageNumber&pageSize&project=futures"];
//    NSURLSession *session = [NSURLSession sharedSession];
//    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//        NSArray *arr = dict[@"data"][@"list"];
//        NSMutableArray *arrayM = [NSMutableArray array];
//        for (NSDictionary *smallDic in arr) {
//            [arrayM addObject:[ZYSheQuM SheQu:smallDic]];
//        }
//        self.SheQuArray = arrayM;
//        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//            [self.TableView reloadData];
//        }];
//    }]resume];

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


}

-(void)loadNewData:(MJRefreshNormalHeader *)header{
    self.gg++;
    self.ZJSJ = 1;
    [self tt];
//    [self JsonTocaijin];
    
    if (_SheQuArray != nil && ![_SheQuArray isKindOfClass:[NSNull class]] && _SheQuArray.count != 0) {
          [header setTitle:@"刷新成功" forState:MJRefreshStateRefreshing];
          [header endRefreshing];
    }else{
        [header setTitle:@"刷新失败" forState:MJRefreshStateRefreshing];
        [header endRefreshing];
    }

}

-(void)delayMethod
{
 self.TableView.mj_footer.alpha = 0.01;
}

-(void)clickBtn:(ZYTuiJianTableViewCell*)cell
{
    NSIndexPath *Remove = [self.TableView indexPathForCell:cell];
    [self.SheQuArray removeObjectAtIndex:Remove.row];
    [self.TableView reloadData];
}



@end
