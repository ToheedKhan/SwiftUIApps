//
//  SourceLinkView.swift
//  Fructus
//
//  Created by Toheed Jahan Khan on 14/12/23.
//

import SwiftUI

struct SourceLinkView: View {
  var body: some View {
      /*
       This group books behaves as a vertical stack container, so everything we put inside it, it will be displayed vertically that's why we took HStack inside it.
       */
    GroupBox() {
      HStack {
        Text("Content source")
        Spacer()
        Link("Wikipedia", destination: URL(string: "https://wikipedia.com")!)
        Image(systemName: "arrow.up.right.square")
      }
      .font(.footnote)
    }
  }
}

struct SourceLinkView_Previews: PreviewProvider {
  static var previews: some View {
    SourceLinkView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}

