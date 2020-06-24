//
//  ZYPlTableViewCell.m
//  ZyProject
//
//  Created by apple on 2020/6/17.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYPlTableViewCell.h"
#import "talkListModel.h"
#import "userModel.h"

@interface ZYPlTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *TX;
@property (weak, nonatomic) IBOutlet UILabel *MZ;
@property (weak, nonatomic) IBOutlet UILabel *PL;

@end

@implementation ZYPlTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    self.TX.layer.cornerRadius = 17.5;
}

- (void)setPLM:(ListModel *)PLM{
    if (PLM) {
        _PLM = PLM;
        [self.TX sd_setImageWithURL:[NSURL URLWithString:_PLM.user.head] placeholderImage:[UIImage imageNamed:@"banner01_zx(1)"]];
        self.MZ.text = _PLM.user.nickName;
        self.PL.text = _PLM.content;
    }
}


@end
