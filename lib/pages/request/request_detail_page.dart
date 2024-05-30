import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:halmstad/models/requestModel.dart';
import 'package:halmstad/network/network_calls.dart';
import 'package:halmstad/widgets/reusables.dart';
import 'package:intl/intl.dart';

class RequestDetailPage extends StatefulWidget {
  RequestModel requestDetail;
  RequestDetailPage({super.key, required this.requestDetail});

  @override
  State<RequestDetailPage> createState() => _RequestDetailPageState();
}

class _RequestDetailPageState extends State<RequestDetailPage> {
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
            TextRow(
                text1: 'Dated: ',
                text2: DateFormat('dd MMM yyyy')
                    .format(widget.requestDetail.time)),
            const SizedBox(
              height: 12,
            ),
            TextRow(
                text1: 'Time: ',
                text2: DateFormat.jm().format(widget.requestDetail.time)),
            const SizedBox(
              height: 12,
            ),
            TextRow(
                text1: 'Request Type: ',
                text2: widget.requestDetail.requestType),
            const SizedBox(
              height: 12,
            ),
            TextRow(text1: 'Source: ', text2: widget.requestDetail.source),
            const SizedBox(
              height: 12,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nature of Request: ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: Get.size.width / 1.83,
                    child: Text(
                      widget.requestDetail.natureOfRequest,
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
                      widget.requestDetail.detailedAddress,
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
            TextRow(
                text1: 'Tip Category: ',
                text2: widget.requestDetail.tipCategory),
            const SizedBox(
              height: 12,
            ),
            TextRow(
                text1: 'Request Category: ',
                text2: widget.requestDetail.requestCategory),
            const SizedBox(
              height: 12,
            ),
            TextRow(text1: 'Urgency: ', text2: widget.requestDetail.urgency),
            const SizedBox(
              height: 12,
            ),
            TextRow(text1: 'Status: ', text2: widget.requestDetail.status),
            // const SizedBox(
            //   height: 12,
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
                      widget.requestDetail.notes,
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

            widget.requestDetail.status == 'RESOLVED'
                ? Container()
                : Container(
                    width: Get.size.width,
                    child: SmartLifePrimaryButton(
                      onTap: () async {
                        final response = await NetworkCalls()
                            .markAsResolved(widget.requestDetail.id.toString());

                        if (!response.contains('Error:')) {
                          Get.back(result: 'success');
                          Get.rawSnackbar(
                              message:
                                  'Request Marked as Resolved Successfully!',
                              backgroundColor: Colors.green.shade400);
                        }
                      },
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
