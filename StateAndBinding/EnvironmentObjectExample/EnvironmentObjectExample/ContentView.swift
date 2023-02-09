//
//  ContentView.swift
//  EnvironmentObjectExample
//
//  Created by Toheed on 09/02/23.
//

import SwiftUI
/*
 So if you see that the content view, as well as a final or fancy score of you, both of them are actually
 updating the same score.
 This means that you can use this user settings or put the score somewhere common so that both can access
 it.
 And not only these two can access it, but if you have another controls somewhere down in the hierarchy,
 all of them can actually access the environment, object and read the updated value from there.
 */

/*
 So in this case, the user settings will be shared between the content view and the fancy score view.
 But if there were some other controls which are like the child or grandchild of content view or even
 the fancy score view, they can still use the environment object.
 */
struct ContentView: View {
    
//    @ObservedObject var userSettings = UserSettings()
    
    //environment object will automatically be populated, so we don't really need to initialize it here
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        VStack {
            Text("\(self.userSettings.score)")
                .font(.largeTitle)
            Button("Increment Score") {
                self.userSettings.score += 1
            }
            
            //Fancy score view can update this property
//            FancyScoreView(score: self.$userSettings.score)
            FancyScoreView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
