//
//  ZYWoDeHeaDerview.m
//  ZyProject
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYWoDeHeaDerview.h"
#import "ZYGeRenXinXiViewController.h"
#import "ViewController+CurrentVC.h"
#import "ZYQianDaoViewController.h"
#import "ZYGuanZhuViewController.h"
#import "ZYFenSiViewController.h"
#import "userModel.h"
#import <MJExtension/MJExtension.h>
#import "ZYDengluViewController.h"
#import <SDWebImage.h>
#import "ZYNameModel.h"
#import "ZYGxQmModel.h"
#import "ZYGeRenXinXiViewController.h"
#import "ZYBianJiViewController.h"

@interface ZYWoDeHeaDerview()



@property (nonatomic, strong) NSArray *GuanZhuArry;

@property (nonatomic, strong) userModel *us;



@end

@implementation ZYWoDeHeaDerview

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self get];
    
    self.imagePush.layer.cornerRadius = 21;
    //添加点击方法
       UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imagevPsuh)];
    //添加点击
      self.imagePush.userInteractionEnabled = YES;
      
      //imagePush添加到tap中
      [self.imagePush addGestureRecognizer:tap];
    
    NSUserDefaults *userDefautlt = [NSUserDefaults standardUserDefaults];    if([userDefautlt objectForKey:@"id"]){
        self.DT.text  =  [NSString stringWithFormat:@"%@",[userDefautlt objectForKey:@"talkCount"]];
        self.FS.text = [NSString stringWithFormat:@"%@",[userDefautlt objectForKey:@"fansCount"]];
        self.GZ.text = [NSString stringWithFormat:@"%@",[userDefautlt objectForKey:@"followCount"]];
        self.NameLabel.text = [NSString stringWithFormat:@"%@",[userDefautlt objectForKey:@"nickName"]];
        self.GxQmLabel.text = [NSString stringWithFormat:@"%@",[userDefautlt objectForKey:@"signature"]];
        NSData *data = [userDefautlt objectForKey:@"headerImage"];
            self.imagePush.image = [UIImage imageWithData:data];
    }else{
        self.DT.text  =  [NSString stringWithFormat:@"10"];
        self.FS.text = [NSString stringWithFormat:@"10"];
        self.GZ.text = [NSString stringWithFormat:@"10"];
        self.NameLabel.text = [NSString stringWithFormat:@"还没登录哟～"];
        self.GxQmLabel.text = [NSString stringWithFormat:@""];
        self.imagePush.image = [UIImage imageNamed:@"pic_geren"];
    }


  
    
}


- (void)setContactM:(ZYNameModel *)ContactM{

    _ContactM  = ContactM;
    self.NameLabel.text = ContactM.name;

}


-(void)setContM:(ZYGxQmModel *)ContM
{
    _ContM = ContM;
    self.GxQmLabel.text = ContM.name;
    self.imagePush.image = [UIImage imageWithData:ContM.str];
    
}


-(void)imagevPsuh
{
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        if([userDefault objectForKey:@"id"]){
            ZYBianJiViewController *PushBianji = [[ZYBianJiViewController alloc]init];
            PushBianji.hidesBottomBarWhenPushed = YES;
            [[UIViewController jsd_getCurrentViewController].navigationController
             pushViewController:PushBianji animated:YES];
            
        }else{
          ZYDengluViewController *PushDl = [[ZYDengluViewController alloc]init];
          [[UIViewController jsd_getCurrentViewController].navigationController pushViewController:PushDl animated:YES];
    }

}

- (IBAction)QD:(UIButton *)sender
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    if([userDefault objectForKey:@"id"]){
        ZYQianDaoViewController *PushQD = [[ZYQianDaoViewController alloc]init];
        [[UIViewController jsd_getCurrentViewController].navigationController pushViewController:PushQD animated:YES];
    }else{
        ZYDengluViewController *PushDl = [[ZYDengluViewController alloc]init];
        [[UIViewController jsd_getCurrentViewController].navigationController pushViewController:PushDl animated:YES];
    }
}
- (IBAction)Dt:(UIButton *)sender
{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    if([userDefault objectForKey:@"id"]){
        ZYGeRenXinXiViewController *GrXX = [ZYGeRenXinXiViewController new];
        [[UIViewController jsd_getCurrentViewController].navigationController
        pushViewController:GrXX animated:YES];
    }else{
        ZYDengluViewController *PushDl = [[ZYDengluViewController alloc]init];
        [[UIViewController jsd_getCurrentViewController].navigationController pushViewController:PushDl animated:YES];
    }


}


- (IBAction)FenSi:(UIButton *)sender
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    if([userDefault objectForKey:@"id"]){
        ZYFenSiViewController *PushFenSi = [[ZYFenSiViewController alloc]init];
        [[UIViewController jsd_getCurrentViewController].navigationController
        pushViewController:PushFenSi animated:YES];
    }else{
        ZYDengluViewController *PushDl = [[ZYDengluViewController alloc]init];
        [[UIViewController jsd_getCurrentViewController].navigationController pushViewController:PushDl animated:YES];
    }
}


- (IBAction)GuanZhu:(UIButton *)sender
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    if([userDefault objectForKey:@"id"]){
        ZYGuanZhuViewController *PushGuanZhu = [[ZYGuanZhuViewController alloc]init];
        [[UIViewController jsd_getCurrentViewController].navigationController pushViewController:PushGuanZhu animated:YES];
    }else{
        ZYDengluViewController *PushDl = [[ZYDengluViewController alloc]init];
        [[UIViewController jsd_getCurrentViewController].navigationController pushViewController:PushDl animated:YES];
    }
}

- (void)get
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    if([userDefault objectForKey:@"id"]){
            NSNumber *dd  = [userDefault objectForKey:@"id"];
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            [manager GET:@"http://api.yysc.online/user/follow/getUserFollowList" parameters:@{
                @"userId": dd,
                @"type" : @1,
                @"pageNumber" : @1,
                @"pageSize" : @10
            }
                progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if(responseObject != nil){
                    self.GuanZhuArry = [userModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        //            [self.TableView reloadData];
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"failure--%@",error);
            }];
    }
}



@end



