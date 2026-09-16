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
            exact: "4.19.0"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "CloudXUnityAdsAdapter",
            url: "https://github.com/cloudx-io/cloudx-ios/releases/download/adapter-unityads/4.19.0.0/CloudXUnityAdsAdapter.xcframework.zip",
            checksum: "31b79d20f0983464f7826fbc047ec491fab9d766cf5e6beb738ee15c28dbfe32"
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
