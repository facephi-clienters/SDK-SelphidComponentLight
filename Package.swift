// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "selphidComponent",
    defaultLocalization: "es",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "selphidComponent",
            targets: ["selphidLightComponent", "selphidComponent"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/facephi-clienters/selphidnoml-framework.git", .upToNextMinor(from: "1.41.6")),
        .package(url: "https://github.com/facephi-clienters/SDK-CorePackage-SPM.git", .exactItem("2.12.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "selphidLightComponent",
            dependencies: [
                .product(name: "FPhiSelphIDWidgetiOSLight", package: "selphidnoml-framework"),
                "SDK-CorePackage-SPM",
                "selphidComponent"
            ],
            resources: [.process("Resources")]),
        .binaryTarget(name: "selphidComponent",
        url: "https://facephicorp.jfrog.io/artifactory/spm-pro-fphi/SDK/FPHISDKSelphIDComponentLight/2.12.1/selphidComponent.zip",
        checksum: "92cec113823f30ada8d74212f2b5050755f72a1c824ffd1b4ccb649bd9f573af")
    ]
)
