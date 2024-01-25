//
//  Persistence.swift
//  Devote
//
//  Created by Toheed Jahan Khan on 19/01/24.
//

import CoreData
/*
 The persistent swift file and the devote data model files aren't real data model files, but they fall into the data model and storage category.
 */

/*
 This persistence controller is our starter point.
 */
struct PersistenceController {
    // MARK: - 1. PERSISTENT CONTROLLER
    static let shared = PersistenceController()
    
    // MARK: - 2. PERSISTENT CONTAINER
    let container: NSPersistentContainer
    
    // MARK: - 4. PREVIEW
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for i in 0..<5 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = "Sample task No\(i)"
            newItem.completion = false
            newItem.id = UUID()
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    // MARK: - 3. INITIALIZATION (load the persistent store)
/*
 with this in-memory conditional state, we can access the non disk storage.
It's perfect for unit testing and for using it in the swift UI preview.
 we load the persistent store using basic error handling and depending on if the in-memory
 is true or false, we can get access to the content of either the temporary or the disk based SQLite
 store.
 */
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Devote")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
               
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
