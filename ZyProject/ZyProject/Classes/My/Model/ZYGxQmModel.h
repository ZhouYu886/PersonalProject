//
//  ZYGxQmModel.h
//  XiangMu
//
//  Created by apple on 2020/5/26.
//  Copyright © 2020 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYGxQmModel : NSObject

@property(nonatomic,copy)NSString *name;

@property (nonatomic, strong) NSData *str;

@property (nonatomic, strong) NSString *signature;

+(instancetype)ContactModelWithname:(NSString *)name;

+(instancetype)ContModelWithImage:(NSString *)Image;

@end

NS_ASSUME_NONNULL_END
