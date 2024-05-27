import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:halmstad/constants/colors.dart';
import 'package:get/get.dart';
import 'package:halmstad/models/interactionModel.dart';
import 'package:halmstad/network/network_calls.dart';
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
  final networkCalls = NetworkCalls();

  InteractionModel? interactionModel;
  InteractionModel? calendarInteractionModel;
  bool isLoading = false;

  String message = '';

  DateTime firstDayOfWeek =
      DateTime.now().subtract(Duration(days: DateTime.now().weekday));
  DateTime lastDayOfWeek = DateTime.now()
      .subtract(Duration(days: DateTime.now().weekday))
      .add(Duration(days: 6));

  @override
  void initState() {
    super.initState();
    getInteractionsForToday();
  }

  getInteractionsForToday() async {
    message = '';
    isLoading = true;
    interactionModel = null;
    setState(() {});
    final response = await networkCalls.getTodayInteractions();
    if (!response.contains('Error:')) {
      if (jsonDecode(response)['success'] == false) {
        message = jsonDecode(response)['message'];
        setState(() {});
        print("Message ::: $message");
      } else {
        interactionModel = interactionModelFromJson(response);
        setState(() {});
      }
    }
    isLoading = false;
    setState(() {});
  }

  getInteractionsForCalendar(DateTime startDate, DateTime endDate) async {
    message = '';
    calendarInteractionModel = null;
    isLoading = true;
    setState(() {});
    final response =
        await networkCalls.getDateRangeInteractions(startDate, endDate);
    if (!response.contains('Error:')) {
      if (jsonDecode(response)['success'] == false) {
        message = jsonDecode(response)['message'];
        setState(() {});
        print("Message ::: $message");
      } else {
        calendarInteractionModel = interactionModelFromJson(response);
        setState(() {});
      }
    }
    isLoading = false;
    setState(() {});
  }

  // addInteraction() async {
  //   isLoading = true;
  //   setState(() {});
  //   // final response = await networkCalls.addInteraction();
  //   if(!response.contains('Error:')){

  //   }
  // }

  List eventList = [DateTime(2024, 5, 15), DateTime(2024, 5, 18)];

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
          margin: const EdgeInsets.only(top: 20, bottom: 20),
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
                  onSelectionChanged: (Set<PageType> newSelection) async {
                    if (selectedPage == PageType.today) {
                      interactionModel = null;
                      setState(() {
                        isLoading = true;
                      });
                      await getInteractionsForToday();
                      setState(() {
                        isLoading = false;
                      });
                    } else {
                      calendarInteractionModel = null;
                      setState(() {
                        isLoading = true;
                      });

                      await getInteractionsForCalendar(
                          firstDayOfWeek, lastDayOfWeek);
                      setState(() {
                        isLoading = false;
                      });
                    }
                    setState(() {
                      selectedPage = newSelection.first;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              selectedPage == PageType.calendar
                  ? TableCalendar(
                      calendarFormat: CalendarFormat.week,
                      currentDay: _selectedDay,
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay =
                              focusedDay; // update `_focusedDay` here as well
                        });
                      },
                      eventLoader: (day) {
                        return eventList
                            .where((date) => isSameDay(date, day))
                            .toList();
                      },
                      onPageChanged: (focusedDay) async {
                        _selectedDay = focusedDay;
                        firstDayOfWeek = focusedDay
                            .subtract(Duration(days: focusedDay.weekday));
                        lastDayOfWeek = firstDayOfWeek.add(Duration(days: 6));

                        setState(() {
                          isLoading = true;
                        });

                        print(firstDayOfWeek);
                        print(lastDayOfWeek);

                        await getInteractionsForCalendar(
                            firstDayOfWeek, lastDayOfWeek);
                        setState(() {
                          isLoading = false;
                        });
                      },
                      calendarBuilders: CalendarBuilders(
                        headerTitleBuilder: (context, day) {
                          final firstDay =
                              day.subtract(Duration(days: day.weekday));
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
                      firstDay:
                          DateTime.now().subtract(const Duration(days: 365)),
                      lastDay: DateTime.now().add(const Duration(days: 365)))
                  : Container(),
              selectedPage == PageType.calendar
                  ? const SizedBox(
                      height: 20,
                    )
                  : Container(),
              if (isLoading) ...[
                Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ] else ...[
                Expanded(
                    child: selectedPage == PageType.today
                        ? _getTodayPageView(context)
                        : _getCalendarPageView(context)),
              ],
            ],
          ),
        )));
  }

  _getTodayPageView(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: !isLoading && message == '' && interactionModel != null
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: interactionModel?.data?.length,
              itemBuilder: (context, index) {
                return InteractionItem(
                  interaction: interactionModel!.data![index],
                  onTap: () {
                    Get.to(() => InteractionDetailPage(
                          interaction: interactionModel!.data![index],
                        ));
                  },
                );
              },
            )
          : Container(
              padding: const EdgeInsets.all(30),
              child: Text(
                message,
                style: textStyle16600,
              )),
    );
  }

  DateTime _selectedDay = DateTime.now();
  // ignore: unused_field
  DateTime _focusedDay = DateTime.now();

  DateTime? weekStartDay;
  DateTime? weekEndDay;

  _getCalendarPageView(BuildContext context) {
    print(isLoading);
    print("message :: $message");
    print('Interaction Model :: ${calendarInteractionModel?.data?.length}');
    return Container(
      child: !isLoading && message == '' && calendarInteractionModel != null
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: calendarInteractionModel?.data?.length,
              itemBuilder: (context, index) {
                return InteractionItem(
                  interaction: calendarInteractionModel!.data![index],
                  onTap: () {
                    Get.to(() => InteractionDetailPage(
                          interaction: calendarInteractionModel!.data![index],
                        ));
                  },
                );
              },
            )
          : Container(
              padding: EdgeInsets.all(30),
              child: Text(
                textAlign: TextAlign.center,
                message,
                style: textStyle16600,
              )),
    );
  }
}
