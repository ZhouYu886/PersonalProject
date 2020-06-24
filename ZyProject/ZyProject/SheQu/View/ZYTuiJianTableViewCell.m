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

@interface ZYTuiJianTableViewCell () 
@property (weak, nonatomic) IBOutlet UIButton *GuanZhu;
@property (weak, nonatomic) IBOutlet UIImageView *TX;
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *BT;
@property (weak, nonatomic) IBOutlet UILabel *NR;

@end

@implementation ZYTuiJianTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.TX.layer.cornerRadius = 21.25;
}


-(void)setSqM:(ZYSheQuM *)SqM
{
    _SqM = SqM;
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

@end
