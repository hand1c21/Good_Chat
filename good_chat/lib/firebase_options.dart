import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform{
    return android;
  }

  static const FirebaseOptions android=FirebaseOptions(
    apiKey: 'AIzaSyB7hT1XWLO7QjRgaWEYTPG1THKRGqYTPVI',
    appId:'1:667760363911:android:63e69386e9e7127a16eb22' ,
    projectId: 'goodchat-17d52',
    messagingSenderId: '667760363911',
    storageBucket:'goodchat-17d52.appspot.com' ,
  );
}