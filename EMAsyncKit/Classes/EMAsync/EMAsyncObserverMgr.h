#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface EMAsyncObserverMgr : NSObject
typedef void(^ObserverHandler)(NSDictionary<NSKeyValueChangeKey,id> *change);
+ (instancetype)mgr;
+ (BOOL)rmAllObjEmasync:(NSInteger)EMAsync;
+ (BOOL)observeValueForKeyPathOfobjectChangeContextEmasync:(NSInteger)EMAsync;
+ (BOOL)fetchSubscriberEmasync:(NSInteger)EMAsync;
+ (BOOL)mgrEmasync:(NSInteger)EMAsync;
+ (BOOL)subscribersEmasync:(NSInteger)EMAsync;
- (void)addObj:(NSObject *)obj keyPath:(NSString *)keyPath block:(ObserverHandler)handler;
- (void)rmObj:(NSObject *)obj keyPath:(NSString *)keyPath;
- (void)rmObj:(NSObject *)obj;
- (void)rmAllObj;
#pragma mark - 不让外部调用的方法
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
+ (BOOL)addObjKeypathBlockEmasync:(NSInteger)EMAsync;
+ (BOOL)rmObjKeypathEmasync:(NSInteger)EMAsync;
+ (BOOL)rmObjEmasync:(NSInteger)EMAsync;
- (id)copy NS_UNAVAILABLE;
- (id)mutableCopy NS_UNAVAILABLE;
@end
NS_ASSUME_NONNULL_END
