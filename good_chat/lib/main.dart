// import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:flutter/material.dart';
import 'package:good_chat/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'pages/login_page.dart';
import 'theme/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';


void main()async
{

WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(
    ChangeNotifierProvider(
      create: (context)=>ThemeProvider(),
      child:MyApp(),
    )
  );
}

class MyApp extends StatelessWidget{
const MyApp();

Widget build(BuildContext context){
  return  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: Provider.of<ThemeProvider>(context).themeData,
  );
}
}