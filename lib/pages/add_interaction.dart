import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:intl/intl.dart';

class AddInteraction extends StatefulWidget {
  const AddInteraction({super.key});

  @override
  State<AddInteraction> createState() => _AddInteractionState();
}

class _AddInteractionState extends State<AddInteraction> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  String address = '';

  List peopleList = [];
  var categoryItems = [
    'Substance Abuse',
    'Violence',
    'Mental Health',
  ];
  String categorySelectedValue = 'Substance Abuse';

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
        iconTheme: IconThemeData(color: whiteColor),
        title: Text(
          'Add Interaction',
          style: textStyle16600.copyWith(
            color: whiteColor,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 20),
        width: Get.size.width - 60,
        height: Get.size.height,
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'General Information',
              style: textStyle16600.copyWith(color: bluePrimary),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
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
                        text:
                            '${selectedDate != null ? DateFormat('dd MMM yyyy').format(selectedDate!) : 'Select Date'}',
                        onTap: () async {
                          selectedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now().subtract(
                              Duration(days: 365),
                            ),
                            lastDate: DateTime.now().add(
                              Duration(days: 365),
                            ),
                          );
                          setState(() {});
                        },
                      )),
                  SizedBox(
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
                                initialTime: TimeOfDay(hour: 0, minute: 0));
                            setState(() {});
                          },
                          text:
                              '${selectedTime != null ? selectedTime!.format(context) : 'Select Time'}')),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Address',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  Container(
                      width: Get.size.width,
                      child: CustomTextField(
                          controller: TextEditingController(),
                          hintText: 'Enter Your Detailed Address')),
                  SizedBox(
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
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          style: textStyle14500.copyWith(color: greytextColor),
                          isExpanded: true,

                          // Initial Value
                          value: categorySelectedValue,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: categoryItems.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              categorySelectedValue = newValue!;
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
                  SizedBox(
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
                          controller: TextEditingController(),
                          hintText: 'Write Important Notes Here')),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Physical Features',
              style: textStyle16600.copyWith(color: bluePrimary),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
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
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          style: textStyle14500.copyWith(color: greytextColor),
                          isExpanded: true,

                          // Initial Value
                          value: selectedFocusArea,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: focusAreaList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedFocusArea = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
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
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          style: textStyle14500.copyWith(color: greytextColor),
                          isExpanded: true,

                          // Initial Value
                          value: selectedFocusArea,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: focusAreaList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedFocusArea = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Follow up',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  Container(
                      width: Get.size.width,
                      child: CustomTextField(
                          controller: TextEditingController(),
                          hintText: 'Enter Your Detailed Address')),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Attachment',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  Container(
                      width: Get.size.width,
                      child: CustomTextField(
                          controller: TextEditingController(),
                          hintText: 'Attachment Document (if any)')),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Group of People',
                    style: textStyle14500.copyWith(color: textColor054),
                  ),
                  SizedBox(
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
                          height: Get.size.height / 1.5,
                          padding: EdgeInsets.only(left: 15, right: 15),
                          width: Get.size.width - 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 14,
                              ),
                              Text(
                                'Name',
                                style: textStyle14500.copyWith(
                                    color: textColor054),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Container(
                                  width: Get.size.width,
                                  child: CustomTextField(
                                      controller: TextEditingController(),
                                      hintText: 'Enter Your Name')),
                              SizedBox(
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
                                    contentPadding: EdgeInsets.symmetric(
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
                                      value: categorySelectedValue,

                                      // Down Arrow Icon
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: categoryItems.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          categorySelectedValue = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Text(
                                'Ethnicity',
                                style: textStyle14500.copyWith(
                                    color: textColor054),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Container(
                                  width: Get.size.width,
                                  child: CustomTextField(
                                      controller: TextEditingController(),
                                      hintText: 'Enter Your Ethnicity')),
                              SizedBox(
                                height: 14,
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
                                    contentPadding: EdgeInsets.symmetric(
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
                                      value: categorySelectedValue,

                                      // Down Arrow Icon
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: categoryItems.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          categorySelectedValue = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Text(
                                'Notes',
                                style: textStyle14500.copyWith(
                                    color: textColor054),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Container(
                                  height: 100,
                                  width: Get.size.width,
                                  child: CustomTextField(
                                      controller: TextEditingController(),
                                      hintText: 'Write Important Notes Here')),
                              SizedBox(
                                height: 20,
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
                            ],
                          ),
                        ),
                      ));

                      print('result:::: ${result}');
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      child: GFBorder(
                        type: GFBorderType.circle,
                        dashedLine: [4, 6],
                        color: Color(0xFFD0D5DD),
                        strokeWidth: 2,
                        child: Center(
                            child: Icon(
                          Icons.add,
                          size: 40,
                          color: Color(0xFFD0D5DD),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
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
                  SizedBox(
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

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool hasMargin;
  String? Function(String?)? validator;

  CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.hasMargin = true,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(
            color: blackColor.withOpacity(0.6),
            width: 1,
          ),
          color: whiteColor,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        minLines: 1,
        maxLines: 20,
        controller: controller,
        style: textStyle14500,
        validator: validator,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(bottom: 13),
            hintStyle: textStyle14500,
            hintText: hintText),
      ),
    );
  }
}

class SmartLifeOutlinedButton extends StatelessWidget {
  final String text;
  final Color? bgColor;
  final Color? textColor;
  final Color? shadowColor;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final double? fontSize;
  final Color? borderColor;
  final double? borderWidth;

  const SmartLifeOutlinedButton(
      {super.key,
      required this.text,
      this.bgColor,
      this.fontSize,
      this.textColor,
      this.textStyle,
      this.borderColor,
      this.borderWidth,
      this.onTap,
      this.shadowColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      child: OutlinedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.only(bottom: 5, top: 5)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          side: MaterialStatePropertyAll(BorderSide(
            color: blackColor.withOpacity(0.6),
            width: 1,
          )),
        ),
        onPressed: onTap,
        child: Text(
          text,
          // textAlign: TextAlign.left,
          style: textStyle,
        ),
      ),
    );
  }
}

class SmartLifePrimaryButton extends StatelessWidget {
  final String text;
  final Color? bgColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final double? fontSize;
  final double? borderRadius;

  const SmartLifePrimaryButton({
    super.key,
    required this.text,
    this.bgColor,
    this.textColor,
    this.fontSize,
    this.textStyle,
    this.borderRadius,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 50))),
            backgroundColor: MaterialStatePropertyAll(bluePrimary),
            // shadowColor: MaterialStatePropertyAll(shadowColor ?? blackColor)
          ),
          child: Text(
            text,
            style: textStyle,
          )),
    );
  }
}
