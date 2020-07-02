//
//  ZYXYFbXQTableViewCell.m
//  ZyProject
//
//  Created by apple on 2020/6/23.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYXYFbXQTableViewCell.h"
#import "ZYHangYeFBM.h"
#import <SDWebImage.h>

@implementation ZYXYFbXQTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    

}


-(void)setHm:(ZYHangYeFBM *)Hm
{
    _Hm = Hm;
    self.neirong.text = _Hm.content;
    self.biaoTI.text = [_Hm.content substringToIndex:10];
}

@end
