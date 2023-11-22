//
//  CardView.swift
//  HikeApp
//
//  Created by Toheed Jahan Khan on 22/11/23.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    // MARK: - FUNCTIONS
    
    func randomImage() {
      print("--- BUTTON WAS PRESSED ---")
      print("Status: Old Image Number = \(imageNumber)")
      
      repeat {
        randomNumber = Int.random(in: 1...5)
        print("Action: Random Number Generated = \(randomNumber)")
      } while randomNumber == imageNumber
      
      imageNumber = randomNumber
      
      print("Result: New Image Number = \(imageNumber)")
      print("--- THE END ---")
      print("\n")
    }
    
    var body: some View {
        // MARK: - CARD
        
        ZStack {
          CustomBackgroundView()
          
          VStack {
            // MARK: - HEADER
            
            VStack(alignment: .leading) {
              HStack {
                Text("Hiking")
                  .fontWeight(.black)
                  .font(.system(size: 52))
                  .foregroundStyle(
                    LinearGradient(
                      colors: [
                        .customGrayLight,
                        .customGrayMedium],
                      startPoint: .top,
                      endPoint: .bottom)
                  )
                
                Spacer()
                
                Button {
                  // ACTION: Show a Sheet
                  print("The button was pressed.")
                  isShowingSheet.toggle()
                } label: {
                  CustomButtonView()
                }
                
              }
              
              Text("Fun and enjoyable outdoor activity for friends and families.")
                .multilineTextAlignment(.leading)
                .italic()
                .foregroundColor(.customGrayMedium)
            } //: HEADER
            .padding(.horizontal, 30)
            
           
            
          } //: ZSTACK
        } //: CARD
        .frame(width: 320, height: 570)
      }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
