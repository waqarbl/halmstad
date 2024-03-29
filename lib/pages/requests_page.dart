import 'package:flutter/material.dart';

enum PageType { meeting, visit, reference, request }

class RequestsPage extends StatefulWidget {
  const RequestsPage({super.key});

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  PageType selectedPage = PageType.meeting;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Requests',

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
                    value: PageType.meeting,
                    label: Text('Meeting'),

                    // icon: Icon(Icons.calendar_view_day)
                  ),
                  ButtonSegment<PageType>(
                    value: PageType.visit,
                    label: Text('Visit'),
                    // icon: Icon(Icons.calendar_view_week)
                  ),
                  ButtonSegment<PageType>(
                    value: PageType.reference,
                    label: Text('Reference'),
                    // icon: Icon(Icons.calendar_view_week)
                  ),
                  ButtonSegment<PageType>(
                    value: PageType.request,
                    label: Text('Tip'),
                    // icon: Icon(Icons.calendar_view_week)
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
                child: Text('RequestsPage'),
              )
            ],
          ),
        )));
  }
}
