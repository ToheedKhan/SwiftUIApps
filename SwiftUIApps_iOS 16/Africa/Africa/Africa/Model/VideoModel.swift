//
//  VideoModel.swift
//  Africa
//
//  Created by Toheed Jahan Khan on 12/01/24.
//

import Foundation

struct Video: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  
  // Computed Property
  var thumbnail: String {
    "video-\(id)"
  }
}
