//
//  ContentView.swift
//  UnderstandingObservableObject
//
//  Created by Toheed on 09/02/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var fancyTimer = FancyTimer()
    
    var body: some View {
        VStack {
            Text("\(self.fancyTimer.value)")
                .font(.largeTitle)
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
