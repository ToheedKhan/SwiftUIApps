//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Toheed Jahan Khan on 26/01/24.
//

import SwiftUI
/* Preferred Color scheme for built-in UI elements - Automatic
 For Custom component - Manual Switch
 
 Using the preferred color scheme is ideal for all swift UI's built in user interface elements.
It will switch from one mode to another one automatically.
But when it comes to any custom design, then we have to manage it manually.
This is why we must work on this new task item component a little bit.
 */
struct NewTaskItemView: View {
    // MARK: - PROPERTY
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @Environment(\.managedObjectContext) private var viewContext
    @State private var task: String = ""
    @Binding var isShowing: Bool

    private var isButtonDisabled: Bool {
      task.isEmpty
    }
    
    // MARK: - FUNCTION
    
    private func addItem() {
      withAnimation {
        let newItem = Item(context: viewContext)
        newItem.timestamp = Date()
        newItem.task = task
        newItem.completion = false
        newItem.id = UUID()

        do {
          try viewContext.save()
        } catch {
          let nsError = error as NSError
          fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }

        task = ""
        hideKeyboard()
        isShowing = false
      }
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16) {
                TextField("New task", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(
                        isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                      )
                    .cornerRadius(10)
                
                Button(action:  {
                    print(isButtonDisabled)
                    
                    addItem()
                }, label: {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                })
                .disabled(isButtonDisabled)
                .padding()
                .foregroundColor(.white)
                .background(isButtonDisabled ? Color.blue : Color.pink)
                .cornerRadius(10)
            } //: VSTACK
            .padding()
            .padding(.vertical, 20)
            .background(
                isDarkMode ? Color(UIColor.secondarySystemBackground) : Color.white
              )
            .cornerRadius(16)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
            .frame(maxWidth: 640)

        } //: VSTACK
    }
}

struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .previewDevice("iPhone 12 Pro")
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}
