//
//  DynamicCell.h
//  MasonryTest
//
//  Created by 佟铁铮 on 15/7/14.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import "RootCell.h"

@interface DynamicCell : RootCell

@property (nonatomic, strong) UILabel *titleLbl;

@property (nonatomic, strong) NSMutableDictionary *dic;

+ (CGFloat)heightForRow:(NSDictionary *)model;

@end
