//
//  Constant.swift
//  TouchDown
//
//  Created by Toheed Jahan Khan on 15/01/24.
//
//Organize swift Global Constants
import SwiftUI
/*these are the most common types that we can find in
any real project.
 
 The benefit of using a constant property instead of using the name of the color set in our project everywhere
 is when we want to replace the color with another one.
 In that case, we can do it by modifying only this constant property, and we don't need to search for
 and replace every place where we use the name of the color set.
 The second benefit of using a constant property we don't have to type its long property value every single time when we want to use it.

 The third benefit is quite evident since we gather these global properties into one place, therefore
 we can manage them with ease.
 The third benefit is quite evident since we gather these global properties into one place, therefore
 we can manage them with ease.
 */

// DATA
let players: [Player] = Bundle.main.decode("player.json")
let categories: [Category] = Bundle.main.decode("category.json")


// COLOR

let colorBackground: Color = Color("ColorBackground")
let colorGray: Color = Color(UIColor.systemGray4)
let products: [Product] = Bundle.main.decode("product.json")
let brands: [Brand] = Bundle.main.decode("brand.json")

// LAYOUT
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
/*
 This grid layout will help us creating any two column vertical or any two row horizontal containers.
 */
var gridLayout: [GridItem] {
  return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}


// UX


// API
// IMAGE
// FONT
// STRING
// MISC
