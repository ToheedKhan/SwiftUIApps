//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Toheed Jahan Khan on 12/01/24.
//

import SwiftUI

struct AnimalDetailView: View {
    //MARK: - PROPERTIES
    let animal: Animal
    //MARK: - BODY

    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                
                // HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                // TITLE
                /*
                 In swift UI, a color is a view so we can add different modifiers to it, similarly
                to other UI components.
                 */
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(Color.accentColor.frame(height: 6)
                        .offset(y: 24)
                    )
                
                // HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // GALLERY
                /*
                 As you can notice, we put this new heading view inside a new group.
                 The reasoning behind it is that there is a limitation of how many views we can use together in a swiftUI file.
                 We can avoid this limitation using Groups.
                 */
                Group {
                   HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                // FACTS
                Group {
                   HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                // DESCRIPTION
                Group {
                  HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                  
                  Text(animal.description)
                    .multilineTextAlignment(.leading)
                    .layoutPriority(1)
                }
                .padding(.horizontal)

                // MAP
                Group {
                  HeadingView(headingImage: "map", headingText: "National Parks")
                  
                  InsetMapView()
                }
                .padding(.horizontal)
                
                // LINK
                
                Group {
                  HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                  
                  ExternalWeblinkView(animal: animal)
                }
                .padding(.horizontal)
                
            } //: VSTACK
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
            //This inline title looks very well with the back button on the navigation bar.

        } //: SCROLL
    }
}

//MARK: PREVIEW

struct AnimalDetailView_Previews: PreviewProvider {
    /*
     In order to see the navigation bar in the preview first we need to add it.
     */
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
        .previewDevice("iPhone 11 Pro")
    }
}
