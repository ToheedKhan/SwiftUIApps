//
//  GalleryView.swift
//  Africa
//
//  Created by Toheed Jahan Khan on 11/01/24.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - PROPERTIES
    
    // SIMPLE GRID DEFINITION - 3 Column Layout
     let gridLayout: [GridItem] = [
       GridItem(.flexible()),
       GridItem(.flexible()),
       GridItem(.flexible())
     ]
    //MARK: - BODY

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Gallery")
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
