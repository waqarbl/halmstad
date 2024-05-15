import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/constants/colors.dart';
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
  PageType selectedPage = PageType.meetingvisit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const OvalBorder(),
          backgroundColor: const Color.fromARGB(255, 1, 3, 90),
          onPressed: () {
            // Get.to(() => AddInteraction());
            // print('floating action button pressed');
            // Get.to(() => const AddMeeting());
            Get.to(() => AddRequest());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          backgroundColor: bluePrimary,
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
                  onSelectionChanged: (Set<PageType> newSelection) {
                    setState(() {
                      selectedPage = newSelection.first;
                    });
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
      height: Get.size.height / 1.34,
      padding: const EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(child: MeetingVisitItem(
            onTap: () {
              print("meeting card clicked");
              Get.to(() => const RequestDetailPage());
            },
          ));
        },
      ),
    );
  }

  _getTipsPageView(BuildContext context) {
    return Container(
      height: Get.size.height / 1.34,
      padding: const EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(child: TipItem(
            onTap: () {
              print("meeting card clicked");

              Get.to(() => const RequestDetailPage());
            },
          ));
        },
      ),
    );
  }
}
