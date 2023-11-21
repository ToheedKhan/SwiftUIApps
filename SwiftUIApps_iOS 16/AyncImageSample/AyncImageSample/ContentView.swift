//
//  ContentView.swift
//  AyncImageSample
//
//  Created by Toheed Jahan Khan on 21/11/23.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
      self
        .imageModifier()
        .frame(maxWidth: 128)
        .foregroundColor(.purple)
        .opacity(0.5)
    }
}

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        // MARK: 1. BASIC
        /*
         Once the remote image is completely downloaded, Async Image displays this image in its original size.
         */
//        AsyncImage(url: URL(string: imageURL))
        
        // MARK: - 2. SCALE
        
//         AsyncImage(url: URL(string: imageURL), scale: 3.0)
        
        // MARK: - 3. PLACEHOLDER
        
//        AsyncImage(url: URL(string: imageURL)) { image in
//          image.imageModifier()
//        } placeholder: {
//          Image(systemName: "photo.circle.fill").iconModifier()
//        }
//        .padding(40)
        
        // MARK: - 4. PHASE
        
        /*
        AsyncImage(url: URL(string: imageURL)) { phase in
          // SUCCESS: The image successfully loaded.
          // FAILURE: The image failed to load with an error.
          // EMPTY: No image is loaded.
          
          if let image = phase.image {
            image.imageModifier()
          } else if phase.error != nil {
            Image(systemName: "ant.circle.fill").iconModifier()
          } else {
            Image(systemName: "photo.circle.fill").iconModifier()
          }
        }
        .padding(40)
        */
        
        // MARK: - 5. ANIMATION
        
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
          switch phase {
          case .success(let image):
            image
              .imageModifier()
//               .transition(.move(edge: .bottom))
//               .transition(.slide)
              .transition(.scale)
          case .failure(_):
            Image(systemName: "ant.circle.fill").iconModifier()
          case .empty:
            Image(systemName: "photo.circle.fill").iconModifier()
          @unknown default:
            ProgressView()
          }
        }
        .padding(40)
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
