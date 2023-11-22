//
//  CustomListRowView.swift
//  HikeApp
//
//  Created by Toheed Jahan Khan on 22/11/23.
//

import SwiftUI

struct CustomListRowView: View {
    // MARK: - PROPERTIES
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent {
            // Content
            if rowContent != nil {
              Text(rowContent!)
                .foregroundColor(.primary)
                .fontWeight(.heavy)
            } else if (rowLinkLabel != nil && rowLinkDestination != nil) {
              Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                .foregroundColor(.pink)
                .fontWeight(.heavy)
            } else {
              EmptyView()
            }
          } label: {
         //Label
         HStack {
         ZStack {
         RoundedRectangle(cornerRadius: 8).frame(width: 30, height: 30)
         .foregroundColor(rowTintColor)
         Image(systemName: rowIcon)
         .foregroundColor(.white)
         .fontWeight(.semibold)
         
         }
         Text(rowLabel)
         }//: HStack
         }//: label
    }
}

struct CustomListRowView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CustomListRowView(
              rowLabel: "iOS Developer",
              rowIcon: "globe",
              rowContent: nil,
              rowTintColor: .pink,
              rowLinkLabel: "TJK",
              rowLinkDestination: "https://www.google.com"
            )
          }
    }
}
