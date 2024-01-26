//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Toheed Jahan Khan on 26/01/24.
//

import Foundation

import SwiftUI

#if canImport(UIKit)
extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
#endif
