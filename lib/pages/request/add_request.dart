import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:halmstad/controllers/my_app_controller.dart';
import 'package:halmstad/network/network_calls.dart';
import 'package:halmstad/widgets/reusables.dart';
import 'package:intl/intl.dart';

class AddRequest extends StatefulWidget {
  const AddRequest({super.key});

  @override
  State<AddRequest> createState() => _AddRequestState();
}

class _AddRequestState extends State<AddRequest> {
  final myAppController = Get.find<MyAppController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String address = '';

  List peopleList = [];
  // var categoryItems = [
  //   'Substance Abuse',
  //   'Violence',
  //   'Mental Health',
  // ];

  // var meetingType = ['Parent Meeting', 'Partner Meeting'];
  // String selectedMeetingType = 'Parent Meeting';
  // String categorySelectedValue = 'Substance Abuse';

  var focusAreaList = [
    'School',
    'Leisure Center',
    'Old Home',
    'Care Home',
  ];

  String selectedFocusArea = 'School';

  addRequest() async {
    var body = {
      "requestType": myAppController.requestSelectedType.value,
      "time": "2024-05-23T10:00:00.000Z",
      "source": myAppController.requestSource.value,
      "natureOfRequest": myAppController.requestNature.value,
      "tipCategory": myAppController.requestSelectedTipCategory.value,
      "locationId": 1,
      "requestCategory": myAppController.requestSelectedCategory.value,
      "urgency": myAppController.requestSelectedUrgency.value,
      "status": myAppController.requestSelectedStatus.value,
      "notes": myAppController.requestNotes.value,
      "resolved": false,
      "createdById": 1,
      "assignedToId": 3,
      "detailedAddress": myAppController.requestAddress.value
    };

    final response = await NetworkCalls().addRequest(body);
    if (!response.contains('Error:')) {
      print('No error in response');
      resetValues();
      setState(() {});

      Get.back();
      Get.rawSnackbar(
          message: 'Action Added Successfully',
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
          'Add Request',
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
                      height: 44,
                      child: SmartLifeOutlinedButton(
                        textStyle:
                            textStyle14500.copyWith(color: greytextColor),
                        text: myAppController.requestSelectedDate.value != null
                            ? DateFormat('dd MMM yyyy').format(
                                myAppController.requestSelectedDate.value!)
                            : 'Select Date',
                        onTap: () async {
                          myAppController.requestSelectedDate.value =
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
                      height: 44,
                      child: SmartLifeOutlinedButton(
                          textStyle:
                              textStyle14500.copyWith(color: greytextColor),
                          onTap: () async {
                            myAppController.requestSelectedTime.value =
                                await showTimePicker(
                                    context: context,
                                    initialTime:
                                        const TimeOfDay(hour: 0, minute: 0));
                            setState(() {});
                          },
                          text:
                              myAppController.requestSelectedTime.value != null
                                  ? myAppController.requestSelectedTime.value!
                                      .format(context)
                                  : 'Select Time')),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Type',
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
                          value: myAppController.requestSelectedType.value,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: myAppController.requestType.map((items) {
                            return DropdownMenuItem<String>(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              myAppController.requestSelectedType.value =
                                  newValue!;
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
                    'Source',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  Container(
                      width: Get.size.width,
                      child: CustomTextField(
                          onChange: (value) {
                            //handle change

                            myAppController.requestSource.value = value;
                          },
                          controller: myAppController.requestSourceController,
                          hintText: 'Enter Source of Request')),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Nature of Request',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  Container(
                      width: Get.size.width,
                      child: CustomTextField(
                          onChange: (value) {
                            //handle change
                            myAppController.requestNature.value = value;
                          },
                          controller: myAppController.requestNatureController,
                          hintText: 'Enter Nature of Request')),
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
                          onChange: (value) {
                            //handle change
                            myAppController.requestAddress.value = value;
                          },
                          controller: myAppController.requestAddressController,
                          hintText: 'Enter Address')),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Tip Category',
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
                          value:
                              myAppController.requestSelectedTipCategory.value,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items:
                              myAppController.requestTipCategory.map((items) {
                            return DropdownMenuItem<String>(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              myAppController.requestSelectedTipCategory.value =
                                  newValue!;
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
                    'Request Category',
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
                          value: myAppController.requestSelectedCategory.value,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: myAppController.requestCategory.map((items) {
                            return DropdownMenuItem<String>(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              myAppController.requestSelectedCategory.value =
                                  newValue!;
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
                    'Urgency',
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
                          value: myAppController.requestSelectedUrgency.value,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: myAppController.requestUrgency.map((items) {
                            return DropdownMenuItem<String>(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              myAppController.requestSelectedUrgency.value =
                                  newValue!;
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
                    'Status',
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
                          value: myAppController.requestSelectedStatus.value,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: myAppController.requestStatus.map((items) {
                            return DropdownMenuItem<String>(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              myAppController.requestSelectedStatus.value =
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
                  const SizedBox(
                    height: 14,
                  ),
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

                            myAppController.requestNotes.value = value;
                          },
                          controller: myAppController.requestNotesController,
                          hintText: 'Write Important Notes Here')),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: Get.size.width,
                    child: SmartLifePrimaryButton(
                      onTap: () {
                        addRequest();
                      },
                      borderRadius: 10,
                      text: 'Add',
                      textStyle: textStyle14500.copyWith(
                          color: whiteColor, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  resetValues() {
    myAppController.requestSelectedDate.value = null;
    myAppController.requestSelectedTime.value = null;
    myAppController.requestSource.value = '';
    myAppController.requestSourceController.text = '';

    myAppController.requestNature.value = '';
    myAppController.requestNatureController.text = '';

    myAppController.requestAddress.value = '';
    myAppController.requestAddressController.text = '';

    myAppController.requestNotes.value = '';
    myAppController.requestNotesController.text = '';
  }
}
