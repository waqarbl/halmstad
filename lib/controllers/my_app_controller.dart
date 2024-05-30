import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/controllers/enums_controller.dart';
import 'package:halmstad/models/focusAreaModel.dart';

class MyAppController extends GetxController {
  // Interaction General variables
  final interactionGeneralDate = Rxn<DateTime>();
  final interactionGeneralTime = Rxn<TimeOfDay>();
  final interactionGeneralAddress = ''.obs;
  final addressController = TextEditingController();
  final interactionGeneralTitle = ''.obs;
  final interactionGeneralTitleController = TextEditingController();
  final interactionGeneralDescription = ''.obs;
  final interactionGeneralDescriptionController = TextEditingController();

  final focusAreas = Rxn<FocusAreas>();

  final interactionDetailDropdownItems = [].obs;
  final selectedinteractionGeneralDetail = ''.obs;
  // Get.find<EnumsController>().tipCategory.first.value.obs;
  final interactionGeneralNotesController = TextEditingController();
  final interactionGeneralNotes = ''.obs;

  // Interaction Physical variables

  final interactionFocusAreaDropdownItems = [].obs;

  final interactionTypeDropDownItems = [].obs;
  final selectedInteractionType = ''.obs;
  final selectedInteractionPhysicalFocusArea = Rxn<FocusAreaInModel>();
  final interactionPhysicalFollowUp = ''.obs;
  final interactionFollowUpController = TextEditingController();
  final interactionPhysicalAttachment = Rxn<File>();

  // interaction Members fields
  final interactionGroupOfProple = [].obs;

  final interactionMemberName = ''.obs;
  final interactionmemberNameController = TextEditingController();
  final interactionMemberAge = ''.obs;
  final interactionMemberAgeController = TextEditingController();
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
  final meetingSelectedTime = Rxn<TimeOfDay>();
  final meetingAddress = ''.obs;
  final meetingAddressController = TextEditingController();
  final meetingType = [].obs; // enum or dropdown
  final meetingSelectedType = ''.obs;

  final meetingNotes = ''.obs;
  final meetingNotesController = TextEditingController();
  // final meetingAttachment = ''.obs;
  final meetingMembers = [].obs;

  final meetingMemberName = ''.obs;
  final meetingmemberNameController = TextEditingController();
  final meetingMemberAge = ''.obs;
  final meetingMemberAgeController = TextEditingController();
  final selectedMeetingGender = 'Male'.obs;
  final meetingGenderList = [
    'Male',
    'Female',
  ];

  final meetingDisabilityMemberList = ['Yes', 'No'];
  final selectedMeetingDisabilityMember = 'Yes'.obs;
  final selectedMeetingEthnicity = ''.obs;
  final meetingEthnicityController = TextEditingController();
  final meetingMemberDisabilityNotes = ''.obs;
  final meetingMemberDisabilityNotesController = TextEditingController();

  //Request variables
  final requestSelectedDate = Rxn<DateTime>();
  final requestSelectedTime = Rxn<TimeOfDay>();
  final requestType = [].obs; // enum or dropdown value
  final requestSelectedType = ''.obs;
  final requestSource = ''.obs;
  final requestSourceController = TextEditingController();
  final requestNature = ''.obs;
  final requestNatureController = TextEditingController();
  final requestAddress = ''.obs;
  final requestAddressController = TextEditingController();
  final requestTipCategory = [].obs; // enum or dropdown
  final requestSelectedTipCategory = ''.obs;
  final requestCategory = [].obs;
  final requestSelectedCategory = ''.obs;
  final requestUrgency = [].obs; // enum or dropdown
  final requestSelectedUrgency = ''.obs;
  final requestStatus = [].obs;
  final requestSelectedStatus = ''.obs;
  final requestNotes = ''.obs;
  final requestNotesController = TextEditingController();

  //Action variables

  final actionSelectedDate = Rxn<DateTime>();
  final actionSelectedTime = Rxn<TimeOfDay>();

  final actionActivityDropdown = [].obs;
  final actionSelectedActivity = ''.obs;

  final actionSelectedType = ''.obs;
  final actionTypeDropDown = [].obs;

  final actionDescription = ''.obs;
  final actionDescriptionController = TextEditingController();

  final actionSelectedOutcome = ''.obs;
  final actionOutcomeDropdown = [].obs;

  final actionOutcomeDetails = ''.obs;
  final actionOutcomeDetailsController = TextEditingController();

  // final actionType = ''.obs;
  // final actionDescription = ''.obs;
  // final actionOutcomeType = ''.obs;
  // final actionOutcomeDetails = ''.obs;
  // final actionAttachment = ''.obs;
}
