// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AmazingColorHelpers",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "AmazingColorHelpers",
            targets: ["AmazingColorHelpers"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AmazingColorHelpers",
            dependencies: []),
        .testTarget(
            name: "AmazingColorHelpersTests",
            dependencies: ["AmazingColorHelpers"]),
    ]
)
