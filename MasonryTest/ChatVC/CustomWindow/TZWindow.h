//
//  TZWindow.h
//  MasonryTest
//
//  Created by 佟铁铮 on 15/7/24.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TZWindow : UIWindow

@property (nonatomic, strong) UIWindow *window;

+ (id)shareInstance;

- (void)showAlert;

@end
