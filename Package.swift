// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PrivateXCFrameworkPackaging",
    products: [
        .plugin(name: "PrivateXCFrameworkPackaging", targets: ["PrivateXCFrameworkPackaging"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .plugin(
            name: "PrivateXCFrameworkPackaging",
            capability: .command(
                intent: .custom(verb: "hoge", description: "fuga"),
                permissions: [
                    .writeToPackageDirectory(reason: "This command reformats source files")
                ]
            )
        ),
    ]
)
