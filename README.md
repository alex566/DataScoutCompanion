# DataScoutCompanion

### Embeddable SwiftData Inspector into your app
DataScoutCompanion is a lightweight, embeddable Swift package that provides a UI to inspect the contents of your SwiftData/CoreData/SQLite stores at runtime. It ships as a drop‑in Swift Package, integrates seamlessly into SwiftUI, and lets you visualize and debug your data model without leaving your app.
This package is planned as a companion to the macOS app for debugging SwiftData [DataScout](https://apps.apple.com/us/app/datascout-for-swiftdata/id6737813684) and will be used in the future to support data synchronization between devices.

![screenshot](https://github.com/user-attachments/assets/92d4b247-0526-4908-babf-8fbb91ba5d03)

## 📦 Installation
Add DataScoutCompanion to your project:
1. In Xcode, choose File > Add Package Dependencies...
2. Enter the repository URL:
```
https://github.com/alex566/DataScoutCompanion.git
```
3. Set the version requirement.
4. Add the DataScoutCompanion package to your app target.

## 🎯 Usage
Everything you need to do is present DatabaseBrowser:

```Swift
import SwiftUI
import DataScoutCompanion

struct YourRootView: View {
    @State private var isBrowserPresented = false

    var body: some View {
        YourContentView()
            .toolbar {
                Button(action: { isBrowserPresented = true }) {
                    Image(systemName: "tablecells")
                }
            }
            .sheet(isPresented: $isBrowserPresented) {
                DatabaseBrowser()
            }
    }
}
```
