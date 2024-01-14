//
//  GalleryView.swift
//  Africa
//
//  Created by Toheed Jahan Khan on 11/01/24.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - PROPERTIES
    
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
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                ForEach(animals) { item in
                    // MARK: - IMAGE
                    
                    Image(item.image)
                      .resizable()
                      .scaledToFit()
                      .clipShape(Circle())
                      .overlay(Circle().stroke(Color.white, lineWidth: 8))
                }
            } //: GRID
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
