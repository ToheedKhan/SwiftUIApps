# Pinch-App

<img width="821" alt="Screenshot 2023-12-07 at 1 51 52 PM" src="https://github.com/ToheedKhan/SwiftUIApps/assets/4839453/55d47b37-3b8c-4d5d-949a-7e722826ed28">

## Pinch gesture
You can move the two gray circles that represent your fingers around the screen by holding **`Option`**  and  **`Shift`** and moving the mouse.

Pinch **`Option`** + click


## SF SYMBOL

There are 4 different rendering modes.
**Monochrome**
It applies one color to all symbols within a symbol paths render in the color we specify.
**Hierarchical**
This rendering mode assigns a different opacity of a single color to each layer, creating a visual hierarchy that gives depth to the symbol.
**Palette**
Which applies two or more contrasting colors to each symbol, using one color per layer, specifying only two colors.
For a symbol that defines three levels of hierarchy means the secondary and tertiary layers use the same color.
**Multi color**
This is available for only a smaller pool of symbols.
This multi color rendering applies system defined intrinsic colors to some symbols to enhance meaning.

![SF Symbol Rendering Modes](https://github.com/ToheedKhan/SwiftUIApps/assets/4839453/27c069e1-cd58-4eae-bc87-285bcc131784)

## Swift UI Page Thumbnails
In this feature there are two thumbnails of the cover images in the drawer, and we can switch between them by clicking them.
While we are developing this new feature, we will also learn about the importance of data fetching and modeling.
In this below topis have been covered
* DataModel
* Local Data File
* Data Fetching
* Extension
* UI Design

Thumbnail images are minified versions of the extremely large cover images.
And before we start coding, you should understand why we need to use separate files inside the draw
when displaying an image in a swift UI.
We can use The View's **Content Mode** property to scale down the picture automatically.
However, when the native image size is much larger than the bounds of the view to coating, the full
size image creates **unnecessary memory overhead.**
You could imagine the burden on the computing power when we use not only two, but much more images
in the draw by providing a thumbnail image at a specified scaled down size.
We can avoid the overhead of decoding the image to its full extent.

In **UIkit framework** a particular method is available called preparedThumbnail.
This method asynchronously creates the thumbnail image on a background thread and calls the completion handler on that thread.

Unfortunately, this is not available in SwiftUI as of now.
