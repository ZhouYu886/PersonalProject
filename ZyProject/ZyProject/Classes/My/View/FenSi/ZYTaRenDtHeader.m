//
//  ZYTaRenDtHeader.m
//  ZyProject
//
//  Created by apple on 2020/6/30.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYTaRenDtHeader.h"
#import "userModel.h"
#import <SDWebImage.h>
@interface ZYTaRenDtHeader ()

@property (weak, nonatomic) IBOutlet UIButton *GuanZhu;
@end

@implementation ZYTaRenDtHeader


-(void)awakeFromNib
{
    [super awakeFromNib];
    self.TxImage.layer.cornerRadius = 25.5;
}

-(void)setUM:(userModel *)UM
{
    _UM = UM;
    self.namelabel.text = UM.nickName;
    self.GXQm.text = UM.signature;
    self.GuanZhuLabel.text = [NSString stringWithFormat:@"%@",UM.followCount];
    self.Dongtai.text = [NSString stringWithFormat:@"%@",UM.talkCount];
    self.FenSilabel.text = [NSString stringWithFormat:@"%@",UM.fansCount];
        [self.TxImage sd_setImageWithURL:[NSURL URLWithString:_UM.head] placeholderImage:nil];
}

- (IBAction)gaunzhu:(UIButton *)sender
{
    self.GuanZhu.selected = !self.GuanZhu.selected;
       if (self.GuanZhu.selected) {

           [self.GuanZhu setBackgroundImage:[UIImage imageNamed:@"btn_keguanzhu"] forState:UIControlStateNormal];
       }else{

           [self.GuanZhu setBackgroundImage:[UIImage imageNamed:@"btn_bukeguanzhu"] forState:UIControlStateNormal];
       }
}

@end
