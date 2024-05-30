import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/controllers/appDependencies.dart';
import 'package:halmstad/controllers/enums_controller.dart';
import 'package:halmstad/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: MyAppDependencies(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}
