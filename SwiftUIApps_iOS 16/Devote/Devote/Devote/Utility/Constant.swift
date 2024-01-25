//
//  Constant.swift
//  Devote
//
//  Created by Toheed Jahan Khan on 24/01/24.
//

import Foundation

// MARK: - FORMATTER

let itemFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateStyle = .short
  formatter.timeStyle = .medium
  return formatter
}()
