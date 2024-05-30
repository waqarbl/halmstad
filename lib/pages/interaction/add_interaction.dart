import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:halmstad/controllers/my_app_controller.dart';
import 'package:halmstad/models/focusAreaModel.dart';
import 'package:halmstad/models/interactionModel.dart';
import 'package:halmstad/models/memberModel.dart';
import 'package:halmstad/network/network_calls.dart';
import 'package:halmstad/widgets/reusables.dart';
import 'package:intl/intl.dart';

class AddInteraction extends StatefulWidget {
  const AddInteraction({super.key});

  @override
  State<AddInteraction> createState() => _AddInteractionState();
}

class _AddInteractionState extends State<AddInteraction> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    resetValues();
  }

  final myAppController = Get.find<MyAppController>();

  final membersList = <Map<String, dynamic>>[].obs;

  int memberCount = 0;

  addInteraction() async {
    DateTime activityTime = DateTime(
      myAppController.interactionGeneralDate.value!.year,
      myAppController.interactionGeneralDate.value!.month,
      myAppController.interactionGeneralDate.value!.day,
      myAppController.interactionGeneralTime.value!.hour,
      myAppController.interactionGeneralTime.value!.minute,
    );

    print(activityTime.toIso8601String());

    var body = {
      "activityTime": "${activityTime.toIso8601String()}Z",
      "interactiontitle": myAppController.interactionGeneralTitle.value,
      "interactiondes": myAppController.interactionGeneralDescription.value,
      "followupdetails": myAppController.interactionPhysicalFollowUp.value,
      "location": {
        "title": "my loc 2",
        "address": myAppController.interactionGeneralAddress.value,
        "locationType": myAppController.selectedInteractionType.value,
        "plusCode": "123123",
        "coordinates": {"lat": 1.2345, "lng": 3.456}
      },
      "group": {
        "title": "my second group",
        "description": "second ever group to be created in the app",
        "members": membersList
      },
      "focusAreaId":
          myAppController.selectedInteractionPhysicalFocusArea.value?.id,
      "interactionDetails": {
        "substance_use_observed":
            myAppController.selectedinteractionGeneralDetail.value ==
                    "SUBSTANCE_USE"
                ? true
                : false,
        "violence_observed":
            myAppController.selectedinteractionGeneralDetail.value == "VIOLENCE"
                ? true
                : false,
        "violence_type":
            myAppController.selectedinteractionGeneralDetail.value ==
                    "MENTAL_HEALTH"
                ? true
                : false
      }
    };

    final response = await NetworkCalls().addInteraction(body);
    if (!response.contains('Error:')) {
      Get.back();
      Get.rawSnackbar(
          message: 'Interaction Added Successfully',
          backgroundColor: Colors.green.shade500);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bluePrimary,
        iconTheme: const IconThemeData(color: whiteColor),
        title: Text(
          'Add Interaction',
          style: textStyle16600.copyWith(
            color: whiteColor,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 20),
        width: Get.size.width - 60,
        height: Get.size.height,
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'General Information',
              style: textStyle16600.copyWith(color: bluePrimary),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  Container(
                      width: Get.size.width,
                      child: Obx(
                        () => SmartLifeOutlinedButton(
                          textStyle:
                              textStyle14500.copyWith(color: greytextColor),
                          text: myAppController.interactionGeneralDate.value !=
                                  null
                              ? DateFormat('dd MMM yyyy').format(
                                  myAppController.interactionGeneralDate.value!)
                              : 'Select Date',
                          onTap: () async {
                            myAppController.interactionGeneralDate.value =
                                await showDatePicker(
                              context: context,
                              firstDate: DateTime.now().subtract(
                                const Duration(days: 365),
                              ),
                              lastDate: DateTime.now().add(
                                const Duration(days: 365),
                              ),
                            );
                            setState(() {});
                          },
                        ),
                      )),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Time',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  Container(
                      width: Get.size.width,
                      child: Obx(
                        () => SmartLifeOutlinedButton(
                            textStyle:
                                textStyle14500.copyWith(color: greytextColor),
                            onTap: () async {
                              myAppController.interactionGeneralTime.value =
                                  await showTimePicker(
                                      context: context,
                                      initialTime:
                                          const TimeOfDay(hour: 0, minute: 0));
                              setState(() {});
                            },
                            text:
                                '${myAppController.interactionGeneralTime.value != null ? myAppController.interactionGeneralTime.value!.format(context) : 'Select Time'}'),
                      )),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Title',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  Container(
                      width: Get.size.width,
                      child: CustomTextField(
                          controller:
                              myAppController.interactionGeneralTitleController,
                          onChange: (value) {
                            print("title : $value");
                            myAppController.interactionGeneralTitle.value =
                                value;
                          },
                          hintText: 'Enter title for Interaction')),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Description',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  Container(
                      width: Get.size.width,
                      child: CustomTextField(
                          controller: myAppController
                              .interactionGeneralDescriptionController,
                          onChange: (value) {
                            print("description : $value");
                            myAppController
                                .interactionGeneralDescription.value = value;
                          },
                          hintText: 'Enter description for Interaction')),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Address',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  Container(
                      width: Get.size.width,
                      child: CustomTextField(
                          controller: myAppController.addressController,
                          onChange: (value) {
                            print("address : $value");
                            myAppController.interactionGeneralAddress.value =
                                value;
                          },
                          hintText: 'Enter Your Detailed Address')),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Detail',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  Container(
                    width: Get.size.width,
                    height: 44,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: Obx(
                          () => DropdownButton<String>(
                            style:
                                textStyle14500.copyWith(color: greytextColor),
                            isExpanded: true,

                            // Initial Value
                            value: myAppController
                                .selectedinteractionGeneralDetail.value,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: myAppController
                                .interactionDetailDropdownItems
                                .map((items) {
                              return DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              myAppController.selectedinteractionGeneralDetail
                                  .value = newValue!;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //     width: Get.size.width,
                  //     child: CustomTextField(
                  //         controller: TextEditingController(),
                  //         hintText: 'Select Categssory')),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Notes',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  Container(
                      height: 100,
                      width: Get.size.width,
                      child: CustomTextField(
                          controller:
                              myAppController.interactionGeneralNotesController,
                          onChange: (value) {
                            //handle change

                            myAppController.interactionGeneralNotes.value =
                                value;
                          },
                          hintText: 'Write Important Notes Here')),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Physical Features',
              style: textStyle16600.copyWith(color: bluePrimary),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Focus Area',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  Container(
                    width: Get.size.width,
                    height: 44,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: Obx(
                          () => DropdownButton<FocusAreaInModel>(
                            style:
                                textStyle14500.copyWith(color: greytextColor),
                            isExpanded: true,

                            // Initial Value
                            value: myAppController
                                .selectedInteractionPhysicalFocusArea.value,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: myAppController
                                .interactionFocusAreaDropdownItems
                                .map((items) {
                              return DropdownMenuItem<FocusAreaInModel>(
                                value: items,
                                child: Text(items.title),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (FocusAreaInModel? newValue) {
                              setState(() {
                                myAppController
                                    .selectedInteractionPhysicalFocusArea
                                    .value = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Type',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  Container(
                    width: Get.size.width,
                    height: 44,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: Obx(
                          () => DropdownButton<String>(
                            style:
                                textStyle14500.copyWith(color: greytextColor),
                            isExpanded: true,

                            // Initial Value
                            value:
                                myAppController.selectedInteractionType.value,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: myAppController.interactionTypeDropDownItems
                                .map((items) {
                              return DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              myAppController.selectedInteractionType.value =
                                  newValue!;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Follow up',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  Container(
                      width: Get.size.width,
                      child: CustomTextField(
                          onChange: (value) {
                            //handle change
                            myAppController.interactionPhysicalFollowUp.value =
                                value;
                          },
                          controller:
                              myAppController.interactionFollowUpController,
                          hintText: 'Enter Follow up Details')),
                  const SizedBox(
                    height: 14,
                  ),
                  // Text(
                  //   'Attachment',
                  //   style: textStyle14500.copyWith(color: textColor054),
                  // ),
                  // Container(
                  //     width: Get.size.width,
                  //     child: CustomTextField(
                  //         onChange: (value) {
                  //           //handle change
                  //         },
                  //         controller: TextEditingController(),
                  //         hintText: 'Attachment Document (if any)')),
                  // const SizedBox(
                  //   height: 14,
                  // ),
                  Text(
                    'Group of People',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      //show dialog add member
                      print('Show dialog add member');
                      Member? result = await Get.dialog(Dialog(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          width: Get.size.width - 40,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Name',
                                style: textStyle14500.copyWith(
                                    color: textColor054),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Container(
                                  width: Get.size.width,
                                  child: CustomTextField(
                                      onChange: (value) {
                                        //handle change
                                        myAppController.interactionMemberName
                                            .value = value;
                                      },
                                      controller: myAppController
                                          .interactionmemberNameController,
                                      hintText: 'Enter Your Name')),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Age',
                                style: textStyle14500.copyWith(
                                    color: textColor054),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Container(
                                  width: Get.size.width,
                                  child: CustomTextField(
                                      onChange: (value) {
                                        //handle change
                                        myAppController
                                            .interactionMemberAge.value = value;
                                      },
                                      controller: myAppController
                                          .interactionMemberAgeController,
                                      hintText: 'Enter Your Age')),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Gender',
                                style: textStyle14500.copyWith(
                                    color: textColor054),
                              ),
                              Container(
                                width: Get.size.width,
                                height: 44,
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 15.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: Obx(
                                      () => DropdownButton(
                                        style: textStyle14500.copyWith(
                                            color: greytextColor),
                                        isExpanded: true,

                                        // Initial Value
                                        value: myAppController
                                            .selectedInteractionGender.value,

                                        // Down Arrow Icon
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),

                                        // Array list of items
                                        items: myAppController
                                            .interactionGenderList
                                            .map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        // After selecting the desired option,it will
                                        // change button value to selected value
                                        onChanged: (newValue) {
                                          myAppController
                                              .selectedInteractionGender
                                              .value = newValue!;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Ethnicity',
                                style: textStyle14500.copyWith(
                                    color: textColor054),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Container(
                                  width: Get.size.width,
                                  child: CustomTextField(
                                      onChange: (value) {
                                        //handle change
                                        myAppController
                                            .selectedInteractionEthnicity
                                            .value = value;
                                      },
                                      controller: myAppController
                                          .interactionEthnicityController,
                                      hintText: 'Enter Your Ethnicity')),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Disability',
                                style: textStyle14500.copyWith(
                                    color: textColor054),
                              ),
                              Container(
                                width: Get.size.width,
                                height: 44,
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 15.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: Obx(
                                      () => DropdownButton(
                                        style: textStyle14500.copyWith(
                                            color: greytextColor),
                                        isExpanded: true,

                                        // Initial Value
                                        value: myAppController
                                            .selectedInteractionDisabilityMember
                                            .value,

                                        // Down Arrow Icon
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),

                                        // Array list of items
                                        items: myAppController
                                            .interactionDisabilityMemberList
                                            .map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        // After selecting the desired option,it will
                                        // change button value to selected value
                                        onChanged: (String? newValue) {
                                          myAppController
                                              .selectedInteractionDisabilityMember
                                              .value = newValue!;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Notes',
                                style: textStyle14500.copyWith(
                                    color: textColor054),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Container(
                                  height: 60,
                                  width: Get.size.width,
                                  child: CustomTextField(
                                      onChange: (value) {
                                        //handle change
                                        myAppController
                                            .interactionMemberDisabilityNotes
                                            .value = value;
                                      },
                                      controller: myAppController
                                          .interactionMemberDisabilityNotesController,
                                      hintText: 'Write Disability Notes Here')),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: Get.size.width,
                                child: SmartLifePrimaryButton(
                                  onTap: () {
                                    Member member = Member(
                                        age: int.parse(myAppController
                                            .interactionMemberAge.value),
                                        name: myAppController
                                            .interactionMemberName.value,
                                        gender: myAppController
                                            .selectedInteractionGender.value
                                            .toUpperCase(),
                                        ethnicity: myAppController
                                            .selectedInteractionEthnicity.value,
                                        disability: myAppController
                                            .interactionMemberDisabilityNotes
                                            .value);

                                    membersList.add(member.toJson());
                                    memberCount++;
                                    resetMember();
                                    setState(() {});
                                    print(membersList);
                                    Get.back();
                                  },
                                  borderRadius: 10,
                                  text: 'Add Member',
                                  textStyle: textStyle14500.copyWith(
                                      color: whiteColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ));

                      // if (result != null) {
                      //   // membersList.add(result);
                      //   membersList.add(result.toJson());
                      //   print(jsonEncode(membersList));
                      //   resetMember();
                      // }
                      // setState(() {});
                      // print('result:::: ${result}');
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      child: memberCount > 0
                          ? CircleAvatar(
                              backgroundColor: bluePrimary,
                              child: Center(
                                child: Text(
                                  memberCount.toString(),
                                  style: textStyle16600.copyWith(
                                      fontSize: 22, color: whiteColor),
                                ),
                              ),
                            )
                          : GFBorder(
                              type: GFBorderType.circle,
                              dashedLine: [4, 6],
                              color: const Color(0xFFD0D5DD),
                              strokeWidth: 2,
                              child: const Center(
                                  child: Icon(
                                Icons.add,
                                size: 40,
                                color: Color(0xFFD0D5DD),
                              )),
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: Get.size.width,
                    child: SmartLifePrimaryButton(
                      onTap: () {
                        //add interaction
                        addInteraction();
                      },
                      borderRadius: 10,
                      text: 'Add',
                      textStyle: textStyle14500.copyWith(
                          color: whiteColor, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  resetMember() {
    myAppController.interactionMemberAge.value = '';
    myAppController.interactionMemberAgeController.text = '';
    myAppController.interactionMemberName.value = '';
    myAppController.interactionmemberNameController.text = '';
    myAppController.selectedInteractionEthnicity.value = '';
    myAppController.interactionEthnicityController.text = '';
    myAppController.interactionMemberDisabilityNotes.value = '';
    myAppController.interactionMemberDisabilityNotesController.text = '';
  }

  resetValues() {
    // Use when add call is successful
    myAppController.interactionGeneralDate.value = null;
    myAppController.interactionGeneralTime.value = null;
    myAppController.interactionGeneralAddress.value = '';
    myAppController.addressController.text = '';
    myAppController.selectedinteractionGeneralDetail.value = '';
    myAppController.interactionGeneralNotes.value = '';

    myAppController.selectedInteractionPhysicalFocusArea.value = null;
    myAppController.selectedInteractionType.value = '';
    myAppController.interactionPhysicalFollowUp.value = '';
    myAppController.interactionPhysicalAttachment.value = null;

    myAppController.interactionGroupOfProple.value = [];

    myAppController.interactionMemberName.value = '';
    myAppController.selectedInteractionGender.value = '';
    myAppController.selectedInteractionEthnicity.value = '';
    myAppController.interactionMemberDisabilityNotes.value = '';
  }
}
