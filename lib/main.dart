import 'package:flutter/material.dart';
import 'package:login_flutter/firebase/Auth.dart';
import 'package:login_flutter/page/home_page.dart';
import 'page/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: "MadeChat",
      home: HomePage(authBase: Auth()),
    );
  }
}
