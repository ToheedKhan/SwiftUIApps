//
//  MainView.swift
//  Africa
//
//  Created by Toheed Jahan Khan on 11/01/24.
//

import SwiftUI

struct MainView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                } //: ContentView tab
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                } //: VideoListView tab
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                } //: MapView tab
            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }//: GalleryView tab
        } //: TAB
    }
}
//MARK: PREVIEW

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
