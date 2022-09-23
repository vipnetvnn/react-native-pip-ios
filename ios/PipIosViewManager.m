#import "React/RCTViewManager.h"
#import <React/RCTUIManager.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTLog.h>

//#import "PipIosViewManager-Swift.h"
@interface RCT_EXTERN_MODULE(PipIosViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(color, NSString)
RCT_EXTERN_METHOD(toggle:(nonnull NSNumber*)node)
@end
