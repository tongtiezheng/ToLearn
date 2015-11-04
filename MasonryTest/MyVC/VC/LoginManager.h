//
//  LoginManager.h
//  MasonryTest
//
//  Created by 佟铁铮 on 15/11/3.
//  Copyright © 2015年 佟铁铮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginManager : NSObject

@property (nonatomic, assign) BOOL logginIn;

+ (LoginManager *)sharedManager;

- (void)logInWithUsername:(NSString *)name password:(NSString *)pwd;

@end
