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
        let process = Process()
        process.currentDirectoryURL = URL(fileURLWithPath: context.package.directory.string)
        process.executableURL = URL(fileURLWithPath: "/usr/bin/make")
//        process.arguments = ["/Applications/Slack.app"]
        process.launch()
        process.waitUntilExit()
    }
}

