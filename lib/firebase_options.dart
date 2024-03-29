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
    apiKey: 'AIzaSyDP932zA5Rr5b_LL34eliw_r8DznpZ70KM',
    appId: '1:819291624437:web:1ec101185f5f72da0846bc',
    messagingSenderId: '819291624437',
    projectId: 'etecfood-etf',
    authDomain: 'etecfood-etf.firebaseapp.com',
    storageBucket: 'etecfood-etf.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDIH4EhBk1rshmc3Q56KpfkdYJ5096JsB0',
    appId: '1:819291624437:android:197dd521123578320846bc',
    messagingSenderId: '819291624437',
    projectId: 'etecfood-etf',
    storageBucket: 'etecfood-etf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3JAc-252RsBJ9rtfRzRbluE298KRC1JA',
    appId: '1:819291624437:ios:09547e0bf4fa61fc0846bc',
    messagingSenderId: '819291624437',
    projectId: 'etecfood-etf',
    storageBucket: 'etecfood-etf.appspot.com',
    iosClientId: '819291624437-se2s3ssoebep6ps4ustfmpjvglkl8jco.apps.googleusercontent.com',
    iosBundleId: 'br.com.guilherme.etecfood',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3JAc-252RsBJ9rtfRzRbluE298KRC1JA',
    appId: '1:819291624437:ios:812646bdb78df8b90846bc',
    messagingSenderId: '819291624437',
    projectId: 'etecfood-etf',
    storageBucket: 'etecfood-etf.appspot.com',
    iosClientId: '819291624437-uf7fsf1cpgj3qtde0uk49emade0cjj1f.apps.googleusercontent.com',
    iosBundleId: 'br.com.guilherme.etecfood.RunnerTests',
  );
}
