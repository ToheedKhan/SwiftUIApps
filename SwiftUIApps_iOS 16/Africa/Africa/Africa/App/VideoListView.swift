//
//  VideoListView.swift
//  Africa
//
//  Created by Toheed Jahan Khan on 11/01/24.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - PROPERTIES
    /*
     Our goal is to develop a new shuffle feature with a button.
     So when users tap on the toolbar button, then the videos in this list will be shuffled like in the
     Apple Music app.
     */
    /*
     video property is a value type and we cannot modify by default.
     We can solve it by adding the @State property wrapper to it so it will be immutable.
     */
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - BODY

    var body: some View {
        NavigationView {
          List {
            ForEach(videos) { item in
              NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                VideoListItemView(video: item)
                  .padding(.vertical, 8)
              }
            } //: LOOP
          } //: LIST
          .listStyle(InsetGroupedListStyle())
          .navigationBarTitle("Videos", displayMode: .inline)
          .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
              Button(action: {
                // Shuffle videos
                videos.shuffle()
                hapticImpact.impactOccurred()
              }) {
                Image(systemName: "arrow.2.squarepath")
              }
            }
          }
        } //: NAVIGATION
      }
}

//MARK: PREVIEW

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
          .previewDevice("iPhone 12 Pro")
      }
}
