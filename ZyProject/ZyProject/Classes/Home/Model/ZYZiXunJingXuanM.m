//
//  ZYZiXunJingXuanM.m
//  ZyProject
//
//  Created by apple on 2020/6/22.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYZiXunJingXuanM.h"

@implementation ZYZiXunJingXuanM

+(instancetype)ZiXunMode:(NSDictionary *)dict
{
    ZYZiXunJingXuanM *ZiXunM = [ZYZiXunJingXuanM new];
    ZiXunM.picture = dict[@"picture"];
    ZiXunM.content = dict[@"content"];
    return ZiXunM;
}




@end
