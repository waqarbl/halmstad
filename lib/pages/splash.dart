import 'package:flutter/material.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:halmstad/pages/authentication/home.dart';
import 'package:halmstad/pages/authentication/login.dart';

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
      backgroundColor: bluePrimary,
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
                child: Container(
                    width: 260,
                    height: 130,
                    child: Image.asset('assets/halmstadLogo.png')))),
      ),
    );
  }
}
