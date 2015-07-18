//
//  DynamicCell.m
//  MasonryTest
//
//  Created by 佟铁铮 on 15/7/14.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import "DynamicCell.h"

@interface DynamicCell ()



@end

@implementation DynamicCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initView];
    }
    return self;
}

- (void)initView {
    
    __block UIView *ws = self.contentView;
    
    UILabel *titleLbl = [UILabel new];
    titleLbl.text = @"";
    titleLbl.backgroundColor = [UIColor clearColor];
    titleLbl.numberOfLines = 0;
    titleLbl.font = [UIFont systemFontOfSize:14.0f];
    [self.contentView addSubview:titleLbl];
    self.titleLbl = titleLbl;
    [titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
}

- (void)setDic:(NSMutableDictionary *)dic {
    self.titleLbl.text = dic[@"content"];
}

+ (CGFloat)heightForRow:(NSDictionary *)model {
    CGFloat height = 0.0f;
    NSString *txt = model[@"content"];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14],NSFontAttributeName, nil];
    CGRect temp = [ txt boundingRectWithSize:CGSizeMake(310, 999) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading   attributes:dict context:nil ];
    height += temp.size.height + 10 + 1;
    return height;
}

@end
