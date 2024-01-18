//
//  TouchDownApp.swift
//  TouchDown
//
//  Created by Toheed Jahan Khan on 15/01/24.
//

import SwiftUI

@main
struct TouchDownApp: App {
    var body: some Scene {
        /*
         This environment object modifier allows us to create views that rely on shared data.
         From now we can access the properties of this shop class anywhere.
         */
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
