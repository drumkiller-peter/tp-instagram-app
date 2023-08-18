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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCvvKmS6MpjAZE-RAk-CDwwU2lymVmuDTA',
    appId: '1:874203735024:web:985d2a82f8bc2388dd7335',
    messagingSenderId: '874203735024',
    projectId: 'training-point-app',
    authDomain: 'training-point-app.firebaseapp.com',
    storageBucket: 'training-point-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_GDAqb8W7S-QyyRo2v16keSCTrtEsdnM',
    appId: '1:874203735024:android:52f49420869ba47ddd7335',
    messagingSenderId: '874203735024',
    projectId: 'training-point-app',
    storageBucket: 'training-point-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGqj5Hhxcs6stiUh5rO5ZkAIfuAFiSjpg',
    appId: '1:874203735024:ios:af18c1909a4501c0dd7335',
    messagingSenderId: '874203735024',
    projectId: 'training-point-app',
    storageBucket: 'training-point-app.appspot.com',
    iosClientId: '874203735024-md0m9382eeqkp6bj55sr7b0rjmm7g2vm.apps.googleusercontent.com',
    iosBundleId: 'com.example.tpInstagramApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAGqj5Hhxcs6stiUh5rO5ZkAIfuAFiSjpg',
    appId: '1:874203735024:ios:320f023e5c61cc9ddd7335',
    messagingSenderId: '874203735024',
    projectId: 'training-point-app',
    storageBucket: 'training-point-app.appspot.com',
    iosClientId: '874203735024-kq1ild6lv6chukrk6bpo5068gedj529q.apps.googleusercontent.com',
    iosBundleId: 'com.example.tpInstagramApp.RunnerTests',
  );
}