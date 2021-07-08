import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/home.dart';
import 'package:flutter_application_2/screens/temperature.dart';
import 'package:flutter_application_2/screens/volume.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: {
        '/home': (context) => Home(),
        '/temperature': (context) => Temperature(),
        '/volume': (context) => Volume(),
      },
    );
  }
}
