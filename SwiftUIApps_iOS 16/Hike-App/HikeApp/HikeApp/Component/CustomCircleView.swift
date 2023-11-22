//
//  CustomCircleView.swift
//  HikeApp
//
//  Created by Toheed Jahan Khan on 22/11/23.
//

import SwiftUI
//Custom Motion effect
struct CustomCircleView: View {
    /*
     Our goal is to start the animation after the Circle View is rendered on the screen.
     We can achieve it by adding a new modifier to the circle.
     */
    @State private var isAnimateGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .customIndigoMedium,
                            .customSalmonLight
                        ],
                        startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                        endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing
                    )
                )//Gradient Animation
                .onAppear {
                  withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                    isAnimateGradient.toggle()
                  }
                }
            //Now what property of the circle we want to animate
            //Here we are animating the direction of the linear color gradient.
            MotionAnimationView()
        } //: ZSTACK
        .frame(width: 256, height: 256)
        /*
         we can notice that the circles move out of the shape of the central circle.
         What do you think about how we could solve this unwanted problem?
         Mask modifier.
         The answer is masking.
         So when we create a new mask layer, then those circles outside the main shape won't be visible anymore.

         */
        .mask(Circle())
        .drawingGroup()
        /*
         High performance rendering.
         Metal rendering
         
         What this new modifier is doing for us.
         First of all, this new modifier enables high performance metal rendering.
         You should know that Swift UI uses core animation for its view rendering by default.
         This core animation offers great performance out of the box.
         However, you might find that your code starts to slow down a bit for complex animation.
         We can fix this issue by applying the so-called drawing group modifier.
         This tells Swift UI to render the content into an off screen image before returning it to the screen
         as a single rendered output, which is significantly faster.
         And behind the scenes, this is powered by metal, which is Apple's native framework for working directly
         with the GPU for high speed graphics.
         */
    }
}

struct CustomCircleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCircleView()
    }
}
