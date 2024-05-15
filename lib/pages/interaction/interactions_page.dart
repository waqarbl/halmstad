import 'package:flutter/material.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:get/get.dart';
import 'package:halmstad/pages/interaction/add_interaction.dart';
import 'package:halmstad/pages/interaction/interactionDetailPage.dart';
import 'package:halmstad/widgets/reusables.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

enum PageType { today, calendar }

class InteractionsPage extends StatefulWidget {
  const InteractionsPage({super.key});

  @override
  State<InteractionsPage> createState() => _InteractionsPageState();
}

class _InteractionsPageState extends State<InteractionsPage> {
  PageType selectedPage = PageType.today;
  // DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const OvalBorder(),
          backgroundColor: const Color.fromARGB(255, 1, 3, 90),
          onPressed: () {
            Get.to(() => const AddInteraction());
            // print('floating action button pressed');
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
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
              const SizedBox(
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
      padding: const EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(child: InteractionItem(
            onTap: () {
              Get.to(() => const InteractionDetailPage());
            },
          ));
        },
      ),
    );
  }

  DateTime _selectedDay = DateTime.now();
  // ignore: unused_field
  DateTime _focusedDay = DateTime.now();

  DateTime? weekStartDay;
  DateTime? weekEndDay;

  _getCalendarPageView(BuildContext context) {
    List eventList = [DateTime(2024, 5, 15), DateTime(2024, 5, 18)];
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: [
          TableCalendar(
              calendarFormat: CalendarFormat.week,
              currentDay: _selectedDay,
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
              onPageChanged: (focusedDay) {},
              calendarBuilders: CalendarBuilders(
                headerTitleBuilder: (context, day) {
                  final firstDay = day.subtract(Duration(days: day.weekday));
                  final lastDay = firstDay.add(Duration(days: 6));
                  final formattedDateRange =
                      "${firstDay.day}  ${DateFormat('MMM').format(firstDay)} ${firstDay.year == lastDay.year ? '' : firstDay.year} - ${lastDay.day}  ${DateFormat('MMM').format(lastDay)} ${lastDay.year}";
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        formattedDateRange,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  );
                },
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              focusedDay: _selectedDay,
              firstDay: DateTime.now().subtract(const Duration(days: 365)),
              lastDay: DateTime.now().add(const Duration(days: 365))),
          const SizedBox(
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
                    Get.to(() => const InteractionDetailPage());
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
