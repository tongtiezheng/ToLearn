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
#define iOS7  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#endif
