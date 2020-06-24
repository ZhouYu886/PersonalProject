//
//  ZYGuanZhuTableViewCell.m
//  ZyProject
//
//  Created by apple on 2020/6/19.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYGuanZhuTableViewCell.h"

@implementation ZYGuanZhuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)BuZaiGuanZhu:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(BuZaiGuanZhu)]) {
        [self.delegate BuZaiGuanZhu];
    }

}

@end
