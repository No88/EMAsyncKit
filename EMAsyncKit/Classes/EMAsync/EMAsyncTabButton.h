#import <UIKit/UIKit.h>
@interface EMAsyncTabButton : UIButton
@property (nonatomic, assign) NSInteger em_ret;
+ (BOOL)initWithFrameEmasync:(NSInteger)EMAsync;
+ (BOOL)initEmasync:(NSInteger)EMAsync;
+ (BOOL)commonInitEmasync:(NSInteger)EMAsync;
+ (BOOL)titleRectForContentRectEmasync:(NSInteger)EMAsync;
+ (BOOL)imageRectForContentRectEmasync:(NSInteger)EMAsync;
@end
