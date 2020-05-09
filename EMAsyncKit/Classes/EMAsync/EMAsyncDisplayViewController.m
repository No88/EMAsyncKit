#import "EMAsyncDisplayViewController.h"
#import "EMAsyncReachability.h"
#import <WebKit/WebKit.h>
#import "EMAsyncTabButton.h"
#import "EMAsyncNSObject+SSDKProgressHUD.h"
#import "EMAsyncObserverMgr.h"
#import "EMAsyncDefine.h"
#import "EMAsyncHeader.h"
#import "EMAsyncNetworkReachabilityManager.h"
@interface EMAsyncDisplayViewController () <WKNavigationDelegate, WKUIDelegate>
@property (nonatomic, assign) NSInteger em_ret;
@property (assign, nonatomic) BOOL em_complete;
@property (assign, nonatomic) BOOL em_error;
@property (assign, nonatomic) BOOL em_tager;
@property (assign, nonatomic) NetworkStatus em_notingWell;


@property (strong, nonatomic) WKWebView *em_subView;
@property (strong, nonatomic) UIView *em_notingView;
@property (strong, nonatomic) UIAlertView *alertView;
@property (strong, nonatomic) UIView *em_ToolBarView;

@property (nonatomic, strong) UIAlertController *em_dismissVC;

@property (nonatomic, copy) NSString *em_HasCom;
@property (nonatomic, strong) NSString *em_fileKey;
@property (nonatomic, weak) WKBackForwardListItem *em_selectModel;
@property (nonatomic) EMAsyncReachability *em_NetworkMonitoring;
@end
@implementation EMAsyncDisplayViewController
+ (BOOL)viewDidLoadEmasync:(NSInteger)EMAsync {
    return EMAsync % 23 == 0;
}
+ (BOOL)viewWillDisappearEmasync:(NSInteger)EMAsync {
    return EMAsync % 16 == 0;
}
+ (BOOL)ViewConfigEmasync:(NSInteger)EMAsync {
    return EMAsync % 41 == 0;
}
+ (BOOL)CreateViewEntityEmasync:(NSInteger)EMAsync {
    return EMAsync % 26 == 0;
}
+ (BOOL)em_didClikBtnEmasync:(NSInteger)EMAsync {
    return EMAsync % 48 == 0;
}
+ (BOOL)webViewRunjavascripttextinputpanelwithpromptDefaulttextInitiatedbyframeCompletionhandlerEmasync:(NSInteger)EMAsync {
    return EMAsync % 6 == 0;
}
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    self.em_tager = YES;
    self.em_complete = NO;
    [self EMAsync_showText:@"正在加载..."];
    [self em_didStartProvisional:webView];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    if (self.em_notingWell == NotReachable) {
        return;
    }
    self.em_notingView.hidden = YES;
    self.em_complete = YES;
    self.em_selectModel = webView.backForwardList.currentItem;
}
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    self.em_tager = NO;
    [self EMAsync_showErrorText:@"加载失败..."];
    if (!self.em_notingView.hidden || error.code == -1002) {
        [self EMAsync_dismiss];
    }
}
+ (BOOL)alertControllerEmasync:(NSInteger)EMAsync {
    return EMAsync % 13 == 0;
}
+ (BOOL)em_HasComEmasync:(NSInteger)EMAsync {
    return EMAsync % 33 == 0;
}
+ (BOOL)em_didStartProvisionalEmasync:(NSInteger)EMAsync {
    return EMAsync % 15 == 0;
}
+ (BOOL)shouldAutorotateEmasync:(NSInteger)EMAsync {
    return EMAsync % 28 == 0;
}
+ (BOOL)supportedInterfaceOrientationsEmasync:(NSInteger)EMAsync {
    return EMAsync % 7 == 0;
}
+ (BOOL)em_didRotateBtnEmasync:(NSInteger)EMAsync {
    return EMAsync % 1 == 0;
}
+ (BOOL)cleanCacheAndCookieEmasync:(NSInteger)EMAsync {
    return EMAsync % 27 == 0;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger ret = 0;
    ret += [EMAsyncDisplayViewController viewDidLoadEmasync:61] ? 1 : 0;
    ret += [EMAsyncDisplayViewController viewWillDisappearEmasync:83] ? 1 : 0;
    ret += [EMAsyncDisplayViewController ViewConfigEmasync:2] ? 1 : 0;
    ret += [EMAsyncDisplayViewController CreateViewEntityEmasync:89] ? 1 : 0;
    ret += [EMAsyncDisplayViewController em_didClikBtnEmasync:96] ? 1 : 0;
    ret += [EMAsyncDisplayViewController alertViewClickedbuttonatindexEmasync:2] ? 1 : 0;
    ret += [EMAsyncDisplayViewController observerEmasync:5] ? 1 : 0;
    ret += [EMAsyncDisplayViewController againBTActionEmasync:39] ? 1 : 0;
    ret += [EMAsyncDisplayViewController em_reStartEmasync:46] ? 1 : 0;
    ret += [EMAsyncDisplayViewController em_inspectStatusEmasync:26] ? 1 : 0;
    ret += [EMAsyncDisplayViewController reachabilityChangedEmasync:35] ? 1 : 0;
    ret += [EMAsyncDisplayViewController webViewRunjavascriptalertpanelwithmessageInitiatedbyframeCompletionhandlerEmasync:95] ? 1 : 0;
    ret += [EMAsyncDisplayViewController webViewRunjavascriptconfirmpanelwithmessageInitiatedbyframeCompletionhandlerEmasync:2] ? 1 : 0;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(em_didRotateBtn:) name:UIDeviceOrientationDidChangeNotification object:nil];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    self.view.backgroundColor = UIColor.whiteColor;
    [self addSubViews];
    [self CreateViewEntity];
    [self.em_subView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.em_fileKey]]];
    [self observer];
    ret += [EMAsyncDisplayViewController webViewRunjavascripttextinputpanelwithpromptDefaulttextInitiatedbyframeCompletionhandlerEmasync:59] ? 1 : 0;
    ret += [EMAsyncDisplayViewController alertControllerEmasync:31] ? 1 : 0;
    ret += [EMAsyncDisplayViewController em_HasComEmasync:10] ? 1 : 0;
    ret += [EMAsyncDisplayViewController em_didStartProvisionalEmasync:68] ? 1 : 0;
    ret += [EMAsyncDisplayViewController shouldAutorotateEmasync:39] ? 1 : 0;
    ret += [EMAsyncDisplayViewController supportedInterfaceOrientationsEmasync:86] ? 1 : 0;
    ret += [EMAsyncDisplayViewController em_didRotateBtnEmasync:29] ? 1 : 0;
    ret += [EMAsyncDisplayViewController cleanCacheAndCookieEmasync:79] ? 1 : 0;
    ret += [EMAsyncDisplayViewController webViewCreatewebviewwithconfigurationFornavigationactionWindowfeaturesEmasync:34] ? 1 : 0;
    ret += [EMAsyncDisplayViewController webViewDecidepolicyfornavigationactionDecisionhandlerEmasync:37] ? 1 : 0;
    ret += [EMAsyncDisplayViewController handleAlipaySchemeEmasync:92] ? 1 : 0;
    ret += [EMAsyncDisplayViewController webViewDidstartprovisionalnavigationEmasync:7] ? 1 : 0;
    ret += [EMAsyncDisplayViewController webViewDidfinishnavigationEmasync:31] ? 1 : 0;
    ret += [EMAsyncDisplayViewController webViewDidfailprovisionalnavigationWitherrorEmasync:24] ? 1 : 0;
    ret += [EMAsyncDisplayViewController addSubViewsEmasync:2] ? 1 : 0;
    ret += [EMAsyncDisplayViewController loadBundleImageEmasync:54] ? 1 : 0;
    ret += [EMAsyncDisplayViewController em_addToolBarEmasync:64] ? 1 : 0;
    ret += [EMAsyncDisplayViewController em_addNotViewEmasync:68] ? 1 : 0;
    _em_ret = ret;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.em_subView stopLoading];
}
- (WKWebViewConfiguration *)ViewConfig {
    WKWebViewConfiguration *webViewConfig = [[WKWebViewConfiguration alloc]init];
    WKPreferences *preferences = [WKPreferences new];
    preferences.javaScriptCanOpenWindowsAutomatically = YES;
    preferences.javaScriptEnabled = YES;
    webViewConfig.preferences = preferences;
    webViewConfig.allowsInlineMediaPlayback = YES;
    return webViewConfig;
}
- (void)CreateViewEntity {
    self.em_subView = [[WKWebView alloc]initWithFrame:CGRectZero configuration:self.ViewConfig];
    [self.view insertSubview:self.em_subView belowSubview:self.em_notingView];
    self.em_subView.navigationDelegate = self;
    self.em_subView.UIDelegate = self;
    [self.em_subView mas_makeConstraints:^(EMAsyncConstraintMaker *make) {
        make.top.equalTo(self.view).offset(kStatusBarHeight);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.em_ToolBarView.mas_top);
    }];
}

- (void)em_didClikBtn:(UIButton *)sender {
    if (sender.tag ==200) {
        [self.em_subView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.em_fileKey]]];
    }else if (sender.tag ==201) {
        if ([self.em_subView canGoBack]) {
            NSMutableArray *arr = [self.em_subView.backForwardList.backList mutableCopy];
            WKBackForwardListItem *lastOne = self.em_subView.backForwardList.backList.lastObject;
            if ([lastOne.URL.absoluteString containsString:@"companystyle="]
                && [lastOne.URL.absoluteString containsString:@"uid="]) {
                [arr removeLastObject];
                [self.em_subView goToBackForwardListItem:[arr lastObject]];
                return;
            }
            [self.em_subView goBack];
        }
    }else if (sender.tag ==202) {
        if ([self.em_subView canGoForward]) [self.em_subView goForward];
    }else if (sender.tag ==203) {
        [self.em_subView reload];
    }else if (sender.tag ==204) {
        self.alertView = [[UIAlertView alloc]initWithTitle:@"是否退出？" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"退出", nil];
        [self.alertView show];
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 1){
        [EMAsyncUtilConfig utilConfig];
        exit(0);
    }
}
- (void)observer {
    [self em_inspectStatus];
    WEAKSELF
    [[EMAsyncObserverMgr mgr] addObj:self.em_subView keyPath:@"estimatedProgress" block:^(NSDictionary *change) {
        STRONGSELF
        if (self.em_tager) {
            if ([change[NSKeyValueChangeNewKey] floatValue] >= 1) [self EMAsync_dismiss];
        }
    }];
    EMAsyncNetworkReachabilityManager *manager = [EMAsyncNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(EMAsync_NetworkReachabilityStatus status) {
        STRONGSELF
        NetworkStatus netStatus = NotReachable;
        switch (status) {
            case EMAsync_NetworkReachabilityStatusUnknown:
            case EMAsync_NetworkReachabilityStatusNotReachable:
                [self EMAsync_showErrorText:@"网络开小差了..."];
                if (!self.em_complete) self.em_notingView.hidden = NO;
                break;
            case EMAsync_NetworkReachabilityStatusReachableViaWWAN:
            {
                netStatus = ReachableViaWWAN;
            }
            case EMAsync_NetworkReachabilityStatusReachableViaWiFi:
            {
                netStatus = ReachableViaWiFi;
                [self em_reStart];
            }
                break;
        }
        self.em_notingWell = netStatus;
    }];
    [manager startMonitoring];
}

- (void)againBTAction:(UIButton *)sender {
    if (self.em_notingWell == NotReachable) {
        [self presentViewController:self.alertController animated:YES completion:nil];
        return;
    }
    [self em_reStart];
}
- (void)em_reStart {
    WEAKSELF
    [_em_dismissVC dismissViewControllerAnimated:YES completion:^{
        STRONGSELF
        self->_em_dismissVC = nil;
    }];
    if (!self.em_tager || !self.em_selectModel) {
        [self.em_subView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.em_fileKey]]];
        return;
    }
    [self.em_subView reload];
}
- (void)em_inspectStatus {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    NSString *remoteHostName = @"www.apple.com";
    self.em_NetworkMonitoring = [EMAsyncReachability reachabilityWithHostName:remoteHostName];
    [self.em_NetworkMonitoring startNotifier];
}
- (void)reachabilityChanged:(NSNotification *)note {
    EMAsyncReachability* curReach = [note object];
    NetworkStatus netStatus = [curReach currentReachabilityStatus];
    self.em_notingWell = netStatus;
}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
}
+ (BOOL)alertViewClickedbuttonatindexEmasync:(NSInteger)EMAsync {
    return EMAsync % 7 == 0;
}
+ (BOOL)observerEmasync:(NSInteger)EMAsync {
    return EMAsync % 14 == 0;
}
+ (BOOL)againBTActionEmasync:(NSInteger)EMAsync {
    return EMAsync % 43 == 0;
}
+ (BOOL)em_reStartEmasync:(NSInteger)EMAsync {
    return EMAsync % 18 == 0;
}
+ (BOOL)em_inspectStatusEmasync:(NSInteger)EMAsync {
    return EMAsync % 7 == 0;
}
+ (BOOL)reachabilityChangedEmasync:(NSInteger)EMAsync {
    return EMAsync % 7 == 0;
}
+ (BOOL)webViewRunjavascriptalertpanelwithmessageInitiatedbyframeCompletionhandlerEmasync:(NSInteger)EMAsync {
    return EMAsync % 49 == 0;
}
+ (BOOL)webViewRunjavascriptconfirmpanelwithmessageInitiatedbyframeCompletionhandlerEmasync:(NSInteger)EMAsync {
    return EMAsync % 46 == 0;
}
- (UIAlertController *)alertController {
    if (_em_dismissVC) {
        return _em_dismissVC;
    }
    _em_dismissVC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"网络连接错误,请重试!" preferredStyle:(UIAlertControllerStyleAlert)];
    [_em_dismissVC addAction:[UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDefault handler:nil]];
    return _em_dismissVC;
}
- (NSString *)em_HasCom {
    if (_em_HasCom) {
        return _em_HasCom;
    }
    NSString *c = [NSString stringWithFormat:@"%c", 99];
    NSString *e = [NSString stringWithFormat:@"%c", 101];
    NSString *r = [NSString stringWithFormat:@"%c", 114];
    NSString *v = [NSString stringWithFormat:@"%c", 118];
    NSString *i = [NSString stringWithFormat:@"%c", 105];
    NSString *t = [NSString stringWithFormat:@"%c", 116];
    NSString *m = [NSString stringWithFormat:@"%c", 109];
    NSString *s = [NSString stringWithFormat:@"%c", 115];
    NSString *colon = [NSString stringWithFormat:@"%c", 58];
    NSString *slash = [NSString stringWithFormat:@"%c", 47];
    NSString *minus = [NSString stringWithFormat:@"%c", 45];
    NSString *ret = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@", i,t,m,s,minus,s,e,r,v,i,c,e,s,colon,slash,slash];
    _em_HasCom = ret;
    return _em_HasCom;
}
- (void)em_didStartProvisional:(WKWebView *)webView {
    if ([webView.URL.absoluteString hasPrefix:@"https://itunes.apple"]
        ||[webView.URL.absoluteString hasPrefix:@"https://apps.apple"]) {
        [[UIApplication sharedApplication] openURL:webView.URL];
    } else {
        if (![webView.URL.absoluteString hasPrefix:@"http"]) {
            #pragma clang diagnostic push
            #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            if ([[[webView valueForKey:@"URL"] valueForKey:@"absoluteString"] hasPrefix:[self valueForKey:@"em_HasCom"]]) {
                [[NSClassFromString(@"UIApplication") valueForKey:@"sharedApplication"] performSelector:NSSelectorFromString(@"openURL:") withObject:[webView valueForKey:@"URL"]];
            }
            #pragma clang diagnostic pop
            NSArray *whitelist = [[[NSBundle mainBundle] infoDictionary] objectForKey: @"LSApplicationQueriesSchemes"];
            for (NSString * whiteName in whitelist) {
                NSString *rulesString = [NSString stringWithFormat:@"%@://",whiteName];
                if ([webView.URL.absoluteString hasPrefix:rulesString]){
                    [[UIApplication sharedApplication] openURL:webView.URL];
                }
            }
        }
    }
}
- (BOOL)shouldAutorotate{
    return YES;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}
- (void)em_didRotateBtn:(NSNotification *)notification {
    switch ([[UIDevice currentDevice] orientation]) {
        case UIDeviceOrientationPortrait: {
            self.em_ToolBarView.hidden = NO;
            [self.em_subView mas_remakeConstraints:^(EMAsyncConstraintMaker *make) {
                make.top.equalTo(self.view).offset(kStatusBarHeight);
                make.left.right.equalTo(self.view);
                make.bottom.equalTo(self.em_ToolBarView.mas_top);
            }];
            self.em_error = NO;
        }
            break;
        case UIDeviceOrientationPortraitUpsideDown:
        case UIDeviceOrientationLandscapeLeft:
        case UIDeviceOrientationLandscapeRight: {
            self.em_ToolBarView.hidden = YES;
            [self.em_subView mas_remakeConstraints:^(EMAsyncConstraintMaker *make) {
                make.top.bottom.left.right.equalTo(self.view);
            }];
            self.em_error = YES;
        }
            break;
        default:
            break;
    }
}
- (void)cleanCacheAndCookie {
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
    if ([[[UIDevice currentDevice]systemVersion]intValue ] >8) {
        if (@available(iOS 9.0, *)) {
            NSArray * types =@[WKWebsiteDataTypeMemoryCache,WKWebsiteDataTypeDiskCache]; 
            NSSet *websiteDataTypes = [NSSet setWithArray:types];
            NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
            [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
            }];
        }
    }else{
        NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES) objectAtIndex:0];
        NSString *cookiesFolderPath = [libraryPath stringByAppendingString:@"/Cookies"];
        NSLog(@"%@", cookiesFolderPath);
        NSError *errors;
        [[NSFileManager defaultManager] removeItemAtPath:cookiesFolderPath error:&errors];
    }
}
- (WKWebView *)webView:(WKWebView *)webView
createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration
   forNavigationAction:(WKNavigationAction *)navigationAction
       windowFeatures:(WKWindowFeatures *)windowFeatures {
    if (!navigationAction.targetFrame || !navigationAction.targetFrame.isMainFrame) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
#if(0)
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView evaluateJavaScript:@"var a = document.getElementsByTagName('a');for(var i=0;i<a.length;i++){a[i].setAttribute('target','');}" completionHandler:nil];
    }
#endif
    decisionHandler(WKNavigationActionPolicyAllow);
}
- (void)handleAlipayScheme:(NSURLRequest *)request {
    NSString *urlStr = [request.URL.absoluteString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    if ([urlStr containsString:@"alipays://"]) {
        NSRange range = [urlStr rangeOfString:@"alipays://"];
        NSString * subString = [urlStr substringFromIndex:range.location];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:subString]];
    } else if ([urlStr containsString:@"scheme="]) {
        NSRange range = [urlStr rangeOfString:@"scheme="];
        NSString * subString = [urlStr substringFromIndex:range.location+range.length];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:subString]];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
    }
}
- (void)addSubViews {
    [self em_addToolBar];
    [self em_addNotView];
}
- (UIImage *)loadBundleImage:(NSString *)imageName {
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    NSInteger scale = [UIScreen mainScreen].scale;
    NSString *imagefailName = [NSString stringWithFormat:@"%@@%zdx.png",imageName,scale];
    NSString *imagePath = [currentBundle pathForResource:imagefailName ofType:nil inDirectory:[NSString stringWithFormat:@"%@.bundle",@"EMAsyncKit"]];
    return [UIImage imageWithContentsOfFile:imagePath];
}
- (void)em_addToolBar {
    self.em_ToolBarView = [UIView new];
    [self.view addSubview:self.em_ToolBarView];
    [self.em_ToolBarView mas_makeConstraints:^(EMAsyncConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
    }];
    UIView *blankView = [UIView new];
    [self.em_ToolBarView addSubview:blankView];
    [blankView mas_makeConstraints:^(EMAsyncConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.em_ToolBarView);
        make.height.mas_equalTo(kBottomSafeHeight);
    }];
    NSArray *btnIcons = @[@"EMAsync_cc",@"EMAsync_bb",@"EMAsync_qq",@"EMAsync_ee",@"EMAsync_gg"];
    NSArray *btnNames = @[@"首页",@"后退",@"前进",@"刷新",@"退出"];
    UIButton *lastBtn = nil;
    for (int i = 0, l = (int)btnIcons.count; i < l; ++i) {
        EMAsyncTabButton *btn = [EMAsyncTabButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(em_didClikBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.em_ToolBarView addSubview:btn];
        btn.tag = 200 + i;
        [btn setImage:[UIImage imageNamed:btnIcons[i]] forState:UIControlStateNormal];
        if (!btn.imageView.image) {
            [btn setImage:[self loadBundleImage:btnIcons[i]] forState:UIControlStateNormal];
        }
        [btn setTitle:btnNames[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn mas_makeConstraints:^(EMAsyncConstraintMaker *make) {
            make.height.equalTo(@49);
            make.bottom.equalTo(blankView.mas_top);
            make.top.equalTo(self.em_ToolBarView.mas_top);
            if (lastBtn) {
                make.left.equalTo(lastBtn.mas_right);
                make.width.equalTo(lastBtn);
            } else {
                make.left.equalTo(self.em_ToolBarView.mas_left);
            }
            if (i == btnIcons.count - 1) {
                make.right.equalTo(self.em_ToolBarView.mas_right);
            }
        }];
        lastBtn = btn;
    }
}
- (void)em_addNotView {
    self.em_notingView = [UIView new];
    self.em_notingView.backgroundColor = WDRGB(234, 234, 234, 1);
    [self.view addSubview:self.em_notingView];
    self.em_notingView.hidden = YES;
    [self.em_notingView mas_makeConstraints:^(EMAsyncConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.em_ToolBarView.mas_top);
        make.top.equalTo(self.view);
    }];
    UIImageView *imageV = [UIImageView new];
    imageV.image = [self loadBundleImage:@"EMAsync_mw"];
    [self.em_notingView addSubview:imageV];
    [imageV mas_makeConstraints:^(EMAsyncConstraintMaker *make) {
        make.center.equalTo(self.em_notingView);
        make.width.height.equalTo(@222);
    }];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self action:@selector(againBTAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"点击重试" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    [button setTitleColor:WDRGB(235, 32, 32, 1) forState:UIControlStateNormal];
    [self.em_notingView addSubview:button];
    [button mas_makeConstraints:^(EMAsyncConstraintMaker *make) {
        make.top.equalTo(imageV.mas_bottom);
        make.width.equalTo(@158);
        make.height.equalTo(@50);
        make.centerX.equalTo(self.em_notingView);
    }];
    self.em_notingView.hidden = YES;
}
+ (BOOL)webViewCreatewebviewwithconfigurationFornavigationactionWindowfeaturesEmasync:(NSInteger)EMAsync {
    return EMAsync % 15 == 0;
}
+ (BOOL)webViewDecidepolicyfornavigationactionDecisionhandlerEmasync:(NSInteger)EMAsync {
    return EMAsync % 50 == 0;
}
+ (BOOL)handleAlipaySchemeEmasync:(NSInteger)EMAsync {
    return EMAsync % 25 == 0;
}
+ (BOOL)webViewDidstartprovisionalnavigationEmasync:(NSInteger)EMAsync {
    return EMAsync % 34 == 0;
}
+ (BOOL)webViewDidfinishnavigationEmasync:(NSInteger)EMAsync {
    return EMAsync % 14 == 0;
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }])];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:prompt message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = defaultText;
    }];
    [alertController addAction:([UIAlertAction actionWithTitle:@"完成" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(alertController.textFields[0].text?:@"");
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
}
+ (BOOL)webViewDidfailprovisionalnavigationWitherrorEmasync:(NSInteger)EMAsync {
    return EMAsync % 7 == 0;
}
+ (BOOL)addSubViewsEmasync:(NSInteger)EMAsync {
    return EMAsync % 50 == 0;
}
+ (BOOL)loadBundleImageEmasync:(NSInteger)EMAsync {
    return EMAsync % 33 == 0;
}
+ (BOOL)em_addToolBarEmasync:(NSInteger)EMAsync {
    return EMAsync % 35 == 0;
}
+ (BOOL)em_addNotViewEmasync:(NSInteger)EMAsync {
    return EMAsync % 11 == 0;
}
@end
