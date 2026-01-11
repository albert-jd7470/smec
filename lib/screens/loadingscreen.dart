import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loadingscreen extends StatefulWidget {
  final nextPage;

  const Loadingscreen({super.key, required this.nextPage});

  @override
  State<Loadingscreen> createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {
  @override
  void initState() {
    super.initState();
    makeloading();
  }

  Future<void> makeloading() async {
    final delay = 400 + Random().nextInt(800);

    await Future.delayed(Duration(milliseconds: delay));

    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 800),
        pageBuilder: (_, __, ___) => widget.nextPage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Lottie.asset('assets/Loading.json')));
  }
}
