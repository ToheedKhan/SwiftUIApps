//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Toheed Jahan Khan on 14/01/24.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTIES
    //This property will store random number for us b/w 12 to 16.
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    // MARK: - FUNCTIONS
    
    // 1. RANDOM COORDINATE
    //So that repeated circle will not be on top of each other.
    func randomCoordinate(max: CGFloat) -> CGFloat {
      return CGFloat.random(in: 0...max)
    }
    
    // 2. RANDOM SIZE
    func randomSize() -> CGFloat {
      return CGFloat(Int.random(in: 10...300))
    }
    
    // 3. RANDOM SCALE
    func randomScale() -> CGFloat {
      return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // 4. RANDOM SPEED
    func randomSpeed() -> Double {
      return Double.random(in: 0.025...1.0)
    }
    
    // 5. RANDOM DELAY
    func randomDelay() -> Double {
      return Double.random(in: 0...2)
    }
    
    // MARK: - BODY
    var body: some View {
        /*
         geometry, width and height, printed out the exact size of the screen in points.
         
         **Why the text view moved its position from center to top left?**
         - When we wrap any view into a geometry reader container, then the origin point will be changed from the center to top left.
         */
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: 256, height: 256, alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                    //to make it center, no matter which device we are using.
//                        .position(
//                            x: geometry.size.width / 2,
//                            y: geometry.size.height / 2
//                    )
                    //Random position
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                    )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                        .repeatForever()
                        .speed(randomSpeed())
                        .delay(randomDelay())
                            ) //: Animation
                        .onAppear(perform: {
                          isAnimating = true
                        })
                } //: LOOP
                
//                Text("Width: \(Int(geometry.size.width)) Height: \(Int(geometry.size.height))")
            } //: ZSTACK
            .drawingGroup()
            /*
             Running such a complex animation with tons of moving and scaling elements could be power consuming.
             There is a special modifier that can cope with this delicate scenario.
             Drawing group.
             As you may know, Swift UI uses core animation for its rendering by default, which offers great performance
             out of the box.
             With the drawing loop modifier, this complex rendering won't be slowed down because this tells Swift
             UI that it should render the contents of the view into sequential still images which are significantly
             faster than real time rendering.
             Behind the scenes, this operation is powered by metal.
             That is Apple's high level framework for working directly with the GPU.
             And with this tiny addition, this motion effect will not suffer any performance reduction.
             */
        } //: GEOMETRY
    }
}

// MARK: - PREVIEW

struct MotionAnimationView_Previews: PreviewProvider {
  static var previews: some View {
    MotionAnimationView()
      .previewDevice("iPhone 12 Pro")
  }
}
