import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppController extends GetxController {
  // Interaction variables
  final interactionGeneralDate = Rxn<DateTime>();
  final interactionGeneralTime = Rxn<TimeOfDay>();
  final interactionGeneralAddress = ''.obs;
  final selectedinteractionGeneralDetail = ''.obs;
  final interactionGeneralNotes = ''.obs;

  final selectedInteractionPhysicalFocusArea = ''.obs;
  final selectedInteractionPhysicalType = ''.obs;
  final interactionPhysicalFollowUp = ''.obs;
  final interactionPhysicalAttachment = Rxn<File>();

  final interactionGroupOfProple = [].obs;

  final interactionMemberName = ''.obs;
  final selectedInteractionGender = ''.obs;
  final selectedInteractionEthnicity = ''.obs;
  final interactionMemberNotes = ''.obs;

  //Meetings variables

  //Request variables

  //Action variables
}
