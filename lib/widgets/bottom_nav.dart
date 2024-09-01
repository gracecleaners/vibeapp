import 'package:flutter/material.dart';
import 'package:vibeapp/view/pages/calls.dart';
import 'package:vibeapp/view/pages/chat.dart';
import 'package:vibeapp/view/pages/contact.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    CallsPage(),   // First page is for Calls
    ChatsPage(),   // Second page is for Chats
    ContactsPage() // Third page is for Contacts
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],  // Display the selected widget
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFFF8B11B), // Customize selected item color
        backgroundColor: Colors.white,        // Set background color
        elevation: 0,                         // Customize elevation
        currentIndex: _selectedIndex,         // Current selected index
        onTap: _onItemTapped,                 // Handle tap events
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),           // Default icon
            activeIcon: Icon(Icons.call),     // Active icon
            label: "Calls",                   // Label for calls page
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),           // Default icon
            activeIcon: Icon(Icons.chat_bubble), // Active icon for chat
            label: "Chats",                   // Label for chats page
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),       // Default icon for contacts
            activeIcon: Icon(Icons.contacts), // Active icon for contacts
            label: "Contacts",                // Label for contacts page
          ),
        ],
      ),
    );
  }
}
