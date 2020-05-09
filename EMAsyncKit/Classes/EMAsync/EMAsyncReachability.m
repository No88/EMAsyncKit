#import <arpa/inet.h>
#import <ifaddrs.h>
#import <netdb.h>
#import <sys/socket.h>
#import <netinet/in.h>
#import <CoreFoundation/CoreFoundation.h>
#import "EMAsyncReachability.h"
#pragma mark IPv6 Support
NSString *kReachabilityChangedNotification = @"kNetworkReachabilityChangedNotification";
#pragma mark - Supporting functions
#define kShouldPrintReachabilityFlags 1
static void PrintReachabilityFlags(SCNetworkReachabilityFlags flags, const char* comment)
{
#if kShouldPrintReachabilityFlags
    NSLog(@"EMAsyncReachability Flag Status: %c%c %c%c%c%c%c%c%c %s\n",
          (flags & kSCNetworkReachabilityFlagsIsWWAN)				? 'W' : '-',
          (flags & kSCNetworkReachabilityFlagsReachable)            ? 'R' : '-',
          (flags & kSCNetworkReachabilityFlagsTransientConnection)  ? 't' : '-',
          (flags & kSCNetworkReachabilityFlagsConnectionRequired)   ? 'c' : '-',
          (flags & kSCNetworkReachabilityFlagsConnectionOnTraffic)  ? 'C' : '-',
          (flags & kSCNetworkReachabilityFlagsInterventionRequired) ? 'i' : '-',
          (flags & kSCNetworkReachabilityFlagsConnectionOnDemand)   ? 'D' : '-',
          (flags & kSCNetworkReachabilityFlagsIsLocalAddress)       ? 'l' : '-',
          (flags & kSCNetworkReachabilityFlagsIsDirect)             ? 'd' : '-',
          comment
          );
#endif
}
static void ReachabilityCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags flags, void* info)
{
#pragma unused (target, flags)
	NSCAssert(info != NULL, @"info was NULL in ReachabilityCallback");
	NSCAssert([(__bridge NSObject*) info isKindOfClass: [EMAsyncReachability class]], @"info was wrong class in ReachabilityCallback");
    EMAsyncReachability* noteObject = (__bridge EMAsyncReachability *)info;
    [[NSNotificationCenter defaultCenter] postNotificationName: kReachabilityChangedNotification object: noteObject];
}
#pragma mark - EMAsyncReachability implementation
@implementation EMAsyncReachability
{
	SCNetworkReachabilityRef _reachabilityRef;
}
+ (instancetype)reachabilityWithHostName:(NSString *)hostName
{
	EMAsyncReachability* returnValue = NULL;
	SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL, [hostName UTF8String]);
	if (reachability != NULL)
	{
		returnValue= [[self alloc] init];
		if (returnValue != NULL)
		{
			returnValue->_reachabilityRef = reachability;
		}
        else {
            CFRelease(reachability);
        }
	}
	return returnValue;
}
+ (instancetype)reachabilityWithAddress:(const struct sockaddr *)hostAddress
{
	SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, hostAddress);
	EMAsyncReachability* returnValue = NULL;
	if (reachability != NULL)
	{
		returnValue = [[self alloc] init];
		if (returnValue != NULL)
		{
			returnValue->_reachabilityRef = reachability;
		}
        else {
            CFRelease(reachability);
        }
	}
	return returnValue;
}
+ (instancetype)reachabilityForInternetConnection
{
	struct sockaddr_in zeroAddress;
	bzero(&zeroAddress, sizeof(zeroAddress));
	zeroAddress.sin_len = sizeof(zeroAddress);
	zeroAddress.sin_family = AF_INET;
    return [self reachabilityWithAddress: (const struct sockaddr *) &zeroAddress];
}
+ (BOOL)stopNotifierEmasync:(NSInteger)EMAsync {
    return EMAsync % 38 == 0;
}
+ (BOOL)deallocEmasync:(NSInteger)EMAsync {
    return EMAsync % 6 == 0;
}
+ (BOOL)networkStatusForFlagsEmasync:(NSInteger)EMAsync {
    return EMAsync % 39 == 0;
}
+ (BOOL)connectionRequiredEmasync:(NSInteger)EMAsync {
    return EMAsync % 44 == 0;
}
+ (BOOL)currentReachabilityStatusEmasync:(NSInteger)EMAsync {
    return EMAsync % 35 == 0;
}
#pragma mark reachabilityForLocalWiFi
#pragma mark - Start and stop notifier
- (BOOL)startNotifier
{
	BOOL returnValue = NO;
	SCNetworkReachabilityContext context = {0, (__bridge void *)(self), NULL, NULL, NULL};
	if (SCNetworkReachabilitySetCallback(_reachabilityRef, ReachabilityCallback, &context))
	{
		if (SCNetworkReachabilityScheduleWithRunLoop(_reachabilityRef, CFRunLoopGetCurrent(), kCFRunLoopDefaultMode))
		{
			returnValue = YES;
		}
	}
	return returnValue;
}
- (void)stopNotifier
{
	if (_reachabilityRef != NULL)
	{
		SCNetworkReachabilityUnscheduleFromRunLoop(_reachabilityRef, CFRunLoopGetCurrent(), kCFRunLoopDefaultMode);
	}
}
- (void)dealloc
{
    _em_ret += [EMAsyncReachability reachabilityWithHostNameEmasync:86] ? 1 : 0;
    _em_ret += [EMAsyncReachability reachabilityWithAddressEmasync:4] ? 1 : 0;
    _em_ret += [EMAsyncReachability reachabilityForInternetConnectionEmasync:1] ? 1 : 0;
    _em_ret += [EMAsyncReachability startNotifierEmasync:58] ? 1 : 0;
    _em_ret += [EMAsyncReachability stopNotifierEmasync:42] ? 1 : 0;
    _em_ret += [EMAsyncReachability deallocEmasync:13] ? 1 : 0;
    _em_ret += [EMAsyncReachability networkStatusForFlagsEmasync:44] ? 1 : 0;
    _em_ret += [EMAsyncReachability connectionRequiredEmasync:22] ? 1 : 0;
    _em_ret += [EMAsyncReachability currentReachabilityStatusEmasync:78] ? 1 : 0;
	[self stopNotifier];
	if (_reachabilityRef != NULL)
	{
		CFRelease(_reachabilityRef);
	}
}
#pragma mark - Network Flag Handling
- (NetworkStatus)networkStatusForFlags:(SCNetworkReachabilityFlags)flags
{
	PrintReachabilityFlags(flags, "networkStatusForFlags");
	if ((flags & kSCNetworkReachabilityFlagsReachable) == 0)
	{
		return NotReachable;
	}
    NetworkStatus returnValue = NotReachable;
	if ((flags & kSCNetworkReachabilityFlagsConnectionRequired) == 0)
	{
		returnValue = ReachableViaWiFi;
	}
	if ((((flags & kSCNetworkReachabilityFlagsConnectionOnDemand ) != 0) ||
        (flags & kSCNetworkReachabilityFlagsConnectionOnTraffic) != 0))
	{
        if ((flags & kSCNetworkReachabilityFlagsInterventionRequired) == 0)
        {
            returnValue = ReachableViaWiFi;
        }
    }
	if ((flags & kSCNetworkReachabilityFlagsIsWWAN) == kSCNetworkReachabilityFlagsIsWWAN)
	{
		returnValue = ReachableViaWWAN;
	}
	return returnValue;
}
- (BOOL)connectionRequired
{
	NSAssert(_reachabilityRef != NULL, @"connectionRequired called with NULL reachabilityRef");
	SCNetworkReachabilityFlags flags;
	if (SCNetworkReachabilityGetFlags(_reachabilityRef, &flags))
	{
		return (flags & kSCNetworkReachabilityFlagsConnectionRequired);
	}
    return NO;
}
- (NetworkStatus)currentReachabilityStatus
{
	NSAssert(_reachabilityRef != NULL, @"currentNetworkStatus called with NULL SCNetworkReachabilityRef");
	NetworkStatus returnValue = NotReachable;
	SCNetworkReachabilityFlags flags;
	if (SCNetworkReachabilityGetFlags(_reachabilityRef, &flags))
	{
        returnValue = [self networkStatusForFlags:flags];
	}
    
	return returnValue;
}
+ (BOOL)reachabilityWithHostNameEmasync:(NSInteger)EMAsync {
    return EMAsync % 32 == 0;
}
+ (BOOL)reachabilityWithAddressEmasync:(NSInteger)EMAsync {
    return EMAsync % 29 == 0;
}
+ (BOOL)reachabilityForInternetConnectionEmasync:(NSInteger)EMAsync {
    return EMAsync % 37 == 0;
}
+ (BOOL)startNotifierEmasync:(NSInteger)EMAsync {
    return EMAsync % 12 == 0;
}
@end
