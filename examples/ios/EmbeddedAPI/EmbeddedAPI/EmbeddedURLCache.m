//
//  EmbeddedURLCache.m
//  EmbeddedAPI
//
//  Created by Johnson Lee on 11/5/15.
//  Copyright (c) 2015 Beast Bikes. All rights reserved.
//

#import "EmbeddedURLCache.h"

static NSString * const HOME_URL = @"http://192.168.31.111:3000";

static NSString * const BASE_URL = @"http://192.168.31.111:3000/1.0";

static const char *EMBEDDED_JS = "(function(global) {                           "
"   var ajax = function(url, options) {                                         "
"       var self = this;                                                        "
"       var opt = {                                                             "
"           success : options.success || function() {                           "
"               console.log('Request ' + url + ' success');                     "
"           },                                                                  "
"           error : options.error || function(e) {                              "
"               console.log(e.stack || e.message);                              "
"           },                                                                  "
"       };                                                                      "
"                                                                               "
"       var xhr = new XMLHttpRequest();                                         "
"                                                                               "
"       try {                                                                   "
"           xhr.open('GET', url);                                               "
"           xhr.onreadystatechange = function() {                               "
"               if (4 != this.readyState)                                       "
"                   return;                                                     "
"               if (this.responseText) {                                        "
"                   opt.success.call(self, JSON.parse(this.responseText));      "
"               } else {                                                        "
"                   opt.success.call(self);                                     "
"               }                                                               "
"           };                                                                  "
"           xhr.send();                                                         "
"       } catch (e) {                                                           "
"           opt.error.call(self, e);                                            "
"       }                                                                       "
"   };                                                                          "
"                                                                               "
"   var VERSION_1_0 = '/1.0';                                                   "
"                                                                               "
"   global.embapi = global.embapi || {                                          "
"                                                                               "
"       getDevice : function(options) {                                         "
"           return ajax.call(this, VERSION_1_0 + '/device', options || {});     "
"       },                                                                      "
"                                                                               "
"       getUser : function(options) {                                           "
"           return ajax.call(this, VERSION_1_0 + '/user', options || {});       "
"       },                                                                      "
"                                                                               "
"   };                                                                          "
"})(window)";


@implementation EmbeddedURLCache

+ (NSString *) home {
    return HOME_URL;
}

- (NSCachedURLResponse *)cachedResponseForRequest:(NSURLRequest *)request {
    NSString *url = [[request URL] absoluteString];
    if (![url hasPrefix:BASE_URL]) {
        return[super cachedResponseForRequest:request];
    }

    NSLog(@"Intercepting %@", url);

    NSString *path = [[request URL] path];

    if ([@"/1.0/embedded.js" isEqualToString:path]) {
        NSLog(@"%@", path);
        NSData *data = [NSData dataWithBytes:EMBEDDED_JS length:strlen(EMBEDDED_JS)];
        NSURLResponse *resp = [[NSURLResponse alloc] initWithURL:[request URL] MIMEType:@"application/javascript" expectedContentLength:[data length] textEncodingName:@"utf-8"];
        return [[NSCachedURLResponse alloc] initWithResponse:resp data:data];
    } else if ([@"/1.0/device" isEqualToString:path]) {
        NSLog(@"%@", path);
        const char *device = "{\"id\":\"0123456789\"}";
        NSData *data = [NSData dataWithBytes:device length:strlen(device)];
        NSURLResponse *resp = [[NSURLResponse alloc] initWithURL:[request URL] MIMEType:@"application/json" expectedContentLength:[data length] textEncodingName:@"utf-8"];
        return [[NSCachedURLResponse alloc] initWithResponse:resp data:data];
    } else if ([@"/1.0/user" isEqualToString:path]) {
        NSLog(@"%@", path);
        const char *user = "{\"id\":\"1234567890\", \"email\":\"g.johnsonlee@gmail.com\"}";
        NSData *data = [NSData dataWithBytes:user length:strlen(user)];
        NSURLResponse *resp = [[NSURLResponse alloc] initWithURL:[request URL] MIMEType:@"application/json" expectedContentLength:[data length] textEncodingName:@"utf-8"];
        return [[NSCachedURLResponse alloc] initWithResponse:resp data:data];
    }

    return [super cachedResponseForRequest:request];
}

@end
