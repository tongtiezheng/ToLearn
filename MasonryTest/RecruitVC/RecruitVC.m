//
//  RecruitVC.m
//  MasonryTest
//
//  Created by 佟铁铮 on 15/5/30.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import "RecruitVC.h"
#import "ComplexCell.h"
#import "POP.h"
#import "TBAnimationButton.h"

@interface RecruitVC () <
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UILabel *testView;

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

- (void)btnClick:(TBAnimationButton *)sender {
    if (sender.currentState == TBAnimationButtonStateMenu) {
        [sender animationTransformToState:TBAnimationButtonStateCross];
        
        NSInteger height = CGRectGetHeight(self.view.bounds);
        NSInteger width = CGRectGetWidth(self.view.bounds);
        
//        CGFloat centerX = arc4random() % width;
//        CGFloat centerY = arc4random() % height;
        CGFloat centerX = width / 2;
        CGFloat centerY = height / 2;
        
        NSLog(@"height=%ld",height);
        NSLog(@"width=%ld",width);
        NSLog(@"centerX=%f",centerX);
        NSLog(@"centerY=%f",centerY);
        
        POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerY)];
        anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        anim.duration = 1;
        [self.testView pop_addAnimation:anim forKey:@"centerAnimation"];
        
    } else if (sender.currentState == TBAnimationButtonStateCross) {
        [sender animationTransformToState:TBAnimationButtonStateMenu];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[MTUtil shareInstance] TBButtonItemWithaction:@selector(btnClick:) andTitle:nil andNavigation:self];
    
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    l.backgroundColor = RED_COLOR;
    [self.view addSubview:l];
    self.testView = l;
    
//    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
//    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    anim.fromValue = @(0.0);
//    anim.toValue = @(1.0);
//    [l pop_addAnimation:anim forKey:@"fade"];
    
//    POPDecayAnimation *anim = [POPDecayAnimation animationWithPropertyNamed: kPOPLayerPositionX];
//    anim.velocity = @(50);
//    [l.layer pop_addAnimation:anim forKey:@"slide"];
    
//    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
//    anim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 400, 400)];
//    [l.layer pop_addAnimation:anim forKey:@"size"];
    
    /*
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
     */
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
