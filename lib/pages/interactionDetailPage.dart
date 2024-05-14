import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:halmstad/widgets/reusables.dart';

class InteractionDetailPage extends StatelessWidget {
  const InteractionDetailPage({super.key});

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
            TextRow(text1: 'Dated: ', text2: '22 Mar 2024'),
            SizedBox(
              height: 12,
            ),
            TextRow(text1: 'Time: ', text2: '4:22 PM'),
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
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
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
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
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
            TextRow(text1: 'Focus Area: ', text2: 'Area Name'),
            SizedBox(
              height: 12,
            ),
            TextRow(text1: 'Type: ', text2: 'Area Type'),
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
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
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
            TextRow(text1: 'Follow up: ', text2: 'Follow up input'),
            SizedBox(
              height: 12,
            ),
            Text(
              'Attachments:  ',
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
                      '5',
                      style: textStyle14500.copyWith(color: greytextColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            MemberItem(),
            MemberItem(),
          ],
        ),
      ),
    );
  }
}

class MemberItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      width: Get.size.width,
      padding: EdgeInsets.all(10),
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
                children: [Text('Member Name'), Text('26 years')],
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ethnicity :  ',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Container(
                  child: Text(
                    'Asian',
                    style: textStyle14500.copyWith(color: greytextColor),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
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
