//
//  ZYJingXuanXiangQingTableViewCell.m
//  ZyProject
//
//  Created by apple on 2020/6/23.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYJingXuanXiangQingTableViewCell.h"
#import "ZYZiXunJingXuanM.h"
#import <SDWebImage.h>

@interface ZYJingXuanXiangQingTableViewCell  ()
@property (weak, nonatomic) IBOutlet UILabel *NRLabel;
@property (weak, nonatomic) IBOutlet UIImageView *TuPian;


@end

@implementation ZYJingXuanXiangQingTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
  
}

-(void)setZiXunM:(ZYZiXunJingXuanM *)ZiXunM
{
    _ZiXunM = ZiXunM;
    self.NRLabel.text = _ZiXunM.content;
    [self.TuPian sd_setImageWithURL:[NSURL URLWithString:_ZiXunM.picture] placeholderImage:[UIImage imageNamed:@"pic_geren"]];
}

@end
