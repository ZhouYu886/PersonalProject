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
    HYFB.title = dict[@"title"];
    HYFB.content = dict[@"content"];
    HYFB.picture = dict[@"picture"];
    return HYFB;
}


@end
