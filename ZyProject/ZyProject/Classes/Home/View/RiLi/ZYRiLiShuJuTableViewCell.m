//
//  ZYRiLiShuJuTableViewCell.m
//  ZyProject
//
//  Created by apple on 2020/6/19.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYRiLiShuJuTableViewCell.h"
#import "ZYRLModel.h"
#import <SDWebImage.h>
#import "ZYGQModel.h"

@interface ZYRiLiShuJuTableViewCell ()<SDWebImageManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *QianQI;
@property (weak, nonatomic) IBOutlet UILabel *YuQi;
@property (weak, nonatomic) IBOutlet UILabel *GongBi;

@property (weak, nonatomic) IBOutlet UIButton *FaBu;
@property (weak, nonatomic) IBOutlet UILabel *ShiJIan;
@property (weak, nonatomic) IBOutlet UILabel *GuoJia;

@end

@implementation ZYRiLiShuJuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    //
}

-(void)setGuoQiM:(ZYGQModel *)GuoQiM
{
    _GuoQiM = GuoQiM;

//    if ([GuoQiM.countryName isEqualToString:self.RLM.country]) {
//     NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)GuoQiM.countryFlag,NULL,NULL,kCFStringEncodingUTF8));
//        NSURL *url1 = [NSURL URLWithString:encodedString];
//                [self.GuoQi sd_setImageWithURL:url1];
//        for (NSDictionary *dict in self.GuoQiM.countryFlag) {
//            if ([self.RLM.country isEqualToString:@"%@",self.GuoQiM.countryName]) {
//
//            }
//        }
//
//    }
    
    
}

-(void)setRLM:(ZYRLModel *)RLM
{
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    _RLM = RLM;
    self.GuoJia.text = RLM.country;
    self.Name.text = RLM.name;
    self.QianQI.text = [NSString stringWithFormat:@" %@",RLM.previous];
    self.YuQi.text = [NSString stringWithFormat:@" %@",RLM.consensus];
//    NSData *data = [userdefaults objectForKey:@"countryName"];
//    self.GuoQi.image = [UIImage imageWithData:data];
    NSURL *url1 = [NSURL URLWithString:[userdefaults objectForKey:@"countryName"]];
    [self.GuoQi sd_setImageWithURL:url1];

    
    
    self.ShiJIan.text = [self stringTimeWithTimeString:RLM.time];
    

        if ([RLM.affect isEqualToString:@"0"]) {
            [self.FaBu setImage:[UIImage imageNamed:@"pic_weigongbu"] forState:UIControlStateNormal];
//            [self.FaBu setTitle:@"未发布" forState:UIControlStateNormal];
        }else{
            [self.FaBu setImage:[UIImage imageNamed:@"pic_yigongbu"] forState:UIControlStateNormal];
//            [self.FaBu setTitle:@"已发布" forState:UIControlStateNormal];
        }
    
}

- (NSString *)stringTimeWithTimeString:(NSString *)string{
    NSInteger t_integer = [string integerValue] / 1000;
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:t_integer];

    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    //格式化成目标时间格式
    [formatter setDateFormat:@"YYYY年MM月dd日 HH:MM"];
    NSString  *timeString  = [formatter stringFromDate:date];
    return timeString;
}
@end
