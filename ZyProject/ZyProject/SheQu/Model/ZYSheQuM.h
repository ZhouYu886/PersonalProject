//
//  ZYSheQuM.h
//  ZyProject
//
//  Created by apple on 2020/6/23.
//  Copyright © 2020 123123. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ZYSheQuB;
@interface ZYSheQuM : NSObject

@property(nonatomic,strong)NSString *picture;
@property(nonatomic,strong)ZYSheQuB *user;
@property(nonatomic,strong)NSString *content;
@property (nonatomic,strong)NSString *talkId;


+(instancetype)SheQu:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
