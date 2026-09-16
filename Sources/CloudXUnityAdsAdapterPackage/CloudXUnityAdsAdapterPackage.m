#import <CloudXUnityAdsAdapter/CloudXUnityAdsAdapter.h>

@interface CloudXUnityAdsAdapterPackageLoader : NSObject
@end

@implementation CloudXUnityAdsAdapterPackageLoader

+ (void)load {
    CloudXUnityAdsAdapterRegister();
}

@end
