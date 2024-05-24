import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:halmstad/widgets/reusables.dart';
import 'package:intl/intl.dart';

class AddMeeting extends StatefulWidget {
  const AddMeeting({super.key});

  @override
  State<AddMeeting> createState() => _AddMeetingState();
}

class _AddMeetingState extends State<AddMeeting> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  String address = '';

  List peopleList = [];
  // var categoryItems = [
  //   'Substance Abuse',
  //   'Violence',
  //   'Mental Health',
  // ];

  var meetingType = ['Parent Meeting', 'Partner Meeting'];
  String selectedMeetingType = 'Parent Meeting';
  // String categorySelectedValue = 'Substance Abuse';

  var focusAreaList = [
    'School',
    'Leisure Center',
    'Old Home',
    'Care Home',
  ];

  String selectedFocusArea = 'School';

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
                        text: selectedDate != null
                            ? DateFormat('dd MMM yyyy').format(selectedDate!)
                            : 'Select Date',
                        onTap: () async {
                          selectedDate = await showDatePicker(
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
                            selectedTime = await showTimePicker(
                                context: context,
                                initialTime:
                                    const TimeOfDay(hour: 0, minute: 0));
                            setState(() {});
                          },
                          text: selectedTime != null
                              ? selectedTime!.format(context)
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
                          },
                          controller: TextEditingController(),
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
                          value: selectedMeetingType,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: meetingType.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedMeetingType = newValue!;
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
                          },
                          controller: TextEditingController(),
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
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Attachment',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  Container(
                      width: Get.size.width,
                      child: CustomTextField(
                          onChange: (value) {
                            //handle change
                          },
                          controller: TextEditingController(),
                          hintText: 'Attachment Document (if any)')),
                  const SizedBox(
                    height: 14,
                  ),
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
                      final result = await Get.dialog(Dialog(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          // height: Get.size.height / 1.6,
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          width: Get.size.width - 40,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 14,
                              ),
                              Text(
                                'Name',
                                style: textStyle14500.copyWith(
                                    color: textColor054),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Container(
                                  width: Get.size.width,
                                  child: CustomTextField(
                                      onChange: (value) {
                                        //handle change
                                      },
                                      controller: TextEditingController(),
                                      hintText: 'Enter Your Name')),
                              const SizedBox(
                                height: 14,
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
                                    child: DropdownButton(
                                      style: textStyle14500.copyWith(
                                          color: greytextColor),
                                      isExpanded: true,

                                      // Initial Value
                                      value: selectedMeetingType,

                                      // Down Arrow Icon
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: meetingType.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedMeetingType = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Text(
                                'Ethnicity',
                                style: textStyle14500.copyWith(
                                    color: textColor054),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Container(
                                  width: Get.size.width,
                                  child: CustomTextField(
                                      onChange: (value) {
                                        //handle change
                                      },
                                      controller: TextEditingController(),
                                      hintText: 'Enter Your Ethnicity')),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: Get.size.width,
                                child: SmartLifePrimaryButton(
                                  borderRadius: 10,
                                  text: 'Add Member',
                                  textStyle: textStyle14500.copyWith(
                                      color: whiteColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ));

                      print('result:::: $result');
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
}
