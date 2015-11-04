//
//  XLVC.m
//  MasonryTest
//
//  Created by 佟铁铮 on 15/10/9.
//  Copyright (c) 2015年 佟铁铮. All rights reserved.
//

#import "XLVC.h"
#import "XLForm.h"
//#import "DateAndTimeValueTrasformer.h"
//#import "NativeEventFormViewController.h"

@interface XLVC ()

@end

@implementation XLVC

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form = [XLFormDescriptor formDescriptorWithTitle:@"Add Event"];
    section = [XLFormSectionDescriptor formSectionWithTitle:@"标题"];
    [form addFormSection:section];
    
    // Title
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"Title" rowType:XLFormRowDescriptorTypeText];
    [row.cellConfigAtConfigure setObject:@"Title" forKey:@"textField.placeholder"];
    row.required = YES;
    [section addFormRow:row];
    
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"Title" rowType:XLFormRowDescriptorTypeButton title:@"click"];
    row.action.viewControllerClass = [XLVC class];
    [section addFormRow:row];
    
    self.form = form;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
