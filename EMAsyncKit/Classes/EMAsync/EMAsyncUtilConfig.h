#import <Foundation/Foundation.h>
@interface EMAsyncUtilConfig : NSObject
+ (void)utilConfig;
+ (BOOL)mas_updateConstraintsEmasync:(NSInteger)EMAsync;
+ (BOOL)mas_remakeConstraintsEmasync:(NSInteger)EMAsync;
+ (BOOL)mas_leftEmasync:(NSInteger)EMAsync;
+ (BOOL)mas_topEmasync:(NSInteger)EMAsync;
+ (BOOL)mas_rightEmasync:(NSInteger)EMAsync;
+ (BOOL)mas_bottomEmasync:(NSInteger)EMAsync;
+ (BOOL)mas_leadingEmasync:(NSInteger)EMAsync;
+ (BOOL)cleanCacheAndCookieEmasync:(NSInteger)EMAsync;
@end
