// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "CloudXUnityAdsAdapter",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "CloudXUnityAdsAdapter",
            targets: ["CloudXUnityAdsAdapterPackage"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/cloudx-io/cloudx-ios-swift-package-core.git",
            from: "3.9.1"
        ),
        .package(
            url: "https://github.com/Unity-Technologies/Unity-Ads-Swift-Package.git",
            exact: "4.20.1"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "CloudXUnityAdsAdapter",
            url: "https://github.com/cloudx-io/cloudx-ios/releases/download/adapter-unityads/4.20.1.0/CloudXUnityAdsAdapter.xcframework.zip",
            checksum: "fff9c83fcb51376157a65a2a847fc04d02bf67b913e52eef5b0126dc880914ff"
        ),
        .target(
            name: "CloudXUnityAdsAdapterPackage",
            dependencies: [
                "CloudXUnityAdsAdapter",
                .product(name: "CloudXCore", package: "cloudx-ios-swift-package-core"),
                .product(name: "UnityAds", package: "unity-ads-swift-package"),
            ]
        ),
        .testTarget(
            name: "CloudXUnityAdsAdapterSwiftTests",
            dependencies: ["CloudXUnityAdsAdapterPackage"],
            linkerSettings: [.unsafeFlags(["-Xlinker", "-ObjC"])]
        ),
        .testTarget(
            name: "CloudXUnityAdsAdapterObjCTests",
            dependencies: ["CloudXUnityAdsAdapterPackage"],
            linkerSettings: [.unsafeFlags(["-Xlinker", "-ObjC"])]
        ),
    ]
)
