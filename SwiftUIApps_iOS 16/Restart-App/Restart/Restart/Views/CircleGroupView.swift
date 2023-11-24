//
//  CircleGroupView.swift
//  Restart
//
//  Created by Toheed Jahan Khan on 23/11/23.
//

import SwiftUI

struct CircleGroupView: View {
    /*
     Our ultimate goal with this ring component is the following We want this UI component to be used in
     multiple environments on top of **different background colors**.
     To achieve this goal, we need to create two properties representing the color and opacity attributes
     of the ring component.
     */
    
    // MARK: - PROPERTY
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(0.2), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
            
            
             
        } //: ZStack
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
          isAnimating = true
        })
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
          Color("ColorBlue")
            .ignoresSafeArea(.all, edges: .all)
          
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
      }
}
