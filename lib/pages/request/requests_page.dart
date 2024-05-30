import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:halmstad/models/requestModel.dart';
import 'package:halmstad/network/network_calls.dart';
import 'package:halmstad/pages/request/add_request.dart';
import 'package:halmstad/pages/request/request_detail_page.dart';
import 'package:halmstad/widgets/reusables.dart';

enum PageType { meetingvisit, tips }

class RequestsPage extends StatefulWidget {
  const RequestsPage({super.key});

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  final networkCalls = NetworkCalls();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRequests();
  }

  List<RequestModel> meetingvisistList = [];
  List<RequestModel> tipsList = [];

  String message = '';
  bool isLoading = false;

  getRequests() async {
    message = '';
    isLoading = true;
    meetingvisistList = [];
    tipsList = [];
    // interactionModel = null;
    setState(() {});
    final response = await networkCalls.getRequests();
    log(response);
    final decodedResponse = jsonDecode(response);
    for (var element in decodedResponse) {
      RequestModel requestModel = RequestModel.fromJson(element);
      if (requestModel.requestType == 'TIP') {
        tipsList.add(requestModel);
      } else {
        meetingvisistList.add(requestModel);
      }
    }
    isLoading = false;
    setState(() {});
  }

  PageType selectedPage = PageType.meetingvisit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const OvalBorder(),
          backgroundColor: const Color.fromARGB(255, 1, 3, 90),
          onPressed: () async {
            Get.to(() => AddRequest());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          backgroundColor: bluePrimary,
          automaticallyImplyLeading: false,
          title: const Text(
            'Request',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.only(top: 20),
          // width: double.maxFinite,
          // height: Get.size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: Get.width / 1.2,
                child: SegmentedButton<PageType>(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return bluePrimary;
                        }
                        return whiteColor;
                      },
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ),
                  showSelectedIcon: false,
                  segments: <ButtonSegment<PageType>>[
                    ButtonSegment<PageType>(
                      value: PageType.meetingvisit,
                      label: Text(
                        'Meeting/Visits',
                        style: textStyle14500.copyWith(
                          color: selectedPage == PageType.meetingvisit
                              ? whiteColor
                              : blackColor,
                        ),
                      ),
                    ),
                    ButtonSegment<PageType>(
                      value: PageType.tips,
                      label: Text(
                        'Tips',
                        style: textStyle14500.copyWith(
                          color: selectedPage == PageType.tips
                              ? whiteColor
                              : blackColor,
                        ),
                      ),
                    ),
                  ],
                  selected: <PageType>{selectedPage},
                  onSelectionChanged: (Set<PageType> newSelection) async {
                    await getRequests();
                    selectedPage = newSelection.first;
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              selectedPage == PageType.meetingvisit
                  ? _getMeetingVisitsPageView(context)
                  : _getTipsPageView(context)
            ],
          ),
        )));
  }

  _getMeetingVisitsPageView(BuildContext context) {
    return Container(
      height: Get.size.height / 1.4,
      padding: const EdgeInsets.only(bottom: 10),
      child: meetingvisistList.isEmpty
          ? Container(
              padding: const EdgeInsets.all(30),
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : const Text(
                      'There are no upcoming actions',
                      style: textStyle16600,
                    ))
          : ListView.builder(
              shrinkWrap: true,
              itemCount: meetingvisistList.length,
              itemBuilder: (context, index) {
                return Container(
                    child: MeetingVisitItem(
                  request: meetingvisistList[index],
                  onTap: () async {
                    print("meeting card clicked");
                    final result = await Get.to(() => RequestDetailPage(
                          requestDetail: meetingvisistList[index],
                        ));
                    print(result);
                    if (result != null) {
                      if (result == 'success') {
                        await getRequests();
                      }
                    }
                  },
                ));
              },
            ),
    );
  }

  _getTipsPageView(BuildContext context) {
    return Container(
      height: Get.size.height / 1.4,
      padding: const EdgeInsets.only(bottom: 10),
      child: tipsList.isEmpty
          ? Container(
              padding: const EdgeInsets.all(30),
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : const Text(
                      'There are no upcoming actions',
                      style: textStyle16600,
                    ))
          : ListView.builder(
              shrinkWrap: true,
              itemCount: tipsList.length,
              itemBuilder: (context, index) {
                return Container(
                    child: TipItem(
                  tip: tipsList[index],
                  onTap: () async {
                    print("meeting card clicked");

                    final result = await Get.to(() => RequestDetailPage(
                          requestDetail: tipsList[index],
                        ));
                    print(result);
                    if (result != null) {
                      if (result == 'success') {
                        await getRequests();
                      }
                    }
                  },
                ));
              },
            ),
    );
  }
}
