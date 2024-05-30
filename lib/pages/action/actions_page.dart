import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:halmstad/models/actionModel.dart' as actionModel;
import 'package:halmstad/models/actionModel.dart';
import 'package:halmstad/network/network_calls.dart';
import 'package:halmstad/pages/action/action_detail_page.dart';
import 'package:halmstad/pages/action/add_action.dart';
import 'package:halmstad/widgets/reusables.dart';
import 'dart:developer';

enum PageType { upcoming, completed }

class ActionsPage extends StatefulWidget {
  const ActionsPage({super.key});

  @override
  State<ActionsPage> createState() => _ActionsPageState();
}

class _ActionsPageState extends State<ActionsPage> {
  bool isLoading = false;
  final networkCalls = NetworkCalls();

  List<actionModel.Action> upcomingActionList = [];
  List<actionModel.Action> completedActionList = [];
  String message = '';
  @override
  void initState() {
    super.initState();

    getActions();
  }

  getActions() async {
    message = '';
    isLoading = true;
    // interactionModel = null;
    setState(() {});
    final response = await networkCalls.getActions();
    log(response);
    if (!response.contains('Error:')) {
      if (jsonDecode(response)['success'] == false) {
        message = jsonDecode(response)['message'];
        setState(() {});
        print("Message ::: $message");
      } else {
        actionModel.ActionModel actionModelLocal =
            actionModelFromJson(response);
        var timeNow = DateTime.utc(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            DateTime.now().hour,
            DateTime.now().minute,
            DateTime.now().millisecond);
        actionModelLocal.data.forEach((element) {
          final elementTime = DateTime.utc(
              element.actionTime.year,
              element.actionTime.month,
              element.actionTime.day,
              element.actionTime.hour,
              element.actionTime.minute,
              element.actionTime.millisecond);

          if (elementTime.isAfter(timeNow)) {
            upcomingActionList.add(element);
          } else {
            completedActionList.add(element);
          }
        });

        setState(() {});
      }
    }
    isLoading = false;
    setState(() {});
  }

  PageType selectedPage = PageType.upcoming;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const OvalBorder(),
          backgroundColor: const Color.fromARGB(255, 1, 3, 90),
          onPressed: () {
            Get.to(() => AddAction());
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
            'Action',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.only(top: 20),
          width: Get.size.width,
          height: Get.size.height,
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
                      value: PageType.upcoming,
                      label: Text(
                        'Upcoming',
                        style: textStyle14500.copyWith(
                          color: selectedPage == PageType.upcoming
                              ? whiteColor
                              : blackColor,
                        ),
                      ),
                    ),
                    ButtonSegment<PageType>(
                      value: PageType.completed,
                      label: Text(
                        'Completed',
                        style: textStyle14500.copyWith(
                          color: selectedPage == PageType.completed
                              ? whiteColor
                              : blackColor,
                        ),
                      ),
                    ),
                  ],
                  selected: <PageType>{selectedPage},
                  onSelectionChanged: (Set<PageType> newSelection) async {
                    upcomingActionList.clear();
                    completedActionList.clear();
                    selectedPage = newSelection.first;

                    await getActions();
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              selectedPage == PageType.upcoming
                  ? _getUpcomingPageView(context)
                  : _getCompletedPageView(context)
            ],
          ),
        )));
  }

  _getUpcomingPageView(BuildContext context) {
    return Container(
      height: Get.size.height / 1.4,
      padding: const EdgeInsets.only(bottom: 10),
      child: upcomingActionList.isEmpty
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
              itemCount: upcomingActionList.length,
              itemBuilder: (context, index) {
                return Container(
                    child: ActionItem(
                  action: upcomingActionList[index],
                  onTap: () {
                    // print("meeting card clicked");
                    // Get.to(() => const RequestDetailPage());
                    Get.to(() => ActionDetailPage(
                          action: upcomingActionList[index],
                        ));
                  },
                ));
              },
            ),
    );
  }

  _getCompletedPageView(BuildContext context) {
    return Container(
      height: Get.size.height / 1.4,
      padding: const EdgeInsets.only(bottom: 10),
      child: completedActionList.isEmpty
          ? Container(
              padding: const EdgeInsets.all(30),
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : const Text(
                      'There are no completed actions',
                      style: textStyle16600,
                    ))
          : ListView.builder(
              shrinkWrap: true,
              itemCount: completedActionList.length,
              itemBuilder: (context, index) {
                return Container(
                    child: ActionItem(
                  action: completedActionList[index],
                  onTap: () {
                    // print("meeting card clicked");

                    // Get.to(() => const RequestDetailPage());
                    Get.to(() => ActionDetailPage(
                          action: completedActionList[index],
                        ));
                  },
                ));
              },
            ),
    );
  }
}
