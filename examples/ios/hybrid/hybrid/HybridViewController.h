//
//  HybridViewController.h
//  hybrid
//
//  Created by Johnson Lee on 24/7/15.
//  Copyright (c) 2015 Beast Bikes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HybridViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *browser;

@end

