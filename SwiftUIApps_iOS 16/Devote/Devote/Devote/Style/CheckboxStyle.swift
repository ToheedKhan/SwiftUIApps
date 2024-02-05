//
//  CheckboxStyle.swift
//  Devote
//
//  Created by Toheed Jahan Khan on 02/02/24.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {
  func makeBody(configuration: Configuration) -> some View {
    return HStack {
      Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
        .foregroundColor(configuration.isOn ? .pink : .primary)
        .font(.system(size: 30, weight: .semibold, design: .rounded))
        .onTapGesture {
            configuration.isOn.toggle()
            feedback.notificationOccurred(.success)
            
            if configuration.isOn {
              playSound(sound: "sound-rise", type: "mp3")
            } else {
              playSound(sound: "sound-tap", type: "mp3")
            }
        }//: TAP
        configuration.label
    } //: HSTACK
  }
}

struct CheckboxStyle_Previews: PreviewProvider {
  static var previews: some View {
      /*
       Since we will develop a new style for swift UI's.
       Toggle element.
       Therefore, the best way to use the preview is to insert a new toggle element with our custom style.
       */
    Toggle("Placeholder label", isOn: .constant(false))
      .toggleStyle(CheckboxStyle())
      .padding()
      .previewLayout(.sizeThatFits)
  }
}
