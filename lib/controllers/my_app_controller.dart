import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/models/focusAreaModel.dart';

class MyAppController extends GetxController {
  // Interaction General variables
  final interactionGeneralDate = Rxn<DateTime>();
  final interactionGeneralTime = Rxn<TimeOfDay>();
  final interactionGeneralAddress = ''.obs;
  final addressController = TextEditingController();

  final focusAreas = Rxn<FocusAreas>();

  final interactionDetailDropdownItems = [].obs;
  final selectedinteractionGeneralDetail = Rxn<FocusArea>();
  final interactionGeneralNotesController = TextEditingController();
  final interactionGeneralNotes = ''.obs;

  // Interaction Physical variables

  final interactionFocusAreaDropdownItems = [
    'Area1',
    'Area2',
    'Area3',
  ];

  final interactionTypeDropDownItems = [
    'School',
    'Leisure Center',
    'Old Home',
    'Care Home',
  ];
  final selectedInteractionPhysicalFocusArea = 'Area1'.obs;
  final selectedInteractionPhysicalType = 'School'.obs;
  final interactionPhysicalFollowUp = ''.obs;
  final interactionFollowUpController = TextEditingController();
  final interactionPhysicalAttachment = Rxn<File>();

  // interaction Members fields
  final interactionGroupOfProple = [].obs;

  final interactionMemberName = ''.obs;
  final interactionmemberNameController = TextEditingController();
  final selectedInteractionGender = 'Male'.obs;
  final interactionGenderList = [
    'Male',
    'Female',
  ];

  final interactionDisabilityMemberList = ['Yes', 'No'];
  final selectedInteractionDisabilityMember = 'Yes'.obs;
  final selectedInteractionEthnicity = ''.obs;
  final interactionEthnicityController = TextEditingController();
  final interactionMemberDisabilityNotes = ''.obs;
  final interactionMemberDisabilityNotesController = TextEditingController();

  //Meetings variables

  final meetingSelectedDate = Rxn<DateTime>();
  final meetingSelectedTime = Rxn<DateTime>();
  final meetingAddress = ''.obs;
  final meetingType = ''.obs; // enum or dropdown
  final meetingNotes = ''.obs;
  final meetingAttachment = ''.obs;
  final meetingMembers = [].obs;

  //Request variables
  final requestSelectedDate = Rxn<DateTime>();
  final requestSelectedTime = Rxn<TimeOfDay>();
  final requestType = ''.obs; // enum or dropdown value
  final requestSource = ''.obs;
  final requestNature = ''.obs;
  final requestAddress = ''.obs;
  final requestTipCategory = ''.obs; // enum or dropdown
  final requestCategory = ''.obs;
  final requestUrgency = ''.obs; // enum or dropdown
  final requestStatus = ''.obs;
  final requestAttachment = ''.obs;
  final requestNotes = ''.obs;

  //Action variables

  final actionSelectedDate = Rxn<DateTime>();
  final actionSelectedTime = Rxn<TimeOfDay>();
  final actionActivity = ''.obs;
  final actionLink = ''.obs;
  final actionType = ''.obs;
  final actionDescription = ''.obs;
  final actionOutcomeType = ''.obs;
  final actionOutcomeDetails = ''.obs;
  final actionAttachment = ''.obs;
}
