import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:halmstad/controllers/my_app_controller.dart';
import 'package:halmstad/network/network_calls.dart';
import 'package:halmstad/widgets/reusables.dart';
import 'package:intl/intl.dart';

class AddAction extends StatefulWidget {
  const AddAction({super.key});

  @override
  State<AddAction> createState() => _AddActionState();
}

class _AddActionState extends State<AddAction> {
  final myAppController = Get.find<MyAppController>();
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

  // TextEditingController placesController = TextEditingController();

  addAction() async {
    var body = {
      "activityType": myAppController.actionSelectedActivity.value,
      "actionType": myAppController.actionSelectedType.value,
      "description": myAppController.actionDescription.value,
      "actionTime": "2024-05-31T10:00:00Z",
      "outcomeType": myAppController.actionSelectedOutcome.value,
      "outcomeDetails": myAppController.actionOutcomeDetails.value
    };

    final response = await NetworkCalls().addAction(body);
    print(response);
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
          'Add Action',
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
            // GooglePlacesAutoCompleteTextFormField(
            //     textEditingController: placesController,
            //     googleAPIKey: "AIzaSyAp3uRjDh2iqb_ZqMrN995lzvHn_39P16g",
            //     // proxyURL:
            //     //     "https://your-proxy.com/", // only needed if you build for the web
            //     debounceTime: 400, // defaults to 600 ms
            //     countries: [], // optional, by default the list is empty (no restrictions)
            //     isLatLngRequired:
            //         true, // if you require the coordinates from the place details

            //     getPlaceDetailWithLatLng: (prediction) {
            //       // this method will return latlng with place detail
            //       print("Coordinates: (${prediction.lat},${prediction.lng})");

            //       print(prediction.placeId);
            //       // print(prediction.)
            //     }, // this callback is called when isLatLngRequired is true

            //     itmClick: (prediction) {
            //       placesController.text = prediction.description!;
            //       placesController.selection = TextSelection.fromPosition(
            //           TextPosition(offset: prediction.description!.length));
            //     }),
            Text(
              'Action Date and Time',
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
                        text: myAppController.actionSelectedDate.value != null
                            ? DateFormat('dd MMM yyyy').format(
                                myAppController.actionSelectedDate.value!)
                            : 'Select Date',
                        onTap: () async {
                          myAppController.actionSelectedDate.value =
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
                            myAppController.actionSelectedTime.value =
                                await showTimePicker(
                                    context: context,
                                    initialTime:
                                        const TimeOfDay(hour: 0, minute: 0));
                            setState(() {});
                          },
                          text: myAppController.actionSelectedTime.value != null
                              ? myAppController.actionSelectedTime.value!
                                  .format(context)
                              : 'Select Time')),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
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
                    'Activity',
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
                        child: DropdownButton<String>(
                          style: textStyle14500.copyWith(color: greytextColor),
                          isExpanded: true,

                          // Initial Value
                          value: myAppController.actionSelectedActivity.value,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: myAppController.actionActivityDropdown
                              .map((items) {
                            return DropdownMenuItem<String>(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              myAppController.actionSelectedActivity.value =
                                  newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 14,
                  // ),
                  // Text(
                  //   'Link (Interaction/Meeting/Request)',
                  //   style: textStyle14500.copyWith(color: textColor054),
                  // ),
                  // Container(
                  //     width: Get.size.width,
                  //     child: CustomTextField(
                  //         onChange: (value) {
                  //           //handle change
                  //         },
                  //         controller: TextEditingController(),
                  //         hintText: 'Paste Link Here')),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Action Type',
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
                        child: DropdownButton<String>(
                          style: textStyle14500.copyWith(color: greytextColor),
                          isExpanded: true,

                          // Initial Value
                          value: myAppController.actionSelectedType.value,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items:
                              myAppController.actionTypeDropDown.map((items) {
                            return DropdownMenuItem<String>(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              myAppController.actionSelectedType.value =
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
                    'Description',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  Container(
                      height: 100,
                      width: Get.size.width,
                      child: CustomTextField(
                          onChange: (value) {
                            //handle change
                            myAppController.actionDescription.value = value;
                          },
                          controller:
                              myAppController.actionDescriptionController,
                          hintText: 'Write Important Notes Here')),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Action Outcome Type',
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
                          value: myAppController.actionSelectedOutcome.value,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: myAppController.actionOutcomeDropdown
                              .map((items) {
                            return DropdownMenuItem<String>(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              myAppController.actionSelectedOutcome.value =
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
                    'Outcome Details',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  Container(
                      height: 100,
                      width: Get.size.width,
                      child: CustomTextField(
                          onChange: (value) {
                            //handle change
                            myAppController.actionOutcomeDetails.value = value;
                          },
                          controller:
                              myAppController.actionOutcomeDetailsController,
                          hintText: 'Write Important Notes Here')),
                ],
              ),
            ),
            // const SizedBox(
            //   height: 8,
            // ),
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
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: Get.size.width,
                    child: SmartLifePrimaryButton(
                      onTap: () async {
                        addAction();
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

  resetValues() {
    myAppController.actionSelectedDate.value = null;
    myAppController.actionSelectedTime.value = null;
    myAppController.actionDescription.value = '';
    myAppController.actionOutcomeDetails.value = '';
  }
}
