//
//  GEBaseNetwork.m
//  Geetrip
//
//  Created by addinghome on 16/1/20.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "GEBaseNetwork.h"

@implementation GEBaseNetwork

+ (AFHTTPSessionManager *)securityManager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"DtcwG8mfX9A" password:@"gZVxwBaOFdoohyd3"];
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    [policy setValidatesDomainName:NO];
    [policy setAllowInvalidCertificates:YES];
    manager.securityPolicy = policy;
    
    return manager;
}

+ (AFHTTPSessionManager *)manager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    return manager;
}

//- (NSURLSessionDataTask *)GET:(NSString *)URLString parameters:(NSDictionary *)paramaters success:(void (^) (NSURLSessionDataTask *task,id responseObject))success failure:(void (^)(NSURLSessionDataTask *task,NSError *error))failure
//{
//    
//    return [s GET:URLString parameters:paramaters progress:nil success:success failure:failure];
//}
//
//- (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(NSDictionary *)paramaters success:(void (^) (NSURLSessionDataTask *task,id responseObject))success failure:(void (^)(NSURLSessionDataTask *task,NSError *error))failure
//{
//    
//}
//
//- (NSURLSessionDataTask *)PATCH:(NSString *)URLString parameters:(NSDictionary *)paramaters success:(void (^) (NSURLSessionDataTask *task,id responseObject))success failure:(void (^)(NSURLSessionDataTask *task,NSError *error))failure
//{
//    
//}
//
//- (NSURLSessionDataTask *)DELETE:(NSString *)URLString parameters:(NSDictionary *)paramaters success:(void (^) (NSURLSessionDataTask *task,id responseObject))success failure:(void (^)(NSURLSessionDataTask *task,NSError *error))failure
//{
//    
//}

@end
