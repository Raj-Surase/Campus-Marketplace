// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGJt8P9B9TwT0Ny1xyQcjljHrqlHdkAdo',
    appId: '1:893861858775:android:414e2d8000f4df9c088f92',
    messagingSenderId: '893861858775',
    projectId: 'campus-marketplace-ee0ae',
    storageBucket: 'campus-marketplace-ee0ae.firebasestorage.app',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDapGMgnkZEmrZmMfMvA_JZvC-PRSWMWO8',
    appId: '1:893861858775:web:8cda1629f46f45b9088f92',
    messagingSenderId: '893861858775',
    projectId: 'campus-marketplace-ee0ae',
    authDomain: 'campus-marketplace-ee0ae.firebaseapp.com',
    storageBucket: 'campus-marketplace-ee0ae.firebasestorage.app',
    measurementId: 'G-8NZ88QY5B7',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBFNq6y-i7_aitVG2BDLCnBaIbh3lp4UCs',
    appId: '1:893861858775:ios:aa295c648a7322f2088f92',
    messagingSenderId: '893861858775',
    projectId: 'campus-marketplace-ee0ae',
    storageBucket: 'campus-marketplace-ee0ae.firebasestorage.app',
    iosBundleId: 'com.example.campusMarketplace',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFNq6y-i7_aitVG2BDLCnBaIbh3lp4UCs',
    appId: '1:893861858775:ios:aa295c648a7322f2088f92',
    messagingSenderId: '893861858775',
    projectId: 'campus-marketplace-ee0ae',
    storageBucket: 'campus-marketplace-ee0ae.firebasestorage.app',
    iosBundleId: 'com.example.campusMarketplace',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDapGMgnkZEmrZmMfMvA_JZvC-PRSWMWO8',
    appId: '1:893861858775:web:5c3f9964e861c27f088f92',
    messagingSenderId: '893861858775',
    projectId: 'campus-marketplace-ee0ae',
    authDomain: 'campus-marketplace-ee0ae.firebaseapp.com',
    storageBucket: 'campus-marketplace-ee0ae.firebasestorage.app',
    measurementId: 'G-9L49PC2T7B',
  );

}