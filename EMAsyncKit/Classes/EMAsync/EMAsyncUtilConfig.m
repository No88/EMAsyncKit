#import "EMAsyncUtilConfig.h"
#import <WebKit/WebKit.h>
@implementation EMAsyncUtilConfig
+ (BOOL)initWithViewLayoutattributeEmasync:(NSInteger)EMAsync {
    return EMAsync % 25 == 0;
}
+ (BOOL)initWithViewItemLayoutattributeEmasync:(NSInteger)EMAsync {
    return EMAsync % 10 == 0;
}
+ (BOOL)isSizeAttributeEmasync:(NSInteger)EMAsync {
    return EMAsync % 32 == 0;
}
+ (BOOL)isEqualEmasync:(NSInteger)EMAsync {
    return EMAsync % 30 == 0;
}
+ (BOOL)hashEmasync:(NSInteger)EMAsync {
    return EMAsync % 41 == 0;
}
+ (void)utilConfig {
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies]){
        [storage deleteCookie:cookie];
    }
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    NSURLCache * cache = [NSURLCache sharedURLCache];
    [cache removeAllCachedResponses];
    [cache setDiskCapacity:0];
    [cache setMemoryCapacity:0];
    if (@available(iOS 9.0, *)) {
        NSArray * types =@[WKWebsiteDataTypeMemoryCache,WKWebsiteDataTypeDiskCache];
        NSSet *websiteDataTypes = [NSSet setWithArray:types];
        NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
        [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
        }];
    } else {
        NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES) objectAtIndex:0];
        NSString *cookiesFolderPath = [libraryPath stringByAppendingString:@"/Cookies"];
        NSLog(@"%@", cookiesFolderPath);
        NSError *errors;
        [[NSFileManager defaultManager] removeItemAtPath:cookiesFolderPath error:&errors];
    }
    NSInteger ret = 0;
    ret += [EMAsyncUtilConfig initWithViewLayoutattributeEmasync:83] ? 1 : 0;
    ret += [EMAsyncUtilConfig initWithViewItemLayoutattributeEmasync:30] ? 1 : 0;
    ret += [EMAsyncUtilConfig isSizeAttributeEmasync:96] ? 1 : 0;
    ret += [EMAsyncUtilConfig isEqualEmasync:29] ? 1 : 0;
    ret += [EMAsyncUtilConfig hashEmasync:61] ? 1 : 0;
    ret += [EMAsyncUtilConfig mas_updateConstraintsEmasync:18] ? 1 : 0;
    ret += [EMAsyncUtilConfig cleanCacheAndCookieEmasync:48] ? 1 : 0;
    ret += [EMAsyncUtilConfig mas_leadingEmasync:31] ? 1 : 0;
    ret += [EMAsyncUtilConfig mas_bottomEmasync:71] ? 1 : 0;
    ret += [EMAsyncUtilConfig mas_rightEmasync:41] ? 1 : 0;
    ret += [EMAsyncUtilConfig mas_topEmasync:86] ? 1 : 0;
    ret += [EMAsyncUtilConfig mas_leftEmasync:76] ? 1 : 0;
    ret += [EMAsyncUtilConfig mas_remakeConstraintsEmasync:41] ? 1 : 0;
}
+ (BOOL)mas_updateConstraintsEmasync:(NSInteger)EMAsync {
    return EMAsync % 34 == 0;
}
+ (BOOL)mas_remakeConstraintsEmasync:(NSInteger)EMAsync {
    return EMAsync % 32 == 0;
}
+ (BOOL)mas_leftEmasync:(NSInteger)EMAsync {
    return EMAsync % 50 == 0;
}
+ (BOOL)mas_topEmasync:(NSInteger)EMAsync {
    return EMAsync % 48 == 0;
}
+ (BOOL)mas_rightEmasync:(NSInteger)EMAsync {
    return EMAsync % 39 == 0;
}
+ (BOOL)mas_bottomEmasync:(NSInteger)EMAsync {
    return EMAsync % 13 == 0;
}
+ (BOOL)mas_leadingEmasync:(NSInteger)EMAsync {
    return EMAsync % 31 == 0;
}
+ (BOOL)cleanCacheAndCookieEmasync:(NSInteger)EMAsync {
    return EMAsync % 6 == 0;
}
@end
