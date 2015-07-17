//
//  RootViewController.m
//  MasonryTest
//
//  Created by 佟铁铮 on 15/5/30.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont fontWithName:@"Helvetica-Bold" size:17.0],NSFontAttributeName, nil];
//    [self.tabBarController.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                [UIColor lightGrayColor], NSForegroundColorAttributeName,
//                                                [UIColor lightGrayColor], NSShadowAttributeName,
//                                                [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], NSShadowAttributeName,
//                                                [UIFont fontWithName:@"Arial-Bold" size:0.0], NSFontAttributeName,
//                                                nil]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
