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
    
    // SIMPLE GRID DEFINITION - 3 Column Layout
//     let gridLayout: [GridItem] = [
//       GridItem(.flexible()),
//       GridItem(.flexible()),
//       GridItem(.flexible())
//     ]
    
    // EFFICIENT GRID DEFINITION
     let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
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
            
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        // MARK: - IMAGE
                        
                        Image(item.image)
                          .resizable()
                          .scaledToFit()
                          .clipShape(Circle())
                          .overlay(Circle().stroke(Color.white, lineWidth: 8))
                          .onTapGesture {
                              selectedAnimal = item.image
                          }
                    }
                } //: GRID
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
