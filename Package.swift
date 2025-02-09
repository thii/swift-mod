// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "swift-mod",
    platforms: [
       .macOS("10.15")
    ],
    products: [
        .executable(
            name: "swift-mod",
            targets: ["swift-mod"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax", .upToNextMinor(from: "0.50700.0")),
        .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMinor(from: "1.1.2")),
        .package(url: "https://github.com/apple/swift-tools-support-core.git", from: "0.2.3"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "5.0.0")
    ],
    targets: [
        .executableTarget(
            name: "swift-mod",
            dependencies: ["SwiftModCommands"]
        ),
        .target(
            name: "SwiftModCommands",
            dependencies: [
                "SwiftModRules",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .testTarget(
            name: "SwiftModCommandsTests",
            dependencies: ["SwiftModCommands"]
        ),
        .target(
            name: "SwiftModRules",
            dependencies: ["SwiftModCore"]
        ),
        .testTarget(
            name: "SwiftModRulesTests",
            dependencies: ["SwiftModRules"]
        ),
        .target(
            name: "SwiftModCore",
            dependencies: [
                .product(name: "SwiftSyntaxParser", package: "swift-syntax"),
                .product(name: "SwiftToolsSupport-auto", package: "swift-tools-support-core"),
                "Yams",
            ]
        ),
        .testTarget(
            name: "SwiftModCoreTests",
            dependencies: ["SwiftModCore"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
