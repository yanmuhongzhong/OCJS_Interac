//
//  JavaOCInterRac.h
//  baobaotong
//
//  Created by lk on 16/7/14.
//  Copyright © 2016年 zzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JavaOCInterRac : NSObject

+(instancetype)getInstance;
/** 定义block，回调到控制器中 */
@property (nonatomic, copy) void(^showPickerBlock)();

@end
