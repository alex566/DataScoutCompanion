# DataScoutCompanion

### Embeddable SwiftData Inspector into your app
DataScoutCompanion is a lightweight, embeddable Swift package that provides a UI to inspect the contents of your SwiftData/CoreData/SQLite stores at runtime. It ships as a drop‑in Swift Package, integrates seamlessly into SwiftUI, and lets you visualize and debug your data model without leaving your app.

This package is planned as a companion to the macOS app for debugging SwiftData [DataScout](https://apps.apple.com/us/app/datascout-for-swiftdata/id6737813684) and will be used in the future to support synchronization between devices.

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

## 🛜 Remote debugging

1. Update Info.plist with the following keys:
```xml
    <key>NSBonjourServices</key>
    <array>
        <string>_datascout-sync._tcp</string>
    </array>
    <key>NSLocalNetworkUsageDescription</key>
    <string>To debug the database over the local network</string>
```

2. In your app’s startup code (e.g. in `AppDelegate` or `SceneDelegate`), import the package and call `startAdvertising`:

```swift
import DataScoutCompanion

func application(_ application: UIApplication,
                didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Option A: Pass an existing ModelContainer
    let myModelContainer = /* your ModelContainer instance */
    ConnectionService.shared.startAdvertising(container: myModelContainer)

    // Option B: Pass a file URL to your database
    let dbURL: URL = /* URL to your .sqlite3 file */
    ConnectionService.shared.startAdvertising(url: dbURL)

    return true
}
```

### 3. Use the Built-In Database Browser (Alternative)

If you’d rather broadcast from within the companion UI in your app:
1. **Open** the database you wish to debug.  
2. Go to the **Network Debugging** menu.  
2. Enable the **Discovery** checkbox for that database.
