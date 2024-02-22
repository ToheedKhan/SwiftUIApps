//
//  RipeningModel.swift
//  Avocados
//
//  Created by Toheed Jahan Khan on 22/02/24.
//

import Foundation

// MARK: RIPENING MODEL

struct Ripening: Identifiable {
  var id = UUID()
  var image: String
  var stage: String
  var title: String
  var description: String
  var ripeness: String
  var instruction: String
}
