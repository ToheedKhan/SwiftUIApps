//
//  ContentView.swift
//  SwiftUISample
//
//  Created by Toheed on 14/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("First Line")
                .font(.largeTitle)
                .foregroundColor(.green)
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            //Spacer()
            Text("Hello, world!!")
                .font(.title)
                .foregroundColor(.orange)
            Image("nature")
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .clipShape(Circle())
                .cornerRadius(44)
                .padding(.all)

            //Spacer(minLength: 2)
            HStack {
                Text("Left")
                Text("Right")
                    .padding(.all)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
