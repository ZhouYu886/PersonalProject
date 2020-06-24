//
//  ZYZiLiaoTableViewCell.m
//  ZyProject
//
//  Created by apple on 2020/6/17.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYZiLiaoTableViewCell.h"
#import "ZYKxM.h"

@implementation ZYZiLiaoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setKxM:(ZYKxM *)KxM
{
    _KxM = KxM;
    self.NeiRong.text = _KxM.content;
//    self.ShiJIan.text = _KxM.time;
    self.BiaoTI.text = [_KxM.content substringToIndex:10];

}


@end
