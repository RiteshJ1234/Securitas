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
    apiKey: 'AIzaSyDSJqnoOC33Tcw_C0IFmPRUF7b-61BxpFs',
    appId: '1:341745983462:web:b7b77af24bcdfd76590027',
    messagingSenderId: '341745983462',
    projectId: 'securitas-c8d29',
    authDomain: 'securitas-c8d29.firebaseapp.com',
    storageBucket: 'securitas-c8d29.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJ_-8yoHHctiA5u6ZWD847Aw9V7IKnINo',
    appId: '1:341745983462:android:31c85ecffc601d71590027',
    messagingSenderId: '341745983462',
    projectId: 'securitas-c8d29',
    storageBucket: 'securitas-c8d29.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDO8DJSFGyNvQH95tWZex7J229SkAjGBZg',
    appId: '1:341745983462:ios:ef86cecfb3e74c34590027',
    messagingSenderId: '341745983462',
    projectId: 'securitas-c8d29',
    storageBucket: 'securitas-c8d29.appspot.com',
    iosBundleId: 'com.example.securitas',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDO8DJSFGyNvQH95tWZex7J229SkAjGBZg',
    appId: '1:341745983462:ios:512f92f2dca13601590027',
    messagingSenderId: '341745983462',
    projectId: 'securitas-c8d29',
    storageBucket: 'securitas-c8d29.appspot.com',
    iosBundleId: 'com.example.securitas.RunnerTests',
  );
}