import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:halmstad/controllers/my_app_controller.dart';
import 'package:halmstad/models/interactionModel.dart';
import 'package:halmstad/models/memberModel.dart';
import 'package:halmstad/network/network_calls.dart';
import 'package:halmstad/widgets/reusables.dart';
import 'package:intl/intl.dart';

class AddMeeting extends StatefulWidget {
  const AddMeeting({super.key});

  @override
  State<AddMeeting> createState() => _AddMeetingState();
}

class _AddMeetingState extends State<AddMeeting> {
  final myAppController = Get.find<MyAppController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    resetValues();
  }

  List<Map<String, dynamic>> membersList = [];

  int memberCount = 0;

  addMeeting() async {
    DateTime activityTime = DateTime(
      myAppController.meetingSelectedDate.value!.year,
      myAppController.meetingSelectedDate.value!.month,
      myAppController.meetingSelectedDate.value!.day,
      myAppController.meetingSelectedTime.value!.hour,
      myAppController.meetingSelectedTime.value!.minute,
    );

    print(activityTime.toIso8601String());

    var body = {
      "activityTime": "${activityTime.toIso8601String()}Z",
      "detailedAddress": myAppController.meetingAddress.value,
      "notes": myAppController.meetingNotes.value,
      "followUpPlanned": true,
      "MeetingType": myAppController.meetingSelectedType.value,
      "group": {
        "title": "my second group",
        "description": "second ever group to be created in the app",
        "members": membersList,
      }
    };

    final response = await NetworkCalls().addMeeting(body);
    print("Hello ::: $response");
    if (!response.contains('Error:')) {
      print('not error');
      Get.back();
      Get.rawSnackbar(
          message: 'Meeting Added Successfully',
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
          'Add Meeting',
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
                      child: SmartLifeOutlinedButton(
                        textStyle:
                            textStyle14500.copyWith(color: greytextColor),
                        text: myAppController.meetingSelectedDate.value != null
                            ? DateFormat('dd MMM yyyy').format(
                                myAppController.meetingSelectedDate.value!)
                            : 'Select Date',
                        onTap: () async {
                          myAppController.meetingSelectedDate.value =
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
                      child: SmartLifeOutlinedButton(
                          textStyle:
                              textStyle14500.copyWith(color: greytextColor),
                          onTap: () async {
                            myAppController.meetingSelectedTime.value =
                                await showTimePicker(
                                    context: context,
                                    initialTime:
                                        const TimeOfDay(hour: 0, minute: 0));
                            setState(() {});
                          },
                          text:
                              myAppController.meetingSelectedTime.value != null
                                  ? myAppController.meetingSelectedTime.value!
                                      .format(context)
                                  : 'Select Time')),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Location',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  Container(
                      width: Get.size.width,
                      child: CustomTextField(
                          onChange: (value) {
                            //handle change
                            myAppController.meetingAddress.value = value;
                          },
                          controller: myAppController.meetingAddressController,
                          hintText: 'Enter Your Detailed Address')),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Meeting Type',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  Container(
                    width: Get.size.width,
                    height: 40,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          style: textStyle14500.copyWith(color: greytextColor),
                          isExpanded: true,

                          // Initial Value
                          value: myAppController.meetingSelectedType.value,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: myAppController.meetingType.map((items) {
                            return DropdownMenuItem<String>(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              myAppController.meetingSelectedType.value =
                                  newValue!;
                            });
                          },
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
                          onChange: (value) {
                            //handle change

                            myAppController.meetingNotes.value = value;
                          },
                          controller: myAppController.meetingNotesController,
                          hintText: 'Write Important Notes Here')),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(
                  //   height: 14,
                  // ),
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
                                        myAppController
                                            .meetingMemberName.value = value;
                                      },
                                      controller: myAppController
                                          .meetingmemberNameController,
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
                                        myAppController.meetingMemberAge.value =
                                            value;
                                      },
                                      controller: myAppController
                                          .meetingMemberAgeController,
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
                                            .selectedMeetingGender.value,

                                        // Down Arrow Icon
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),

                                        // Array list of items
                                        items: myAppController.meetingGenderList
                                            .map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        // After selecting the desired option,it will
                                        // change button value to selected value
                                        onChanged: (newValue) {
                                          myAppController.selectedMeetingGender
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
                                        myAppController.selectedMeetingEthnicity
                                            .value = value;
                                      },
                                      controller: myAppController
                                          .meetingEthnicityController,
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
                                            .selectedMeetingDisabilityMember
                                            .value,

                                        // Down Arrow Icon
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),

                                        // Array list of items
                                        items: myAppController
                                            .meetingDisabilityMemberList
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
                                              .selectedMeetingDisabilityMember
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
                                            .meetingMemberDisabilityNotes
                                            .value = value;
                                      },
                                      controller: myAppController
                                          .meetingMemberDisabilityNotesController,
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
                                            .meetingMemberAge.value),
                                        name: myAppController
                                            .meetingMemberName.value,
                                        gender: myAppController
                                            .selectedMeetingGender.value
                                            .toUpperCase(),
                                        ethnicity: myAppController
                                            .selectedMeetingEthnicity.value,
                                        disability: myAppController
                                            .meetingMemberDisabilityNotes
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
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      child: GFBorder(
                        type: GFBorderType.circle,
                        dashedLine: const [4, 6],
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
                        //call add meeting here
                        addMeeting();
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
    myAppController.meetingMemberAge.value = '';
    myAppController.meetingMemberAgeController.text = '';
    myAppController.meetingMemberName.value = '';
    myAppController.meetingmemberNameController.text = '';
    myAppController.selectedMeetingEthnicity.value = '';
    myAppController.meetingEthnicityController.text = '';
    myAppController.meetingMemberDisabilityNotes.value = '';
    myAppController.meetingMemberDisabilityNotesController.text = '';
  }

  resetValues() {
    // Use when add call is successful
    myAppController.meetingSelectedDate.value = null;
    myAppController.meetingSelectedTime.value = null;
    myAppController.meetingAddress.value = '';
    myAppController.meetingAddressController.text = '';
    myAppController.meetingNotes.value = '';
    myAppController.meetingNotesController.text = '';

    myAppController.meetingMembers.value = [];
    membersList = [];
  }
}
