//
//  ZYFenSiTableViewCell.m
//  ZyProject
//
//  Created by apple on 2020/6/19.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYFenSiTableViewCell.h"
#import "userModel.h"
#import <MJExtension/MJExtension.h>
#import <SDWebImage.h>


@interface ZYFenSiTableViewCell()
@property (weak, nonatomic) IBOutlet UIButton *GuanZHu;
@property (weak, nonatomic) IBOutlet UIImageView *TXImage;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *DT;
@property (weak, nonatomic) IBOutlet UILabel *FS;
@property (nonatomic, strong) NSArray *GuanZhuArry;



@end

@implementation ZYFenSiTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
 
    self.TXImage.layer.cornerRadius = 25.5;
}


-(void)setUM:(userModel *)UM
{
    _UM = UM;
    self.NameLabel.text = UM.nickName;
    self.DT.text = [NSString stringWithFormat:@"%@",UM.talkCount];
    self.FS.text = [NSString stringWithFormat:@"%@",UM.fansCount];
        [self.TXImage sd_setImageWithURL:[NSURL URLWithString:_UM.head] placeholderImage:nil];
}


- (IBAction)GuanZhu:(UIButton *)sender
{
    self.GuanZHu.selected = !self.GuanZHu.selected;
       if (self.GuanZHu.selected) {

           [self.GuanZHu setBackgroundImage:[UIImage imageNamed:@"btn_guanzhuciren"] forState:UIControlStateNormal];
       }else{

           [self.GuanZHu setBackgroundImage:[UIImage imageNamed:@"btn_bukeguanzhuciren"] forState:UIControlStateNormal];
       }
    
}



@end
