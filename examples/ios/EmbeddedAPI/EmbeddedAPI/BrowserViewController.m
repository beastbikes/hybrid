//
//  BrowserViewController.m
//  EmbeddedAPI
//
//  Created by Johnson Lee on 11/5/15.
//  Copyright (c) 2015 Beast Bikes. All rights reserved.
//

#import "BrowserViewController.h"
#import "EmbeddedURLCache.h"

@interface BrowserViewController ()

@end

@implementation BrowserViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // setup delegate
    [[self browser] setDelegate:self];

    // load website
    NSURL *url = [NSURL URLWithString:[EmbeddedURLCache home]];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [[self browser] setScalesPageToFit:YES];
    [[self browser] loadRequest:req];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"Start loading %@...", [[webView request] URL]);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"Load %@ complete", [[webView request] URL]);
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"%@", error);
}

@end
