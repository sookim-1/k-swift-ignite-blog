// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SookimTWL",
    platforms: [.macOS(.v13)],
    dependencies: [
        .package(url: "https://github.com/sookim-1/Ignite.git", branch: "feat_content_style")
    ],
    targets: [
        .executableTarget(
            name: "SookimTWL",
            dependencies: ["Ignite"]),
    ]
)
