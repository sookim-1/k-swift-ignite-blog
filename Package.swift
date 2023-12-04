// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "BlogWebsite",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "BlogWebsite",
            targets: ["BlogWebsite"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.9.0"),
    ],
    targets: [
        .executableTarget(
            name: "BlogWebsite",
            dependencies: [
                .product(name: "Publish", package: "publish"),
            ]
        ),
    ]
)
