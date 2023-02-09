//
//  ContentView.swift
//  BindingExample
//
//  Created by Toheed on 09/02/23.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = "Hi"
    
    private func printName() {
        print(self.name)
    }
    var body: some View {
        VStack {
            Text(name)
//            TextField($name, placeholder: Text("Enter Text")).padding(12)
            
            TextField("Enter Text", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .padding(12)

            Button(action: printName) {
                Text("Show Name Value")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
