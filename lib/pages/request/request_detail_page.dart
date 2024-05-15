import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:halmstad/widgets/reusables.dart';

class RequestDetailPage extends StatelessWidget {
  const RequestDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bluePrimary,
        iconTheme: const IconThemeData(color: whiteColor),
        title: Text(
          'Request',
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
              height: 12,
            ),
            const TextRow(text1: 'Dated: ', text2: '22 Mar 2024'),
            const SizedBox(
              height: 12,
            ),
            const TextRow(text1: 'Time: ', text2: '4:22 PM'),
            const SizedBox(
              height: 12,
            ),
            const TextRow(text1: 'Request Type: ', text2: 'Meeting'),
            const SizedBox(
              height: 12,
            ),
            const TextRow(text1: 'Source: ', text2: 'Lorem ipsum dolor sit'),
            const SizedBox(
              height: 12,
            ),
            const TextRow(
                text1: 'Nature of Request: ', text2: 'Lorem ipsum dolor sit'),
            const SizedBox(
              height: 12,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Address:  ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: Get.size.width / 1.46,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      maxLines: 3,
                      style: textStyle14500.copyWith(color: greytextColor),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const TextRow(text1: 'Tip Category: ', text2: 'Substance Use'),
            const SizedBox(
              height: 12,
            ),
            const TextRow(text1: 'Request Category: ', text2: 'Resource'),
            const SizedBox(
              height: 12,
            ),
            const TextRow(text1: 'Urgency: ', text2: 'Urgent'),
            const SizedBox(
              height: 12,
            ),
            const TextRow(text1: 'Status: ', text2: 'Resolved'),
            const SizedBox(
              height: 12,
            ),
            const Text(
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
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                ),
                const SizedBox(
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
              height: 15,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Notes:  ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: Get.size.width / 1.46,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      maxLines: 3,
                      style: textStyle14500.copyWith(color: greytextColor),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: Get.size.width,
              child: SmartLifePrimaryButton(
                borderRadius: 10,
                text: 'Mark as Resolved',
                textStyle: textStyle14500.copyWith(
                    color: whiteColor, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
