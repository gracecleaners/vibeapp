import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibeapp/const/colors.dart';
import 'package:vibeapp/view/pages/calls.dart';
import 'package:vibeapp/view/pages/chat.dart';
import 'package:vibeapp/view/pages/contact.dart';
import 'package:vibeapp/widgets/drawer_items.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  /// List of Tab Bar Item
  List<String> items = [
    "Calls",
    "Chats",
    "Contacts",
  ];

  /// List of icons for Bottom Navigation Bar
  List<IconData> icons = [
    Icons.call,
    Icons.chat_bubble,
    Icons.people_sharp,
  ];

  /// List of pages for each tab
  List<Widget> pages = [
    CallsPage(),
    ChatsPage(),
    ContactsPage(),
  ];

  int current = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFF5800),
        title: Text(
          items[current],
          style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Image.asset("assets/images/drawer.png"),
            );
          }
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
          )
        ],
      ),
      drawer: DrawerItems(),
      body: PageView.builder(
        itemCount: pages.length,
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(items.length, (index) {
          return BottomNavigationBarItem(
            icon: Icon(icons[index]),
            label: items[index],
          );
        }),
        currentIndex: current,
        selectedItemColor: Coloors.primary,
        unselectedItemColor: Colors.grey.shade400,
        onTap: (index) {
          setState(() {
            current = index;
          });
          pageController.animateToPage(
            current,
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
