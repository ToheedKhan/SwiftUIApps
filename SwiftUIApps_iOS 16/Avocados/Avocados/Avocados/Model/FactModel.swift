//
//  FactModel.swift
//  Avocados
//
//  Created by Toheed Jahan Khan on 21/02/24.
//


import SwiftUI

// MARK: - FACT MODEL

struct Fact: Identifiable {
  var id = UUID()
  var image: String
  var content: String
}
