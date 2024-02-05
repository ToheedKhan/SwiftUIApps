//
//  BlankView.swift
//  Devote
//
//  Created by Toheed Jahan Khan on 31/01/24.
//

import SwiftUI
/*
 A blank semi-transparent layer between the MainView and the NewTaskItem view.
 */

/*
 There is a built in visual effect in the
 UIKit framework.
 However, unfortunately it hasn't been ported to the Swift UI framework yet.
 
A there is no direct view modifier available in SwiftUI for Visual effect as of now, We will create this visual effect manually.
 */
struct BlankView: View {
    // MARK: - PROPERTY
    
    //To make this visual effect reusable, we need to create two properties for it.
    var backgroundColor: Color
    var backgroundOpacity: Double
    
    // MARK: - BODY
    
    var body: some View {
      VStack {
        Spacer()
      }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
      .background(backgroundColor)
      .opacity(backgroundOpacity)
      .blendMode(.overlay)
      .edgesIgnoringSafeArea(.all)
    }
  }

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
      BlankView(backgroundColor: Color.black, backgroundOpacity: 0.3)
        .background(BackgroundImageView())
        .background(backgroundGradient.ignoresSafeArea(.all))
    }
  }
