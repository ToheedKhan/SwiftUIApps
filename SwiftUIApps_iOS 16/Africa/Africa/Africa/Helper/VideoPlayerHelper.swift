//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Toheed Jahan Khan on 12/01/24.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

//Common utility function that will auto play any provided video file.
func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
  if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
    videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
    videoPlayer?.play()
  }
  return videoPlayer!
}