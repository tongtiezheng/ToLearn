//
//  ViewController.m
//  MasonryTest
//
//  Created by 佟铁铮 on 15/5/28.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
//    __weak UIView * weakSelf = self.view;
    
    UIImageView *contentView = [UIImageView new];
    [contentView setImage:[UIImage imageNamed:@"btn"]];
    [self.view addSubview:contentView];
    __weak UIView * weakSelf = self.view;
    contentView.backgroundColor = [UIColor clearColor];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf).with.offset(0);
        make.bottom.equalTo(weakSelf).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    
    /*
    UIView *v1 = [UIView new];
    [contentView addSubview:v1];
    v1.backgroundColor = [UIColor blueColor];
    
    UIView *v2 = [UIView new];
    [contentView addSubview:v2];
    v2.backgroundColor = [UIColor blueColor];
    
    int padding = 10;
    [v1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(contentView.mas_centerY);
        make.left.equalTo(contentView.mas_left).with.offset(padding);
        make.right.equalTo(v2.mas_left).with.offset(-padding);
        make.width.equalTo(v2);
        make.height.equalTo(@150);
        
    }];
    
    [v2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(contentView.mas_centerY);
        make.left.equalTo(v1.mas_right).with.offset(-padding);
        make.right.equalTo(contentView.mas_right).with.offset(-padding);
        make.width.equalTo(v1);
        make.height.equalTo(@150);
    }];
    */
//    UIView * titleView=[UIView new];
//    [self.view addSubview:titleView];
//    __weak UIView * weakSelf=self.view;
//    titleView.backgroundColor=[UIColor colorWithRed:0.89f green:0.24f blue:0.25f alpha:1.00f];
//    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.top.equalTo(weakSelf).with.offset(0);
//        make.right.equalTo(weakSelf).with.offset(0);
//        make.left.equalTo(weakSelf).with.offset(0);
//        make.height.equalTo(@64);
//        
//    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
