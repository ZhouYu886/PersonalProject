//
//  ZYGuanZhuTableViewCell.m
//  ZyProject
//
//  Created by apple on 2020/6/19.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYGuanZhuTableViewCell.h"
#import "userModel.h"
#import <SDWebImage.h>

@interface  ZYGuanZhuTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *TXImage;
@property (weak, nonatomic) IBOutlet UIImageView *TxImage;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;

@property (weak, nonatomic) IBOutlet UILabel *DT;
@property (weak, nonatomic) IBOutlet UILabel *FS;

@end

@implementation ZYGuanZhuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.TxImage.layer.cornerRadius = 19.5;
}


-(void)setUM:(userModel *)UM
{
        _UM = UM;
        self.NameLabel.text = UM.nickName;
        self.DT.text = [NSString stringWithFormat:@"%@",UM.talkCount];
        self.FS.text = [NSString stringWithFormat:@"%@",UM.fansCount];
        [self.TxImage sd_setImageWithURL:[NSURL URLWithString:_UM.head] placeholderImage:nil];
    
}






- (IBAction)BuZaiGuanZhu:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(remove:)]) {
        [self.delegate remove:self];
    }

}

@end
