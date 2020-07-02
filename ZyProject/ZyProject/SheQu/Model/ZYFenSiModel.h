//
//  ZYFenSiModel.h
//  ZyProject
//
//  Created by apple on 2020/6/30.
//  Copyright © 2020 123123. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYFenSiModel : NSObject

@property (nonatomic, strong) NSString *picture;
@property (nonatomic, strong) NSString *content;
+(instancetype)fensiWitnDict:(NSDictionary *)fenSi;
@end

NS_ASSUME_NONNULL_END
