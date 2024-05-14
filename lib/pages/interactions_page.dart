import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:get/get.dart';
import 'package:halmstad/pages/add_interaction.dart';
import 'package:halmstad/pages/interactionDetailPage.dart';
import 'package:halmstad/widgets/reusables.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

enum PageType { today, calendar }

class InteractionsPage extends StatefulWidget {
  const InteractionsPage({super.key});

  @override
  State<InteractionsPage> createState() => _InteractionsPageState();
}

class _InteractionsPageState extends State<InteractionsPage> {
  PageType selectedPage = PageType.today;
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: OvalBorder(),
          backgroundColor: const Color.fromARGB(255, 1, 3, 90),
          onPressed: () {
            Get.to(() => AddInteraction());
            // print('floating action button pressed');
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        // drawer: Drawer(
        //   child: Column(
        //     children: [
        //       const UserAccountsDrawerHeader(
        //         accountName: Text('John Doe'),
        //         accountEmail: Text('user@example.com'),
        //         currentAccountPicture: CircleAvatar(
        //           backgroundColor: Colors.lime,
        //         ),
        //       ),
        //       const ListTile(
        //         leading: Icon(Icons.access_alarm),
        //         title: Text('Interaction Details'),
        //         trailing: Icon(Icons.arrow_forward_ios_rounded),
        //       ),
        //       const Divider(),
        //       const ListTile(
        //         leading: Icon(Icons.access_alarm),
        //         title: Text('Interaction Details'),
        //         trailing: Icon(Icons.arrow_forward_ios_rounded),
        //       ),
        //       const Divider(),
        //       const ListTile(
        //         leading: Icon(Icons.access_alarm),
        //         title: Text('Interaction Details'),
        //         trailing: Icon(Icons.arrow_forward_ios_rounded),
        //       ),
        //       const Divider(),
        //       const ListTile(
        //         leading: Icon(Icons.access_alarm),
        //         title: Text('Interaction Details'),
        //         trailing: Icon(Icons.arrow_forward_ios_rounded),
        //       ),
        //       const Divider(),
        //       const Spacer(),
        //       ElevatedButton(
        //         onPressed: () {},
        //         style: ElevatedButton.styleFrom(
        //           maximumSize: const Size(200, 50),
        //           minimumSize: const Size(200, 50),
        //           backgroundColor: const Color.fromARGB(255, 1, 3, 90),
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(7), // button's shape
        //           ),
        //         ),
        //         child: const Text(
        //           'Logout',
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       ),
        //       const SizedBox(
        //         height: 30,
        //       )
        //     ],
        //   ),
        // ),
        appBar: AppBar(
          backgroundColor: bluePrimary,
          title: const Text(
            'Interaction',
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
                      value: PageType.today,
                      label: Text(
                        'Today',
                        style: textStyle14500.copyWith(
                          color: selectedPage == PageType.today
                              ? whiteColor
                              : blackColor,
                        ),
                      ),
                    ),
                    ButtonSegment<PageType>(
                      value: PageType.calendar,
                      label: Text(
                        'Calendar',
                        style: textStyle14500.copyWith(
                          color: selectedPage == PageType.calendar
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
              SizedBox(
                height: 10,
              ),
              selectedPage == PageType.today
                  ? _getTodayPageView(context)
                  : _getCalendarPageView(context)
            ],
          ),
        )));
  }

  _getTodayPageView(BuildContext context) {
    return Container(
      height: Get.size.height / 1.34,
      padding: EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(child: InteractionItem(
            onTap: () {
              Get.to(() => InteractionDetailPage());
            },
          ));
        },
      ),
    );
  }

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  _getCalendarPageView(BuildContext context) {
    List eventList = [DateTime(2024, 5, 15), DateTime(2024, 5, 18)];
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: [
          TableCalendar(
              currentDay: DateTime.now(),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // update `_focusedDay` here as well
                });
              },
              eventLoader: (day) {
                return eventList.where((date) => isSameDay(date, day)).toList();
              },
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
              focusedDay: selectedDate,
              firstDay: DateTime.now().subtract(Duration(days: 365)),
              lastDay: DateTime.now().add(Duration(days: 365))),
          SizedBox(
            height: 20,
          ),

          Container(
            height: Get.size.width / 1.32,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return InteractionItem(
                  onTap: () {
                    Get.to(() => InteractionDetailPage());
                  },
                );
              },
            ),
          ),

          // Container(
          //   child: Column(
          //     children: eventList
          //         .map(
          //           (e) => InteractionItem(),
          //         )
          //         .toList(),
          //   ),
          // ),
          // Container(
          //   height: Get.size.height / 1.34,
          //   padding: EdgeInsets.only(bottom: 10),
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //     itemCount: 4,
          //     itemBuilder: (context, index) {
          //       return Container(child: InteractionItem());
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
