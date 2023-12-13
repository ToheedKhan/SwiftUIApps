//
//  PageModel.swift
//  PinchApp
//
//  Created by Toheed Jahan Khan on 13/12/23.
//

import Foundation

struct Page: Identifiable {
  let id: Int
  let imageName: String
}

extension Page {
  var thumbnailName: String {
    return "thumb-" + imageName
  }
}
