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

3. Extras  
Cache managed with Realm.
Unit tests implemented with XCTest framework.

![zp1](https://user-images.githubusercontent.com/5834201/180488952-24e51983-2984-4f83-8a3d-88e0169168d6.jpg)
![zp2](https://user-images.githubusercontent.com/5834201/180488974-87ab7a94-0d44-4e83-9f76-8954c1ee4b8e.jpg)
