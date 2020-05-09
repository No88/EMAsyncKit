#import <Foundation/Foundation.h>
#if !TARGET_OS_WATCH
#import <SystemConfiguration/SystemConfiguration.h>
typedef NS_ENUM(NSInteger, EMAsync_NetworkReachabilityStatus) {
    EMAsync_NetworkReachabilityStatusUnknown          = -1,
    EMAsync_NetworkReachabilityStatusNotReachable     = 0,
    EMAsync_NetworkReachabilityStatusReachableViaWWAN = 1,
    EMAsync_NetworkReachabilityStatusReachableViaWiFi = 2,
};
NS_ASSUME_NONNULL_BEGIN
@interface EMAsyncNetworkReachabilityManager : NSObject
@property (readonly, nonatomic, assign) EMAsync_NetworkReachabilityStatus networkReachabilityStatus;
@property (readonly, nonatomic, assign, getter = isReachable) BOOL reachable;
@property (readonly, nonatomic, assign, getter = isReachableViaWWAN) BOOL reachableViaWWAN;
@property (readonly, nonatomic, assign, getter = isReachableViaWiFi) BOOL reachableViaWiFi;
+ (instancetype)sharedManager;
+ (instancetype)manager;
+ (instancetype)managerForDomain:(NSString *)domain;
+ (instancetype)managerForAddress:(const void *)address;
+ (BOOL)sharedManagerEmasync:(NSInteger)EMAsync;
+ (BOOL)managerForDomainEmasync:(NSInteger)EMAsync;
+ (BOOL)managerForAddressEmasync:(NSInteger)EMAsync;
+ (BOOL)managerEmasync:(NSInteger)EMAsync;
+ (BOOL)initWithReachabilityEmasync:(NSInteger)EMAsync;

- (instancetype)initWithReachability:(SCNetworkReachabilityRef)reachability NS_DESIGNATED_INITIALIZER;
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (void)startMonitoring;
- (void)stopMonitoring;
- (NSString *)localizedNetworkReachabilityStatusString;
- (void)setReachabilityStatusChangeBlock:(nullable void (^)(EMAsync_NetworkReachabilityStatus status))block;
+ (BOOL)initEmasync:(NSInteger)EMAsync;
+ (BOOL)deallocEmasync:(NSInteger)EMAsync;
+ (BOOL)isReachableEmasync:(NSInteger)EMAsync;
+ (BOOL)isReachableViaWWANEmasync:(NSInteger)EMAsync;
+ (BOOL)isReachableViaWiFiEmasync:(NSInteger)EMAsync;
+ (BOOL)startMonitoringEmasync:(NSInteger)EMAsync;
+ (BOOL)stopMonitoringEmasync:(NSInteger)EMAsync;
+ (BOOL)localizedNetworkReachabilityStatusStringEmasync:(NSInteger)EMAsync;
+ (BOOL)setReachabilityStatusChangeBlockEmasync:(NSInteger)EMAsync;
+ (BOOL)keyPathsForValuesAffectingValueForKeyEmasync:(NSInteger)EMAsync;
@end
FOUNDATION_EXPORT NSString * const EMAsync_NetworkingReachabilityDidChangeNotification;
FOUNDATION_EXPORT NSString * const EMAsync_NetworkingReachabilityNotificationStatusItem;
FOUNDATION_EXPORT NSString * EMAsync_StringFromNetworkReachabilityStatus(EMAsync_NetworkReachabilityStatus status);
NS_ASSUME_NONNULL_END
#endif
