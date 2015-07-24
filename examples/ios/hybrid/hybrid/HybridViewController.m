//
//  HybridViewController.m
//  hybrid
//
//  Created by Johnson Lee on 24/7/15.
//  Copyright (c) 2015 Beast Bikes. All rights reserved.
//

#import "HybridViewController.h"

@interface HybridViewController ()

@end

@implementation HybridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self browser] setDelegate:self];

    NSURL *url = [NSURL URLWithString:@"http://192.168.31.111:3000"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [[self browser] setScalesPageToFit:YES];
    [[self browser] loadRequest:req];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UIWebViewDelegate

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    // TODO
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // TODO
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    // TODO
}

@end
