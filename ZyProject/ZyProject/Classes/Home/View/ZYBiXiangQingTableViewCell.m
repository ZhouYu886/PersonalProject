//
//  ZYBiXiangQingTableViewCell.m
//  ZyProject
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYBiXiangQingTableViewCell.h"

@interface ZYBiXiangQingTableViewCell ()

@end

@implementation ZYBiXiangQingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    CGFloat ZW = SCREEN_WIDTH - 151;
    
    CGFloat w = ZW / 3;
    
    self.GunagChiSuanLabel.frame = CGRectMake(2*w+ 21.5 +35, 11, 66, 17);
   
    
    self.ShouYiLabel.frame = CGRectMake(w + 33, 11, 50, 17);
    
    self.JiaGeLabel.frame =  CGRectMake(w + 13.5, 30, 80, 15);
    
    self.QuanWangSuan.frame = CGRectMake(2*w+ 25 +35, 30, 60, 15);
    
}





@end
