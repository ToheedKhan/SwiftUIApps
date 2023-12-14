//
//  OnboardingView.swift
//  Fructus
//
//  Created by Toheed Jahan Khan on 14/12/23.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    
//    var fruits: [Fruit] = fruitsData
    
    // MARK: - BODY
    
    var body: some View {
        TabView {
            ForEach(0..<5) { item in
//              FruitCardView()
                Text("Cards")
            } //: LOOP
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

// MARK: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
