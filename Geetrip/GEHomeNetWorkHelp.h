//
//  GEHomeNetWorkHelp.h
//  Geetrip
//
//  Created by chengfeng on 15/10/18.
//  Copyright © 2015年 Geetrip Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GEHomeNetWorkHelp : NSObject

+ (NSURLSessionDataTask *)getActListSuccess:(void (^)(id responseObject))successBlock failure:(void (^)(NSError *error))failureBlock;

+ (NSURLSessionDataTask *)getPlanWithTourId:(NSString *)tourId success:(void (^)(id responseObject))successBlock failure:(void (^)(NSError *error))failureBlock;

+ (NSURLSessionDataTask *)getSearchContentWithKeyword:(NSString *)keyword success:(void (^)(id responseObject))successBlock failure:(void (^)(NSError *error))failureBlock;

@end
