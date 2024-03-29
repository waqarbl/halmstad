import 'package:flutter/material.dart';

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
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Meetings',
            // style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
            child: Container(
          margin: EdgeInsets.only(top: 20),
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
                child: Text('Meetings Page'),
              )
            ],
          ),
        )));
  }
}
