//
//  ZYMeiWangDTTableViewCell.m
//  ZyProject
//
//  Created by apple on 2020/6/18.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYMeiWangDTTableViewCell.h"
#import "MBProgressHUD+XMG.h"



@implementation ZYMeiWangDTTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
}

- (IBAction)shuaxin:(UIButton *)sender
{
    
    //提醒框
    [MBProgressHUD showMessage:@"正在刷新中..."];
    
    
    //延时执行代码
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 {
            //隐藏提醒框
            [MBProgressHUD hideHUD];

        }
    });


}
    




@end
