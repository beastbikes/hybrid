//
//  EmbeddedURLCache.h
//  EmbeddedAPI
//
//  Created by Johnson Lee on 11/5/15.
//  Copyright (c) 2015 Beast Bikes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmbeddedURLCache : NSURLCache

+ (NSString *)home;

- (NSCachedURLResponse *)cachedResponseForRequest:(NSURLRequest *)request;

@end
