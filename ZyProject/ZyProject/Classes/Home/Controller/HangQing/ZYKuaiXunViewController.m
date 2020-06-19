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
@interface ZYKuaiXunViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *TableView;

@end

@implementation ZYKuaiXunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.TableView.delegate =self;
    self.TableView.dataSource =self;
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else{
        return 4;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 ) {
              ZYKuaiXunTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"KuaiXun"];
          [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
          self.TableView.rowHeight = 124;
          return cell;
    }else if (indexPath.section == 1 && indexPath.row <= 4){
            ZYZiLiaoTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"ZiLiao"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.TableView.rowHeight = 120;
        return cell;
    }
        return [UITableViewCell new];

}

@end
