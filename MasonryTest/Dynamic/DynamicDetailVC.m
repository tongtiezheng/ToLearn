//
//  DynamicDetailVC.m
//  MasonryTest
//
//  Created by 佟铁铮 on 15/5/30.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import "DynamicDetailVC.h"
#import "MJRefresh.h"


@interface DynamicDetailVC () <
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView *listView;

@end

@implementation DynamicDetailVC

- (id)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(cc)
                                                     name:@"cc"
                                                   object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:@"cc"
                                                  object:nil];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = @"详情" ;
}

- (void)cc {
    NSLog(@"321***");
}

- (void)bb {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cc" object:nil];
}

- (void)aa {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self performSelector:@selector(bb) withObject:nil afterDelay:2];
        
        // 拿到当前的上拉刷新控件，结束刷新状态
        [self.listView.footer endRefreshing];
    });
}

- (void)dd {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self performSelector:@selector(bb) withObject:nil afterDelay:2];
        
        // 拿到当前的上拉刷新控件，结束刷新状态
        [self.listView.header endRefreshing];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WS(ws);
    
    UITableView *listView = [UITableView new];
    listView.backgroundColor = [UIColor clearColor];
    listView.delegate = self;
    listView.dataSource = self;
    [self.view addSubview:listView];
    self.listView = listView;
    [listView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
//    __weak __typeof(self) weakSelf = self;
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.listView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [ws dd];
    }];
    
    // 马上进入刷新状态
    [self.listView.header beginRefreshing];
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(aa)];
    
    // 禁止自动加载
    footer.automaticallyRefresh = NO;
    
    // 设置footer
    listView.footer = footer;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [self.listView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"1";
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
