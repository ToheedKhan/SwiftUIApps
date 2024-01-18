//
//  ProductDetailView.swift
//  TouchDown
//
//  Created by Toheed Jahan Khan on 18/01/24.
//

import SwiftUI

struct ProductDetailView: View {
    // MARK: - PROPERTY
    
    
    // MARK: - BODY
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5, content: {
            // NAVBAR
            NavigationBarDetailView()
                .padding(.horizontal)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            // HEADER
            HeaderDetailView()
                .padding(.horizontal)
            
            // DETAIL TOP PART
            
            TopPartDetailView()
                .padding(.horizontal)
            
            // DETAIL BOTTOM PART
            // RATINGS + SIZES
            
            
            // DESCRIPTION
            
            
            // QUANTITY + FAVOURITE
                .padding(.vertical, 10)
            
            // ADD TO CART
            Spacer()
        }) //: VSTACK
        .ignoresSafeArea(.all, edges: .all)
        .background(
            Color(
                red: sampleProduct.red,
                green: sampleProduct.green,
                blue: sampleProduct.blue
            ).ignoresSafeArea(.all, edges: .all)
        )
    }
}

// MARK: - PREVIEW

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .previewLayout(.fixed(width: 375, height: 812))
    }
}
