//
//  ZYGxQmModel.m
//  XiangMu
//
//  Created by apple on 2020/5/26.
//  Copyright © 2020 apple. All rights reserved.
//

#import "ZYGxQmModel.h"

@implementation ZYGxQmModel

+(instancetype)ContactModelWithname:(NSString *)name {
    ZYGxQmModel *ContactM= [[ZYGxQmModel alloc]init];
    ContactM.name=name;
    return ContactM;
}

+(instancetype)ContModelWithImage:(NSString *)Image
{
    ZYGxQmModel *ContM = [[ZYGxQmModel alloc]init];
    ContM.str = Image;
    return ContM;

}


@end
