//
//  ZYBIZhongTableViewCell.m
//  ZyProject
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYBIZhongTableViewCell.h"

@interface ZYBIZhongTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *RiShouYi;
@property (weak, nonatomic) IBOutlet UILabel *SuanLv;


@end

@implementation ZYBIZhongTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    CGFloat ZW = SCREEN_WIDTH - 132;
    
    CGFloat w = ZW / 3;
    
    self.SuanLv.frame = CGRectMake(2*w+ 17.5+35, 9.5, 49, 25.5);
   
    self.RiShouYi.frame = CGRectMake(w + 28, 9.5, 35, 25.5);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
