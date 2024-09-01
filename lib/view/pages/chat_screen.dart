import 'package:flutter/material.dart';
import 'package:vibeapp/const/colors.dart';
import 'package:vibeapp/widgets/circle_image.dart'; // Ensure this import is correct

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Chat content
          Positioned.fill(
            top: 250, // Adjust to fit below the AppBar and avatar
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      // Example chat bubble (received)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 20, bottom: 20, right: 16, left: 45),
                              margin: const EdgeInsets.only(bottom: 20, left: 30),
                              decoration: BoxDecoration(
                                color: Coloors.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                "Good morning Allan, how are you doing today. I was told that you are opening up a youtube channel, what content are you gonna be teaching?",
                                style: TextStyle(fontSize: 15, color: Colors.white),
                              ),
                            ),
                            Positioned(
                              top: 10, // Adjust this value to set half of the image on the app bar
                              left: 0, // Center the image horizontally
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  color: Colors.white,
                                  border: Border.all(color: Coloors.primary)
                                ),
                                child: CircleAvatar(
                                  radius: 35, // Adjust the radius to fit your design
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage('assets/images/okumu.png'), // Replace with your image path
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Example chat bubble (sent)
                      Align(
                        alignment: Alignment.centerRight,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 20, bottom: 20, right: 45, left: 16),
                              margin: const EdgeInsets.only(bottom: 20, right: 30),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                "Good morning, am doing good \nI was thinking of teaching django framework, ofcourse am gonna start with python basics",
                                style: TextStyle(fontSize: 15,),
                              ),
                            ),
                            Positioned(
                              top: 10, // Adjust this value to set half of the image on the app bar
                              right: 0, // Center the image horizontally
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  color: Colors.white,
                                  border: Border.all(color: Coloors.primary)
                                ),
                                child: CircleAvatar(
                                  radius: 35, // Adjust the radius to fit your design
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage('assets/images/okumu1.png'), // Replace with your image path
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Example timestamp
                      // Align(
                      //   alignment: Alignment.center,
                      //   child: Text(
                      //     "12:30 PM",
                      //     style: TextStyle(
                      //       fontSize: 12,
                      //       color: Colors.grey.shade600,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                // Message input field
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  color: Colors.white,
                  child: Row(
                    children: [
                      IconButton(
                        style: IconButton.styleFrom(backgroundColor: Coloors.primary),
                        icon: Icon(Icons.camera_alt_outlined),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Type a message",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        style: IconButton.styleFrom(backgroundColor: Coloors.primary),
                        icon: Icon(Icons.send),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                      IconButton(
                        style: IconButton.styleFrom(backgroundColor: Coloors.primary),
                        icon: Icon(Icons.keyboard_voice_outlined),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // AppBar and circular image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                AppBar(
                  toolbarHeight: 120,
                  backgroundColor: Coloors.primary,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                  title: Row(
                    children: [
                      IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.5),
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.phone_in_talk_outlined,
                            color: Colors.white),
                      ),
                      SizedBox(width: 10), // Add some spacing between icon and title
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Allan Junior",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 10), // Adjusted to fit better within AppBar
                            Text(
                              "",
                              style: TextStyle(color: Colors.white70, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.5),
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.video_call_outlined,
                            color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100, // Adjust this value to set half of the image on the app bar
            left: MediaQuery.of(context).size.width / 2 - 65, // Center the image horizontally
            child: CircleAvatar(
              radius: 60, // Adjust the radius to fit your design
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/okumu.png'), // Replace with your image path
            ),
          ),
        ],
      ),
    );
  }
}
