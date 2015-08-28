//
//  MTUtil.m
//  MasonryTest
//
//  Created by 佟铁铮 on 15/5/30.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import "MTUtil.h"
#import "TBAnimationButton.h"
#import "THPinViewController.h"

static MTUtil *mt = nil;

@interface MTUtil () <
    THPinViewControllerDelegate
>


@property (nonatomic, copy) NSString *correctPin;
@property (nonatomic, assign) NSInteger remainingPinEntries;

@end

@implementation MTUtil

+ (MTUtil *)shareInstance {
    if (!mt) {
        mt = [[MTUtil alloc] init];
        
    }
    return mt;
}

- (id)init {
    if (self = [super init]) {
        _correctPin = @"1234";
        _remainingPinEntries = 3;
//        [self initPinView];
    }
    return self;
}

- (void)initPinView {
    if (!_pinViewController) {
        _pinViewController = [[THPinViewController alloc] initWithDelegate:self];
        _pinViewController.promptTitle = @"Enter PIN";
        _pinViewController.promptColor = [UIColor darkTextColor];
        _pinViewController.view.tintColor = [UIColor darkTextColor];
        _pinViewController.hideLetters = YES;
        _pinViewController.backgroundColor = [UIColor purpleColor];
        _pinViewController.translucentBackground = YES;
    }
}

- (void)buttonItemWithaction:(SEL)action
                    andTitle:(NSString*)title
               andNavigation:(UIViewController *)nav {
    TBAnimationButton *button = [TBAnimationButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = RED_COLOR;
    button.currentState = TBAnimationButtonStateMenu;
    button.lineWidth = 25;
    button.showsTouchWhenHighlighted = YES;
    //    button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 50);
    button.frame = CGRectMake(0, 0, 44, 44);
    //    button.bounds = CGRectMake(10, 0, 44, 44);
    if (title && title.length != 0) {
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14.0];
    }
    
    [button addTarget:nav action:action forControlEvents:UIControlEventTouchUpInside];
    [nav.navigationController.navigationBar addSubview:button];
}

- (UIBarButtonItem *)TBButtonItemWithaction:(SEL)action
                                       andTitle:(NSString*)title
                                  andNavigation:(UIViewController *)nav {
    TBAnimationButton *button = [TBAnimationButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = CLEAR_COLOR;
    button.currentState = TBAnimationButtonStateMenu;
    button.lineWidth = 22.5;
    button.lineSpacing = 6;
//    button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 50);
//    button.frame = CGRectMake(0, 0, 44, 44);
    button.bounds = CGRectMake(10, 0, 44, 44);
    if (title && title.length != 0) {
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14.0];
    }
    
    [button addTarget:nav action:action forControlEvents:UIControlEventTouchUpInside];
    
    __autoreleasing UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    return barButtonItem;
}

- (UITabBarItem *)returnTabBarItem:(NSString *)title andImageName:(NSString *)name{
    UIImage *normalImage = [self returnImage:[NSString stringWithFormat:@"%@_A@2x",name]];
    UIImage *selectImage = [self returnImage:[NSString stringWithFormat:@"%@_B@2x",name]];
    __autoreleasing UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:normalImage tag:0];
    tabBarItem.selectedImage = selectImage;
    if (iOS7){
        tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else{
        tabBarItem.selectedImage = selectImage;
    }
    NSDictionary *selectTitle = [[NSDictionary alloc] initWithObjectsAndKeys:RGBColor(12, 96, 254),NSForegroundColorAttributeName, nil];
    [tabBarItem setTitleTextAttributes:selectTitle forState:UIControlStateSelected];
    [tabBarItem setTitlePositionAdjustment:UIOffsetMake(0.0, -2.0)];
    return tabBarItem;
}

- (UIImage*)returnImage:(NSString *)name{
    __weak NSString *imagePath = [[NSBundle mainBundle] pathForResource:name ofType:@"png"];
    UIImage *returnImage = [UIImage imageWithContentsOfFile:imagePath];
    return returnImage;
}

- (THPinViewController *)pinViewController {
    if (!_pinViewController) {
        _pinViewController = [[THPinViewController alloc] initWithDelegate:self];
        _pinViewController.promptTitle = @"Enter PIN";
        _pinViewController.promptColor = [UIColor darkTextColor];
        _pinViewController.view.tintColor = [UIColor darkTextColor];
        _pinViewController.hideLetters = YES;
//        _pinViewController.backgroundColor = RGBColor(68, 68, 68);
        _pinViewController.backgroundColor = [UIColor whiteColor];
//        _pinViewController.translucentBackground = YES;
    }
    return _pinViewController;
}

- (NSUInteger)pinLengthForPinViewController:(THPinViewController *)pinViewController
{
    return 4;
}

- (BOOL)pinViewController:(THPinViewController *)pinViewController isPinValid:(NSString *)pin
{
    if ([pin isEqualToString:self.correctPin]) {
        return YES;
    } else {
        self.remainingPinEntries--;
        return NO;
    }
}

- (BOOL)userCanRetryInPinViewController:(THPinViewController *)pinViewController
{
    return (self.remainingPinEntries > 0);
}

@end
