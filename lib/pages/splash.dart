import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:halmstad/controllers/local_storage.dart';
// import 'package:halmstad/controllers/local_storage.dart';
import 'package:halmstad/models/enumsModel.dart';
import 'package:halmstad/models/focusAreaModel.dart';
import 'package:halmstad/network/network_calls.dart';
import 'package:halmstad/pages/authentication/home.dart';
import 'package:halmstad/pages/authentication/login.dart';
// import 'package:path_provider/path_provider.dart';

// import 'dart:io';
// import 'dart:convert';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // final myAppController = Get.find<MyAppCon>();

  moveToLogin() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(() => LoginPage());
    });
  }

  @override
  void initState() {
    super.initState();
    moveToLogin();
    getEnums();
  }

  getEnums() async {
    try {
      final response = await NetworkCalls().getEnums();
      if (!response.contains('Error:')) {
        final enumsMap = enumsModelFromJson(response);

        await LocalStorage().writeJsonToFile(enumsMap);
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  getFocusAreas() async {
    final response = await NetworkCalls().getFocusAreas();
    if (!response.contains('Error:')) {
      //  = focusAreasFromJson(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    // moveToLogin(context);
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 260,
                        height: 130,
                        child: Image.asset('assets/halmstadLogo.png')),
                    SizedBox(
                      height: 40,
                    ),
                    CircularProgressIndicator(
                      backgroundColor: bluePrimary,
                      color: whiteColor,
                    )
                  ],
                ))),
      ),
    );
  }
}
