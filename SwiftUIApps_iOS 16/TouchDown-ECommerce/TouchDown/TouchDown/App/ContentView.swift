//
//  ContentView.swift
//  TouchDown
//
//  Created by Toheed Jahan Khan on 15/01/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
              NavigationBarView()
                .padding()
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                
              Spacer()
                
                  FooterView()
                    .padding(.horizontal)
              
            } //: VSTACK
            //By doing this, it will be white till top of the screen
            .background(colorBackground.ignoresSafeArea(.all, edges: .all))
       
        } //: ZSTACK
        /*All edges top with this ZStack will be the main content container from now so we can switch from
         the e-commerce apps storefront home view to the product detail view later on.*/
        /*
         Afer this Status bar will be white but The custom nav bar is still covered by the ugly notch at the top.
         */
        .ignoresSafeArea(.all, edges: .top)
      }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
