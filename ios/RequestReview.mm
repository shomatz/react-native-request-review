#import "RequestReview.h"
#import <StoreKit/SKStoreReviewController.h>

@implementation RequestReview
RCT_EXPORT_MODULE()

#ifdef RCT_NEW_ARCH_ENABLED
- (void)requestReview
#else
RCT_EXPORT_METHOD(requestReview)
#endif
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindowScene *activeScene;
        NSSet *scenes = [[UIApplication sharedApplication] connectedScenes];
        for (UIScene *scene in scenes) {
            if ([scene activationState] == UISceneActivationStateForegroundActive) {
                activeScene = (UIWindowScene *)scene;
                break;
            }
        }
        if (activeScene != nil) {
            [SKStoreReviewController requestReviewInScene:activeScene];
        }
    });
}

#ifdef RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
(const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeRequestReviewSpecJSI>(params);
}
#endif

@end
