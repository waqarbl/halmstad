import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:halmstad/models/meetingModel.dart';
import 'package:halmstad/widgets/reusables.dart';
import 'package:intl/intl.dart';

class MeetingDetailPage extends StatefulWidget {
  final Meeting meeting;
  MeetingDetailPage({super.key, required this.meeting});

  @override
  State<MeetingDetailPage> createState() => _MeetingDetailPageState();
}

class _MeetingDetailPageState extends State<MeetingDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bluePrimary,
        iconTheme: const IconThemeData(color: whiteColor),
        title: Text(
          'Meeting',
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
            TextRow(
                text1: 'Dated: ',
                text2: DateFormat('dd MMM yyyy')
                    .format(widget.meeting.activityTime)),
            const SizedBox(
              height: 12,
            ),
            TextRow(
                text1: 'Time: ',
                text2: DateFormat.jm().format(widget.meeting.activityTime)),
            const SizedBox(
              height: 12,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Location:  ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: Get.size.width / 1.46,
                    child: Text(
                      widget.meeting.detailedAddress,
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
            const TextRow(text1: 'Meeting Type: ', text2: 'widget.meeting.'),
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
                    width: Get.size.width / 1.46,
                    child: Text(
                      widget.meeting.notes,
                      maxLines: 3,
                      style: textStyle14500.copyWith(color: greytextColor),
                    ),
                  )
                ],
              ),
            ),
            // const SizedBox(
            //   height: 30,
            // ),
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
            Text(
              'Participants',
              style: textStyle16600.copyWith(color: bluePrimary),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Members:  ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    child: Text(
                      widget.meeting.group.members.length.toString(),
                      style: textStyle14500.copyWith(color: greytextColor),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            // const MemberItem(),
            // const MemberItem(),
          ],
        ),
      ),
    );
  }
}
