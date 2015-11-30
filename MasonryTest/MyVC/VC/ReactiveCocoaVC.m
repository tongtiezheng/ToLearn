//
//  ReactiveCocoaVCViewController.m
//  MasonryTest
//
//  Created by 佟铁铮 on 15/11/3.
//  Copyright © 2015年 佟铁铮. All rights reserved.
//

#import "ReactiveCocoaVC.h"
#import "LoginManager.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

static void *ObservationContext = &ObservationContext;

@interface ReactiveCocoaVC ()

@property (nonatomic, strong) UITextField *userNameTxt;
@property (nonatomic, strong) UITextField *pwdTxt;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, assign) BOOL loggedIn;

@end

@implementation ReactiveCocoaVC

- (void)blockTest1 {
    int multiplier = 7;
    int (^myBlock) (int) = ^(int num) {
        return num * multiplier;
    };
    printf("%d",myBlock(3));
}

- (void)blockTest2 {
    char *myCharacters[3] = { "C", "Z", "A" };
    
    qsort_b(myCharacters, 3, sizeof(char *), ^(const void *l, const void *r) {
        char *left = *(char **)l;
        char *right = *(char **)r;
        return strncmp(left, right, 1);
    });
    for (NSInteger i=0; i<3; i++) {
        printf("%s ",myCharacters[i]);
    }
}

- (void)blockTest3 {
    NSArray *stringsArray = @[ @"string 1",
                               @"String 21",
                               @"string 12",
                               @"String 11",
                               @"String 02" ];
    
    static NSStringCompareOptions comparisonOptions = NSCaseInsensitiveSearch | NSNumericSearch |
    NSWidthInsensitiveSearch | NSForcedOrderingSearch;
    NSLocale *currentLocale = [NSLocale currentLocale];
    
    NSComparator finderSortBlock = ^(id string1, id string2) {
        
        NSRange string1Range = NSMakeRange(0, [string1 length]);
        return [string1 compare:string2 options:comparisonOptions range:string1Range locale:currentLocale];
    };
    
    NSArray *finderSortArray = [stringsArray sortedArrayUsingComparator:finderSortBlock];
    NSLog(@"finderSortArray: %@", finderSortArray);
}

- (void)blockTest4 {
    NSArray *array = @[@"A", @"B", @"C", @"A", @"B", @"Z", @"G", @"are", @"Q"];
    void (^test)(id obj, NSInteger idx);
    
    test = ^(id obj, NSInteger idx) {
        NSLog(@"");
        NSLog(@"%@",array[idx]);
    };
    NSUInteger indexes = [array indexOfObjectPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"obj=%@,idx=%lu",obj,idx);
        if ([obj isEqualToString:@"are"]) {
            return YES;
        }
        return NO;
    }];
    NSLog(@"indexes=%lu",indexes);
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"idx=%lu,obj=%@",idx,obj);
    }];
}

- (BOOL)isValidUsername:(NSString *)username {
    return username.length > 3;
}

- (BOOL)isValidPassword:(NSString *)password {
    return password.length > 3;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
}



//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    NSLog(@"%@",string_weak);
//}
//
//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    NSLog(@"%@",string_weak);
//}
//__weak NSString * string_weak = nil;
- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString *string = [NSString stringWithFormat:@"123%@",@"1"];
//    string_weak = string;
    
//    @autoreleasepool {
//        NSString *string = [NSString stringWithFormat:@"123%@",@"2"];
//        string_weak = string;
//    }
//    NSString *string = nil;
//    @autoreleasepool {
//        string = [NSString stringWithFormat:@"123%@",@"3"];
//        string_weak = string;
//    }
    
//    NSLog(@"%@",string_weak);
    [self initView];
    
    /*
    RACSignal *validUsernameSignal =
    [self.userNameTxt.rac_textSignal
     map:^id(NSString *text) {
         return @([self isValidUsername:text]);
     }];
    
    RACSignal *validPasswordSignal =
    [self.pwdTxt.rac_textSignal
     map:^id(NSString *text) {
         return @([self isValidPassword:text]);
     }];
    
    RAC(self.userNameTxt, backgroundColor) = [validUsernameSignal map:^id(NSNumber *userNameValid) {
        return [userNameValid boolValue] ? [UIColor clearColor] : [UIColor yellowColor];
    }];
    RAC(self.pwdTxt, backgroundColor) = [validPasswordSignal map:^id(NSNumber *pwdValid) {
        return [pwdValid boolValue] ? [UIColor clearColor] : [UIColor yellowColor];
    }];
    
    RACSignal *btnEnableSignal = [RACSignal combineLatest:@[validUsernameSignal,validPasswordSignal] reduce:^id(NSNumber *usernameValid, NSNumber *pwdValid) {
        return @([usernameValid boolValue] && [pwdValid boolValue]);
    }];
    
    [btnEnableSignal subscribeNext:^(NSNumber *enable) {
        self.loginBtn.enabled = [enable boolValue];
        self.loginBtn.backgroundColor = [enable boolValue]?[UIColor lightGrayColor]:[UIColor grayColor];
    }];
    
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"click");
    }];*/
}

- (void)test4 {
    //length>3之后，开始输出length
    [[[self.userNameTxt.rac_textSignal map:^id(NSString *text) {
        return @(text.length);
    }] filter:^BOOL(NSNumber *length) {
        return [length integerValue] > 3;
    }] subscribeNext:^(id x) {
        NSLog(@"%@",x);//4 5 6 7 8 9 10 11 12...
    }];
}

- (void)test3 {
    //test2的分开写法
    RACSignal *userNameSourceSignal = self.userNameTxt.rac_textSignal;
    RACSignal *filteredUserName = [userNameSourceSignal filter:^BOOL(id value) {
        NSString *text = value;
        return text.length > 3;
    }];
    
    [filteredUserName subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}

- (void)test2 {
    //length>3之后会输出
    [[self.userNameTxt.rac_textSignal filter:^BOOL(id value) {
        NSString *text = value;
        return text.length > 3;
    }] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}

- (void)test1 {
    //输出
    [self.userNameTxt.rac_textSignal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}

- (void)initView {
    WS(ws);
    
    UITextField *userNameTxt = [UITextField new];
    userNameTxt.backgroundColor = [UIColor lightGrayColor];
    userNameTxt.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:userNameTxt];
    self.userNameTxt = userNameTxt;
    
    UITextField *pwdTxt = [UITextField new];
    pwdTxt.backgroundColor = [UIColor lightGrayColor];
    pwdTxt.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:pwdTxt];
    self.pwdTxt = pwdTxt;
    
    UIButton *loginBtn = [UIButton new];
    loginBtn.backgroundColor = [UIColor grayColor];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
    self.loginBtn = loginBtn;
    
    [userNameTxt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(50);
        make.left.mas_equalTo(ws.view).with.offset(10);
        make.right.mas_equalTo(ws.view).with.offset(-10);
        make.height.mas_equalTo(@44);
    }];
    
    [pwdTxt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(userNameTxt.mas_bottom).with.offset(10);
        make.left.mas_equalTo(ws.view).with.offset(10);
        make.right.mas_equalTo(ws.view).with.offset(-10);
        make.height.mas_equalTo(@44);
    }];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(pwdTxt.mas_bottom).with.offset(30);
        make.left.mas_equalTo(ws.view).with.offset(20);
        make.right.mas_equalTo(ws.view).with.offset(-20);
        make.height.mas_equalTo(@44);
    }];
    
//    [loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)loginClick {
    NSLog(@"click");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)test {
    /*
     WS(ws);
     RAC(self.loginBtn, enabled) = [RACSignal combineLatest:@[self.userNameTxt.rac_textSignal, self.pwdTxt.rac_textSignal,RACObserve([LoginManager sharedManager], logginIn),RACObserve(self, self.loggedIn)] reduce:^(NSString *username, NSString *password, NSNumber *loggingIn, NSNumber *loggedIn){
     return @(username.length > 0 && password.length > 0 && !loggingIn.boolValue && !loggedIn.boolValue);
     }];
     
     [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *sender) {
     //        strongify(self);
     //        strongify(self);
     RACSignal *loginSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
     [[LoginManager sharedManager] logInWithUsername:self.userNameTxt.text password:self.pwdTxt.text];
     return nil;
     }];
     //
     [loginSignal subscribeError:^(NSError *error) {
     //            strongify(self);
     //            [self presentError:error];
     NSLog(@"nonono");
     } completed:^{
     //            strongify(self);
     self.loggedIn = YES;
     NSLog(@"yesyes");
     }];
     }];
     RAC(self, self.loggedIn) = [[NSNotificationCenter.defaultCenter
     rac_addObserverForName:@"abc" object:nil]
     mapReplace:@NO];*/
}

@end
