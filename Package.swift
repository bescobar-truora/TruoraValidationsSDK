// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TruoraValidationsSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "TruoraValidationsSDK",
            targets: ["TruoraValidationsSDK"]
        ),
        .library(
            name: "TruoraCamera",
            targets: ["TruoraCamera"]
        )
    ],
    dependencies: [],
    targets: [
        // Main SDK target
        .target(
            name: "TruoraValidationsSDK",
            dependencies: [
                "TruoraCamera",
                "TruoraShared"
            ],
            path: "ios/validations/TruoraValidationsSDK/Sources",
            swiftSettings: [
                .define("SWIFT_PACKAGE")
            ]
        ),
        // Camera module
        .target(
            name: "TruoraCamera",
            dependencies: [
                "TensorFlowLite"
            ],
            path: "ios/validations/TruoraCamera/Sources",
            resources: [
                .process("../Resources")
            ]
        ),
        // TensorFlowLite Swift wrapper
        .target(
            name: "TensorFlowLite",
            dependencies: [
                "TensorFlowLiteC"
            ],
            path: "ios/validations/TensorFlowLite/Sources"
        ),
        // Binary targets
        .binaryTarget(
            name: "TruoraShared",
            path: "shared/truora/shared/build/XCFrameworks/release/TruoraShared.xcframework"
        ),
        .binaryTarget(
            name: "TensorFlowLiteC",
            path: "ios/validations/XCFrameworks/TensorFlowLiteC.xcframework"
        )
    ]
)
