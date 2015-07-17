//
//  MTUtil.m
//  MasonryTest
//
//  Created by 佟铁铮 on 15/5/30.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import "MTUtil.h"

static MTUtil *mt = nil;

@implementation MTUtil

+ (MTUtil *)shareInstance {
    if (!mt) {
        mt = [[MTUtil alloc] init];
    }
    return mt;
}

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
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

@end
