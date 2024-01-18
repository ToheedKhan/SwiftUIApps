//
//  Shop.swift
//  TouchDown
//
//  Created by Toheed Jahan Khan on 18/01/24.
//

import Foundation
/*
 This observable object conformance allows instances of this class to be used inside any views we want,
 so when important changes happen, the view will reload.
 To make this work, we will need to tell the swift UI framework which data it should continuously watch and take care of.
 
 This add published property wrapper tells swift UI that any changes to these properties should trigger view reloads.
 
 We need to inject this **shop observable object** into the app's environment meant to share it across the whole application.
 */
class Shop: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: Product? //= nil
}
