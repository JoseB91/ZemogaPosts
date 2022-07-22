# ZemogaPosts

1. Running the App
To run the app is not necessary to install any Cocoa Pod.  
The Swift Package Manager will load the external libraries related to Realm.  

2. Architecture
The app uses an MVVM architecture.  

The ViewModels conform to protocols and uses dependency injection in order to be testables.  
The service layer is injected in the ViewModels and then the UI uses binding properties to update the state of data.
The data is also persisted locally using Realm.
SwiftUI framework is used for UI implementation.

3. Extras:
Cache managed with Realm.
Unit tests implemented with XCTest framework.

