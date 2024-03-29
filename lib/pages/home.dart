import 'package:flutter/material.dart';
import 'actions_page.dart';
import 'meetings_page.dart';
import 'requests_page.dart';
import 'interactions_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List _pages = [
    const InteractionsPage(),
    const MeetingsPage(),
    const RequestsPage(),
    const ActionsPage(),
  ];

  _changeTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF6200EE),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (index) => _changeTab(index),
          items: const [
            BottomNavigationBarItem(
              label: 'Interactions',
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'Meetings',
              icon: Icon(Icons.music_note),
            ),
            BottomNavigationBarItem(
              label: 'Requests',
              icon: Icon(Icons.location_on),
            ),
            BottomNavigationBarItem(
              label: 'Actions',
              icon: Icon(Icons.library_books),
            ),
          ],
        ));
  }
}
