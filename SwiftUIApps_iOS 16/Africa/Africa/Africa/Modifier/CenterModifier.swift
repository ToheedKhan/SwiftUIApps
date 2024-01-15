//
//  CenterModifier.swift
//  Africa
//
//  Created by Toheed Jahan Khan on 15/01/24.
//

import SwiftUI
/*
 A custom swift UI view modifier that you
 can reuse as many times as you wish.
 */
struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
