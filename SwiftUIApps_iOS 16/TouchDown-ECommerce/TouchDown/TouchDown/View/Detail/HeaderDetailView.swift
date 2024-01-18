//
//  HeaderDetailView.swift
//  TouchDown
//
//  Created by Toheed Jahan Khan on 18/01/24.
//

import SwiftUI

struct HeaderDetailView: View {
    // MARK: - PROPERTY
    
    
    // MARK: - BODY
    
    var body: some View {
      VStack(alignment: .leading, spacing: 6, content: {
        Text("Protective Gear")
        
        Text(sampleProduct.name)
          .font(.largeTitle)
          .fontWeight(.black)
      }) //: VSTACK
      .foregroundColor(.white)
    }
  }

  // MARK: - PREVIEW

  struct HeaderDetailView_Previews: PreviewProvider {
    static var previews: some View {
      HeaderDetailView()
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.gray)
    }
  }
