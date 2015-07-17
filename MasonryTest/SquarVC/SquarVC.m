//
//  SquarVC.m
//  MasonryTest
//
//  Created by 佟铁铮 on 15/5/30.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import "SquarVC.h"
#import "AFMInfoBanner.h"

@interface SquarVC ()

@end

@implementation SquarVC

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = @"广场";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WS(ws);
    
    UIButton *btn = [UIButton new];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"show AFMInfoBanner" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(100);
        make.left.equalTo(ws.view).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(200, 50));
    }];
}

- (void)btnClick:(id)sender {
    [AFMInfoBanner showAndHideWithText:@"测试信息" style:AFMInfoBannerStyleInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
