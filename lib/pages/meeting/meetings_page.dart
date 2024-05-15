import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:halmstad/pages/meeting/add_meeting.dart';
import 'package:halmstad/pages/meeting/meeting_detail_page.dart';
import 'package:halmstad/widgets/reusables.dart';

enum PageType { completed, upcoming }

class MeetingsPage extends StatefulWidget {
  const MeetingsPage({super.key});

  @override
  State<MeetingsPage> createState() => _MeetingsPageState();
}

class _MeetingsPageState extends State<MeetingsPage> {
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
            Get.to(() => const AddMeeting());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          backgroundColor: bluePrimary,
          title: const Text(
            'Meeting',
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
          return Container(child: MeetingItem(
            onTap: () {
              print("meeting card clicked");
              Get.to(() => const MeetingDetailPage());
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
          return Container(child: MeetingItem(
            onTap: () {
              print("meeting card clicked");

              Get.to(() => const MeetingDetailPage());
            },
          ));
        },
      ),
    );
  }

  // DateTime _selectedDay = DateTime.now();
  // DateTime _focusedDay = DateTime.now();

  // _getCalendarPageView(BuildContext context) {
  //   List eventList = [DateTime(2024, 5, 15), DateTime(2024, 5, 18)];
  //   return Container(
  //     child: ListView(
  //       shrinkWrap: true,
  //       children: [
  //         // TableCalendar(
  //         //     currentDay: DateTime.now(),
  //         //     selectedDayPredicate: (day) {
  //         //       return isSameDay(_selectedDay, day);
  //         //     },
  //         //     onDaySelected: (selectedDay, focusedDay) {
  //         //       setState(() {
  //         //         _selectedDay = selectedDay;
  //         //         _focusedDay = focusedDay; // update `_focusedDay` here as well
  //         //       });
  //         //     },
  //         //     eventLoader: (day) {
  //         //       return eventList.where((date) => isSameDay(date, day)).toList();
  //         //     },
  //         //     headerStyle:
  //         //         HeaderStyle(formatButtonVisible: false, titleCentered: true),
  //         //     focusedDay: selectedDate,
  //         //     firstDay: DateTime.now().subtract(Duration(days: 365)),
  //         //     lastDay: DateTime.now().add(Duration(days: 365))),
  //         SizedBox(
  //           height: 20,
  //         ),

  //         Container(
  //           height: Get.size.width / 1.32,
  //           // child: ListView.builder(
  //           //   shrinkWrap: true,
  //           //   itemCount: 4,
  //           //   itemBuilder: (context, index) {
  //           //     return InteractionItem(
  //           //       onTap: () {
  //           //         Get.to(() => InteractionDetailPage());
  //           //       },
  //           //     );
  //           //   },
  //           // ),
  //         ),

  //         // Container(
  //         //   child: Column(
  //         //     children: eventList
  //         //         .map(
  //         //           (e) => InteractionItem(),
  //         //         )
  //         //         .toList(),
  //         //   ),
  //         // ),
  //         // Container(
  //         //   height: Get.size.height / 1.34,
  //         //   padding: EdgeInsets.only(bottom: 10),
  //         //   child: ListView.builder(
  //         //     shrinkWrap: true,
  //         //     itemCount: 4,
  //         //     itemBuilder: (context, index) {
  //         //       return Container(child: InteractionItem());
  //         //     },
  //         //   ),
  //         // )
  //       ],
  //     ),
  //   );
  // }
}
