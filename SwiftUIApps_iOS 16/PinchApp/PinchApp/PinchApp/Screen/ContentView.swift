//
//  ContentView.swift
//  PinchApp
//
//  Created by Toheed Jahan Khan on 24/11/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Property
    
    //MARK: - FUNCTION
    
    //MARK: - CONTENT
    
    var body: some View {
        NavigationView {
            ZStack {
               Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
            }//: ZStack
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
        } //: NAVIGATION
        .navigationViewStyle(.stack)
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
