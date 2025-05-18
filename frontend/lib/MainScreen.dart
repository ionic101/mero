import 'package:flutter/material.dart';
import 'package:mero/MainCard.dart';
import 'package:mero/main.dart';

import 'Icons.dart';
import 'Variables.dart';
import 'main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Навигация между экранами',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    CalendarScreen(),
    SearchScreen(),
    HomeScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar:ClipRRect(
          child: BottomNavigationBar(
            backgroundColor: const Color(0xff252525),
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(icon: _selectedIndex == 0 ? quastionSelectedImage : quastionImage, label: '',),
              BottomNavigationBarItem(icon: _selectedIndex == 1 ? mapSelectedImage : mapImage, label: ''),
              BottomNavigationBarItem(icon: _selectedIndex == 2 ? mainPageSelectedImage : mainPageImage, label: ''),
              BottomNavigationBarItem(icon: _selectedIndex == 3 ? chatSelectedImage : chatImage, label: ''),
              BottomNavigationBarItem(icon: _selectedIndex == 4 ? userSelectedImage : userImage, label: ''),
            ],
          ),
        ),
    );
  }
}

// Пример экранов


class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("📅 Календарь", style: TextStyle(fontSize: 24)));
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("🔍 Поиск", style: TextStyle(fontSize: 24)));
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("👤 Профиль", style: TextStyle(fontSize: 24)));
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("⚙️ Настройки", style: TextStyle(fontSize: 24)));
  }
}
