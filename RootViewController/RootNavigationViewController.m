//
//  RootViewController.m
//  MasonryTest
//
//  Created by 佟铁铮 on 15/5/30.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import "RootNavigationViewController.h"

@interface RootNavigationViewController ()

@end

@implementation RootNavigationViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = NO;
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav"] forBarMetrics:UIBarMetricsDefault];
//    UIFont* font = [UIFont fontWithName:@"Arial-Bold" size:0.0]
//    NSDictionary* textAttributes = @{NSFontAttributeName:font,
//                                     NSForegroundColorAttributeName:[UIColor blackColor]};
//    
//    [[UINavigationBar appearance]setTitleTextAttributes:textAttributes];
//    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                                     [UIColor lightGrayColor], NSForegroundColorAttributeName,
//                                                                     [UIColor lightGrayColor], NSShadowAttributeName,
//                                                                     [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], NSShadowAttributeName,
//                                                                     [UIFont fontWithName:@"Arial-Bold" size:0.0], NSFontAttributeName,
//                                                                     nil]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
