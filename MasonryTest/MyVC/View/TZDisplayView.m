//
//  TZDisplayView.m
//  MasonryTest
//
//  Created by 佟铁铮 on 15/7/18.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import "TZDisplayView.h"
#import "CoreText/CoreText.h"

@implementation TZDisplayView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    // 步骤 1
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 步骤 2
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // 步骤 3
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    
    // 步骤 4
//    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:@"Hello World! "
//                                     " 创建绘制的区域，CoreText 本身支持各种文字排版的区域，"
//                                     " 我们这里简单地将 UIView 的整个界面作为排版的区域。"
//                                     " 为了加深理解，建议读者将该步骤的代码替换成如下代码，"
//                                     " 测试设置不同的绘制区域带来的界面变化。"];
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:@"Hello World! "
                                     " 创建绘制的区域，CoreText 本身支持各种文字排版的区域，"
                                     " 我们这里简单地将 UIView 的整个界面作为排版的区域。"
                                     " 为了加深理解，建议读者将该步骤的代码替换成如下代码，"
                                     " 测试设置不同的绘制区域带来的界面变化。"];
    CTFramesetterRef framesetter =
    CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
    CTFrameRef frame =
    CTFramesetterCreateFrame(framesetter,
                             CFRangeMake(0, [attString length]), path, NULL);
    
    // 步骤 5
    CTFrameDraw(frame, context);
    
    // 步骤 6
    CFRelease(frame);
    CFRelease(path);
    CFRelease(framesetter);
}


@end
