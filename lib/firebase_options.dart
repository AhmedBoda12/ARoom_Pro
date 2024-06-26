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
    apiKey: 'AIzaSyDxGDzisQ3vkvewLRmcVmKxGxCDbJ01ctw',
    appId: '1:884502683699:web:5a7e060c83e4e263dd4346',
    messagingSenderId: '884502683699',
    projectId: 'aroom-pro',
    authDomain: 'aroom-pro.firebaseapp.com',
    storageBucket: 'aroom-pro.appspot.com',
    measurementId: 'G-YYDNSNBMZ0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDRYxrdqNh3OvxDKhdqME1JMizi6icLTak',
    appId: '1:884502683699:android:baf4d308ccd20fcedd4346',
    messagingSenderId: '884502683699',
    projectId: 'aroom-pro',
    storageBucket: 'aroom-pro.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDKgMB7x9pxkVSkjDgG8Wky6L2y0PajLi8',
    appId: '1:884502683699:ios:5cc514762f7079eddd4346',
    messagingSenderId: '884502683699',
    projectId: 'aroom-pro',
    storageBucket: 'aroom-pro.appspot.com',
    iosBundleId: 'com.example.aroomPro',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDKgMB7x9pxkVSkjDgG8Wky6L2y0PajLi8',
    appId: '1:884502683699:ios:5cc514762f7079eddd4346',
    messagingSenderId: '884502683699',
    projectId: 'aroom-pro',
    storageBucket: 'aroom-pro.appspot.com',
    iosBundleId: 'com.example.aroomPro',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDxGDzisQ3vkvewLRmcVmKxGxCDbJ01ctw',
    appId: '1:884502683699:web:cd5c002528890eeedd4346',
    messagingSenderId: '884502683699',
    projectId: 'aroom-pro',
    authDomain: 'aroom-pro.firebaseapp.com',
    storageBucket: 'aroom-pro.appspot.com',
    measurementId: 'G-VPSL4RG1ZB',
  );

}