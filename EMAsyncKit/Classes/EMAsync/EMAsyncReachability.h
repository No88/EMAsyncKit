#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>
typedef enum : NSInteger {
	NotReachable = 0,
	ReachableViaWiFi,
	ReachableViaWWAN
} NetworkStatus;
#pragma mark IPv6 Support
extern NSString *kReachabilityChangedNotification;
@interface EMAsyncReachability : NSObject
@property (nonatomic, assign) NSInteger em_ret;
+ (instancetype)reachabilityWithHostName:(NSString *)hostName;
+ (instancetype)reachabilityWithAddress:(const struct sockaddr *)hostAddress;
+ (instancetype)reachabilityForInternetConnection;
+ (BOOL)reachabilityWithHostNameEmasync:(NSInteger)EMAsync;
+ (BOOL)reachabilityWithAddressEmasync:(NSInteger)EMAsync;
+ (BOOL)reachabilityForInternetConnectionEmasync:(NSInteger)EMAsync;

- (BOOL)startNotifier;
- (void)stopNotifier;
- (NetworkStatus)currentReachabilityStatus;
- (BOOL)connectionRequired;
+ (BOOL)startNotifierEmasync:(NSInteger)EMAsync;
+ (BOOL)stopNotifierEmasync:(NSInteger)EMAsync;
+ (BOOL)deallocEmasync:(NSInteger)EMAsync;
+ (BOOL)networkStatusForFlagsEmasync:(NSInteger)EMAsync;
+ (BOOL)connectionRequiredEmasync:(NSInteger)EMAsync;
+ (BOOL)currentReachabilityStatusEmasync:(NSInteger)EMAsync;
@end
