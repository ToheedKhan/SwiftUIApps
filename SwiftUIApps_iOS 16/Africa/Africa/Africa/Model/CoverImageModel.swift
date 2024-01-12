//
//  CoverImageModel.swift
//  Africa
//
//  Created by Toheed Jahan Khan on 12/01/24.
//

import SwiftUI

/*
 Codable - Parsing
 Identifiable - Populating
 */
struct CoverImage: Codable, Identifiable {
    let id: Int
    let name: String
}
