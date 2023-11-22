//
//  MotionAnimationView.swift
//  HikeApp
//
//  Created by Toheed Jahan Khan on 22/11/23.
//

import SwiftUI

struct MotionAnimationView: View {
    /*
     This code will generate a random number between 6 and 12.
     It also represents the maximum number of circles that we will display on the screen.
     */
    
    // MARK: - PROPERTIES
    
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    
    // MARK: - FUNCTIONS
    
    // 1. RANDOM COORDINATE
    func randomCoordinate() -> CGFloat {
      return CGFloat.random(in: 0...256)
    }
    
    // 2. RANDOM SIZE
    func randomSize() -> CGFloat {
      return CGFloat(Int.random(in: 4...80))
    }
    
    // 3. RANDOM SCALE
    func randomScale() -> CGFloat {
      return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // 4. RANDOM SPEED
    func randomSpeed() -> Double {
      return Double.random(in: 0.05...1.0)
    }
    
    // 5. RANDOM DELAY
    func randomDelay() -> Double {
      return Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            /*
             With this code, we have already created many circle views on the screen.
             */
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                //randomly positioned many randomly generated circle views
                    .position(
                      x: randomCoordinate(),
                      y: randomCoordinate()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                //Motion animation - Spring animation
                    .onAppear(perform: {
                      withAnimation(
                        .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                        .repeatForever()
                        .speed(randomSpeed())
                        .delay(randomDelay())
                      ) {
                        isAnimating = true
                      }
                    })
            }
           
        } //: ZSTACK
        .frame(width: 256, height: 256)

      }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
//        ZStack {
//            Color.teal.ignoresSafeArea()
//
//            MotionAnimationView()
//        }
        
        MotionAnimationView()
          .background(
            Circle()
              .fill(.teal)
          )
      }
}
