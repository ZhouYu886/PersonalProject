//
//  ZYRiLiViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYRiLiViewController.h"
#import <FSCalendar/FSCalendar.h>
#import "ZYRiLiShuJuTableViewCell.h"
#import "YXCalendarView.h"
#import "ZYRLModel.h"
#import "ZYGQModel.h"
#import "YYModel.h"
#import <MJExtension/MJExtension.h>
#import "SJNetwork.h"
#import <SDWebImage.h>

@interface ZYRiLiViewController ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>
{
    void * _KVOContext;
}
@property (weak, nonatomic) IBOutlet UITableView *TabelView;
@property (nonatomic, strong) YXCalendarView *calendar;
@property (nonatomic, assign) CGRect PP;
@property (nonatomic, assign) BOOL YY;
@property (nonatomic,strong) NSArray *syArray;
@property (nonatomic,strong) NSArray *syArrayA;
@property(nonatomic,strong)NSArray *GuoQiArray;
@property (nonatomic,strong)NSString *date;
@property (nonatomic,strong)ZYGQModel *gqmd;



@property (weak, nonatomic) IBOutlet NSLayoutConstraint *calendarHeightConstraint;



@end

@implementation ZYRiLiViewController

-(NSArray *)GuoQiArray
{
        if (!_GuoQiArray ) {
            _GuoQiArray  = [ZYGQModel mj_objectArrayWithFilename:@"countryFlag.plist"];
        }
        return _GuoQiArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getDatas];
    [self getAllCountryFlags];

    //设置tableView分割线不显示
    self.TabelView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    self.TabelView.delegate = self;
    self.TabelView.dataSource = self;
    
    //设置导航栏颜色
          self.navigationController.navigationBar.barTintColor = RGB(47, 50, 55);
     //设置背景颜色
       self.view.backgroundColor = RGB(44, 48, 52);
       self.TabelView.backgroundColor  = RGB(44, 48, 52);
    
    //设置cell标识
     [self.TabelView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYRiLiShuJuTableViewCell class]) bundle:nil]
    forCellReuseIdentifier:@"RiLiShuJu"];
    
    UIView *headerV = [UIView new];
    YXCalendarView *calendar = [[YXCalendarView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [YXCalendarView getMonthTotalHeight:[NSDate date] type:CalendarType_Week]) Date:[NSDate date] Type:CalendarType_Week];
        
     calendar.sendSelectDate = ^(NSDate *selDate) {
          self.date = [[YXDateHelpObject manager] getStrFromDateFormat:@"yyyy-MM-dd" Date:selDate];
     NSLog(@"%@",[[YXDateHelpObject manager] getStrFromDateFormat:@"yyyy-MM-dd" Date:selDate]);
         [self getDatas];
                };
                [self.view addSubview:calendar];
    self.TabelView.tableHeaderView = headerV;
    

}

-(void)getDatas{

//    NSDate *date=[NSDate date];
    if (self.date == nil) {
        
        NSDate *dict=[NSDate date];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:@"http://api.yysc.online/admin/getFinanceCalender" parameters:@{@"date":dict} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *dada = responseObject[@"data"];

            NSMutableArray *arrayN = [NSMutableArray array];
           for (NSDictionary *dict in dada) {
            [arrayN addObject:[ZYRLModel yy_modelWithDictionary:dict]];

            }
            self.syArray= arrayN;
            
            [self.TabelView reloadData];

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"@");
        }];
    }else{
        
    NSDictionary *dict = @{
           @"date": self.date,
           };
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:@"http://api.yysc.online/admin/getFinanceCalender" parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *dada = responseObject[@"data"];

            NSMutableArray *arrayN = [NSMutableArray array];
           for (NSDictionary *dict in dada) {
            [arrayN addObject:[ZYRLModel yy_modelWithDictionary:dict]];

            }
            self.syArray= arrayN;
            
            [self.TabelView reloadData];

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"@");
        }];
    }

}


//根据国家名称请求国旗

-(void)getAllCountryFlags{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
     [manager GET:@"http://api.yysc.online/admin/queryAllCountry" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         NSDictionary *dada = responseObject;

         NSMutableArray *arrayN = [NSMutableArray array];
        for (NSDictionary *dict in dada) {
         [arrayN addObject:[ZYGQModel yy_modelWithDictionary:dict]];

         }
         self.GuoQiArray= arrayN;
         
         [self.TabelView reloadData];

     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"请求失败");
     }];
}


#pragma mark - <UITableViewDataSource>


    

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.syArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

      ZYRiLiShuJuTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"RiLiShuJu"];
      [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
      self.TabelView.rowHeight = 110;
    cell.GuoQiM = self.GuoQiArray[indexPath.row];
    cell.RLM = self.syArray[indexPath.row];
    for (NSInteger i = 0; i < self.GuoQiArray.count; i++) {
               ZYGQModel *model = self.GuoQiArray[i];
               if ([cell.RLM.country isEqualToString:model.countryName]) {
                   
                 NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)model.countryFlag,NULL,NULL,kCFStringEncodingUTF8));

                         NSURL *url1 = [NSURL URLWithString:encodedString];
                   
                                [cell.GuoQi sd_setImageWithURL:url1];
               }
               
               }
      return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 110;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerV = [UIView new];
    headerV.backgroundColor = RGB(44, 48, 52);
    return headerV;


}























@end
