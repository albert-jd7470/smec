import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smec/screens/jd/homepage.dart';
import 'package:smec/widgets/navigation.dart';

import 'onboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
 void initState(){
    super.initState();
    nextpage();
  }
  void nextpage(){
    Timer(Duration(seconds: 4), (){
      if(!mounted)return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Onboard(),));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: Center(child: Lottie.asset('assets/smec.json')),
    );
  }
}
