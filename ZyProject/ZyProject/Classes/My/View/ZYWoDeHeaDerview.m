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


@interface ZYWoDeHeaDerview()

@property (weak, nonatomic) IBOutlet UIImageView *imagePush;

@end

@implementation ZYWoDeHeaDerview

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    //添加点击方法
       UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imagevPsuh)];
    
    //添加点击
      self.imagePush.userInteractionEnabled = YES;
      
      //imagePush添加到tap中
      [self.imagePush addGestureRecognizer:tap];
}

-(void)imagevPsuh
{
      ZYGeRenXinXiViewController *PushGrxx = [[ZYGeRenXinXiViewController alloc]init];
      [[UIViewController jsd_getCurrentViewController].navigationController pushViewController:PushGrxx animated:YES];
}

- (IBAction)QD:(UIButton *)sender
{
    ZYQianDaoViewController *PushQD = [[ZYQianDaoViewController alloc]init];
    [[UIViewController jsd_getCurrentViewController].navigationController pushViewController:PushQD animated:YES];

}
- (IBAction)Dt:(UIButton *)sender
{
    
    
    
}
- (IBAction)FenSi:(UIButton *)sender
{
    ZYFenSiViewController *PushFenSi = [[ZYFenSiViewController alloc]init];
    [[UIViewController jsd_getCurrentViewController].navigationController pushViewController:PushFenSi animated:YES];
    
}


- (IBAction)GuanZhu:(UIButton *)sender
{
    ZYGuanZhuViewController *PushGuanZhu = [[ZYGuanZhuViewController alloc]init];
    [[UIViewController jsd_getCurrentViewController].navigationController pushViewController:PushGuanZhu animated:YES];
    
}

@end



