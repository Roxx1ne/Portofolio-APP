import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'CollegePage.dart';
import 'ContactPage.dart';
import 'MenuPage.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MainPage',
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PageController _pageController = PageController(initialPage: 0);
  int _selectedPageIndex = 0;
  final List<Widget> _pages = [
    MenuPage(),
    ContactPage(),
    CollegePage(),
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedPageIndex == 0
              ? "Profile"
              : _selectedPageIndex == 1
              ? "Contact"
              : "College",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 16, 55, 131),
      ),
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          _selectPage(index);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        backgroundColor:  Color.fromARGB(255, 16, 55, 131),
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_rounded),
            label: '',
          ),
        ],
      ),

    );
  }
}

