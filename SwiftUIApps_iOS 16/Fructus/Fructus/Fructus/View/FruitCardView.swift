//
//  FruitCardView.swift
//  Fructus
//
//  Created by Toheed Jahan Khan on 13/12/23.
//

import SwiftUI

struct FruitCardView: View {
    
    // MARK: - PROPERTIES
    
    
    // MARK: - BODY
    var body: some View {
        
        ZStack {
            /*
             to add an expandable background view to this card in order to separate this flexible background from the rest of the content, we need to embed this V stack container into a new Z stack container.

             */
            VStack {
                //FRUIT: IMAGE
                Image("blueberry")
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                //FRUIT: TITLE
                Text("Blueberry")
                //FRUIT: HEADLINE
                //BUTTON: START

            } //: VSTACK
        } //: ZSTACK
        /*
         To make this beautiful color gradient to expand itself to all edges of the screen, add a new frame modifier to this view and make its size not only flexible but expandable as well.
         Enter the following modifier at the top of the others because their order really matters in swift UI.
         */
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment:  .center)
        //This is for background
        .background(LinearGradient(gradient: Gradient(colors: [Color("ColorBlueberryLight"), Color("ColorBlueberryDark")]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
    }
}

// MARK: - PREVIEW
struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView()
          .previewLayout(.fixed(width: 320, height: 640))
      }
}
