//
//  FructusApp.swift
//  Fructus
//
//  Created by Toheed Jahan Khan on 13/12/23.
//

import SwiftUI

/*
 The app main attribute is a new feature in Swift 5.3 programming language that allows a type to serve as an entry point of the execution of the program.
 Normally, a Swift program would require a main swift file to execute.
 Now, with this admin attribute, we can delegate that responsibility and our program automatically
 performs all the necessary setup on launch to get our app to appear on the screen.
 */
@main
struct FructusApp: App {
    /*Fructus application struct is conforming to the new app protocol API.
    And here is another new feature in swift UI.
    As you may notice, this app declaration looks similar to a common view declaration in Swift UI.
    For example, both views and apps can declare that are dependencies.
    An app, however, is built using scenes and so its body property returns a scene instead of a view.
    And finally we find a new window group scene inside this body as well. */
    
    /*
     @AppStorage Property wrapper?
     First, the app storage is Swift UI's new dedicated property wrapper for reading values from Userdefaults.
     Second, this property wrapper automatically invalidates the app's body property on a value change and
     refresh its UI immediately.
     This app storage uses the Userdefaults data storage, which is ideal for storing small pieces of information
     about the app, such as different kinds of settings, utilities, etcetera.
     
     The real benefit of this new app storage is that it not only reads and writes data into the user defaults,
     but it always watches each value change of the key.
     And when a value change is happening, then it updates the UI immediately.
     */
    @AppStorage("isOnboarding") var isOnboarding: Bool = true

    var body: some Scene {
        /*
         Our onboarding view is contained within a scene called Window Group.
         The window group scene manages the window that are onboarding will render into.
         It can also create additional windows within the same window.
         This is where we will develop the logic that will control which views should be rendered the initial
         onboarding view or the content view.
         To wrap up this short introductory, this window group scene manages our main user interface in the
         new Swift UI app lifecycle.
         */
        WindowGroup {
            if isOnboarding {
              OnboardingView()
            } else {
              ContentView()
            }
        }
    }
}
