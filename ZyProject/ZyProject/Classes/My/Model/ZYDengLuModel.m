//
//  ZYDengLuModel.m
//  XiangMu
//
//  Created by apple on 2020/5/27.
//  Copyright © 2020 apple. All rights reserved.
//

#import "ZYDengLuModel.h"

@implementation ZYDengLuModel

+(instancetype)dengluWithDict:(NSDictionary *)dict
{
    ZYDengLuModel *DlM = [[ZYDengLuModel alloc]init];
    DlM.Phone = dict[@"phone"];
    DlM.password = dict[@"password"];
    DlM.TXYanZhengMa = dict[@"TXYanZhengMa"];
    return DlM;
}


@end
