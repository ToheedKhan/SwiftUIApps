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
    
    /*to set the application's appearance separately from the global device's appearance.
     So when we start the application, it will load the actual value of the appearance from the user's defaults.
     */
    @AppStorage("isDarkMode") var isDarkMode: Bool = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
            /*
             This code will set the preferred color scheme of this application independently, regardless of what appearance is set globally on the device.
             */
        }
    }
}
