import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:halmstad/controllers/enums_controller.dart';
// import 'package:halmstad/controllers/enums_controller.dart';
import 'package:halmstad/controllers/local_storage.dart';
import 'package:halmstad/controllers/my_app_controller.dart';
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
  final myAppController = Get.find<MyAppController>();
  final enumsController = Get.find<EnumsController>();

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
    getFocusAreas();
  }

  getEnums() async {
    try {
      final response = await NetworkCalls().getEnums();
      if (!response.contains('Error:')) {
        final enumsMap = enumsModelFromJson(response);

        enumsController.jsonMap.value = enumsMap;
        enumsController.parseEnums();

        // await LocalStorage().writeJsonToFile(enumsMap);
        myAppController.interactionDetailDropdownItems.value =
            enumsController.tipCategory;
        myAppController.selectedinteractionGeneralDetail.value =
            enumsController.tipCategory.first;

        //location type enum
        myAppController.interactionTypeDropDownItems.value =
            enumsController.locationType;
        myAppController.selectedInteractionType.value =
            enumsController.locationType.first;

        // action dropdown items
        myAppController.actionActivityDropdown.value =
            enumsController.activityType;

        myAppController.actionSelectedActivity.value =
            enumsController.activityType.first;

        myAppController.actionTypeDropDown.value = enumsController.actionType;
        myAppController.actionSelectedType.value =
            enumsController.actionType.first;

        myAppController.actionOutcomeDropdown.value =
            enumsController.outcomeType;
        myAppController.actionSelectedOutcome.value =
            enumsController.outcomeType.first;

        //requests

        myAppController.requestStatus.value = enumsController.requestStatus;
        myAppController.requestSelectedStatus.value =
            enumsController.requestStatus.first;

        myAppController.requestCategory.value = enumsController.requestCategory;
        myAppController.requestSelectedCategory.value =
            enumsController.requestCategory.first;

        myAppController.requestTipCategory.value = enumsController.tipCategory;
        myAppController.requestSelectedTipCategory.value =
            enumsController.tipCategory.first;

        myAppController.requestType.value = enumsController.requestType;
        myAppController.requestSelectedType.value =
            enumsController.requestType.first;

        myAppController.requestUrgency.value = enumsController.requestUrgency;
        myAppController.requestSelectedUrgency.value =
            enumsController.requestUrgency.first;

        //meeting enums

        myAppController.meetingType.value = enumsController.meetingType;
        myAppController.meetingSelectedType.value =
            enumsController.meetingType.first;
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  getFocusAreas() async {
    final response = await NetworkCalls().getFocusAreas();
    print(response);
    if (!response.contains('Error:')) {
      final focusAreaModel = focusAreasFromJson(response);

      myAppController.interactionFocusAreaDropdownItems.value =
          focusAreaModel.data;
      myAppController.selectedInteractionPhysicalFocusArea.value =
          focusAreaModel.data.first;
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
        )),
      ),
    );
  }
}
