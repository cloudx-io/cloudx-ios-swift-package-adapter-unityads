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
            url: "https://github.com/cloudx-io/cloudx-ios-swift-package-adapter-unityads/releases/download/binary/4200101.0.0/CloudXUnityAdsAdapter.xcframework.zip",
            checksum: "7ac75108dc7ee7d7ee87d797384a45664c689f4e0efbedff3d9ebbbe34375774"
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
