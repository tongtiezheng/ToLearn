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

- (id)init {
    if (self = [super init]) {
        [self initNotification];
    }
    return self;
}

- (void)initNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardShow)
                                                 name:UIKeyboardWillChangeFrameNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)keyboardShow {
//    NSLog(@"showaaa");
}

- (void)keyboardHide {
//    NSLog(@"hideaaa");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:RGBColor(219, 44, 56),NSForegroundColorAttributeName,[UIFont fontWithName:@"Helvetica-Bold" size:17.0],NSFontAttributeName, nil];
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
