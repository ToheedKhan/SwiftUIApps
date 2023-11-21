# Swift Data: The Future of Data Persistence in SwiftUI
The new SwiftData framework makes it easy to persist data using declarative code. You can query and filter data using regular Swift code. And it’s designed to integrate seamlessly with SwiftUI.

## Create models with Swift
Model your data using regular Swift types with @Model, with no additional files or tools to manage. SwiftData can automatically infer many relationships and you can use clear declarations like `@Attribute(.unique)` to describe constraints. Like SwiftUI, the source of truth is in your code.


`
@Model
class Recipe {
    @Attribute(.unique) var name: String
    var summary: String?
    var ingredients: [Ingredient]
}
`

## Automatic persistence
SwiftData builds a custom schema using your models and maps their fields efficiently to the underlying storage. Objects managed by SwiftData are fetched from the database when needed and automatically saved at the right moment, with no additional work on your part. You can also take full control using the ModelContext API.



## Integrates with SwiftUI
Use `@Query` in your SwiftUI views to fetch data. SwiftData and SwiftUI work together to provide live updates to your views when the underlying data changes, with no need to manually refresh the results.


`
@Query var recipes: [Recipe]
var body: some View {
    List(recipes) { recipe in
        NavigationLink(recipe.name, destination: RecipeView(recipe))
    }
}
`


## Swift-native predicates
Query and filter your data using expressions that are type-checked by the compiler so you can catch typos and mistakes during development. Predicates provide compile-time errors when your expressions can’t be mapped to the underlying storage engine.


`
let simpleFood = #Predicate<Recipe> { recipe in
    recipe.ingredients.count < 3
}
`

## CloudKit syncing
Your data can be stored in files using DocumentGroup and synced via iCloud Drive, or you can use CloudKit to sync data between devices.



## Compatible with Core Data
SwiftData uses the proven storage architecture of Core Data, so you can use both in the same app with the same underlying storage. When you’re ready, Xcode can convert your Core Data models into classes for use with SwiftData.

