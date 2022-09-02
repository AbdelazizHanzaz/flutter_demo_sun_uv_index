import 'package:checktemp_v1/pages/splashScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      color: Colors.deepPurple,
      debugShowCheckedModeBanner: false,
      title: 'Check Index UV',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        primarySwatch: Colors.deepPurple,
        primaryColorDark: Colors.deepPurpleAccent
      ),

      
    );
  }
}
