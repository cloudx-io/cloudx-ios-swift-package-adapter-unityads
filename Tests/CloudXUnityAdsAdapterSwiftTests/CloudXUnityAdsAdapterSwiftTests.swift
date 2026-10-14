import CloudXUnityAdsAdapter
import CloudXUnityAdsAdapterPackage
import XCTest

final class CloudXUnityAdsAdapterSwiftTests: XCTestCase {
    func testAdapterIsLinkedAndRegistered() {
        XCTAssertEqual(CLXUnityAdsAdapterVersion, "4.20.1.1")
        XCTAssertNotNil(NSClassFromString("CLXUnityAdsInitializer"))
    }
}
