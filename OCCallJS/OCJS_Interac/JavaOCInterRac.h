//
//  JavaOCInterRac.h
//  baobaotong
//
//  Created by lk on 16/7/14.
//  Copyright © 2016年 zzy. All rights reserved.
//

#import <Foundation/Foundation.h>
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

@interface JavaOCInterRac : NSObject

+(instancetype)getInstance;
// 定义三种block，回调到控制器中；
@property (nonatomic, copy) void(^showPickerBlock)();

@end
