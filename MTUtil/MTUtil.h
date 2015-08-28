//
//  MTUtil.h
//  MasonryTest
//
//  Created by 佟铁铮 on 15/5/30.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class THPinViewController;

@interface MTUtil : NSObject

+ (MTUtil *)shareInstance;

@property (nonatomic, strong) THPinViewController *pinViewController;

- (UITabBarItem *)returnTabBarItem:(NSString *)title andImageName:(NSString *)name;

- (UIBarButtonItem *)TBButtonItemWithaction:(SEL)action
                                   andTitle:(NSString*)title
                              andNavigation:(UIViewController *)nav;

- (void)buttonItemWithaction:(SEL)action
                    andTitle:(NSString*)title
               andNavigation:(UIViewController *)nav;

@end
