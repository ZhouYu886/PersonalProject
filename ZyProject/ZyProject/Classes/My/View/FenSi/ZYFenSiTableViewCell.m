//
//  ZYFenSiTableViewCell.m
//  ZyProject
//
//  Created by apple on 2020/6/19.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYFenSiTableViewCell.h"

@interface ZYFenSiTableViewCell()
@property (weak, nonatomic) IBOutlet UIButton *GuanZHu;

@end

@implementation ZYFenSiTableViewCell


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
    self.GuanZHu.selected = !self.GuanZHu.selected;
       if (self.GuanZHu.selected) {

           [self.GuanZHu setBackgroundImage:[UIImage imageNamed:@"btn_guanzhuciren"] forState:UIControlStateNormal];
       }else{

           [self.GuanZHu setBackgroundImage:[UIImage imageNamed:@"btn_bukeguanzhuciren"] forState:UIControlStateNormal];
       }
    
}

@end
