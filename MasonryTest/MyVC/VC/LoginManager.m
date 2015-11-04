//
//  LoginManager.m
//  MasonryTest
//
//  Created by 佟铁铮 on 15/11/3.
//  Copyright © 2015年 佟铁铮. All rights reserved.
//

#import "LoginManager.h"

static LoginManager *manager = nil;

@implementation LoginManager

+ (LoginManager *)sharedManager {
    if (!manager) {
        manager = [[LoginManager alloc] init];
    }
    return manager;
}

- (instancetype)init {
    if (self = [super init]) {
        _logginIn = NO;
    }
    return self;
}

- (void)logInWithUsername:(NSString *)name password:(NSString *)pwd {
    NSLog(@"登陆");
}

@end
