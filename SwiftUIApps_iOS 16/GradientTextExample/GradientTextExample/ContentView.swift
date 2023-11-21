//
//  ContentView.swift
//  GradientTextExample
//
//  Created by Toheed Jahan Khan on 21/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // MARK: 1. BASIC GRADIENT TEXT
            Text("iOS")
                .font(.system(size: 180))
                .fontWeight(.black)
                .foregroundStyle(.teal.gradient)
            
            // MARK: 2. CUSTOM GRADIENT TEXT
            Text("iOS")
                .font(.system(size: 180))
                .fontWeight(.black)
                .foregroundStyle(LinearGradient(colors: [.pink, .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
