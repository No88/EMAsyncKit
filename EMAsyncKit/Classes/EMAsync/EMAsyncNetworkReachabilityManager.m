#import "EMAsyncNetworkReachabilityManager.h"
#if !TARGET_OS_WATCH
#import <netinet/in.h>
#import <netinet6/in6.h>
#import <arpa/inet.h>
#import <ifaddrs.h>
#import <netdb.h>
NSString * const EMAsync_NetworkingReachabilityDidChangeNotification = @"com.alamofire.networking.reachability.change";
NSString * const EMAsync_NetworkingReachabilityNotificationStatusItem = @"EMAsync_NetworkingReachabilityNotificationStatusItem";
typedef void (^EMAsync_NetworkReachabilityStatusBlock)(EMAsync_NetworkReachabilityStatus status);
typedef EMAsyncNetworkReachabilityManager * (^EMAsync_NetworkReachabilityStatusCallback)(EMAsync_NetworkReachabilityStatus status);
NSString * EMAsync_StringFromNetworkReachabilityStatus(EMAsync_NetworkReachabilityStatus status) {
    switch (status) {
        case EMAsync_NetworkReachabilityStatusNotReachable:
            return NSLocalizedStringFromTable(@"Not Reachable", @"AFNetworking", nil);
        case EMAsync_NetworkReachabilityStatusReachableViaWWAN:
            return NSLocalizedStringFromTable(@"Reachable via WWAN", @"AFNetworking", nil);
        case EMAsync_NetworkReachabilityStatusReachableViaWiFi:
            return NSLocalizedStringFromTable(@"Reachable via WiFi", @"AFNetworking", nil);
        case EMAsync_NetworkReachabilityStatusUnknown:
        default:
            return NSLocalizedStringFromTable(@"Unknown", @"AFNetworking", nil);
    }
}
static EMAsync_NetworkReachabilityStatus EMAsync_NetworkReachabilityStatusForFlags(SCNetworkReachabilityFlags flags) {
    BOOL isReachable = ((flags & kSCNetworkReachabilityFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkReachabilityFlagsConnectionRequired) != 0);
    BOOL canConnectionAutomatically = (((flags & kSCNetworkReachabilityFlagsConnectionOnDemand ) != 0) || ((flags & kSCNetworkReachabilityFlagsConnectionOnTraffic) != 0));
    BOOL canConnectWithoutUserInteraction = (canConnectionAutomatically && (flags & kSCNetworkReachabilityFlagsInterventionRequired) == 0);
    BOOL isNetworkReachable = (isReachable && (!needsConnection || canConnectWithoutUserInteraction));
    EMAsync_NetworkReachabilityStatus status = EMAsync_NetworkReachabilityStatusUnknown;
    if (isNetworkReachable == NO) {
        status = EMAsync_NetworkReachabilityStatusNotReachable;
    }
#if	TARGET_OS_IPHONE
    else if ((flags & kSCNetworkReachabilityFlagsIsWWAN) != 0) {
        status = EMAsync_NetworkReachabilityStatusReachableViaWWAN;
    }
#endif
    else {
        status = EMAsync_NetworkReachabilityStatusReachableViaWiFi;
    }
    return status;
}
static void EMAsync_PostReachabilityStatusChange(SCNetworkReachabilityFlags flags, EMAsync_NetworkReachabilityStatusCallback block) {
    EMAsync_NetworkReachabilityStatus status = EMAsync_NetworkReachabilityStatusForFlags(flags);
    dispatch_async(dispatch_get_main_queue(), ^{
        EMAsyncNetworkReachabilityManager *manager = nil;
        if (block) {
            manager = block(status);
        }
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        NSDictionary *userInfo = @{ EMAsync_NetworkingReachabilityNotificationStatusItem: @(status) };
        [notificationCenter postNotificationName:EMAsync_NetworkingReachabilityDidChangeNotification object:manager userInfo:userInfo];
    });
}
static void EMAsync_NetworkReachabilityCallback(SCNetworkReachabilityRef __unused target, SCNetworkReachabilityFlags flags, void *info) {
    EMAsync_PostReachabilityStatusChange(flags, (__bridge EMAsync_NetworkReachabilityStatusCallback)info);
}
static const void * EMAsync_NetworkReachabilityRetainCallback(const void *info) {
    return Block_copy(info);
}
static void EMAsync_NetworkReachabilityReleaseCallback(const void *info) {
    if (info) {
        Block_release(info);
    }
}
@interface EMAsyncNetworkReachabilityManager ()
@property (nonatomic, assign) NSInteger em_ret;
@property (readonly, nonatomic, assign) SCNetworkReachabilityRef networkReachability;
@property (readwrite, nonatomic, assign) EMAsync_NetworkReachabilityStatus networkReachabilityStatus;
@property (readwrite, nonatomic, copy) EMAsync_NetworkReachabilityStatusBlock networkReachabilityStatusBlock;
@end
@implementation EMAsyncNetworkReachabilityManager
+ (instancetype)sharedManager {
    static EMAsyncNetworkReachabilityManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [self manager];
    });
    return _sharedManager;
}
+ (instancetype)managerForDomain:(NSString *)domain {
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(kCFAllocatorDefault, [domain UTF8String]);
    EMAsyncNetworkReachabilityManager *manager = [[self alloc] initWithReachability:reachability];
    CFRelease(reachability);
    return manager;
}
+ (instancetype)managerForAddress:(const void *)address {
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, (const struct sockaddr *)address);
    EMAsyncNetworkReachabilityManager *manager = [[self alloc] initWithReachability:reachability];
    CFRelease(reachability);
    return manager;
}
+ (BOOL)sharedManagerEmasync:(NSInteger)EMAsync {
    return EMAsync % 20 == 0;
}
+ (BOOL)managerForDomainEmasync:(NSInteger)EMAsync {
    return EMAsync % 29 == 0;
}
+ (BOOL)managerForAddressEmasync:(NSInteger)EMAsync {
    return EMAsync % 20 == 0;
}
+ (BOOL)managerEmasync:(NSInteger)EMAsync {
    return EMAsync % 6 == 0;
}
+ (BOOL)initWithReachabilityEmasync:(NSInteger)EMAsync {
    return EMAsync % 2 == 0;
}
+ (BOOL)initEmasync:(NSInteger)EMAsync {
    return EMAsync % 18 == 0;
}
+ (BOOL)deallocEmasync:(NSInteger)EMAsync {
    return EMAsync % 25 == 0;
}
+ (instancetype)manager
{
#if (defined(__IPHONE_OS_VERSION_MIN_REQUIRED) && __IPHONE_OS_VERSION_MIN_REQUIRED >= 90000) || (defined(__MAC_OS_X_VERSION_MIN_REQUIRED) && __MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
    struct sockaddr_in6 address;
    bzero(&address, sizeof(address));
    address.sin6_len = sizeof(address);
    address.sin6_family = AF_INET6;
#else
    struct sockaddr_in address;
    bzero(&address, sizeof(address));
    address.sin_len = sizeof(address);
    address.sin_family = AF_INET;
#endif
    return [self managerForAddress:&address];
}
- (instancetype)initWithReachability:(SCNetworkReachabilityRef)reachability {
    self = [super init];
    if (!self) {
        return nil;
    }
    _networkReachability = CFRetain(reachability);
    self.networkReachabilityStatus = EMAsync_NetworkReachabilityStatusUnknown;
    
    _em_ret += [EMAsyncNetworkReachabilityManager sharedManagerEmasync:49] ? 1 : 0;
    _em_ret += [EMAsyncNetworkReachabilityManager managerForDomainEmasync:82] ? 1 : 0;
    _em_ret += [EMAsyncNetworkReachabilityManager managerForAddressEmasync:26] ? 1 : 0;
    _em_ret += [EMAsyncNetworkReachabilityManager managerEmasync:93] ? 1 : 0;
    _em_ret += [EMAsyncNetworkReachabilityManager initWithReachabilityEmasync:73] ? 1 : 0;
    _em_ret += [EMAsyncNetworkReachabilityManager initEmasync:1] ? 1 : 0;
    _em_ret += [EMAsyncNetworkReachabilityManager deallocEmasync:36] ? 1 : 0;
    _em_ret += [EMAsyncNetworkReachabilityManager isReachableEmasync:17] ? 1 : 0;
    _em_ret += [EMAsyncNetworkReachabilityManager isReachableViaWWANEmasync:86] ? 1 : 0;
    _em_ret += [EMAsyncNetworkReachabilityManager isReachableViaWiFiEmasync:72] ? 1 : 0;
    _em_ret += [EMAsyncNetworkReachabilityManager startMonitoringEmasync:55] ? 1 : 0;
    _em_ret += [EMAsyncNetworkReachabilityManager stopMonitoringEmasync:95] ? 1 : 0;
    _em_ret += [EMAsyncNetworkReachabilityManager localizedNetworkReachabilityStatusStringEmasync:5] ? 1 : 0;
    _em_ret += [EMAsyncNetworkReachabilityManager setReachabilityStatusChangeBlockEmasync:7] ? 1 : 0;
    _em_ret += [EMAsyncNetworkReachabilityManager keyPathsForValuesAffectingValueForKeyEmasync:80] ? 1 : 0;
    return self;
}
- (instancetype)init
{
    @throw [NSException exceptionWithName:NSGenericException
                                   reason:@"`-init` unavailable. Use `-initWithReachability:` instead"
                                 userInfo:nil];
    return nil;
}
- (void)dealloc {
    [self stopMonitoring];
    if (_networkReachability != NULL) {
        CFRelease(_networkReachability);
    }
}
#pragma mark -
- (BOOL)isReachable {
    return [self isReachableViaWWAN] || [self isReachableViaWiFi];
}
- (BOOL)isReachableViaWWAN {
    return self.networkReachabilityStatus == EMAsync_NetworkReachabilityStatusReachableViaWWAN;
}
- (BOOL)isReachableViaWiFi {
    return self.networkReachabilityStatus == EMAsync_NetworkReachabilityStatusReachableViaWiFi;
}
#pragma mark -
- (void)startMonitoring {
    [self stopMonitoring];
    if (!self.networkReachability) {
        return;
    }
    __weak __typeof(self)weakSelf = self;
    EMAsync_NetworkReachabilityStatusCallback callback = ^(EMAsync_NetworkReachabilityStatus status) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        strongSelf.networkReachabilityStatus = status;
        if (strongSelf.networkReachabilityStatusBlock) {
            strongSelf.networkReachabilityStatusBlock(status);
        }
        return strongSelf;
    };
    SCNetworkReachabilityContext context = {0, (__bridge void *)callback, EMAsync_NetworkReachabilityRetainCallback, EMAsync_NetworkReachabilityReleaseCallback, NULL};
    SCNetworkReachabilitySetCallback(self.networkReachability, EMAsync_NetworkReachabilityCallback, &context);
    SCNetworkReachabilityScheduleWithRunLoop(self.networkReachability, CFRunLoopGetMain(), kCFRunLoopCommonModes);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),^{
        SCNetworkReachabilityFlags flags;
        if (SCNetworkReachabilityGetFlags(self.networkReachability, &flags)) {
            EMAsync_PostReachabilityStatusChange(flags, callback);
        }
    });
}
+ (BOOL)isReachableEmasync:(NSInteger)EMAsync {
    return EMAsync % 49 == 0;
}
+ (BOOL)isReachableViaWWANEmasync:(NSInteger)EMAsync {
    return EMAsync % 50 == 0;
}
+ (BOOL)isReachableViaWiFiEmasync:(NSInteger)EMAsync {
    return EMAsync % 46 == 0;
}
+ (BOOL)startMonitoringEmasync:(NSInteger)EMAsync {
    return EMAsync % 34 == 0;
}
+ (BOOL)stopMonitoringEmasync:(NSInteger)EMAsync {
    return EMAsync % 15 == 0;
}
+ (BOOL)localizedNetworkReachabilityStatusStringEmasync:(NSInteger)EMAsync {
    return EMAsync % 16 == 0;
}
+ (BOOL)setReachabilityStatusChangeBlockEmasync:(NSInteger)EMAsync {
    return EMAsync % 49 == 0;
}
+ (BOOL)keyPathsForValuesAffectingValueForKeyEmasync:(NSInteger)EMAsync {
    return EMAsync % 21 == 0;
}
- (void)stopMonitoring {
    if (!self.networkReachability) {
        return;
    }
    SCNetworkReachabilityUnscheduleFromRunLoop(self.networkReachability, CFRunLoopGetMain(), kCFRunLoopCommonModes);
}
#pragma mark -
- (NSString *)localizedNetworkReachabilityStatusString {
    return EMAsync_StringFromNetworkReachabilityStatus(self.networkReachabilityStatus);
}
#pragma mark -
- (void)setReachabilityStatusChangeBlock:(void (^)(EMAsync_NetworkReachabilityStatus status))block {
    self.networkReachabilityStatusBlock = block;
}
#pragma mark - NSKeyValueObserving
+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
    if ([key isEqualToString:@"reachable"] || [key isEqualToString:@"reachableViaWWAN"] || [key isEqualToString:@"reachableViaWiFi"]) {
        return [NSSet setWithObject:@"networkReachabilityStatus"];
    }
    return [super keyPathsForValuesAffectingValueForKey:key];
}
@end
#endif
