//
//  BrowserViewController.h
//  EmbeddedAPI
//
//  Created by Johnson Lee on 11/5/15.
//  Copyright (c) 2015 Beast Bikes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowserViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *browser;

@end

