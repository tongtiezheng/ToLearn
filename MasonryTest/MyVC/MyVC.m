//
//  MyVC.m
//  MasonryTest
//
//  Created by 佟铁铮 on 15/5/30.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import "MyVC.h"
#import "TZDisplayView.h"
#import "THPinViewController.h"
#import "THPinView.h"
#import "ReactiveCocoaVC.h"
#import "XLForm.h"
#import "XLVC.h"

#define UIColorFromRGBA(rgbValue, alphaValue) [UIColor colorWithRed:(((float)(((rgbValue) & 0xFF0000) >> 16))/255.0) green:(((float)(((rgbValue) & 0x00FF00) >> 8))/255.0) blue:(((float)((rgbValue) & 0x0000FF))/255.0) alpha:(alphaValue)]

@interface MyVC () <
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView *listView;

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
    
    WS(ws);
    
    UITableView *listView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    listView.delegate = self;
    listView.dataSource = self;
    [self.view addSubview:listView];
    self.listView = listView;
    [listView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.edges.equalTo(ws.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    /*
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

    
    
    TZDisplayView *view = [[TZDisplayView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    [self.view addSubview: view];
    */
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    switch (indexPath.section) {
        case 0: {
            switch (indexPath.row) {
                case 0: {
                    cell.textLabel.text = @"XLForm";
//                    cell.contentView.backgroundColor = UIColorFromRGBA(0x3473a8, 1);
                }
                    break;
                case 1: {
                    cell.textLabel.text = @"1";
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 1: {
            switch (indexPath.row) {
                case 0: {
                    cell.textLabel.text = @"ReactiveCocoa";
                }
                    break;
                case 1: {
                    cell.textLabel.text = @"1";
                }
                    break;
                case 2: {
                    cell.textLabel.text = @"1";
                }
                    break;
                case 3: {
                    cell.textLabel.text = @"密码";
                }
                    break;
                default:
                    break;
            }
        }
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            XLVC *vc = [[XLVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 3) {
            THPinViewController *v = [[MTUtil shareInstance] pinViewController];
            [v.pinView resetInput];
            [self presentViewController:v animated:YES completion:nil];
        } else if (indexPath.row == 0) {
            ReactiveCocoaVC *vc = [[ReactiveCocoaVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
