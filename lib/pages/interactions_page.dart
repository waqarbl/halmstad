import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

enum PageType { completed, upcoming }

class InteractionsPage extends StatefulWidget {
  const InteractionsPage({super.key});

  @override
  State<InteractionsPage> createState() => _InteractionsPageState();
}

class _InteractionsPageState extends State<InteractionsPage> {
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();
  PageType selectedPage = PageType.upcoming;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 1, 3, 90),
          onPressed: () {
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
          centerTitle: true,
          title: const Text(
            'Interactions',
            // style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.only(top: 20),
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SegmentedButton<PageType>(
                showSelectedIcon: false,
                segments: const <ButtonSegment<PageType>>[
                  ButtonSegment<PageType>(
                    value: PageType.upcoming,
                    label: Text('Upcoming'),
                  ),
                  ButtonSegment<PageType>(
                    value: PageType.completed,
                    label: Text('Completed'),
                  ),
                ],
                selected: <PageType>{selectedPage},
                onSelectionChanged: (Set<PageType> newSelection) {
                  setState(() {
                    selectedPage = newSelection.first;
                  });
                },
              ),
              const Center(
                child: Text('InteractionsPage'),
              ),
              EasyDateTimeLine(
                initialDate: DateTime.now(),
                onDateChange: (selectedDate) {
                  //`selectedDate` the new date selected.
                  // print(selectedDate);
                },
                headerProps: const EasyHeaderProps(
                  monthPickerType: MonthPickerType.switcher,
                  dateFormatter: DateFormatter.fullDateDMY(),
                ),
                dayProps: const EasyDayProps(
                  dayStructure: DayStructure.dayStrDayNum,
                  activeDayStyle: DayStyle(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff3371FF),
                          Color(0xff8426D6),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.maxFinite,
                height: 250,
                child: const Card.outlined(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Headline",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text('Title: '),
                            Text('Lorem Ipsum dolor sit amit')
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text('Location: '),
                            Text('Pwd , Islamabad')
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [Text('Action time: '), Text('23 Hours')],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text('Type of Action: '),
                            Text('Lorem Ipsum ')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
