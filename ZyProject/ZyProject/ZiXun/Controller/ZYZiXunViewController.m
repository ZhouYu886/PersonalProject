//
//  ZYZiXunViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYZiXunViewController.h"
#import "ZYZiXunTableViewCell.h"

@interface ZYZiXunViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *TableView;

@end

@implementation ZYZiXunViewController

- (void)viewWillAppear:(BOOL)animated
{
     self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.brownColor;
    //控制器navigationController顶部是否显示
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row <= 5){
        ZYZiXunTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"ZiXun"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.TableView.rowHeight = 175;
        return cell;
    }
    return [UITableViewCell new];
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

@end
