import 'package:flutter/material.dart';
import 'package:smec/screens/homepage.dart';
import 'package:smec/screens/splash_screen.dart';
import 'package:smec/widgets/navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
