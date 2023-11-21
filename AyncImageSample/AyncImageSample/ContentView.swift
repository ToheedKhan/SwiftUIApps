//
//  ContentView.swift
//  AyncImageSample
//
//  Created by Toheed Jahan Khan on 21/11/23.
//

import SwiftUI

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        // MARK: 1. BASIC
        /*
         Once the remote image is completely downloaded, Async Image displays this image in its original size.
         */
//        AsyncImage(url: URL(string: imageURL))
        
        // MARK: - 2. SCALE
        
         AsyncImage(url: URL(string: imageURL), scale: 3.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    /*
     Preview is a gray placeholder.
     */
    
    /*The reason behind it is since the URL is optional. Therefore, the Async Image will show a default gray placeholder if the URL string is invalid.
     
    And if the image can't be loaded for some reason, for example, if the user is offline or the image doesn't exist, then the system will continue showing the same placeholder image.
     */
    static var previews: some View {
        ContentView()
    }
}
