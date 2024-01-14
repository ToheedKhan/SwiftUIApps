//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Toheed Jahan Khan on 14/01/24.
//

import SwiftUI

struct MapAnnotationView: View {
    // MARK: - PROPERTIES
    
    var location: NationalParkLocation
    @State private var animation: Double = 0.0
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            /*
             This is the view that we are going to scale up with animation.
             
             We animate only two attributes the size of the circle with the scale
             effect and the opacity of the border.
             */
            Circle() //unfilled only stroke
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        } //: ZSTACK
        .onAppear {
          withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
            animation = 1
          }
        } //: OnAppear
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    static var previews: some View {
      MapAnnotationView(location: locations[0])
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
