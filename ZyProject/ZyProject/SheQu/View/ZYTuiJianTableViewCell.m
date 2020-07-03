//
//  ZYTuiJianTableViewCell.m
//  ZyProject
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYTuiJianTableViewCell.h"
#import "ZYSheQuM.h"
#import <SDWebImage.h>
#import "ZYSheQuB.h"
#import "ViewController+CurrentVC.h"
#import "ZYJuBaoViewController.h"

@interface ZYTuiJianTableViewCell () 
@property (weak, nonatomic) IBOutlet UIButton *GuanZhu;
@property (weak, nonatomic) IBOutlet UIImageView *TX;
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *BT;
@property (weak, nonatomic) IBOutlet UILabel *NR;
@property (nonatomic,strong)UIView *tempView;
@property(nonatomic,strong)NSString *talk;
@end

@implementation ZYTuiJianTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.TX.layer.cornerRadius = 21.25;
    _XView.hidden = YES;
    _XView.layer.cornerRadius = 5;
    _XView.layer.masksToBounds = YES;
}



-(void)setSqM:(ZYSheQuM *)SqM
{
    _SqM = SqM;
    self.talk = SqM.talkId;
    self.NR.text = _SqM.content;
    self.Name.text = _SqM.user.nickName;
    [self.TX sd_setImageWithURL:[NSURL URLWithString:_SqM.user.head] placeholderImage:[UIImage imageNamed:@"pic_geren"]];
    self.BT.text = [_SqM.content substringToIndex:10];
    
}






- (IBAction)GuanZhu:(UIButton *)sender
{
     self.GuanZhu.selected = !self.GuanZhu.selected;
        if (self.GuanZhu.selected) {

            [self.GuanZhu setBackgroundImage:[UIImage imageNamed:@"btn_keguanzhu"] forState:UIControlStateNormal];
        }else{

            [self.GuanZhu setBackgroundImage:[UIImage imageNamed:@"btn_bukeguanzhu"] forState:UIControlStateNormal];
        }
    
}

- (IBAction)BuGanXingQu:(UIButton *)sender
{


}

- (IBAction)JuBao:(UIButton *)sender
{
    ZYJuBaoViewController *PushJb = [[ZYJuBaoViewController alloc]init];
    PushJb.talk = self.talk;
    [[UIViewController jsd_getCurrentViewController].navigationController pushViewController:PushJb animated:YES];
}

- (IBAction)PingBi:(UIButton *)sender {
}

- (IBAction)X:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(clickBtn:)]) {
        [self.delegate clickBtn:self.XView];
    }
    
}

@end
