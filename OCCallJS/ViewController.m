//
//  ViewController.m
//  JSCallOC
//
//  Created by GHZ on 2017/7/26.
//  Copyright © 2017年 hongzhong. All rights reserved.
//

#import "ViewController.h"
#import "UIWebView+TS_JavaScriptContext.h"
#import "JavaOCInterRac.h"
#import "Foundation+Log.m"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UIWebViewDelegate, TSWebViewDelegate,UIAlertViewDelegate>

@property(nonatomic, strong) JSContext *jsContext;
@property(nonatomic, weak) UIWebView *webView;
@property(nonatomic, strong) UIWebView *jsWebView;
@property(nonatomic, copy) NSString *urlStr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupSubview];
}

#pragma mark - 添加WebView
- (void)setupSubview {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html"];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 20 * kScreenH/667, kScreenW, kScreenH - kScreenH/667)];
    webView.backgroundColor = [UIColor lightGrayColor];
    webView.scalesPageToFit = YES;
    webView.delegate = self;
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    [self.view addSubview:webView];
}

#pragma mark ----- UIWebViewDelegate
- (void)webView:(UIWebView *)webView didCreateJavaScriptContext:(JSContext*) ctx {
    
    ctx[@"object"] = [JavaOCInterRac getInstance];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    JavaOCInterRac *interac = [JavaOCInterRac getInstance];
    interac.showPickerBlock = ^{
        [self showImagePicker];
    };
}

/*
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // 注: 这种方法的话只有在webViewDidFinishLoad即webView加载完成时才调用, 有弊端
    JSContext *jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    // 监听按钮点击
    jsContext[@"startFunction"] = ^(id obj) {
        
        // 当前的Context
        [JSContext currentContext];
        NSData *data = [(NSString *)obj dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.urlStr = dict[@"shareUrl"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:dict[@"title"] message:dict[@"desc"] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"跳转", nil];
        alert.tag = 999;
        [alert show];
    };
    
    jsContext[@"stopFunction"] =^(id obj){
        
        // 当前的Context
        [JSContext currentContext];
        NSData *data = [(NSString *)obj dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%s %s [第%d行] ----- %@", __TIME__, __FUNCTION__, __LINE__, dict);
    };
}
 */

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
}

#pragma mark ----- UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (alertView.tag == 999) {
        if (buttonIndex == 1) {
            
            [self.webView removeFromSuperview];
            self.jsWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 20 * kScreenH/667, kScreenW, kScreenH - kScreenH/667)];
            self.jsWebView.backgroundColor = [UIColor lightGrayColor];
            self.jsWebView.scalesPageToFit = YES;
            [self.jsWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]]];
            [self.view addSubview:self.jsWebView];
        }
    }
}

- (void)showImagePicker {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"请选择文件来源"
                                  delegate:nil
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"拍照",@"从手机相册选择",nil];
    [actionSheet showInView:self.view];
}


@end
