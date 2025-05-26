// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "selphidComponentLight",
    defaultLocalization: "es",
    platforms: [.iOS(.v9)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "selphidComponentLight",
            targets: ["selphidComponent"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "git@github.com:facephi-clienters/selphidnoml-framework.git", .upToNextMinor(from: "1.33.1")),
        .package(url: "git@github.com:facephi-clienters/SDK-CorePackage-SPM.git", .exactItem("2.3.1")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "selphidComponent",
            dependencies: [
                .product(name: "FPhiSelphIDWidgetiOSLight", package: "selphidnoml-framework"),
                "SDK-CorePackage-SPM",
                "selphidComponentLight"
            ],
            resources: [.process("Resources")]),
        .binaryTarget(name: "selphidComponentLight", path: "selphidComponentLight.xcframework")
    ]
)
