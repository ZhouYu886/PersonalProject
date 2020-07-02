//
//  ZYGeRenXinXiTableViewCell.m
//  ZyProject
//
//  Created by apple on 2020/6/18.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYGeRenXinXiTableViewCell.h"
#import "userModel.h"
#import "ZYFenSiModel.h"
#import "talkListModel.h"
#import <SDWebImage.h>

@interface ZYGeRenXinXiTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *NeiRongLabel;
@property (weak, nonatomic) IBOutlet UIImageView *Tximage;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;


@end

@implementation ZYGeRenXinXiTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.Tximage.layer.cornerRadius = 17.5;
}


-(void)setUm:(userModel *)Um
{
    _Um = Um;
    self.NameLabel.text = Um.nickName;
    [self.Tximage sd_setImageWithURL:[NSURL URLWithString:_Um.head] placeholderImage:nil];
}



-(void)setListM:(ListModel *)listM{
    if (_listM != listM) {
        _listM = listM;
    }
    self.NeiRongLabel.text = _listM.content;
    
}





@end
