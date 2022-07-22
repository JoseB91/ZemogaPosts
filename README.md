# ZemogaPosts

1. Running the App  
Before running the app is necessary to add Realm libraries with **Swift Package Manager**.  
You can do this in Xcode via **File/Add Packages...**  
Here you need to add "https://github.com/realm/realm-swift.git", click in **Add Package** and then select Realm and RealmSwift libraries.  
Now you can run the app.  

2. Architecture  
The app uses an **MVVM** architecture.  
The ViewModels conform to **protocols** and uses **dependency injection** in order to be testables.  
The **service dependency** is injected in the ViewModels and then the UI uses binding properties to update the state of data.  
The data is persisted locally using **Realm**.
**SwiftUI** framework is used for UI implementation.

3. Extras  
**Cache** managed with Realm.  
**Unit tests** implemented with XCTest framework.
