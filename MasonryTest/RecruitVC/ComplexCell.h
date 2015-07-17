//
//  ComplexCell.h
//  MasonryTest
//
//  Created by 佟铁铮 on 15/7/3.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

typedef NS_ENUM(NSUInteger, ComplexType) {
    ComplexType1111,
    ComplexType1110,
    ComplexType0111,
    ComplexType0011,
    ComplexType0010,
    ComplexType1101
};

#import <UIKit/UIKit.h>

@interface ComplexCell : UITableViewCell

@property (nonatomic, assign) ComplexType type;

+ (CGFloat)getHeightByType:(NSInteger)tag;

@end
