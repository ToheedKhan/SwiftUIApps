//
//  EnvironmentObjectExampleApp.swift
//  EnvironmentObjectExample
//
//  Created by Toheed on 09/02/23.
//

import SwiftUI

@main
struct EnvironmentObjectExampleApp: App {
    var body: some Scene {
        WindowGroup {
            let userSettings = UserSettings()
            
            ContentView().environmentObject(userSettings)
        }
    }
}
