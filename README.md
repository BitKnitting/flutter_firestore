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

## Challenges with the firestore plugin 

I go to the [web page for Dart Packages](https://pub.dartlang.org/) and look up firestore.  I go to cloud_firestore 's  Installing page and use `cloud_firestore: ^0.9.0`.  This causes compile and build problems.  To fix these:
- go to android/app/gradle.properties and add:  
```
android.useAndroidX=true
android.enableJetifier=true
```
- go to android/app/build.gradle and change to `targetSdkVersion 28` and `compileSdkVersion 28`