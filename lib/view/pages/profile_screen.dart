import 'package:flutter/material.dart';
import 'package:vibeapp/const/colors.dart';
import 'package:vibeapp/view/pages/contact.dart';
import 'package:vibeapp/widgets/circleavatar.dart';

class ProfilePage extends StatelessWidget {
  final int notificationCount;
  ProfilePage({
    Key? key,
    this.notificationCount =
        3, // Default to 0 if not provided// Initialize the onTap callback
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top quarter background image with circular profile image
          Stack(
            clipBehavior:
                Clip.none, // Ensures the circular image is not clipped
            children: [
              Container(
                height: screenHeight *
                    0.25, // Occupying the top quarter of the screen
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/okumu.png'), // Replace with your background image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Gradient Overlay for Text Contrast
              Container(
                height: screenHeight * 0.25,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Coloors.primary
                          .withOpacity(0.4), // Start with black, fully opaque
                      Coloors.primary.withOpacity(
                          0.4), // Middle with semi-transparent black
                      Coloors.primary.withOpacity(
                          0.4), // Middle with semi-transparent black
                      // End with transparent
                    ],
                  ),
                ),
              ),
              // Circular Profile Image
              Positioned(
                bottom:
                    -80, // Positioning it to be over the bottom edge of the top container
                left: screenWidth / 2 -
                    82, // Centering the circular image horizontally
                child: CircleAvatar(
                  radius: 82,
                  backgroundColor: Coloors.primary, // Border color
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(
                        'assets/images/okumu.png'), // Replace with your profile image
                  ),
                ),
              ),
              Positioned(
                  bottom:
                      -35, // Positioning it to be over the bottom edge of the top container
                  left: screenWidth / 4 -
                      80, // Centering the circular image horizontally
                  child: InkWell(
                    onTap: () {}, // Call the onTap callback when tapped
                    child: Stack(
                      clipBehavior: Clip
                          .none, // Ensures the notification count is not clipped
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: CircleAvatar(
                            radius: 30, // Adjust the radius as needed
                            backgroundColor: Colors.white,
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Coloors.primary, width: 3),
                              ),
                              child: Icon(
                                Icons.phone_outlined,
                                color: Coloors.primary,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        if (notificationCount >
                            0) // Only show if notificationCount is greater than 0
                          Positioned(
                            top: 0,
                            right: 12,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors
                                    .red, // Background color for the notification icon
                              ),
                              child: Center(
                                child: Text(
                                  notificationCount.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12, // Adjust size as needed
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )),
              Positioned(
                  bottom:
                      -35, // Positioning it to be over the bottom edge of the top container
                  right: screenWidth / 4 -
                      80, // Centering the circular image horizontally
                  child: InkWell(
                    onTap: () {
                      
                    }, // Call the onTap callback when tapped
                    child: Stack(
                      clipBehavior: Clip
                          .none, // Ensures the notification count is not clipped
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: CircleAvatar(
                            radius: 30, // Adjust the radius as needed
                            backgroundColor: Colors.white,
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Coloors.primary, width: 3),
                              ),
                              child: Icon(
                                Icons.video_call,
                                color: Coloors.primary,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        if (notificationCount >
                            0) // Only show if notificationCount is greater than 0
                          Positioned(
                            top: 0,
                            right: 12,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors
                                    .red, // Background color for the notification icon
                              ),
                              child: Center(
                                child: Text(
                                  notificationCount.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12, // Adjust size as needed
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )),
              Positioned(
                  bottom:
                      -85, // Positioning it to be over the bottom edge of the top container
                  right: screenWidth / 3 -
                      10, // Centering the circular image horizontally
                  child: InkWell(
                    onTap: () {}, // Call the onTap callback when tapped
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Coloors.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Icon(Icons.camera_alt,
                            color: Colors.white, size: 30),
                      ),
                    ),
                  )),
              // Back Button
              Positioned(
                  top: 50,
                  left: 0,
                  right: 0,
                  child: Text(
                    "PROFILE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              // More Options Button
              Positioned(
                top: 40,
                right: 10,
                child: IconButton(
                  icon: Icon(Icons.more_vert, color: Colors.white),
                  onPressed: () {
                    // Add action for more options
                  },
                ),
              ),
            ],
          ),
          // Profile Details Below
          Expanded(
            child: Column(
              children: [
                SizedBox(
                    height:
                        90), // Space for the circular profile image to sit correctly
                // Name Text
                Text(
                  'Allan Junior',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                // Status Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone, color: Coloors.primary),
                    SizedBox(width: 10),
                    Text(
                      '|',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '+256 764341463',
                      style: TextStyle(
                        fontSize: 16,
                        color: Coloors.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Divider(),
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Coloors.primary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Icon(Icons.update, color: Colors.white, size: 30),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Divider(),
                ),
                Row(
                  children: [
                    SizedBox(width: 15),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Coloors.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(Icons.image, color: Colors.white, size: 30),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("PHOTOS"),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 100, // Set a fixed height for the ListView
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return CircleAvatarImage(
                                // Assuming CircleAvatarImage is correctly defined in your project
                                );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Divider(),
                ),
                Row(
                  children: [
                    SizedBox(width: 15),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Coloors.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(Icons.video_call,
                            color: Colors.white, size: 30),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("VIDEOS"),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 100, // Set a fixed height for the ListView
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return CircleAvatar(
                              radius: 35, // Adjust the radius as needed
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage("assets/images/okumu6.png"),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Coloors.primary,
                                    borderRadius: BorderRadius.circular(10)),
                                child:
                                    Icon(Icons.play_arrow, color: Colors.white),
                              ), // Use AssetImage for local images
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
