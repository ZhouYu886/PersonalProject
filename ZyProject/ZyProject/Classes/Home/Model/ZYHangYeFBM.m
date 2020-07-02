//
//  ZYHangYeFBM.m
//  ZyProject
//
//  Created by apple on 2020/6/23.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYHangYeFBM.h"


@implementation ZYHangYeFBM

+(instancetype)HYFBM:(NSDictionary *)dict
{
       ZYHangYeFBM *HYFB = [ZYHangYeFBM new];
    HYFB.content = dict[@"content"];
    HYFB.BT = dict[@"id"];
    return HYFB;
}


@end
