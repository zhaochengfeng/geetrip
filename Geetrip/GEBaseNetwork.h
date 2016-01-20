//
//  GEBaseNetwork.h
//  Geetrip
//
//  Created by addinghome on 16/1/20.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GEBaseNetwork : NSObject

+ (AFHTTPSessionManager *)securityManager;

+ (AFHTTPSessionManager *)manager;

@end
