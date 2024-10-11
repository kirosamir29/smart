import 'package:flutter/material.dart';
import 'package:smart/helper_methods.dart';
import 'package:smart/splash.dart';


void main (){
  runApp(const Smart());
}

class Smart extends StatelessWidget {
  const Smart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        home: SplashView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
