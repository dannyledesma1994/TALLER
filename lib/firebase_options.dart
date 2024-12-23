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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC9CjB8QC30yZ2nhQxAsjmNYpmpNGLApXQ',
    appId: '1:919666395979:web:c30c7b99634db84ff4f6ce',
    messagingSenderId: '919666395979',
    projectId: 'mensajeria-online-cdf8f',
    authDomain: 'mensajeria-online-cdf8f.firebaseapp.com',
    storageBucket: 'mensajeria-online-cdf8f.firebasestorage.app',
    measurementId: 'G-ZZ97XKDLBP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHiHpVjpcGmnObfzLA6Qfx7c_e3j1kWl8',
    appId: '1:919666395979:android:fac36e298dc433d3f4f6ce',
    messagingSenderId: '919666395979',
    projectId: 'mensajeria-online-cdf8f',
    storageBucket: 'mensajeria-online-cdf8f.firebasestorage.app',
  );
}
