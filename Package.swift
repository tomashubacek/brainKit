// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let package = Package(
    name: "BrainKit",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "BrainKit",
            targets: ["BrainKit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BrainKit",
            dependencies: []),
    ],
    swiftLanguageVersions: [.v5]
)
