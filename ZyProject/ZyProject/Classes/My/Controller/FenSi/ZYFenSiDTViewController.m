//
//  ZYFenSiDTViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/30.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYFenSiDTViewController.h"
#import "ZYGeRenXinXiViewController.h"
#import "ZYTaRenDtHeader.h"
#import "ZYGeRenXinXiTableViewCell.h"
#import "userModel.h"
#import <MJExtension/MJExtension.h>
#import "LCPNetWorkManager.h"
#import "talkListModel.h"
#import "YYModel.h"


@interface ZYFenSiDTViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property(nonatomic,strong)ZYTaRenDtHeader *heder;
@property(nonatomic,strong)NSArray *TRDTArray;
@property(nonatomic,strong)userModel *um;
@property(nonatomic,strong)talkListModel *talkM;
@property(nonatomic,strong)NSArray *FenArray;

@end
@implementation ZYFenSiDTViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     [self NR];
    self.tabBarController.tabBar.hidden = YES;
    
    self.navigationController.navigationBar.hidden = NO;
    
//    self.navigationController.navigationBar.opaque = YES;
    self.navigationController.navigationBar.translucent = NO;
    //设置tableView分割线不显示
    self.TableView.separatorStyle = UITableViewCellSelectionStyleNone;
}

- (void)viewWillDisappear:(BOOL)animated{

  self.tabBarController.tabBar.hidden = NO;

}

//-(void)setTarenbDTArray:(NSArray *)TarenbDTArray
//{
//    self.TRDTArray = TarenbDTArray;
//    NSLog(@"~~");
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.talkM = [talkListModel new];
    
    self.title = @"他人动态";
    self.TableView.delegate = self;
    self.TableView.dataSource = self;
    
        //设置导航栏颜色
         self.navigationController.navigationBar.barTintColor = RGB(52, 56, 61);

    //设置背景颜色
      self.view.backgroundColor = RGB(44, 48, 52);
      self.TableView.backgroundColor  = RGB(44, 48, 52);
    
    //设置左边返回
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    //适应大小
    [btn sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    //设置cell标识
     [self.TableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYGeRenXinXiTableViewCell class]) bundle:nil]
          forCellReuseIdentifier:@"GeRenXinXi"];
}


-(void)NR
{
//       NSDictionary *dict = @{
//        @"userId": _fensiModel.id,
//        };
//
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager GET:@"http://api.yysc.online/user/talk/getTalkList/155" parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSDictionary *dada = responseObject[@"data"][@"list"];
//        NSMutableArray *arrayN = [NSMutableArray array];
//       for (NSDictionary *dict in dada) {
//        [arrayN addObject:[userModel yy_modelWithDictionary:dict]];
//
//        }
//        self.FenArray= arrayN;
//        [self.TableView reloadData];
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"@");
//    }];
    
    NSDictionary *dict = @{
    @"userId": _fensiModel.id,
    };
    [LCPNetWorkManager postWithPathUrl:@"/user/talk/getTalkList/155" parameters:dict queryParams:nil Header:nil success:^(BOOL success, id result) {
        
    self.talkM = [talkListModel mj_objectWithKeyValues:result[@"data"]];
        [self.TableView reloadData];
    } failure:^(BOOL failuer, NSError *error) {

    }];
}

//设置左边点击返回上一级
-(void)leftClick
{
    //返回上一级
    [self.navigationController popViewControllerAnimated:YES];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _talkM.list.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        ZYGeRenXinXiTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"GeRenXinXi"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.Um = self.fensiModel;
    cell.listM = self.talkM.list[indexPath.row];
        return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 155;
}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
            //加载XIB个人界面的顶部headerView
        self.heder = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([ZYTaRenDtHeader class]) owner:nil options:nil]firstObject];
        //设置headerView的位置，和样式缺一不可
       self.heder.UM = self.fensiModel;
//        self.TableView.tableHeaderView = self.header;
        self.heder.autoresizingMask = UITableViewScrollPositionNone;
        return _heder;
}



@end
