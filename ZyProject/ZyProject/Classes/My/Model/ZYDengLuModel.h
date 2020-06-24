//
//  ZYDengLuModel.h
//  XiangMu
//
//  Created by apple on 2020/5/27.
//  Copyright © 2020 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYDengLuModel : NSObject

@property(nonatomic ,strong)NSString *Phone;
@property(nonatomic ,strong)NSString *password;
@property(nonatomic ,strong)NSString *TXYanZhengMa;

+(instancetype)dengluWithDict:(NSDictionary *)dict;



@end

NS_ASSUME_NONNULL_END
