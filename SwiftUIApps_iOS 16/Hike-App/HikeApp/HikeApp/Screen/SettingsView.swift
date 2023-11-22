//
//  SettingsView.swift
//  HikeApp
//
//  Created by Toheed Jahan Khan on 22/11/23.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    private let alternateAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    
    var body: some View {
        List {
            // MARK: - SECTION: HEADER
            
            Section {
                HStack {
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editors' Choice")
                            .fontWeight(.medium)
                    } // :VStack
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                } //: HStack
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGreenLight,
                            .customGreenMedium,
                            .customGreenDark
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                } //: VStack Text
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            } //: Section
            .listRowSeparator(.hidden)
            
            // MARK: - SECTION: ICONS
            Section(header: Text("Alternate Icons")) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button {
                                print("Icon \(alternateAppIcons[item]) was pressed.")
                             //To change app icon
                                UIApplication.shared.setAlternateIconName("AppIcon-Campfire") { error in
                                  if error != nil {
                                    print("Failed request to update the app's icon: \(String(describing: error?.localizedDescription))")
                                  } else {
                                    print("Success! You have changed the app's icon to \(alternateAppIcons[item])")
                                  }
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview") //Preview icons size are smaller
//                                Image("\(alternateAppIcons[item])")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                        }.buttonStyle(.borderless)
                        }//: For-Each
                    }//: HStack
                    /*
                     In the last couple of years, developing swift UI applications, what I have found is that the list
                     view does not particularly work seamlessly with buttons to ensure the button action works correctly.
                     I highly recommend adding a borderless modifier to it.
                     */
                    
                }//: ScrollView
                .padding(.top, 12)
                
                Text("Choose your favourite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
                } //: SECTION
               .listRowSeparator(.hidden)
            
            // MARK: - SECTION: ABOUT
            
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack {
                    Spacer()
                    Text("Copyright © All right reserved.")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
                // 1. Basic Labeled Content
                // LabeledContent("Application", value: "Hike")
                
                // 2. Advanced Labeled Content
                /*LabeledContent {
                 //Content
                 Text("Hike")
                 .foregroundColor(.primary)
                 .fontWeight(.heavy)
                 } label: {
                 //Label
                 HStack {
                 ZStack {
                 RoundedRectangle(cornerRadius: 8).frame(width: 30, height: 30)
                 .foregroundColor(.blue)
                 Image(systemName: "apps.iphone")
                 .foregroundColor(.white)
                 .fontWeight(.semibold)
                 
                 }
                 Text("Application")
                 }//: HStack
                 }//: label
                 */
                
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "John Doe", rowTintColor: .mint)
                
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink)
                
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Google", rowLinkDestination: "https://www.google.com")
                
            }//: Section
            
        }//: List
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
