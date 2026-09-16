@import CloudXUnityAdsAdapter;
@import CloudXUnityAdsAdapterPackage;
@import XCTest;

@interface CloudXUnityAdsAdapterObjCTests : XCTestCase
@end

@implementation CloudXUnityAdsAdapterObjCTests

- (void)testAdapterIsLinkedAndRegistered {
    XCTAssertEqualObjects(CLXUnityAdsAdapterVersion, @"4.20.1.0");
    XCTAssertNotNil(NSClassFromString(@"CLXUnityAdsInitializer"));
}

@end
