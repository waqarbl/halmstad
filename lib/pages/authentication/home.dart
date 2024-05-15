import 'package:flutter/material.dart';
import 'package:halmstad/constants/colors.dart';
import '../action/actions_page.dart';
import '../meeting/meetings_page.dart';
import '../request/requests_page.dart';
import '../interaction/interactions_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final assetsList = [
    'assets/interaction.svg',
    'assets/meeting.svg',
    'assets/requestIcon.svg',
    'assets/actionIcon.svg',
  ];

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
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black,
                blurRadius: 4,
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xFFFFFFFF),
            selectedItemColor: Color(0xFF00206A),
            unselectedItemColor: Colors.grey,
            selectedFontSize: 15,
            unselectedFontSize: 14,
            onTap: (index) => _changeTab(index),
            items: [
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  assetsList[0],
                  colorFilter: ColorFilter.mode(bluePrimary, BlendMode.srcIn),
                ),
                label: 'Interactions',
                icon: SvgPicture.asset(
                  assetsList[0],
                ),
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  assetsList[1],
                  colorFilter: ColorFilter.mode(bluePrimary, BlendMode.srcIn),
                ),
                label: 'Meetings',
                icon: SvgPicture.asset(assetsList[1]),
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  assetsList[2],
                  colorFilter: ColorFilter.mode(bluePrimary, BlendMode.srcIn),
                ),
                label: 'Requests',
                icon: SvgPicture.asset(assetsList[2]),
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  assetsList[3],
                  colorFilter: ColorFilter.mode(bluePrimary, BlendMode.srcIn),
                ),
                label: 'Actions',
                icon: SvgPicture.asset(assetsList[3]),
              ),
            ],
          ),
        ));
  }
}
