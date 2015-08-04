//
//  SquarVC.m
//  MasonryTest
//
//  Created by 佟铁铮 on 15/5/30.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import "SquarVC.h"
#import "AFMInfoBanner.h"
#import "CoreDataManager1.h"
#import "News.h"

@interface SquarVC ()

@property (nonatomic, strong) UIWebView *jsWebView;

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
    
    
//    NSURL *url =[[NSURL alloc] initWithString:@"http://10.10.80.125:58090/report/phonePortal/deviceAlarm.jsp"];
    
//    NSURLRequest *request =  [[NSURLRequest alloc] initWithURL:url];
    _jsWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
    _jsWebView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_jsWebView];
    // js地址
    NSString * jsPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
    
    NSString * content = [NSString stringWithContentsOfFile:jsPath encoding:NSUTF8StringEncoding error:nil];
    
    NSString * jsNSString = content;
    
//    [_jsWebView stringByEvaluatingJavaScriptFromString:jsNSString];
    [_jsWebView loadHTMLString:jsNSString baseURL:nil];
    
//    [_jsWebView loadRequest:request];
    
    
    /*
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i=0; i<8; i++) {
        News *model = [[News alloc] init];
        model.islook = @"0";
        model.title = [NSString stringWithFormat:@"第%ld个新闻",((long)i+1)];
        model.desc = [NSString stringWithFormat:@"第%ld个详细内容",((long)i+1)];
        [arr addObject:model];
    }
    
    CoreDataManager1 *core = [[CoreDataManager1 alloc] init];
    [core deleteData];
    NSMutableArray *temp = [core selectData:5 andOffset:0];
    if (temp.count == 0) {
        [core insertCoreData:arr];
    } else {
        [core updateData:@"第1个新闻" withIsLook:@"1"];
        [core updateData:@"第2个新闻" withIsLook:@"1"];
    }
    
    
    
    
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
    }]; */
}

- (void)btnClick:(id)sender {
    [AFMInfoBanner showAndHideWithText:@"测试信息" style:AFMInfoBannerStyleInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
