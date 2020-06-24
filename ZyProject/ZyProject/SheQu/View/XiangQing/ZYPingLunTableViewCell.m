//
//  ZYPingLunTableViewCell.m
//  ZyProject
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYPingLunTableViewCell.h"
#import "ZYSheQuM.h"
#import "ZYSheQuB.h"

@interface ZYPingLunTableViewCell()
@property (weak, nonatomic) IBOutlet UIButton *GuanZhu;
@property (weak, nonatomic) IBOutlet UILabel *BT;
@property (weak, nonatomic) IBOutlet UIImageView *TX;
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *NR;
@property (weak, nonatomic) IBOutlet UIImageView *TUp;

@end

@implementation ZYPingLunTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.TX.layer.cornerRadius = 17.5;
}
-(void)setSM:(ZYSheQuM *)SM
{
    _SM = SM;
    self.Name.text = _SM.user.nickName;
    self.NR.text = _SM.content;
    [self.TX sd_setImageWithURL:[NSURL URLWithString:_SM.user.head] placeholderImage:[UIImage imageNamed:@"pic_geren"]];
    [self.TUp sd_setImageWithURL:[NSURL URLWithString:_SM.picture] placeholderImage:[UIImage imageNamed:@"pic_geren"]];
    self.BT.text = [_SM.content substringToIndex:10];
}


- (IBAction)GuanZhu:(UIButton *)sender
{
      self.GuanZhu.selected = !self.GuanZhu.selected;
         if (self.GuanZhu.selected) {
             
             [self.GuanZhu setBackgroundImage:[UIImage imageNamed:@"btn_guanzhuciren"] forState:UIControlStateNormal];
         }else{

             [self.GuanZhu setBackgroundImage:[UIImage imageNamed:@"btn_bukeguanzhuciren"] forState:UIControlStateNormal];
         }
    
}

@end
