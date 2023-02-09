//
//  FancyScoreView.swift
//  EnvironmentObjectExample
//
//  Created by Toheed on 09/02/23.
//

import SwiftUI

struct FancyScoreView: View {
    
//    @Binding var score: Int
    
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        VStack {
//            Text("\(self.score)")
            Text("\(self.userSettings.score)")
            
            Button("Increment Score") {
                self.userSettings.score += 1
//                self.score += 1
            }.padding().background(Color.green)
            
        }.padding().background(Color.orange)
    }
}

struct FancyScoreView_Previews: PreviewProvider {
    static var previews: some View {
        FancyScoreView()
//        FancyScoreView(score: .constant(0))
    }
}
