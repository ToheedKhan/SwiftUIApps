//
//  HeaderModel.swift
//  Avocados
//
//  Created by Toheed Jahan Khan on 21/02/24.
//

import SwiftUI

// MARK: - HEADER MODEL

struct Header: Identifiable {
  var id = UUID()
  var image: String
  var headline: String
  var subheadline: String
}
