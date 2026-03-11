// Version: 1.0.0
// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "allmark",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "allmark",
            targets: ["allmark"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-collections.git",
            .upToNextMinor(from: "1.3.0") // or `.upToNextMajor
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "allmark",
            dependencies: [
                .product(name: "Collections", package: "swift-collections")
            ]
        ),
        .testTarget(
            name: "allmarkTests",
            dependencies: ["allmark"]
        ),
    ]
)
