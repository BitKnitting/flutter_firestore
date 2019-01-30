# flutter_firestore

In this project I learn how to connect to, add, and read data to a Firestore backend.  The app displays some cards.  Each card contains text that was stored in Firestore.

## Connect iOS and Android
The first step in any Firebase backend app is to associate the unique ids created for iOS and Android when the Flutter app was created.
### Bundle ID
#### Android
The Android Id is found in android/app/src/AndroidManifest.xml.  The YouTube video, [_Using Firestore as a backend to your Flutter app_](https://www.youtube.com/watch?v=DqJ_KjFzL9I) gives us a visual.  For this app, the android package id is:  
```
 package="com.example.flutterfirestore">
 ```
 Next we download the `google-services.json` file and put it in the `android\app` directory.

 ##### Letting Gradle Know
There are two gradle files that need to be modified:
- android/app/build.gradle  
  - add `implementation 'com.google.firebase:firebase-core:16.0.1'` to the dependencies section.
  - put `apply plugin: 'com.google.gms.google-services'` as the last line of the file.  
- android/build.gradle  
  - add `classpath 'com.google.gms:google-services:4.0.1'` to the dependencies section.
 #### iOS
 For iOS, open the Runner.xcodeproject.  Highlight the Runner project to get to the Bundle Identifier.  Ours is:  
 ```
 com.example.flutterFirestore
 ```
 When the iOS bundle id is entered, the `GoogleService-Info.plist` is created.  This file needs to be downloaded and installed within XCode within the Runner directory.

## Firestore Backend
I created the learning firestore project

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
