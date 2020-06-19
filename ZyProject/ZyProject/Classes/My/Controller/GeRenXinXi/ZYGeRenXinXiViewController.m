//
//  ZYGeRenXinXiViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/18.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYGeRenXinXiViewController.h"
#import "ZYGeRenXinXiHeader.h"
#import "ZYGeRenXinXiTableViewCell.h"
#import "ZYDibuTableViewCell.h"


@interface ZYGeRenXinXiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)ZYGeRenXinXiHeader *heder;

@end

@implementation ZYGeRenXinXiViewController

- (void)viewWillAppear:(BOOL)animated{

    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = NO;
    
//    self.navigationController.navigationBar.opaque = YES;
    self.navigationController.navigationBar.translucent = NO;

}

- (void)viewWillDisappear:(BOOL)animated{

  self.tabBarController.tabBar.hidden = NO;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
        //设置导航栏颜色
         self.navigationController.navigationBar.barTintColor = RGB(52, 56, 61);

      
    //设置背景颜色
      self.view.backgroundColor = RGB(44, 48, 52);
      self.tableView.backgroundColor  = RGB(44, 48, 52);
    
    //设置左边返回
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    //适应大小
    [btn sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    //设置cell标识
     [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYGeRenXinXiTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"GeRenXinXi"];
    
    //设置cell标识
     [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYDibuTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"DB"];
    
}
//设置左边点击返回上一级
-(void)leftClick
{
    //返回上一级
    [self.navigationController popViewControllerAnimated:YES];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     if (indexPath.row == 0){
        ZYGeRenXinXiTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"GeRenXinXi"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//        self.TableView.rowHeight = 209;
        return cell;
     }else if(indexPath.row == 1){
                 ZYDibuTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"DB"];
                 [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//                 self.TableView.rowHeight = 226;
                 return cell;
     }
    return [UITableViewCell new];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 155;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
            //加载XIB个人界面的顶部headerView
        self.heder = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([ZYGeRenXinXiHeader class]) owner:nil options:nil]firstObject];

        //设置headerView的位置，和样式缺一不可
//        self.TableView.tableHeaderView = self.header;
        self.heder.autoresizingMask = UITableViewScrollPositionNone;
    return _heder;
}

//点击空白退出键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
