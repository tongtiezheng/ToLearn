//
//  DynamicVC.m
//  MasonryTest
//
//  Created by 佟铁铮 on 15/5/30.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import "DynamicVC.h"
#import "DynamicDetailVC.h"
#import "JSONKit.h"
#import "DynamicCell.h"
#import "TBAnimationButton.h"
#import "FBKVOController.h"
#import "MJRefresh.h"

@interface DynamicVC () <
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *listView;

@end

@implementation DynamicVC

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = @"动态" ;
}

- (NSString*)removeSpecialCharacter: (NSString *)str {
    NSRange urgentRange = [str rangeOfCharacterFromSet: [NSCharacterSet characterSetWithCharactersInString: @"\n "]];
    if (urgentRange.location != NSNotFound)
    {
        NSString *temp = [str stringByReplacingCharactersInRange:urgentRange withString:@""];
        return [self removeSpecialCharacter: temp];
    }
    return str;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;//self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = [DynamicCell heightForRow:self.dataArray[indexPath.row]];
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"goodCell";
    DynamicCell *cell = [self.listView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[DynamicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.dic = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DynamicDetailVC *vc = [[DynamicDetailVC alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)btnClick:(TBAnimationButton *)sender {
    if (sender.currentState == TBAnimationButtonStateMenu) {
        [sender animationTransformToState:TBAnimationButtonStateCross];
    } else if (sender.currentState == TBAnimationButtonStateCross) {
        [sender animationTransformToState:TBAnimationButtonStateMenu];
    }
    
}

- (void)aa {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        
        
        // 拿到当前的上拉刷新控件，结束刷新状态
        [self.listView.footer endRefreshing];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = CLEAR_COLOR;
    
    self.navigationItem.leftBarButtonItem = [[MTUtil shareInstance] TBButtonItemWithaction:@selector(btnClick:) andTitle:nil andNavigation:self];
//    [[MTUtil shareInstance] buttonItemWithaction:@selector(btnClick:) andTitle:nil andNavigation:self];
    
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
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(aa)];
    
    // 禁止自动加载
    footer.automaticallyRefresh = NO;
    
    // 设置footer
    listView.footer = footer;
    
    
    NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *feedDicts = rootDict[@"feed"];
    [self.dataArray setArray:feedDicts];
    
    [listView reloadData];
    
    /*
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    
    UIView *container = [UIView new];
    [scrollView addSubview:container];
    container.backgroundColor = [UIColor blueColor];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.width.equalTo(scrollView);
    }];
    
    int count = 10;
    UIView *lastView = nil;
    for (NSInteger i=1; i<=count; i++) {
        UIView *subv = [UIView new];
        [container addSubview:subv];
        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                               alpha:1];
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(container);
            make.height.mas_equalTo(@(20*i));
            
            if (lastView) {
                make.top.mas_equalTo(lastView.mas_bottom);
            } else {
                make.top.mas_equalTo(container.mas_top);
            }
        }];
        lastView = subv;
    }
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
     */
}

- (void)push {
    DynamicDetailVC *detail = [[DynamicDetailVC alloc] init];
    detail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
