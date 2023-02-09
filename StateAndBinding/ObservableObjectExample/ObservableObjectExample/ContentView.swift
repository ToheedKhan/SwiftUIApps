//
//  ContentView.swift
//  ObservableObjectExample
//
//  Created by Toheed on 09/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userSettings = UserSettings()
    
    var body: some View {
        VStack {
            Text("\(self.userSettings.score)")
                .font(.largeTitle)
            Button("Increment Score") {
                self.userSettings.score += 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
