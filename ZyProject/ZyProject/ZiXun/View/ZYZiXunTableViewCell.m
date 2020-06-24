//
//  ZYZiXunTableViewCell.m
//  ZyProject
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYZiXunTableViewCell.h"
#import "ZYZiXunJingXuanM.h"

@interface ZYZiXunTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *NRLabel;
@property (weak, nonatomic) IBOutlet UILabel *BiaoTiLabel;

@end

@implementation ZYZiXunTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

-(void)setZiXunM:(ZYZiXunJingXuanM *)ZiXunM
{
    _ZiXunM = ZiXunM;
    self.NRLabel.text = _ZiXunM.content;
    self.BiaoTiLabel.text = [_ZiXunM.content substringToIndex:10];
}

@end
