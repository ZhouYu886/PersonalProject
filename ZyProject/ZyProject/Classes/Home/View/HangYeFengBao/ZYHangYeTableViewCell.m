//
//  ZYHangYeTableViewCell.m
//  ZyProject
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYHangYeTableViewCell.h"
#import "ZYHangYeFBM.h"


@implementation ZYHangYeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setHm:(ZYHangYeFBM *)Hm
{
    _Hm = Hm;
    self.NeiRong.text = _Hm.content;
    self.BiaoTi.text = [_Hm.content substringToIndex:10];
}

@end
