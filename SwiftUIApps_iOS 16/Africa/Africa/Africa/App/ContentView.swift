//
//  ContentView.swift
//  Africa
//
//  Created by Toheed Jahan Khan on 28/12/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    @State private var isGridViewActive: Bool = false
    
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var gridColumn: Int = 1
    
    //: MARK - FUNCTIONS
    
    func gridSwitch() {
      gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
      gridColumn = gridLayout.count
      print("Grid Number: \(gridColumn)")
      
      // TOOLBAR IMAGE
      switch gridColumn {
      case 1:
        toolbarIcon = "square.grid.2x2"
      case 2:
        toolbarIcon = "square.grid.3x2"
      case 3:
        toolbarIcon = "rectangle.grid.1x2"
      default:
        toolbarIcon = "square.grid.2x2"
      }
    }
    
    //MARK: - BODY

    var body: some View {
        NavigationView {
            List {
                CoverImageView().frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                ForEach(animals) {
                    animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                        AnimalListItemView(animal: animal)
                    } //: LINK
                    
                }
            } //: LIST
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
              ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 16) {
                  // LIST
                  Button(action: {
                    print("List view is activated")
                    isGridViewActive = false
                  }) {
                    Image(systemName: "square.fill.text.grid.1x2")
                      .font(.title2)
                      .foregroundColor(isGridViewActive ? .primary : .accentColor)
                  }
                  
                  // GRID
                  Button(action: {
                    print("Grid view is activated")
                    isGridViewActive = true
                    gridSwitch()
                  }) {
                    Image(systemName: toolbarIcon)
                      .font(.title2)
                      .foregroundColor(isGridViewActive ? .accentColor : .primary)
                  }
                } //: HSTACK
              } //: BUTTONS
            } //: TOOLBAR
        } //: NAVIGATION
    }
}

//MARK: PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
