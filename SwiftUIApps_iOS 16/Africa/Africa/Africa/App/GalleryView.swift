//
//  GalleryView.swift
//  Africa
//
//  Created by Toheed Jahan Khan on 11/01/24.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - PROPERTIES
    /* We need to create a new property that will hold the necessary information about the selected
    animal above the grid.
    */
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // SIMPLE GRID DEFINITION - 3 Column Layout
//     let gridLayout: [GridItem] = [
//       GridItem(.flexible()),
//       GridItem(.flexible()),
//       GridItem(.flexible())
//     ]
    
    // EFFICIENT GRID DEFINITION
//     let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // DYNAMIC GRID LAYOUT (Using slider UI)
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    /*
     function that will call
     when we move the thumb to the left or to the right on that track.
     */
    
    func gridSwitch() {
      gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    //MARK: - BODY

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                // MARK: - IMAGE
                
                Image(selectedAnimal)
                  .resizable()
                  .scaledToFit()
                  .clipShape(Circle())
                  .overlay(Circle().stroke(Color.white, lineWidth: 8))
                // MARK: - SLIDER
                /*Add a new slider between the selected animal image and the grid to modify the
                 number of columns with this slider user interface.*/
                
                /*Our goal is to provide functionality that will allow the user to switch from two columns up to four.*/
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                  .padding(.horizontal)
                  .onChange(of: gridColumn, perform: { value in
                    gridSwitch()
                  })
                
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        // MARK: - IMAGE
                        
                        Image(item.image)
                          .resizable()
                          .scaledToFit()
                          .clipShape(Circle())
                          .overlay(Circle().stroke(Color.white, lineWidth: 1))
                          .onTapGesture {
                              selectedAnimal = item.image
                              haptics.impactOccurred()
                          }
                    }
                } //: GRID
//                .animation(.easeIn)
                .onAppear(perform: {
                  gridSwitch()
                })
            } //: VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        } //: SCROLLVIEW
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //background motion Animation View.
        .background(MotionAnimationView())
    }
}

//MARK: PREVIEW

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
