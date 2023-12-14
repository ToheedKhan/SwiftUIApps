//
//  FruitCardView.swift
//  Fructus
//
//  Created by Toheed Jahan Khan on 13/12/23.
//

import SwiftUI

struct FruitCardView: View {
    
    // MARK: - PROPERTIES
    
    var fruit: Fruit
    
    //change its value to true each time when the card appears on the screen.
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    var body: some View {
        
        ZStack {
            /*
             to add an expandable background view to this card in order to separate this flexible background from the rest of the content, we need to embed this V stack container into a new Z stack container.

             */
            VStack {
                //FRUIT: IMAGE
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                /*when the value of the is animating property changes from false to true, then the initial
                0.6% size of the image will be scaled up to its original size. */
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                
                //FRUIT: TITLE
                Text(fruit.title)
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                    
                //FRUIT: HEADLINE
                Text(fruit.headline)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 400)
                
                //BUTTON: START
                StartButtonView()
            } //: VSTACK
        } //: ZSTACK
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
        /*
         To make this beautiful color gradient to expand itself to all edges of the screen, add a new frame modifier to this view and make its size not only flexible but expandable as well.
         Enter the following modifier at the top of the others because their order really matters in swift UI.
         */
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment:  .center)
        //This is for background
        .background(LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}

// MARK: - PREVIEW
struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView(fruit: fruitsData[4])
          .previewLayout(.fixed(width: 320, height: 640))
      }
}
