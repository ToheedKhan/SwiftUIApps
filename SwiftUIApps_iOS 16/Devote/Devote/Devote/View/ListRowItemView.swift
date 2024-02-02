//
//  ListRowItemView.swift
//  Devote
//
//  Created by Toheed Jahan Khan on 02/02/24.
//

import SwiftUI

/*
 Typical core data application follows the CRUD design idea.
 This Crud acronym stands for the Create Read Update and delete programming concepts.
 Xcode's Default Core Data Project template is using only **three of these Crud pattern until this point.**
 We can create and save any new task items as we wish to the permanent store.
 We can also read and fetch all task items from this store and display them in a list view.
 we can delete any task item which we want.
 Only one thing is missing to make this application well-rounded.
 
 The only feature that this app is lacking is the update operation,
 and we're going to develop this specific functionality by adding the completion feature with a toggle slash checkbox UI element.
 
 But to do that, we need to declare an item property that **observes** and saves all checkbox changes every time we toggle the checkbox from false to true or vice versa.
 Then this observed object will invalidate the view and its value.
 */

struct ListRowItemView: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    
    var body: some View {
        //The toggle UI element indicates whether the task item is completed or isn't.
      Toggle(isOn: $item.completion) {
        Text(item.task ?? "")
          .font(.system(.title2, design: .rounded))
          .fontWeight(.heavy)
          .foregroundColor(item.completion ? Color.pink : Color.primary)
          .padding(.vertical, 12)
          .animation(.default)
      } //: TOGGLE
        ///To add the update functionality to it. First parameter is Publisher parameter, 2 is action parameter
        ///
        /*
         onReceived modifier consists of 2 parameters, and with these parts it adds
         an action to perform each time when the view detects any change.
         So the first parameter is the item object will change.
         It is a publisher to subscribe to.
         Every time there is a change, then it will run the given action.
         The second parameter is the action that is triggered each time when an event happens in the closure.
         We are trying to save the new value safely and update the store by doing that.
         In a nutshell, this is how this toggle works together with the core data framework.
         */
      .onReceive(item.objectWillChange, perform: { _ in
        if self.viewContext.hasChanges {
          try? self.viewContext.save()
        }
      })
    }
  }
/*
 /*Since we won't provide sample data for the individual task item, therefore we don't need to have a preview.*/
 */

