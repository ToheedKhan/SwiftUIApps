//
//  SettingsView.swift
//  Fructus
//
//  Created by Toheed Jahan Khan on 14/12/23.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    /*
     This Property wrapper allows us to create properties that store values provided to us externally.
     For example, is the user in light mode or dark mode?
     What time zone are they on? etc
     
     All this information and more are values that come from the environment of the device.
     In this instance, we are going to read our views presentation mode from the environment.
     
     The presentation mode of a view contains only two pieces of data, but both are useful.
     A property storing whether the settings view is currently presented on the screen and a method to let
     us dismiss the view immediately.
     This recently created presentation mode property is attached to the presentation mode variable stored
     in the app's environment.
     */
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
          ScrollView(.vertical, showsIndicators: false) {

              VStack(spacing: 20) {
                  // MARK: - SECTION 1
                  
                  GroupBox(
                    label:
                        SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
                  ) {
                      Divider().padding(.vertical, 4)
                      
                      HStack(alignment: .center, spacing: 10) {
                          Image("logo")
                              .resizable()
                              .scaledToFit()
                              .frame(width: 80, height: 80)
                              .cornerRadius(9)
                          
                          Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                              .font(.footnote)
                      } //: HSTACK

                  }
                  // MARK: - SECTION 2
                  
                  // MARK: - SECTION 3
                  GroupBox(
                    label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                  ) {
                      SettingsRowView(name: "Developer", content: "John / Jane")
                      SettingsRowView(name: "Designer", content: "Robert Petras")
                      SettingsRowView(name: "Compatibility", content: "iOS 14")
                      SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                      SettingsRowView(name: "Twitter", linkLabel: "@RobertPetras", linkDestination: "twitter.com/robertpetras")
                      SettingsRowView(name: "SwiftUI", content: "2.0")
                      SettingsRowView(name: "Version", content: "1.1.0")
                  } //: BOX
                 

              } //: VSTACK
              .navigationBarTitle(Text("Settings"), displayMode: .large)
              .navigationBarItems(
                trailing:
                  Button(action: {
                    presentationMode.wrappedValue.dismiss()
                  }) {
                    Image(systemName: "xmark")
                  }
              )
              .padding()
          } //: SCROLL
        } //: NAVIGATION
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
