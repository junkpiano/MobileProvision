// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MobileProvision",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v14),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .executable(name: "mobileprovision", targets: ["MobileProvisionCommand"]),
        .library(
            name: "MobileProvision",
            targets: ["MobileProvision"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(name: "MobileProvisionCommand",
                          dependencies: [
                            "MobileProvision",
                            .product(name: "ArgumentParser", package: "swift-argument-parser")
                          ]),
        .target(
            name: "MobileProvision"),
        .testTarget(
            name: "MobileProvisionTests",
            dependencies: ["MobileProvision"]),
    ]
)
