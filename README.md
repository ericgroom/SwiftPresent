# SwiftPresent

A framework for writing presentations in SwiftUI on MacOS.

Currently pretty barebones, but it provides you with:
* A window with a hiding toolbar and 16:9 aspect ratio
* Scaling content according to the size of the window
* Context dependent keyboard shortcuts

## Example Code

```swift
import SwiftUI
import SwiftPresent

@main
struct MyPresentation: App {
    @State var slideIndex = 0
    
    var body: some Scene {
        Presentation {
            SlideTracker {
                if slideIndex == 0 {
                    Slide1()
                } else {
                    Slide2()
                }
            } nextSlide: {
                withAnimation { slideIndex += 1 } // SwiftUI presentations don't work in `App`, but will if you move this to a subview
            } previousSlide: {
                withAnimation { slideIndex -= 1 }
            }
        }
    }
}

struct Slide1: View {
    @Environment(\.presentationScale) var scale
    
    var body: some View {
        Text("Hello")
            .font(.system(size: 32 * scale))
    }
}

struct Slide2: View {
    @Environment(\.presentationScale) var scale
    
    var body: some View {
        Text("World")
            .font(.system(size: 32 * scale))
    }
}
```
