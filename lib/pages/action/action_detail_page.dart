import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:halmstad/widgets/reusables.dart';
import 'package:halmstad/models/actionModel.dart' as actionModel;
import 'package:intl/intl.dart';

class ActionDetailPage extends StatelessWidget {
  ActionDetailPage({super.key, required this.action});

  final actionModel.Action action;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bluePrimary,
        iconTheme: const IconThemeData(color: whiteColor),
        title: Text(
          'Action',
          style: textStyle16600.copyWith(
            color: whiteColor,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 20),
        // width: Get.size.width - 60,
        height: Get.size.height,
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'Action Date and Time',
              style: textStyle16600.copyWith(color: bluePrimary),
            ),
            const SizedBox(
              height: 12,
            ),
            TextRow(
                text1: 'Dated: ',
                text2: DateFormat('dd MMM yyyy').format(action.actionTime)),
            const SizedBox(
              height: 12,
            ),
            TextRow(
                text1: 'Time: ',
                text2: DateFormat.jm().format(action.actionTime)),
            const SizedBox(
              height: 12,
            ),
            Text(
              'General Information',
              style: textStyle16600.copyWith(color: bluePrimary),
            ),
            const SizedBox(
              height: 12,
            ),
            TextRow(text1: 'Activity: ', text2: action.activityType),
            const SizedBox(
              height: 12,
            ),
            // Container(
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const Text(
            //         'Meeting Link:  ',
            //         style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            //       ),
            //       Container(
            //         width: Get.size.width / 1.5,
            //         child: Text(
            //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            //           maxLines: 3,
            //           style: textStyle14500.copyWith(color: greytextColor),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 12,
            ),
            TextRow(text1: 'Action Type: ', text2: action.actionType),
            const SizedBox(
              height: 12,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Detail:  ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: Get.size.width / 1.5,
                    child: Text(
                      action.description,
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
            TextRow(text1: 'Action Outcome Type: ', text2: action.outcomeType),
            const SizedBox(
              height: 12,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Outcome Detail:  ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: Get.size.width / 1.56,
                    child: Text(
                      action.outcomeDetails,
                      maxLines: 3,
                      style: textStyle14500.copyWith(color: greytextColor),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // const Text(
            //   'Attachments:  ',
            //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            // ),
            // Row(
            //   children: [
            //     Container(
            //       width: 60,
            //       height: 60,
            //       decoration: BoxDecoration(
            //           color: Colors.amber,
            //           borderRadius: BorderRadius.circular(10)),
            //     ),
            //     const SizedBox(
            //       width: 10,
            //     ),
            //     Container(
            //       width: 60,
            //       height: 60,
            //       decoration: BoxDecoration(
            //           color: Colors.amber,
            //           borderRadius: BorderRadius.circular(10)),
            //     ),
            //     const SizedBox(
            //       width: 10,
            //     ),
            //     Container(
            //       width: 60,
            //       height: 60,
            //       decoration: BoxDecoration(
            //           color: Colors.amber,
            //           borderRadius: BorderRadius.circular(10)),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
