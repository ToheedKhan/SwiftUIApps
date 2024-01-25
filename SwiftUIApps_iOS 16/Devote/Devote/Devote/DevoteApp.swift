//
//  DevoteApp.swift
//  Devote
//
//  Created by Toheed Jahan Khan on 19/01/24.
//

import SwiftUI

@main
struct DevoteApp: App {
    let persistenceController = PersistenceController.shared
/*
 This managed object context key in the environment is designed to store our active core data managed object context.
 In a nutshell, with that single line of code, the managed object context is injected for the core data container in the whole swift UI app hierarchy and its all child views.
 */
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
