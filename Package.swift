// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "BranchSDK",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12),
    ],
    products: [
        .library(
            name: "BranchSDK",
            targets: ["BranchSDK"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "BranchSDK",
            path: "Sources",
            sources: [
                "BranchSDK/"
            ],
            resources: [
                .copy("Resources/PrivacyInfo.xcprivacy"),
            ],
            publicHeadersPath: "BranchSDK/Public/",
            cSettings: [
                .headerSearchPath("BranchSDK/Private"),
								.define("BRANCH_EXCLUDE_IDFA_CODE")
            ],
            linkerSettings: [
                .linkedFramework("CoreServices"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("WebKit", .when(platforms: [.iOS])),
                .linkedFramework("CoreSpotlight", .when(platforms: [.iOS])),
            ]
        ),
    ]
)
