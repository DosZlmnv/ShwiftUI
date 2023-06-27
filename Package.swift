// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShwiftUI",
    products: [
        .library(
            name: "ShwiftUI",
            targets: ["ShwiftUI"]
        ),
    ],
    targets: [
        .target(name: "ShwiftUI")
    ]
)
