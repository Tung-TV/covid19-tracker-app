import 'package:covid19/data.dart';
import 'package:covid19/navigation.dart';
import 'package:flutter/material.dart';
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
      theme: ThemeData(
        fontFamily: 'TimeNewsRoman',
        primaryColor: primaryBlack,
        brightness: Brightness.light,
      ),
      home: Navigation(),
    );
  }
}
