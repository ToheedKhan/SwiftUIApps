//
//  HeadingView.swift
//  Africa
//
//  Created by Toheed Jahan Khan on 12/01/24.
//

import SwiftUI

/*
 We are going to separate the different sections with a reusable subtitle with
 modifiable content. To make this happen,
 we need to create a dedicated swift UI for the heading. HeadingView
 */
struct HeadingView: View {
    
    //MARK: - PROPERTIES
    
    var headingImage: String
    var headingText: String
    
    //MARK: - BODY

    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        } //: HSTACK
        .padding(.vertical)
    }
}

//MARK: PREVIEW

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
