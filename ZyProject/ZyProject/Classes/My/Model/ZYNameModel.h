//
//  ZYNameModel.h
//  XiangMu
//
//  Created by apple on 2020/5/25.
//  Copyright © 2020 apple. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZYNameModel : NSObject

//名字
@property(nonatomic,copy)NSString *name;

+ (instancetype)ContactModelWithname:(NSString *)name;

@end


