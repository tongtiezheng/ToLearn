//
//  CommonHeader.h
//  MasonryTest
//
//  Created by 佟铁铮 on 15/5/30.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#ifndef MasonryTest_CommonHeader_h
#define MasonryTest_CommonHeader_h

#define RGBColor(x,y,z) [UIColor colorWithRed:x/255.0f green:y/255.0f blue:z/255.0f                                                                                  alpha:1.0]

#define UIColorFromRGBA(rgbValue, alphaValue) [UIColor colorWithRed:(((float)(((rgbValue) & 0xFF0000) >> 16))/255.0) green:(((float)(((rgbValue) & 0x00FF00) >> 8))/255.0) blue:(((float)((rgbValue) & 0x0000FF))/255.0) alpha:(alphaValue)]

#define iOS7  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define RED_COLOR [UIColor redColor]
#define CLEAR_COLOR [UIColor clearColor]

#endif
