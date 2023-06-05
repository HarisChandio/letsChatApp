

import 'package:flutter/material.dart';
import 'package:lets_chat/pages/room_list_page.dart';
import 'package:lets_chat/pages/settings_page.dart';

class MainPage extends StatefulWidget {
  @override 
  _MainPage createState() => _MainPage(); 
}

class _MainPage extends State<MainPage> {

  int _selectedIndex = 0; 

  final List<Widget> _pages = <Widget>[
    RoomListPage(), 
    SettingsPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _pages[_selectedIndex], 
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            label: "Home"
          ), 
          BottomNavigationBarItem(
            icon: Icon(Icons.settings), 
            label: "Settings"
          )
        ],
        onTap: _onItemTapped,
      ),
    );
    
  }
}