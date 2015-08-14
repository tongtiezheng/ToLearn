//
//  MyVC.m
//  MasonryTest
//
//  Created by 佟铁铮 on 15/5/30.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import "MyVC.h"
#import "TZDisplayView.h"

@interface MyVC ()



@end

@implementation MyVC

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = @"我的";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        
//    });
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"group1");
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"group2");
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"group3");
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"updateUi");
    });  

    
    /*
    TZDisplayView *view = [[TZDisplayView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    [self.view addSubview: view];
    */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
