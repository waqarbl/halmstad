import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:halmstad/models/interactionModel.dart';
import 'package:halmstad/widgets/reusables.dart';
import 'package:intl/intl.dart';

class InteractionDetailPage extends StatelessWidget {
  final Interaction interaction;
  InteractionDetailPage({super.key, required this.interaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bluePrimary,
        iconTheme: IconThemeData(color: whiteColor),
        title: Text(
          'Interaction',
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
              height: 12,
            ),
            TextRow(
                text1: 'Dated: ',
                text2: DateFormat('dd MMM yyyy')
                    .format(interaction.activityTime!)),
            SizedBox(
              height: 12,
            ),
            TextRow(text1: 'Time: ', text2: '4:22 PM not in response'),
            SizedBox(
              height: 12,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Address:  ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: Get.size.width / 1.45,
                    child: Text(
                      interaction.location!.address!,
                      maxLines: 3,
                      style: textStyle14500.copyWith(color: greytextColor),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            TextRow(text1: 'Detail :  Category Name ', text2: ''),
            SizedBox(
              height: 12,
            ),
            Text(
              'Not in response :: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: textStyle14500.copyWith(color: greytextColor),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Physical Features',
              style: textStyle16600.copyWith(color: bluePrimary),
            ),
            SizedBox(
              height: 12,
            ),
            TextRow(
                text1: 'Focus Area: ', text2: interaction.focusArea!.title!),
            SizedBox(
              height: 12,
            ),
            TextRow(
                text1: 'Type: ', text2: interaction.location!.locationType!),
            SizedBox(
              height: 12,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Address:  ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: Get.size.width / 1.45,
                    child: Text(
                      interaction.location!.address!,
                      maxLines: 3,
                      style: textStyle14500.copyWith(color: greytextColor),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            TextRow(
                text1: 'Follow up: ',
                text2: 'Not in response:: Follow up input'),
            SizedBox(
              height: 12,
            ),
            Text(
              'Attachments:  not in response ',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Group of People',
              style: textStyle16600.copyWith(color: bluePrimary),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Members:  ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    child: Text(
                      interaction.group!.members!.length.toString(),
                      style: textStyle14500.copyWith(color: greytextColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: interaction.group!.members!.length,
              itemBuilder: (context, index) {
                return MemberItem(
                  member: interaction.group!.members![index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
