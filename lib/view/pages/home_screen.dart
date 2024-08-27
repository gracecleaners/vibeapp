import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibeapp/const/colors.dart';
import 'package:vibeapp/view/pages/chat.dart';
import 'package:vibeapp/widgets/chat_widget.dart';
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

  /// List of body icon
  List<IconData> icons = [
    Icons.call,
    Icons.chat_bubble,
    Icons.people_sharp,
  ];

  /// List of pages for each tab
  List<Widget> pages = [
    Container(),
    ChatsPage(),
    Container(),
  ];

  int current = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(0, 80),
        child: Container(
          child: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xFFFF5800),
            title: Text(
              items[current],
              style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 30
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
              IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.white,))
            ],
          ),
        ),
      ),
      drawer: DrawerItems(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            /// Tab Bar
           /// Tab Bar
SizedBox(
  width: double.infinity,
  height: 80,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: List.generate(items.length, (index) {
      return Expanded(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  current = index;
                });
                pageController.animateToPage(
                  current,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease,
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.all(5),
                width: double.infinity,
                height: 55,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icons[index],
                        size: current == index ? 28 : 22,
                        color: current == index
                            ? Coloors.primary
                            : Colors.grey.shade400,
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: current == index,
              child: Container(
                width: 5,
                height: 5,
                decoration: const BoxDecoration(
                    color: Coloors.primary, shape: BoxShape.circle),
              ),
            ),
          ],
        ),
      );
    }),
  ),
),


            /// MAIN BODY
            Expanded(
              child: PageView.builder(
                itemCount: pages.length,
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return pages[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
