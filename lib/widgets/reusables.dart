import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:halmstad/models/interactionModel.dart';
import 'package:halmstad/models/meetingModel.dart';
import 'package:halmstad/models/memberModel.dart';
import 'package:halmstad/models/requestModel.dart';
import 'package:intl/intl.dart';
import 'package:halmstad/models/actionModel.dart' as actionModel;

// ignore: must_be_immutable
class InteractionItem extends StatelessWidget {
  Interaction interaction;
  InteractionItem({super.key, this.onTap, required this.interaction});

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      width: double.maxFinite,
      height: 250,
      child: GestureDetector(
        onTap: onTap,
        child: Card.outlined(
          elevation: 8,
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  title:
                      Text(interaction.interationTitle, style: textStyle14500),
                  subtitle:
                      Text(interaction.interationDes, style: textStyle12400),
                  trailing: const Icon(Icons.more_vert_rounded),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text('Dated: ', style: textStyle14500),
                    Text(
                      DateFormat('dd MMM yyyy')
                          .format(interaction.activityTime),
                      style: textStyle14500.copyWith(color: greytextColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('Focus Area: ', style: textStyle14500),
                    Text(
                      interaction.focusArea.title,
                      style: textStyle14500.copyWith(color: greytextColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      'Total Members: ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      interaction.group.members!.length.toString(),
                      style: textStyle14500.copyWith(color: greytextColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address:  ',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        width: Get.size.width / 1.45,
                        child: Text(
                          interaction.location.address,
                          maxLines: 3,
                          style: textStyle14500.copyWith(color: greytextColor),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextRow extends StatelessWidget {
  final String text1;
  final String text2;

  const TextRow({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(
          text2,
          maxLines: 3,
          style: textStyle14500.copyWith(color: greytextColor),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class MeetingItem extends StatelessWidget {
  final Meeting meeting;
  MeetingItem({super.key, required this.meeting, this.onTap});

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      width: double.maxFinite,
      height: 250,
      child: GestureDetector(
        onTap: onTap,
        child: Card.outlined(
          elevation: 8,
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  title: const Text('MEETING', style: textStyle14500),
                  subtitle: Text(meeting.notes, style: textStyle12400),
                  trailing: const Icon(Icons.more_vert_rounded),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text('Time: ', style: textStyle14500),
                    Text(
                      DateFormat.jm().format(meeting.activityTime),
                      style: textStyle14500.copyWith(color: greytextColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('Date: ', style: textStyle14500),
                    Text(
                      DateFormat('dd MMM yyyy').format(meeting.activityTime),
                      style: textStyle14500.copyWith(color: greytextColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('Participants: ', style: textStyle14500),
                    Text(
                      meeting.group.members.length.toString(),
                      style: textStyle14500.copyWith(color: greytextColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location:  ',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        width: Get.size.width / 1.45,
                        child: Text(
                          meeting.detailedAddress,
                          maxLines: 3,
                          style: textStyle14500.copyWith(color: greytextColor),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MemberItem extends StatelessWidget {
  final Member member;
  const MemberItem({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      width: Get.size.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: greytextColor.withOpacity(0.4), width: 2))),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [Text('Member Name'), Text('${member.age} years')],
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ethnicity :  ',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Container(
                  child: Text(
                    'member.',
                    style: textStyle14500.copyWith(color: greytextColor),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Disability :  ',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Container(
                  child: Text(
                    'Yes (Disability Notes Lorem Ipsum)',
                    style: textStyle14500.copyWith(color: greytextColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool hasMargin;
  String? Function(String?)? validator;
  ValueChanged<String>? onChange;

  CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChange,
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
        onChanged: onChange,
        validator: validator,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(bottom: 13),
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
              const EdgeInsets.only(bottom: 5, top: 5)),
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
            backgroundColor: const MaterialStatePropertyAll(bluePrimary),
            // shadowColor: MaterialStatePropertyAll(shadowColor ?? blackColor)
          ),
          child: Text(
            text,
            style: textStyle,
          )),
    );
  }
}

// ignore: must_be_immutable
class MeetingVisitItem extends StatelessWidget {
  final RequestModel request;
  MeetingVisitItem({super.key, required this.request, this.onTap});

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      width: double.maxFinite,
      height: 300,
      child: GestureDetector(
        onTap: onTap,
        child: Card.outlined(
          elevation: 8,
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  title: Text(request.requestType, style: textStyle14500),
                  subtitle: Text(request.notes, style: textStyle12400),
                  trailing: const Icon(Icons.more_vert_rounded),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text('Time: ', style: textStyle14500),
                    Text(
                      DateFormat.jm().format(request.time),
                      style: textStyle14500.copyWith(color: greytextColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('Date: ', style: textStyle14500),
                    Text(
                      DateFormat('dd MMM yyyy').format(request.time),
                      style: textStyle14500.copyWith(color: greytextColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('Urgency: ', style: textStyle14500),
                    Text(
                      request.urgency,
                      style: textStyle14500.copyWith(color: greytextColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('Status: ', style: textStyle14500),
                    Text(
                      request.status,
                      style: textStyle14500.copyWith(color: greytextColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address:  ',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        width: Get.size.width / 1.45,
                        child: Text(
                          request.detailedAddress,
                          maxLines: 3,
                          style: textStyle14500.copyWith(color: greytextColor),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TipItem extends StatelessWidget {
  final RequestModel tip;
  TipItem({super.key, required this.tip, this.onTap});

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      width: double.maxFinite,
      height: 300,
      child: GestureDetector(
        onTap: onTap,
        child: Card.outlined(
          elevation: 8,
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  title: Text(tip.requestType, style: textStyle14500),
                  subtitle: Text(tip.notes, style: textStyle12400),
                  trailing: const Icon(Icons.more_vert_rounded),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text('Time: ', style: textStyle14500),
                    Text(
                      DateFormat.jm().format(tip.time),
                      style: textStyle14500.copyWith(color: greytextColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('Date: ', style: textStyle14500),
                    Text(
                      DateFormat('dd MMM yyyy').format(tip.time),
                      style: textStyle14500.copyWith(color: greytextColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('Urgency: ', style: textStyle14500),
                    Text(
                      tip.urgency,
                      style: textStyle14500.copyWith(color: greytextColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('Status: ', style: textStyle14500),
                    Text(
                      tip.status,
                      style: textStyle14500.copyWith(color: greytextColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address:  ',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        width: Get.size.width / 1.45,
                        child: Text(
                          tip.detailedAddress,
                          maxLines: 3,
                          style: textStyle14500.copyWith(color: greytextColor),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ActionItem extends StatelessWidget {
  ActionItem({super.key, this.onTap, required this.action});
  final actionModel.Action action;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      width: double.maxFinite,
      height: 250,
      child: GestureDetector(
        onTap: onTap,
        child: Card.outlined(
          elevation: 8,
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  title: Text(action.actionType, style: textStyle14500),
                  subtitle: Text(action.description, style: textStyle12400),
                  trailing: const Icon(Icons.more_vert_rounded),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text('Time: ', style: textStyle14500),
                    Text(
                      DateFormat.jm().format(action.actionTime),
                      style: textStyle14500.copyWith(color: greytextColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('Date: ', style: textStyle14500),
                    Text(
                      DateFormat('dd MMM yyyy').format(action.actionTime),
                      style: textStyle14500.copyWith(color: greytextColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Outcome:  ',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        width: Get.size.width / 1.47,
                        child: Text(
                          action.outcomeDetails,
                          maxLines: 3,
                          style: textStyle14500.copyWith(color: greytextColor),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
