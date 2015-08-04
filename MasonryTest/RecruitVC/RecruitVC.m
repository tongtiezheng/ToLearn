//
//  RecruitVC.m
//  MasonryTest
//
//  Created by 佟铁铮 on 15/5/30.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import "RecruitVC.h"
#import "ComplexCell.h"

@interface RecruitVC () <
    UITableViewDelegate,
    UITableViewDataSource
>

@end

@implementation RecruitVC

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = @"招聘";
}

- (void)keyboardShow {
    NSLog(@"showaaa");
}

- (void)keyboardHide {
    NSLog(@"hideaaa");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    WS(ws);
    
    UITableView *listView = [UITableView new];
//    listView.backgroundColor = [UIColor blueColor];
    listView.delegate = self;
    listView.dataSource = self;
    [self.view addSubview:listView];
    
    UITextField *field = [UITextField new];
    field.borderStyle = UITextBorderStyleLine;
    field.backgroundColor = [UIColor redColor];
    field.delegate = self;
    [self.view addSubview:field];
    
    [listView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(ws.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(-89);
    }];
    
    [field mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(-49);
        make.top.equalTo(listView.mas_bottom);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return [ComplexCell getHeightByType:indexPath.row%6];
    return 44.0f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    ComplexCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[ComplexCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
//    cell.type = indexPath.row%6;
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
