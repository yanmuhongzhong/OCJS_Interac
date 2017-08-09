//
//  JavaOCInterRac.m
//  baobaotong
//
//  Created by lk on 16/7/14.
//  Copyright © 2016年 zzy. All rights reserved.
//

#import "JavaOCInterRac.h"
#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

//首先创建一个实现了JSExport协议的协议
@protocol JavaOCInterRacProtocol <JSExport>

// 调系统相册
- (void)callPicker;
// 调支付
- (void)callPay;
// 传一个参数回来
- (void)callPassParameter: (NSString *)orderNumber;
// 传两个参数回来
- (void)callTestParameterone: (NSString *)orderNumber AndParametertwo:(NSString *)name;

@end

@implementation JavaOCInterRac

static JavaOCInterRac *JavaOCInterac = nil;
+(instancetype)getInstance
{
    
    @synchronized(self)
    {
        if(!JavaOCInterac)
        {
            JavaOCInterac = [[self alloc] init];
        }
    }
    return JavaOCInterac;
}

- (void)callPay {
    
    NSLog(@"%s %s [第%d行] ----- 点击了支付", __TIME__, __FUNCTION__, __LINE__);
}

- (void)callPicker {
    
    NSLog(@"%s %s [第%d行] ----- 点击了调用系统相册", __TIME__, __FUNCTION__, __LINE__);
    self.showPickerBlock();
}

- (void)callPassParameter:(NSString *)orderNumber {
    
    NSLog(@"%s %s [第%d行] ----- 传一个参数回来\n{\n编号: %@\n}", __TIME__, __FUNCTION__, __LINE__, orderNumber);
}

- (void)callTestParameterone:(NSString *)orderNumber AndParametertwo:(NSString *)name {
    
    NSLog(@"%s %s [第%d行] ----- 传两个参数回来\n{\n姓名: %@\n编号: %@\n}", __TIME__, __FUNCTION__, __LINE__,  name, orderNumber);
}

@end
