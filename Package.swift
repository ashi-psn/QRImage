// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "QRImage",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_11),
        .tvOS(.v9),
        .watchOS(.v2),
    ],
    products: [
        .library(
            name: "QRImage",
            targets: ["QRImage"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "QRImage",
            dependencies: [
            ]),
        .testTarget(
            name: "QRImageTests",
            dependencies: ["QRImage"]),
    ]
)
