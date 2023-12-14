//
//  ContentView.swift
//  Fructus
//
//  Created by Toheed Jahan Khan on 13/12/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @State private var isShowingSettings: Bool = false
    
    var fruits: [Fruit] = fruitsData
    
    // MARK: - BODY

    var body: some View {
      NavigationView {
        List {
          ForEach(fruits.shuffled()) { item in
              NavigationLink(destination: FruitDetailView(fruit: item)) {
                  FruitRowView(fruit: item)
                      .padding(.vertical, 4)
              }
          }
        }
        .navigationTitle("Fruits")
        
      } //: NAVIGATION
      .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView(fruits: fruitsData)
        .previewDevice("iPhone 11 Pro")
    }
}
