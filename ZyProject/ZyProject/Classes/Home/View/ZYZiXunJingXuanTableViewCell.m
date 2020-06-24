//
//  ZYZiXunJingXuanTableViewCell.m
//  ZyProject
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYZiXunJingXuanTableViewCell.h"
#import "ZYZiXunJingXuanM.h"
#import <MJExtension/MJExtension.h>

@interface ZYZiXunJingXuanTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UIImageView *picture;


@end

@implementation ZYZiXunJingXuanTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    
}

-(void)setModel:(ZYZiXunJingXuanM *)model
{
    
    _model = model;

    self.content.text = model.content;

    [self.picture sd_setImageWithURL:[NSURL URLWithString:model.picture]];
    
}



@end
