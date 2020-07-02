//
//  ZYGeRenXinXiHeader.m
//  ZyProject
//
//  Created by apple on 2020/6/18.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYGeRenXinXiHeader.h"

@interface ZYGeRenXinXiHeader ()

@property (weak, nonatomic) IBOutlet UIImageView *TxImage;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *GxQmLabel;
@property (weak, nonatomic) IBOutlet UILabel *FaTie;
@property (weak, nonatomic) IBOutlet UILabel *FenSilabel;
@property (weak, nonatomic) IBOutlet UILabel *GzLabel;

@end
@implementation ZYGeRenXinXiHeader

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    self.TxImage.layer.cornerRadius = 25.5;
    
    NSUserDefaults *userDefautlt = [NSUserDefaults standardUserDefaults];
    self.FaTie.text  =  [NSString stringWithFormat:@"%@",[userDefautlt objectForKey:@"talkCount"]];
    self.FenSilabel.text = [NSString stringWithFormat:@"%@",[userDefautlt objectForKey:@"fansCount"]];
    self.GzLabel.text = [NSString stringWithFormat:@"%@",[userDefautlt objectForKey:@"followCount"]];
    
    self.NameLabel.text = [NSString stringWithFormat:@"%@",[userDefautlt objectForKey:@"nickName"]];
    self.GxQmLabel.text = [NSString stringWithFormat:@"%@",[userDefautlt objectForKey:@"signature"]];
    NSData *data = [userDefautlt objectForKey:@"headerImage"];
        self.TxImage.image = [UIImage imageWithData:data];
}


@end
