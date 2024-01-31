//
//  ContentView.swift
//  Devote
//
//  Created by Toheed Jahan Khan on 19/01/24.
//

import SwiftUI
import CoreData
/*
 CoreData template problem -
 So the problem with this layout is that it's trying to use the new toolbar API, but to do it in the
 right way is to add a navigation bar first.
 */

/*
 Since we have already injected our managed object context into the swift UI environment.
 Therefore, we can here add an at environment property to contentview to read the managed object context right out.
 Keep in mind that this shared context is required for saving, deleting and some other tasks.
 
 Fetch requests allow us to load core data results that match the specific criteria we specify,
 and swift UI can bind those results directly to user interface elements.
 The at Fetchrequest property wrapper could potentially have four parameters. Such an entity, a sort descriptor, a predicate, and an animation parameter.
 1.The entity is what we want to query.
 2- the sort descriptor determines the order in which results are returned.
 3- With the predicate, we can filter the data.
 4- Animation is used for any changes to the fetched result.
 Xcode's Default core data template uses only the sort descriptors and the animation.
 */
struct ContentView: View {
    // MARK: - PROPERTY
    @State var task: String = ""
  
    // FETCHING DATA
    @Environment(\.managedObjectContext) private var viewContext
    
    // FETCHING DATA
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    // MARK: - FUNCTION
    
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(items) { item in
                            VStack(alignment: .leading) {
                                Text(item.task ?? "")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                
                                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                
                            } //: VSTACK - LIST ITEM
                        }
                        .onDelete(perform: deleteItems)
                    } //: LIST
                    .listRowBackground(Color.green)
                    .listStyle(InsetGroupedListStyle())
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
                    .padding(.vertical, 0)
                    .frame(maxWidth: 640)
                } //: VSTACK
            } //: ZSTACK
            /*
             remove the background color from this new list.
             */
            .onAppear(){
                UITableView.appearance().separatorStyle = .none
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
            .navigationBarTitle("Daily Tasks", displayMode: .large)
            .toolbar {
                //#if os(iOS)
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                //#endif
            } //: TOOLBAR
            .background(BackgroundImageView())
            .background(
                backgroundGradient.ignoresSafeArea(.all))
        } //: NAVIGATION
        //we will support the iPad devices by adding a new modifier to the navigation view.
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
