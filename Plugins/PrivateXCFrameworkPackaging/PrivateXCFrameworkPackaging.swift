//
//  PrivateXCFrameworkPackaging.swift
//
//
//  Created by Masami on 2023/10/07.
//

import PackagePlugin

@main
struct PrivateXCFrameworkPackaging: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        return [
            .prebuildCommand(
                displayName: "Run generate keys",
                executable: Path("/usr/bin/make"),
                arguments: [
                ],
                outputFilesDirectory: context.pluginWorkDirectory
            )
        ]
    }
}

