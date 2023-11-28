//
//  PrivateXCFrameworkPackaging.swift
//
//
//  Created by Masami on 2023/10/07.
//

import Foundation
import PackagePlugin

@main
struct PrivateXCFrameworkPackaging: CommandPlugin {
    func performCommand(
        context: PluginContext,
        arguments: [String]
    ) async throws {
        let checkoutProjectPath = makeCheckoutProjectPath(context: context)!
        let process = Process()
        process.currentDirectoryURL = URL(fileURLWithPath: checkoutProjectPath)
        process.executableURL = URL(fileURLWithPath: "/usr/bin/make")
        process.arguments = ["binary-release", "\(checkoutProjectPath)"]
        process.launch()
        process.waitUntilExit()
    }
}

private extension PrivateXCFrameworkPackaging {
    
    func makeCheckoutProjectPath(context: PluginContext) -> String? {
        let pluginWorkDirectoryPath = URL(string: context.pluginWorkDirectory.string)
        let sourcePackagesDirectoryPath = pluginWorkDirectoryPath?
            .deletingLastPathComponent()
            .deletingLastPathComponent()
        let checkoutDirectoryPath = sourcePackagesDirectoryPath?
            .appending(component: "checkouts")
            .appending(component: "PrivateXCFrameworkPackaging")
        return checkoutDirectoryPath?.absoluteString
    }
    
}
