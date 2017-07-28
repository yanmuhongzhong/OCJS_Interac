//
//  ViewController.h
//  JSCallOC
//
//  Created by GHZ on 2017/7/26.
//  Copyright © 2017年 hongzhong. All rights reserved.
//
/*
 1. OC调用JS:
    JSContext, 使用 javascriptcore交互的核心是通过从webview中获取到当前的JSContext，在JSContext中执行对应的操作
 2. JS调用OC
    这个需要使用javascriptcore提供的JSExport, 在Objective-C中实现该protocol的方法, 就可以在javeScript使用到的接口了. JSExport相当于跨语言提供的protocol.
 */

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@end

