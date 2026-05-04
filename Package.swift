// Version: 1.0.11
// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "Allmark",
	// HACK: For benchmarking
	platforms: [
		.macOS(.v26),
		.iOS(.v26),
		.tvOS(.v26),
		.watchOS(.v26),
		.visionOS(.v26),
	],
	products: [
		// Products define the executables and libraries a package produces, making them visible to other packages.
		.library(
			name: "Allmark",
			targets: ["Allmark"]
		),
	],
	dependencies: [
		.package(
			url: "https://github.com/coenttb/swift-testing-performance",
			from: "0.1.2"
		),
	],
	targets: [
		// Targets are the basic building blocks of a package, defining a module or test suite.
		// Targets can depend on other targets in this package and products from dependencies.
		.target(
			name: "Allmark",
			dependencies: []
		),
		.testTarget(
			name: "AllmarkTests",
			dependencies: [
				"Allmark",
				.product(name: "TestingPerformance", package: "swift-testing-performance"),
			],
			resources: [
				.copy("full-markdown.md"),
			]
		),
	]
)
