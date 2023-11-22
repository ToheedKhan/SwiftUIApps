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
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(colors: [
                            .customGrayLight,
                            .customGrayMedium],
                                       startPoint: .top,
                                       endPoint: .bottomTrailing
                                      )
                    )
                    .frame(width: 256, height: 256)
                
                Image("image-1")
                    .resizable()
                    .scaledToFit()
            }
        }//: CARD
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
