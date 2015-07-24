//
//  TZWindow.m
//  MasonryTest
//
//  Created by 佟铁铮 on 15/7/24.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import "TZWindow.h"

static TZWindow *window = nil;

@implementation TZWindow

+ (id)shareInstance {
    if (!window) {
        window = [[self alloc] init];
    }
    return window;
}

- (id)init {
    if (self = [super init]) {
        [self initView];
    }
    return self;
}

- (void)initView {
//    WS(ws);
    
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.backgroundColor = [UIColor lightGrayColor];
    _window.alpha = .5;
    _window.windowLevel = UIWindowLevelAlert + 1;
    
    UIButton *btn = [UIButton new];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"hide" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [_window addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_window).with.offset(100);
        make.left.equalTo(_window).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(50, 100));
    }];
}

- (void)click {
    [_window resignKeyWindow];
    _window.hidden = YES;
}

- (void)showAlert {
    [_window makeKeyAndVisible];
}

@end
