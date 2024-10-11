import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smart/helper_methods.dart';
import 'package:smart/on_boarding.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      navigateTo(OnBoardingView());
    });
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: ElasticInDown(
          duration: Duration(seconds: 3),
          child: Image.asset(
            "assets/images/logo.png",
          ),
        )));
  }
}
