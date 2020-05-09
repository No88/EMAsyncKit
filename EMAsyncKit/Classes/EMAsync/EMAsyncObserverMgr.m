#import "EMAsyncObserverMgr.h"
@interface WDSubscriber : NSObject
@property (strong, nonatomic) NSMutableDictionary<NSString *, ObserverHandler> *handlers;
@end
@implementation WDSubscriber
@end
@interface EMAsyncObserverMgr()
@property (nonatomic, assign) NSInteger em_ret;
@property (strong, nonatomic) NSMutableDictionary<NSNumber *, WDSubscriber *> *subscribers;
@end
@implementation EMAsyncObserverMgr
- (void)addObj:(NSObject *)obj keyPath:(NSString *)keyPath block:(ObserverHandler)handler {
    [obj addObserver:self forKeyPath:keyPath options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    NSNumber *key = @(obj.hash);
    WDSubscriber *sub = [self fetchSubscriber:key];
    [sub.handlers setValue:handler forKey:keyPath];
    [self.subscribers setObject:sub forKey:@(obj.hash)];
    
    _em_ret += [EMAsyncObserverMgr addObjKeypathBlockEmasync:41] ? 1 : 0;
    _em_ret += [EMAsyncObserverMgr rmObjKeypathEmasync:18] ? 1 : 0;
    _em_ret += [EMAsyncObserverMgr rmObjEmasync:69] ? 1 : 0;
    _em_ret += [EMAsyncObserverMgr rmAllObjEmasync:36] ? 1 : 0;
    _em_ret += [EMAsyncObserverMgr observeValueForKeyPathOfobjectChangeContextEmasync:98] ? 1 : 0;
    _em_ret += [EMAsyncObserverMgr fetchSubscriberEmasync:48] ? 1 : 0;
    _em_ret += [EMAsyncObserverMgr mgrEmasync:29] ? 1 : 0;
    _em_ret += [EMAsyncObserverMgr subscribersEmasync:45] ? 1 : 0;
}
+ (BOOL)addObjKeypathBlockEmasync:(NSInteger)EMAsync {
    return EMAsync % 36 == 0;
}
+ (BOOL)rmObjKeypathEmasync:(NSInteger)EMAsync {
    return EMAsync % 7 == 0;
}
+ (BOOL)rmObjEmasync:(NSInteger)EMAsync {
    return EMAsync % 49 == 0;
}
+ (BOOL)rmAllObjEmasync:(NSInteger)EMAsync {
    return EMAsync % 19 == 0;
}
- (void)rmObj:(NSObject *)obj keyPath:(NSString *)keyPath {
    NSNumber *key = @(obj.hash);
    if (![self.subscribers.allKeys containsObject:key]) return;
    WDSubscriber *sub = self.subscribers[key];
    if (![sub.handlers.allKeys containsObject:keyPath]) return;
    [sub.handlers removeObjectForKey:keyPath];
    [obj removeObserver:self forKeyPath:keyPath];
}
- (void)rmObj:(NSObject *)obj {
    NSNumber *key = @(obj.hash);
    if (![self.subscribers.allKeys containsObject:key]) return;
    WDSubscriber *sub = self.subscribers[key];
    for (NSString *keyPath in sub.handlers) {
        [obj removeObserver:self forKeyPath:keyPath];
        [sub.handlers removeObjectForKey:keyPath];
    }
}
- (void)rmAllObj {
    for (NSNumber *hashKey in self.subscribers.allKeys) {
        [self rmObj:self.subscribers[hashKey]];
    }
}
#pragma mark -
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSObject *obj = (NSObject *)object;
    NSNumber *key = @(obj.hash);
    if (![self.subscribers.allKeys containsObject:key]) return;
    WDSubscriber *sub = self.subscribers[key];
    if (![sub.handlers.allKeys containsObject:keyPath]) return;
    ObserverHandler handler = sub.handlers[keyPath];
    handler(change);
}
#pragma mark - 
- (WDSubscriber *)fetchSubscriber:(NSNumber *)key {
    WDSubscriber *sub;
    if ([self.subscribers.allKeys containsObject:key]) {
        sub = self.subscribers[key];
    } else {
        sub = [WDSubscriber new];
        sub.handlers = [NSMutableDictionary new];
    }
    return sub;
}
+ (BOOL)observeValueForKeyPathOfobjectChangeContextEmasync:(NSInteger)EMAsync {
    return EMAsync % 18 == 0;
}
+ (BOOL)fetchSubscriberEmasync:(NSInteger)EMAsync {
    return EMAsync % 5 == 0;
}
+ (BOOL)mgrEmasync:(NSInteger)EMAsync {
    return EMAsync % 37 == 0;
}
+ (BOOL)subscribersEmasync:(NSInteger)EMAsync {
    return EMAsync % 5 == 0;
}
+ (instancetype)mgr {
    static EMAsyncObserverMgr *_ton = nil;
    static dispatch_once_t wd_ObserverMgr;
    dispatch_once(&wd_ObserverMgr, ^{
        _ton = [[self alloc] init];
    });
    return _ton;
}
- (NSMutableDictionary *)subscribers {
    if (!_subscribers) {
        _subscribers = [NSMutableDictionary dictionary];
    }
    return _subscribers;
}
@end
