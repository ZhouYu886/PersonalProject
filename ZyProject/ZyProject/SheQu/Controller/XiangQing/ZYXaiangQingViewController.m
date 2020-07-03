//
//  ZYXaiangQingViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/17.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYXaiangQingViewController.h"
#import "ZYPingLunTableViewCell.h"
#import "ZYPingLunHeaderView.h"
#import "ZYPlTableViewCell.h"
#import "ZYDibuTableViewCell.h"
#import "ZYSheQuB.h"
#import "ZYSheQuM.h"
#import "talkListModel.h"
#import "userModel.h"
#import <MJExtension/MJExtension.h>
#import "ZYJuBaoViewController.h"
#import "MBProgressHUD+XMG.h"
#import "ZYSheQuViewController.h"


@interface ZYXaiangQingViewController ()<UITableViewDelegate,UITableViewDataSource,ZYPingLunDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tabeleView;

@property (nonatomic, strong) ZYPingLunHeaderView *header;
@property (nonatomic ,strong) talkListModel *talk;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *DiBuYueShu;
@property (weak, nonatomic) IBOutlet UITextField *PingLunTextF;

@end

@implementation ZYXaiangQingViewController

- (void)viewWillAppear:(BOOL)animated{

    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = NO;
    
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewWillDisappear:(BOOL)animated{

  self.tabBarController.tabBar.hidden = NO;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self PLJosnToOc];
    
    self.tabeleView.delegate = self;
    self.tabeleView.dataSource = self;
    //设置tableView分割线不显示
    self.tabeleView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.title = @"详情";
    
    //设置背景颜色
      self.view.backgroundColor = RGB(44, 48, 52);
      self.tabeleView.backgroundColor  = RGB(44, 48, 52);
    
    //设置cell标识
     [self.tabeleView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYPingLunTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"XiangQing"];
    
    //设置cell标识
     [self.tabeleView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYPlTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"PL"];
    
    //设置cell标识
     [self.tabeleView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYDibuTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"DB"];
    
    
      //设置左边返回
         UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
         [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
         [btn addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
         //适应大小
         [btn sizeToFit];
         self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
        
        
          //设置右边分享
          UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
          [btn1 setImage:[UIImage imageNamed:@"ic_gengduo"] forState:UIControlStateNormal];
          [btn1 addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
          //适应大小
          [btn1 sizeToFit];
          //设置右边rightBarButtonItem的自定义btn
          self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(TanChu:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(TanHui:) name:UIKeyboardWillHideNotification object:nil];
    
          
}


- (void)PLJosnToOc
{
    
    [self getTalkDisscussListWithParmas:@{@"talkId":_SheQuM.talkId}];
    
}

-(void)getTalkDisscussListWithParmas:(NSDictionary *)parmas
{
    [LCPNetWorkManager postWithPathUrl:@"/user/talk/getCommentList" parameters:parmas queryParams:nil Header:nil success:^(BOOL success, id result) {
        self.talk = [talkListModel mj_objectWithKeyValues:result[@"data"]];
        [self.tabeleView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationFade];
   } failure:^(BOOL failuer, NSError *error) {
    }];
}


//右边发表
-(void)rightClick
{
     //第1步:创建控制器
       UIAlertController *aletVC  = [UIAlertController alertControllerWithTitle:@"快去分享给你的朋友吧～" message:@"" preferredStyle:(UIAlertControllerStyleActionSheet)];
       
       //第2步:创建按钮
       UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
           //点击按钮执行的代码
       }];
       UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"QQ" style:( UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
           //点击按钮执行的代码
           //返回上一级
           //        [self.navigationController popViewControllerAnimated:YES];
       }];
       
       UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"微博" style:( UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
           //点击按钮执行的代码
           //返回上一级
           //        [self.navigationController popViewControllerAnimated:YES];
       }];
       
       UIAlertAction *action4 = [UIAlertAction actionWithTitle:@"微信" style:( UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
           //点击按钮执行的代码
           //返回上一级
           //        [self.navigationController popViewControllerAnimated:YES];
       }];
       
       //第3步:添加按钮
       [aletVC addAction:action1];
       [aletVC addAction:action2];
       [aletVC addAction:action3];
       [aletVC addAction:action4];
       
       //第4步:显示弹框（相当于show操作）
       [self presentViewController:aletVC animated:YES
                        completion:nil];
    

    
}

//左边返回
-(void)leftClick
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)setSheQuM:(ZYSheQuM *)SheQuM
{
    _SheQuM = SheQuM;
    [self.tabeleView reloadData];
}

-(void)pingbi:(ZYPingLunTableViewCell *)cell
{
    [MBProgressHUD showMessage:@"屏蔽成功" toView:self.view];
    
    //延时执行代码
      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
   {
              //隐藏提醒框
       [MBProgressHUD hideHUD];
       NSIndexPath *Remove = [self.tabeleView indexPathForCell:cell];
       [self.SQarray removeObjectAtIndex:Remove.row];
       [self.navigationController popViewControllerAnimated:YES];
          }
      });
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber *dd = [userDefaults objectForKey:@"id"];
    NSDictionary *dict = @{
        @"userId" : dd,
        @"data" : self.SheQuM.talkId,
        @"type" : @2,
    };
    
    [LCPNetWorkManager postWithPathUrl:@"/user/personal/block" parameters:nil queryParams:dict Header:nil success:^(BOOL success, id result) {
        
        
    } failure:^(BOOL failuer, NSError *error) {
        [MBProgressHUD showMessage:@"屏蔽失败"];
        
    }];
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return self.talk.list.count;
    }else{
        return 1;
    }

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 ) {
            ZYPingLunTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"XiangQing"];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.delegate = self;

        cell.SM = _SheQuM;
            return cell;
    }else if (indexPath.section == 1){
     ZYPlTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"PL"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];        
        cell.PLM = self.talk.list[indexPath.row];
                    return cell;
    }else if(indexPath.section == 2){
        ZYDibuTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"DB"];
           [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                       return cell;
    }
         return [UITableViewCell new];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else if (section == 1){
        return 28;
    }else{
        return 0;
    }
}
- (IBAction)FaBU:(UIButton *)sender
{
    self.PingLunTextF.text = @"";
      [_PingLunTextF resignFirstResponder];
    
//        开启键盘
//        becomeFirstResponder
//        关闭键盘
//        resignFirstResponder
    
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
            //加载XIB个人界面的顶部headerView
        self.header = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([ZYPingLunHeaderView class]) owner:nil options:nil]firstObject];

        //设置headerView的位置，和样式缺一不可
//        self.TableView.tableHeaderView = self.header;
        self.header.autoresizingMask = UITableViewScrollPositionNone;
    return _header;
}

//点击空白退出键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)TanChu:(NSNotification *)noti{
    // 获取键盘的高度  首先获取当前键盘的 Rect
        CGRect kbFram = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        CGFloat kbHeight = kbFram.size.height;
    // 把约束改掉
    self.DiBuYueShu.constant = kbHeight ;
      [UIView animateWithDuration:1 delay:0 options: UIViewAnimationOptionCurveEaseInOut  animations:^{
       // 布控子视图
     [self.view layoutIfNeeded];

        } completion:nil];
}

- (void)TanHui:(NSNotification *)noti{
    {
        // 把约束改成开始的 0
        self.DiBuYueShu.constant = 0 ;
        [UIView animateWithDuration:0.1 delay:0 options: UIViewAnimationOptionCurveEaseInOut  animations:^{
    // 布控子视图
    [self.view layoutIfNeeded];

        } completion:nil];

}
}


@end
