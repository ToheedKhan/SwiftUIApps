//
//  ContentView.swift
//  PodcastPlayer
//
//  Created by Toheed on 09/02/23.
//

import SwiftUI

struct ContentView: View {
    let episode = Episode(name: "Macbreak Weekly", track: "WWDC 2019")

    @State private var isPlaying = false
    
    var body: some View {
        VStack {
            
            Text(self.episode.name)
                .font(.title)
                .foregroundColor(self.isPlaying ? .green : .black)
            
            Text(self.episode.track)
                .foregroundColor(.secondary)
            
            PlayButton(isPlaying: $isPlaying)
            
        }
    }
}
/*
 now this means that whenever the play button is going to change the property, the state is going
 to change.
 And when the state changes, it's going to go ahead and render everything again.
 */
struct PlayButton: View {
    
    @Binding var isPlaying: Bool
    
    var body: some View {
        
        Button(action: {
            self.isPlaying.toggle()
        }) {
            Text("Play")
        }.padding(12)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
