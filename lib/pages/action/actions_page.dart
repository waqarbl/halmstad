import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:halmstad/pages/action/action_detail_page.dart';
import 'package:halmstad/pages/action/add_action.dart';
import 'package:halmstad/widgets/reusables.dart';

enum PageType { upcoming, completed }

class ActionsPage extends StatefulWidget {
  const ActionsPage({super.key});

  @override
  State<ActionsPage> createState() => _ActionsPageState();
}

class _ActionsPageState extends State<ActionsPage> {
  PageType selectedPage = PageType.upcoming;
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
            Get.to(() => AddAction());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          backgroundColor: bluePrimary,
          title: const Text(
            'Action',
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
              selectedPage == PageType.upcoming
                  ? _getUpcomingPageView(context)
                  : _getCompletedPageView(context)
            ],
          ),
        )));
  }

  _getUpcomingPageView(BuildContext context) {
    return Container(
      height: Get.size.height / 1.34,
      padding: const EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(child: ActionItem(
            onTap: () {
              // print("meeting card clicked");
              // Get.to(() => const RequestDetailPage());
              Get.to(() => ActionDetailPage());
            },
          ));
        },
      ),
    );
  }

  _getCompletedPageView(BuildContext context) {
    return Container(
      height: Get.size.height / 1.34,
      padding: const EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(child: ActionItem(
            onTap: () {
              // print("meeting card clicked");

              // Get.to(() => const RequestDetailPage());
              Get.to(() => ActionDetailPage());
            },
          ));
        },
      ),
    );
  }
}
