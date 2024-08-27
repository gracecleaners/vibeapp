import 'package:flutter/material.dart';
import 'package:vibeapp/const/colors.dart';
import 'package:vibeapp/widgets/search.dart';

class DrawerItems extends StatefulWidget {
  const DrawerItems({super.key});

  @override
  _DrawerItemsState createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {
  int _selectedIndex = 0; // Index to track the active ListTile

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9, // Adjust the width as needed
      child: Drawer(
        child: Container(
          color: Color.fromARGB(255, 236, 235, 234).withOpacity(0.00001), // Background color for the drawer
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 280, // Adjust the height as needed
                child: Stack(
                  children: [
                    // Background Image
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/okumu.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Gradient Overlay
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                    ),
                    // Account Name
                    Positioned(
                      bottom: 16, // Adjust the bottom margin as needed
                      left: 16,   // Adjust the left margin as needed
                      child: Text(
                        "John Doe",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: SearchTextField(
                  fillColor: Color.fromARGB(255, 236, 235, 234).withOpacity(0.00001),
                ),
              ),
              _buildListTile(
                index: 0,
                icon: Icons.snapchat,
                title: 'Profile',
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                  // Handle the Profile tap
                },
              ),
              _buildListTile(
                index: 1,
                icon: Icons.published_with_changes_sharp,
                title: 'Status',
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                  // Handle the Status tap
                },
              ),
              _buildListTile(
                index: 2,
                icon: Icons.star_rate_sharp,
                title: 'Favorite',
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                  // Handle the Favorite tap
                },
              ),
              _buildListTile(
                index: 3,
                icon: Icons.settings_input_svideo_outlined,
                title: 'Vibe Web',
                onTap: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                  // Handle the Vibe Web tap
                },
              ),
              _buildListTile(
                index: 4,
                icon: Icons.settings_outlined,
                title: 'Settings',
                onTap: () {
                  setState(() {
                    _selectedIndex = 4;
                  });
                  // Handle the Settings tap
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Divider(),
              ),
              Container(
                 decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color:  Coloors.primary,
                      width: 3,
                    ),
                  ),
                ),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("About Vibe", style: TextStyle(color: Coloors.primary),),
                  ),
                  tileColor: Coloors.primary.withOpacity(0.1),
                      ),
              ),
              SizedBox(height: 10,),
              Container(
                 decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color:  Coloors.primary,
                      width: 3,
                    ),
                  ),
                ),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Your Feedback", style: TextStyle(color: Coloors.primary),),
                         Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(Icons.star_rate_sharp, color: Colors.orange),
                          Icon(Icons.star_rate_sharp, color: Colors.orange),
                          Icon(Icons.star_rate_sharp, color: Colors.orange),
                          Icon(Icons.star_rate_sharp, color: Colors.orange),
                          Icon(Icons.star_rate_sharp, color: Colors.orange),
                        ],
                      ),
                      ],
                    ),
                  ),
                  tileColor: Coloors.primary.withOpacity(0.1),
                      ),
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile({
    required int index,
    IconData? icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: _selectedIndex == index ? Coloors.primary : Colors.transparent,
            width: 3,
          ),
        ),
      ),
      child: ListTile(
        leading: Icon(icon, color: _selectedIndex == index ? Coloors.primary : Colors.black26,),
        title: Text(title , style: TextStyle(color: _selectedIndex == index ? Coloors.primary : Colors.black26),),
        tileColor: _selectedIndex == index ? Coloors.primary.withOpacity(0.1) : null, // Background color for active tile
        onTap: onTap,
      ),
    );
  }
}
