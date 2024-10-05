// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAvzw1NPIUOzMIzMdqMscT4uRGgYqaBRLw',
    appId: '1:489570983442:web:5fa83b542996e979ff02cb',
    messagingSenderId: '489570983442',
    projectId: 'apartemapplication',
    authDomain: 'apartemapplication.firebaseapp.com',
    storageBucket: 'apartemapplication.appspot.com',
    measurementId: 'G-7K7HXV0PVN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDForrOrAO5R-UttkbAF2_XdLLCjcjfxbs',
    appId: '1:489570983442:android:ac242720205fd6d0ff02cb',
    messagingSenderId: '489570983442',
    projectId: 'apartemapplication',
    storageBucket: 'apartemapplication.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBihWdKZgSBKcAny8Bn-5YN6DTGU5xYMoA',
    appId: '1:489570983442:ios:841eaa9033db260fff02cb',
    messagingSenderId: '489570983442',
    projectId: 'apartemapplication',
    storageBucket: 'apartemapplication.appspot.com',
    iosBundleId: 'com.example.bogsandmila',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBihWdKZgSBKcAny8Bn-5YN6DTGU5xYMoA',
    appId: '1:489570983442:ios:e1d758cd48c1f328ff02cb',
    messagingSenderId: '489570983442',
    projectId: 'apartemapplication',
    storageBucket: 'apartemapplication.appspot.com',
    iosBundleId: 'com.example.bogsandmila.RunnerTests',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBihWdKZgSBKcAny8Bn-5YN6DTGU5xYMoA',
    appId: '1:489570983442:ios:e1d758cd48c1f328ff02cb',
    messagingSenderId: '489570983442',
    projectId: 'apartemapplication',
    storageBucket: 'apartemapplication.appspot.com',
    iosBundleId: 'com.example.bogsandmila.RunnerTests',
  );
}
