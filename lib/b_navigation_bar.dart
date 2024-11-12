import 'package:flutter/material.dart';
import 'package:my_project/id_card.dart';
import 'package:my_project/quote.dart';
import 'package:my_project/test.dart';
import 'package:my_project/test_dio.dart';

class BotmNavBar extends StatefulWidget {
  const BotmNavBar({super.key});

  @override
  State<BotmNavBar> createState() => _BotmNavBarState();
}

class _BotmNavBarState extends State<BotmNavBar> {
  // Current index of the selected tab
  int _selectedIndex = 0;

  // List of widgets to show when a tab is selected
  final List<Widget> _pages = [
    const Center(child: IdCard()),
    const Center(child: QuoState()),
    const Center(child: PostsScreen()),
  ];

  // Function to handle tab changes
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BottomNavigation'),
        ),
        body: _pages[_selectedIndex], // Display the corresponding page
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped, // Handle tap event
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
