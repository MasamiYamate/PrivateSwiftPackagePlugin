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
        print(context)
        print(arguments)
        print("hoge!!")
        print(context.package.directory)
        print(context.pluginWorkDirectory)
        print(makeCheckoutProjectPath(context: context))
        let process = Process()
        process.currentDirectoryURL = URL(fileURLWithPath: context.package.directory.string)
        process.executableURL = URL(fileURLWithPath: "/usr/bin/make")
        process.launch()
        process.waitUntilExit()
    }
}

private extension PrivateXCFrameworkPackaging {
    
    func makeCheckoutProjectPath(context: PluginContext) {
        let pluginWorkDirectoryPath = URL(string: context.pluginWorkDirectory.string)
        let sourcePackagesDirectoryPath = pluginWorkDirectoryPath?
            .deletingLastPathComponent()
            .deletingLastPathComponent()
        let checkoutDirectoryPath = sourcePackagesDirectoryPath?
            .appending(component: "checkouts")
            .appending(component: "PrivateXCFrameworkPackaging")
        print(checkoutDirectoryPath)
    }
    
}
