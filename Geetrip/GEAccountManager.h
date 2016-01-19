//
//  GEAccountManager.h
//  Geetrip
//
//  Created by addinghome on 16/1/19.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXMThirdLoginManager.h"
#import "LXMThirdLoginResult.h"


@interface GEAccountManager : NSObject

+ (void)loginWithLoginType:(LXMThirdLoginType)type return:(void (^)(void))onReturnBlcok success:(void (^)(void))successBlock failure:(void (^)(NSError *error))failureBlock;

@end
