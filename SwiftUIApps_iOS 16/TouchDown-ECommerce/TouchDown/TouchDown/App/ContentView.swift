//
//  ContentView.swift
//  TouchDown
//
//  Created by Toheed Jahan Khan on 15/01/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    /* Notice how the show property isn't given a default value by using the Add environment object property wrapper.
     We are seeing the swift UI environment to provide that value rather than explicitly created by this view.
     From now this view can access the showing product and the selected product properties.
     */
    @EnvironmentObject var shop: Shop
    
    // MARK: - FUNCTIONS
    
    private func getWindowScene() -> UIWindowScene? {
        return UIApplication.shared.connectedScenes.first as? UIWindowScene
    }
    
    // MARK: - BODY
    var body: some View {
        /*
         a conditional statement in such a way that we can either show the home view or the product detail view on the screen.
         */
        /*
         fold  code in xcode option+command+<-
         */
        ZStack {/*
                 If users select no product and the product view is also not shown, then users will see the home view on the screen.
                 */
            if shop.showingProduct == false && shop.selectedProduct == nil {
                VStack(spacing: 0) {
                    NavigationBarView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                    //                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .padding(.top, getWindowScene()?.windows.first?.safeAreaInsets.top)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                    
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 0) {
                            FeaturedTabView()
                                .frame(height: UIScreen.main.bounds.width / 1.475)
                                .padding(.vertical, 20)
                            CategoryGridView()
                            
                            TitleView(title: "Helmets")
                            
                            LazyVGrid(columns: gridLayout, spacing: 15, content: {
                                ForEach(products) { product in
                                    ProductItemView(product: product)
                                        .onTapGesture {
                                    
                                            withAnimation(.easeOut) {
                                                shop.selectedProduct = product
                                                shop.showingProduct = true
                                            }
                                        }
                                } //: LOOP
                            }) //: GRID
                            .padding(15)
                            
                            TitleView(title: "Brands")
                            
                            BrandGridView()
                            
                            FooterView()
                                .padding(.horizontal)
                        } //: VSTACK
                    }) //: SCROLL
                    
                } //: VSTACK
                //By doing this, it will be white till top of the screen
                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            } else {
                ProductDetailView()
            }
            
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
            .previewDevice("iPhone 12 Pro")
            .environmentObject(Shop())
    }
}
