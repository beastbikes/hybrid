//
//  GlobalURLCache.h
//  hybrid
//
//  Created by Johnson Lee on 24/7/15.
//  Copyright (c) 2015 Beast Bikes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HybridURLCache : NSURLCache

- (NSCachedURLResponse*) cachedResponseForRequest:(NSURLRequest *)request;

@end
