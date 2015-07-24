//
//  GlobalURLCache.m
//  hybrid
//
//  Created by Johnson Lee on 24/7/15.
//  Copyright (c) 2015 Beast Bikes. All rights reserved.
//

#import "HybridURLCache.h"


static NSString * const HOSTNAME = @"192.168.31.111";

static NSString * const MIME_TYPE_JAVASCRIPT = @"application/javascript";

static NSString * const MIME_TYPE_JSON = @"application/json";

static NSString * const MIME_TYPE_TEXT = @"text/plain";

@implementation HybridURLCache {

    /**
     * The path of hybrid.js
     */
    NSString *_hybridLibPath;

    /**
     * The cache dir for hybrid
     */
    NSString *_hybridCacheDir;

}

- (instancetype)init {
    // Lookup hybrid.js
    _hybridLibPath = [[NSBundle mainBundle] pathForResource:@"hybrid" ofType:@"js"];

    // Create cache directory for hybrid
    BOOL isDir = NO;
    NSArray *caches = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    if ([caches count] > 0) {
        NSError *error = nil;
        NSString *cacheDir = [caches objectAtIndex:0];
        NSFileManager *defaultFileManager = [NSFileManager defaultManager];

        if (![defaultFileManager fileExistsAtPath:cacheDir isDirectory:&isDir] && !isDir) {
            [defaultFileManager createDirectoryAtPath:cacheDir withIntermediateDirectories:NO attributes:nil error:&error];

            if (nil != error) {
                NSLog(@"Create %@ failed: %@", cacheDir, error);
            } else {
                _hybridCacheDir = [cacheDir stringByAppendingPathComponent:@"hybrid"];
                [defaultFileManager createDirectoryAtPath:_hybridCacheDir withIntermediateDirectories:NO attributes:nil error:&error];

                if (nil != error) {
                    NSLog(@"Create %@ failed: %@", cacheDir, error);
                }
            }
        }
    }

    return self;
}

- (NSCachedURLResponse *) cachedResponseForRequest:(NSURLRequest *)request {
    NSURL *url = [request URL];
    NSString *host = [url host];
    NSString *pathname = [url path];

    NSLog(@"%@ %@", [request HTTPMethod], [url absoluteString]);

    if ([host isEqualToString:HOSTNAME]) {
        NSData *data = nil;
        NSString *mime = @"text/plain";

        if ([@"/hybrid/1.0/hybrid.js" isEqualToString:pathname]) {
            mime = MIME_TYPE_JAVASCRIPT;
            data = [NSData dataWithContentsOfFile:_hybridLibPath];
        } else if ([@"/hybrid/1.0/device" isEqualToString:pathname]) {
            mime = MIME_TYPE_JSON;
            data = [[NSString stringWithFormat:@"{\"token\":\"%@\"}", @"1234567890abcdef"] dataUsingEncoding:NSUTF8StringEncoding];
        } else if ([@"/hybrid/1.0/auth" isEqualToString:pathname]) {
            mime = MIME_TYPE_JSON;
            data = [[NSString stringWithFormat:@"{\"username\":\"%@\", \"email\":\"%@\"}", @"Johnson Lee", @"g.johnsonlee@gmail.com"] dataUsingEncoding:NSUTF8StringEncoding];
        }

        if (nil != data) {
            NSURLResponse *resp = [[NSURLResponse alloc] initWithURL:url MIMEType:mime expectedContentLength:[data length] textEncodingName:@"utf-8"];
            return [[NSCachedURLResponse alloc] initWithResponse:resp data:data];
        }
    }

    return [super cachedResponseForRequest:request];
}

@end
