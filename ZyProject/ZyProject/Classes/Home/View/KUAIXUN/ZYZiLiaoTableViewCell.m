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
    self.ShiJIan.text = [self stringTimeWithTimeString:KxM.time];
    self.BiaoTI.text = [_KxM.content substringToIndex:10];

}

- (NSString *)stringTimeWithTimeString:(NSString *)string{
    NSInteger t_integer = [string integerValue] / 1000;
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:t_integer];

    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    //格式化成目标时间格式
    [formatter setDateFormat:@"HH:mm:ss"];
    NSString  *timeString  = [formatter stringFromDate:date];
    return timeString;
}


@end
