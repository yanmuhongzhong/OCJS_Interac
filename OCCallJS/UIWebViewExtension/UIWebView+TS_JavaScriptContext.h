//
//  UIWebView+TS_JavaScriptContext.h
//  testJSWebView
//
//  Created by Nicholas Hodapp on 11/15/13.
//  Copyright (c) 2013 CoDeveloper, LLC. All rights reserved.
//
/*
 此类用于获取JSContext对象,
 因为在一般情况下在WebView的代理webViewDidFinishLoad方法时
 JSContext *jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
 拿到JSContext对象.
 而可能JS端在我们走webViewDidFinishLoad方法前就调用了暴露我们的方法.
 这个类拓展可以在产生JSContext的时候就拿到JSContext对象.
 */

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol TSWebViewDelegate <UIWebViewDelegate>

@optional

- (void)webView:(UIWebView *)webView didCreateJavaScriptContext:(JSContext*) ctx;

@end


@interface UIWebView (TS_JavaScriptContext)

@property (nonatomic, readonly) JSContext* ts_javaScriptContext;

@end
