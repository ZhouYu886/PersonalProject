//
//  ZYShouYeViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYShouYeViewController.h"
#import "HWRollingView.h"
#import "ZYZiXunPushTableViewCell.h"
#import "ZYJingXuanTableViewCell.h"
#import "ZYBIZhongTableViewCell.h"
#import "ZYBiXiangQingTableViewCell.h"
#import "ZYZiXunJingXuanTableViewCell.h"
#import "ZYZiXunJingXuanM.h"
#import "LCPNetWorkManager.h"
#import <MJExtension/MJExtension.h>
#import "YYModel.h"
#import "ZYJingXuanXiangQingViewController.h"
#import "ZYZiXunJingXuanHeader.h"

#define ColorBlue [UIColor colorWithRed:113/255.0 green:103/255.0 blue:252/255.0 alpha:1/1.0]
@interface ZYShouYeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *TableView;

@property (nonatomic, strong) ZYZiXunJingXuanM *model;

@property(nonatomic,strong)NSArray *ZiXunArray;

@property(nonatomic,strong)NSArray *HuoBiArray;
@property(nonatomic,strong)ZYZiXunJingXuanHeader *header;
@property(nonatomic,strong)NSArray *ShuziArray;

@end

@implementation ZYShouYeViewController

- (void)viewWillAppear:(BOOL)animated
{
     self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setB];
    [self ZiXunJingXuna];
    [self tt];
    [self ShuZi];
    //设置界面标题
    self.title = @"首页";
    
    self.TableView.delegate = self;
    self.TableView.dataSource = self;
    
    //控制器navigationController顶部是否显示
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
       //    设置导航条标题颜色
          [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
          self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    //设置tableView分割线不显示
    self.TableView.separatorStyle = UITableViewCellSelectionStyleNone;
          
      //设置导航栏颜色
       self.navigationController.navigationBar.barTintColor = RGB(44, 48, 52);

    
  //设置背景颜色
    self.view.backgroundColor = RGB(44, 48, 52);
    self.TableView.backgroundColor  = RGB(44, 48, 52);
    
    //设置左边点击跳转头像
    
     UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
     [btn setImage:[UIImage imageNamed:@"pic_shouyetouxiang"] forState:UIControlStateNormal];
     [btn addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
     //适应大小
     [btn sizeToFit];
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
     
     
     //设置右边点击跳转查找
     UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
     [btn1 setImage:[UIImage imageNamed:@"ic_sousuo"] forState:UIControlStateNormal];
     [btn1 addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
     
     //适应大小
     [btn sizeToFit];
     
     //设置右边rightBarButtonItem的自定义btn
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    
    //设置cell标识
     [self.TableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYZiXunPushTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"ZiXunPush"];
    
    //设置cell标识
     [self.TableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYJingXuanTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"HuiBiJingXuan"];
    
    //设置cell标识
     [self.TableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYBIZhongTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"BiZhong"];
    
    //设置cell标识
     [self.TableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYBiXiangQingTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"XiangQing"];
    
    //设置cell标识
     [self.TableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYZiXunJingXuanTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"ZiXunJingXuan"];
}


-(void)ShuZi{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://data.api51.cn/apis/integration/rank/?market_type=cryptocurrency&limit=13&order_by=desc&fields=prod_name%2Cprod_code%2Clast_px%2Cpx_change%2Cpx_change_rate%2Chigh_px%2Clow_px%2Cupdate_time&token=3f39051e89e1cea0a84da126601763d8" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dada = responseObject[@"data"];
        NSArray *arr = dada[@"candle"];

        self.ShuziArray= arr;
       [[NSOperationQueue mainQueue] addOperationWithBlock:^{
       [self.TableView reloadData];
       }];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"@");
    }];
        
}




-(void)ZiXunJingXuna{
        NSDate *date=[NSDate date];
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:@"http://api.yysc.online/news/getNewListByProject.do?pageSize&pageNum&project" parameters:@{@"date":date,} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *dada = responseObject[@"data"][@"list"];
            
            NSMutableArray *arrayN = [NSMutableArray array];
            
           for (NSDictionary *dict in dada) {
            [arrayN addObject:[ZYZiXunJingXuanM  yy_modelWithDictionary:dict]];
            }
            
            self.ZiXunArray = arrayN;
            [self.TableView reloadData];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"@");
        }];
    
}

-(void)tt{
//    WEAKSELF
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://data.api51.cn/apis/integration/rank/?market_type=index&limit=38&order_by=desc&fields=prod_name%2Cprod_code%2Clast_px%2Cpx_change%2Cpx_change_rate%2Chigh_px%2Clow_px%2Cupdate_time&token=3f39051e89e1cea0a84da126601763d8" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dada = responseObject[@"data"];
        NSArray *arr = dada[@"candle"];

        self.HuoBiArray= arr;
       [[NSOperationQueue mainQueue] addOperationWithBlock:^{
           [self.TableView reloadData];
       }];
//        weakSelf.sArray= arr;
//        weakSelf.Tableview.reloadData;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"@");
    }];
        
}





//轮播
-(void)setB{
//       __weak typeof(self) weakSelf = self;
        #pragma mark - 本地图片(data为图片名)
        HWRollingView * RollingView = [HWRollingView rollingViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 106) RollingStyle:RollingStyleLocal Data:@[@"banner",@"banner",@"banner"] action:^(NSInteger index) {
            NSLog(@"点击了第%ld页", index);
            if (index == 0) {
                ZYShouYeViewController *daads = [[ZYShouYeViewController alloc] init];
                [self.navigationController pushViewController:daads animated:YES];
            }
        }];
//#pragma mark - 网络图片(data为图片URL)
//        HWRollingView * RollingView = [HWRollingView rollingViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 106) RollingStyle:RollingStyleNetwork Data:@[ @"http://pic28.nipic.com/20130424/11588775_115415688157_2.jpg", @"http://img05.tooopen.com/images/20150531/tooopen_sy_127457023651.jpg",@"https://ss0.baidu.com/7Po3dSag_xI4khGko9WTAnF6hhy/image/h%3D360/sign=0d00fbf7d2ca7bcb627bc1298e096b3f/a2cc7cd98d1001e9460fd63bbd0e7bec54e797d7.jpg"] action:^(NSInteger index) {
//                NSLog(@"点击了第%ld页", index);
//        }];
 
    self.TableView.tableHeaderView = RollingView;
}

//跳转我的
-(void)leftClick
{
    self.tabBarController.selectedIndex = 3;
    
}

//跳转搜索
-(void)rightClick
{
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
       if (section == 0) {
    return 1;
    }else if (section == 1) {
        return 1;
    }else if(section == 2){
        return 1;
    }else if (section == 3){
        return 5;
    }else{
        return self.ZiXunArray.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
   if (indexPath.section==0 && indexPath.row == 0) {
           ZYZiXunPushTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"ZiXunPush"];
           [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
       self.TableView.rowHeight = 83.5;
           return cell;
   }
   else if (indexPath.section==1 && indexPath.row == 0){
           ZYJingXuanTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"HuiBiJingXuan"];
           [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
       self.TableView.rowHeight = 100;
       cell.BZhong.text = self.HuoBiArray[indexPath.row][0];
       cell.JQ.text = [NSString stringWithFormat:@"%f",[_HuoBiArray[indexPath.row][5]floatValue]];
       cell.ZF.text = [NSString stringWithFormat:@"%+.2f%%",[_HuoBiArray[indexPath.row][4] floatValue]];
       
       cell.BZhongB.text = self.HuoBiArray[indexPath.row][1];
       cell.JQB.text = [NSString stringWithFormat:@"%f",[_HuoBiArray[indexPath.row][5]floatValue]];
       cell.ZFB.text = [NSString stringWithFormat:@"%+.2f%%",[_HuoBiArray[indexPath.row][4] floatValue]];
       
       if ([cell.ZF.text floatValue] < 0) {
           cell.ZF.textColor = RGB(65, 215, 93);
       }else if ([cell.ZFB.text floatValue] > 0){
           cell.ZF.textColor = RGB(255, 88, 88);
       }
       
       if ([cell.ZFB.text floatValue] < 0) {
           cell.ZFB.textColor = RGB(65, 215, 93);
       }else if ([cell.ZFB.text floatValue] > 0){
           cell.ZFB.textColor = RGB(255, 88, 88);
       }
       
       
           return cell;
   }else if(indexPath.section==2 && indexPath.row == 0){
           ZYBIZhongTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"BiZhong"];
           [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
       self.TableView.rowHeight = 43;
           return cell;
   }
   else if (indexPath.section==3){
           ZYBiXiangQingTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"XiangQing"];
           [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
       cell.BiZhongLabel.text = self.ShuziArray[indexPath.row][1];
       cell.ShouYiLabel.text = [NSString stringWithFormat:@"%f",[_ShuziArray[indexPath.row][3] floatValue]];
       cell.JiaGeLabel.text = [NSString stringWithFormat:@"%f",[_ShuziArray[indexPath.row][2] floatValue]];
       cell.GunagChiSuanLabel.text = [NSString stringWithFormat:@"%f",[_ShuziArray[indexPath.row][4] floatValue]];
       cell.QuanWangSuan.text = [NSString stringWithFormat:@"%f",[_ShuziArray[indexPath.row][5] floatValue]];
       cell.KuangJiShu.text = [NSString stringWithFormat:@"%f",[_ShuziArray[indexPath.row][6] floatValue]];
       self.TableView.rowHeight = 51;
           return cell;
   }
//   else if (indexPath.section==3 && indexPath.row == 1){
//                  ZYBiXiangQingTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"XiangQing"];
//           [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//       self.TableView.rowHeight = 51;
//       cell.Image.image = [UIImage imageNamed:@"pic_logo2"];
//       cell.BiZhongLabel.text = @"BTCD";
//       cell.ShouYiLabel.text = @"¥0.6/T";
//       cell.JiaGeLabel.text = @"¥56864.48";
//       cell.GunagChiSuanLabel.text = @"18.69EN/s";
//       cell.QuanWangSuan.text = @"63.58EH/s";
//       cell.KuangJiShu.text = @"693.432";
//       return cell;
//   }
//   else if (indexPath.section==3 && indexPath.row == 2){
//                  ZYBiXiangQingTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"XiangQing"];
//           [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//       self.TableView.rowHeight = 51;
//       cell.Image.image = [UIImage imageNamed:@"pic_logo3"];
//       cell.BiZhongLabel.text = @"BTCD";
//       cell.ShouYiLabel.text = @"¥0.6/T";
//       cell.JiaGeLabel.text = @"¥56864.48";
//       cell.GunagChiSuanLabel.text = @"18.69EN/s";
//       cell.QuanWangSuan.text = @"63.58EH/s";
//       cell.KuangJiShu.text = @"693.432";
//       return cell;
//   }
//   else if (indexPath.section==3 && indexPath.row == 3){
//                  ZYBiXiangQingTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"XiangQing"];
//           [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//       self.TableView.rowHeight = 51;
//       cell.Image.image = [UIImage imageNamed:@"pic_logo4"];
//       cell.BiZhongLabel.text = @"BTCD";
//       cell.ShouYiLabel.text = @"¥0.6/T";
//       cell.JiaGeLabel.text = @"¥56864.48";
//       cell.GunagChiSuanLabel.text = @"18.69EN/s";
//       cell.QuanWangSuan.text = @"63.58EH/s";
//       cell.KuangJiShu.text = @"693.432";
//       return cell;
//   }
//   else if (indexPath.section==3 && indexPath.row == 4){
//                  ZYBiXiangQingTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"XiangQing"];
//           [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//       self.TableView.rowHeight = 51;
//       cell.Image.image = [UIImage imageNamed:@"pic_logo5"];
//       cell.BiZhongLabel.text = @"BTCD";
//       cell.ShouYiLabel.text = @"¥0.6/T";
//       cell.JiaGeLabel.text = @"¥56864.48";
//       cell.GunagChiSuanLabel.text = @"18.69EN/s";
//       cell.QuanWangSuan.text = @"63.58EH/s";
//       cell.KuangJiShu.text = @"693.432";
//       return cell;
//   }
   else if(indexPath.section == 4 ){
       ZYZiXunJingXuanTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"ZiXunJingXuan"];
       [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    self.TableView.rowHeight = 230;
       
       cell.model = self.ZiXunArray[indexPath.row];
       return cell;
    }
    return [UITableViewCell new];
}



//设置cell间隔的颜色
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    if (section == 0) {
        UIView *header = [[UIView alloc] init];
        header.backgroundColor = RGB(44, 48, 52);
        return header;
      }else if (section == 1){
          UIView *header = [[UIView alloc] init];
          header.backgroundColor = RGB(44, 48, 52);
          return header;
      }else if (section == 2){
                 UIView *header = [[UIView alloc] init];
          header.backgroundColor = RGB(44, 48, 52);
          return header;
      }else if (section == 3){
        UIView *header = [[UIView alloc] init];
        header.backgroundColor = RGB(44, 48, 52);
        return header;
      }else{
       //加载XIB个人界面的顶部headerView
       self.header = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([ZYZiXunJingXuanHeader class]) owner:nil options:nil]firstObject];
        //设置headerView的位置，和样式缺一不可
          //        self.TableView.tableHeaderView = self.header;
                  self.header.autoresizingMask = UITableViewScrollPositionNone;
              return _header;
      }
    
    
    
    
}

//设置cell之间的间隔
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  if (section == 0) {
        return 12.5;
    }else if (section == 1){
        return 25;
    }else if (section == 2){
        return 0;
    }else if (section == 3){
        return 0;
    }else{
        return 25;
    }

}





-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 4 ){
        ZYJingXuanXiangQingViewController *pushJX = [ZYJingXuanXiangQingViewController new];
               pushJX.ZiXunJingXuanM = self.ZiXunArray[indexPath.row];
               [self.navigationController pushViewController:pushJX animated:YES];
    }
    
    
}

@end
