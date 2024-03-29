import 'package:flutter/material.dart';
import 'package:halmstad/pages/home.dart';
import 'package:halmstad/pages/login.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  moveToLogin(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    moveToLogin(context);
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Center(
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
                },
                child: Image.asset('assets/splash.png'))),
      ),
    );
  }
}
