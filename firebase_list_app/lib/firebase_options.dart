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
    apiKey: 'AIzaSyBd1pB5pT9rmYiEgSc5fvnM5ArG6znyDXg',
    appId: '1:303592368458:web:c8830bc9fb69018ad439b3',
    messagingSenderId: '303592368458',
    projectId: 'students-d4593',
    authDomain: 'students-d4593.firebaseapp.com',
    storageBucket: 'students-d4593.appspot.com',
    measurementId: 'G-VY8C7DY9WG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBuLIMspglbSex5vWlHKYh8S7NdzGccKok',
    appId: '1:303592368458:android:ab31eef497e6594dd439b3',
    messagingSenderId: '303592368458',
    projectId: 'students-d4593',
    storageBucket: 'students-d4593.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2NwIotc5u35g9sXOPWY0c_DHkOEOrEmA',
    appId: '1:303592368458:ios:c61fe52c502d3bc6d439b3',
    messagingSenderId: '303592368458',
    projectId: 'students-d4593',
    storageBucket: 'students-d4593.appspot.com',
    iosClientId: '303592368458-mu620gb15g3ajuqeqsnmtl54ooq3mfrg.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseListApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC2NwIotc5u35g9sXOPWY0c_DHkOEOrEmA',
    appId: '1:303592368458:ios:c61fe52c502d3bc6d439b3',
    messagingSenderId: '303592368458',
    projectId: 'students-d4593',
    storageBucket: 'students-d4593.appspot.com',
    iosClientId: '303592368458-mu620gb15g3ajuqeqsnmtl54ooq3mfrg.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseListApp',
  );
}
