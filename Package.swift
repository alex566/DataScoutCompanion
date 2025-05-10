// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataScoutCompanion",
    products: [
        .library(
            name: "DataScoutCompanion",
            targets: ["DataScoutCompanion"]),
    ],
    targets: [
        .binaryTarget(
            name: "DataScoutCompanion",
            path: "Frameworks/DataScoutCompanion.xcframework"
        )
    ]
)
