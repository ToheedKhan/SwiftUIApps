//
//  CategoryGridView.swift
//  TouchDown
//
//  Created by Toheed Jahan Khan on 18/01/24.
//

import SwiftUI

struct CategoryGridView: View {
    // MARK: - PROPERTY
    
    // MARK: - BODY
    
    var body: some View {
      ScrollView(.horizontal, showsIndicators: false, content: {
          /*
           This code creates a two row lazy horizontal grid layout.
           What is worth to mention there is the fixed height.
           Since lazy edge grid are pushed out views vertically, therefore a vertical alignment or some fixed size constraints is useful.
           */
        LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
            Section(
              header: SectionView(rotateClockwise: false),
              footer: SectionView(rotateClockwise: true)
            ) {
              ForEach(categories) { category in
                CategoryItemView(category: category)
              }
            }
        }) //: GRID
        .frame(height: 140)
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
      }) //: SCROLL
    }
  }

  // MARK: - PREVIEW

  struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
      CategoryGridView()
        .previewLayout(.sizeThatFits)
        .padding()
        .background(colorBackground)
    }
  }
