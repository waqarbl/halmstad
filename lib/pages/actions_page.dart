import 'package:flutter/material.dart';

enum PageType { completed, upcoming }

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
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Actions',
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
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                ),
                showSelectedIcon: false,
                segments: const <ButtonSegment<PageType>>[
                  ButtonSegment<PageType>(
                    value: PageType.upcoming,
                    label: Text('Pending'),
                  ),
                  ButtonSegment<PageType>(
                    value: PageType.completed,
                    label: Text('Taken'),
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
                child: Text('ActionsPage'),
              )
            ],
          ),
        )));
  }
}
