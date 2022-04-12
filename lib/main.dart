import 'package:flutter/material.dart';
import 'package:svj/screens/home_screen.dart';
import 'package:svj/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: const Color(0xFFF7CB02),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.black)),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
       '/': (context) =>  LoginPage(),
       'homeScreen': (context) => HomeScreen(),
      },
    );
  }
}
