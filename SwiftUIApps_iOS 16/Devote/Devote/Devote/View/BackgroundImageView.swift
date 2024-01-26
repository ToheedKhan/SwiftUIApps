//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Toheed Jahan Khan on 26/01/24.
//

import SwiftUI
//Debug preview window ????
struct BackgroundImageView: View {
  var body: some View {
    Image("rocket")
      /*this anti-aliased modifier will keep the edges of the image smooth when it is scaled up or down */
      
      .antialiased(true)
      .resizable()
      .scaledToFill()
      .ignoresSafeArea(.all)
  }
}

struct BackgroundImageView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundImageView()
  }
}
