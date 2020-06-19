//
//  ZYTuiJianTableViewCell.m
//  ZyProject
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYTuiJianTableViewCell.h"

@interface ZYTuiJianTableViewCell () 
@property (weak, nonatomic) IBOutlet UIButton *GuanZhu;

@end

@implementation ZYTuiJianTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




- (IBAction)GuanZhu:(UIButton *)sender
{
     self.GuanZhu.selected = !self.GuanZhu.selected;
        if (self.GuanZhu.selected) {
//            [self.GuanZhu setTitle:@"+关注" forState:UIControlStateNormal];
//            [self.GuanZhu setTitleColor:[UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.0] forState:UIControlStateNormal];
            [self.GuanZhu setBackgroundImage:[UIImage imageNamed:@"btn_keguanzhu"] forState:UIControlStateNormal];
        }else{
//            [self.GuanZhu setTitle:@"取消关注" forState:UIControlStateNormal];
    //        [self.QXBTn setTitleColor:[UIColor colorWithRed:20/255.0 green:139/255.0 blue:246/255.0 alpha:1.0] forState:UIControlStateNormal];
//                    [self.QXBTn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [self.GuanZhu setBackgroundImage:[UIImage imageNamed:@"btn_bukeguanzhu"] forState:UIControlStateNormal];
        }
    
}

@end
