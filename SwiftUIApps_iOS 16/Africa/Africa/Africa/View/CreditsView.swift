//
//  CreditsView.swift
//  Africa
//
//  Created by Toheed Jahan Khan on 15/01/24.
//

import SwiftUI
/*
 We will insert it into the list view at the home screen.
 */
struct CreditsView: View {
  var body: some View {
    VStack {
      Image("compass")
        .resizable()
        .scaledToFit()
        .frame(width: 128, height: 128)
      //Option+G
        /*To open character viewer.
        control + command + space*/
      Text("""
  Copyright © Toheed Jahan Khan
  All right reserved
  Better Apps ♡ Less Code
  """)
        .font(.footnote)
        .multilineTextAlignment(.center)
    } //: VSTACK
    .padding()
    .opacity(0.4)
  }
}

struct CreditsView_Previews: PreviewProvider {
  static var previews: some View {
    CreditsView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
