import 'package:flutter/material.dart';
import 'package:streaming_platform/home/presentation/home_screen.dart';
import 'package:streaming_platform/library/presentation/library_screen.dart';
import 'package:streaming_platform/profile/presentation/profile_screen.dart';
import 'package:streaming_platform/search/presentation/search_screen.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    HomePage(),
    SearchPage(),  
    LibraryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: navigateBottomBar,
        backgroundColor: Color.fromARGB(255, 30, 41, 59),
        selectedItemColor: Color.fromARGB(255, 94, 55, 179),
        unselectedItemColor: Colors.grey[200],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
