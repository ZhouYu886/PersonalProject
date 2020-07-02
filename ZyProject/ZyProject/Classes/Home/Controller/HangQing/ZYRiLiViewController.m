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

@interface ZYRiLiViewController ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>
{
    void * _KVOContext;
}
@property (weak, nonatomic) IBOutlet UITableView *TabelView;
@property (nonatomic, strong) YXCalendarView *calendar;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *calendarHeightConstraint;



@end

@implementation ZYRiLiViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

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
     NSLog(@"%@",[[YXDateHelpObject manager] getStrFromDateFormat:@"yyyy-MM-dd" Date:selDate]);
                };
                [self.view addSubview:calendar];
    self.TabelView.tableHeaderView = headerV;
    

}

#pragma mark - <UITableViewDataSource>


    

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
        return 5;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
if (indexPath.row <= 5){
      ZYRiLiShuJuTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"RiLiShuJu"];
      [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
      self.TabelView.rowHeight = 110;
      return cell;
    }
    return [UITableViewCell new];
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




#pragma mark - <UITableViewDelegate>
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    if (indexPath.section == 0) {
//        FSCalendarScope selectedScope = indexPath.row == 0 ? FSCalendarScopeMonth : FSCalendarScopeWeek;
////        [self.calendar setScope:selectedScope animated:self.animationSwitch.on];
//    }
//
//}




















@end
