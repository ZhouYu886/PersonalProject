//
//  talkListModel.m
//  firstProject
//
//  Created by apple on 2020/6/5.
//  Copyright © 2020 ap. All rights reserved.
//

#import "talkListModel.h"
#import <MJExtension/MJExtension.h>


@implementation talkListModel
+(NSDictionary *)mj_objectClassInArray
{
    return @{
        @"list" :[ListModel class],
    };
}

@end

@implementation ListModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
        @"userId":@"id"
    };
}


@end

