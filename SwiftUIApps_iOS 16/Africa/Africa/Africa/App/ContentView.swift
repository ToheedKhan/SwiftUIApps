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
    
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    //    @State private var gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)

    // For 1 Column to 3 Column
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    //property to keep track of the number of the next grid
    @State private var gridColumn: Int = 1
    
    //: MARK - FUNCTIONS
    /*
     // For 1 Column to 3 Column

      call each time when a user taps on the grid button.
     */
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
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView().frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) {
                            animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            } //: LINK
                            
                        } //: LOOP
                        /*But for some strange reason CreditView aligned to left, and that's not exactly what we want at all.
                         You should keep in mind that the list view in Swift UI comes with some default preferences.
                         Many times this could work perfectly as we intended, but sometimes it does the opposite things.
                         There is no dedicated list cell modifier for the alignment in swiftUI List row yet.
                         To fix this, we can put this credits view into a horizontal stack container as a wrapper*/
                        CreditsView()
                            .modifier(CenterModifier())
                    } //: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                      LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                        ForEach(animals) { animal in
                          NavigationLink(destination: AnimalDetailView(animal: animal)) {
                            AnimalGridItemView(animal: animal)
                          } //: LINK
                        } //: LOOP
                      } //: GRID
                      .padding(10)
                      .animation(.easeIn)
                    } //: SCROLL
                } //: CONDITION
            } //: GROUP
            /* navigation bar and the toolbar to be shared between the list and the grid views.*/
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
              ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 16) {
                  // LIST
                  Button(action: {
                    print("List view is activated")
                    isGridViewActive = false
                    haptics.impactOccurred()
                  }) {
                    Image(systemName: "square.fill.text.grid.1x2")
                      .font(.title2)
                      .foregroundColor(isGridViewActive ? .primary : .accentColor)
                  }
                  
                  // GRID
                  Button(action: {
                    print("Grid view is activated")
                    isGridViewActive = true
                    haptics.impactOccurred()
                    gridSwitch()
                  }) {
                      
//                    Image(systemName: "square.grid.2x2")
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
