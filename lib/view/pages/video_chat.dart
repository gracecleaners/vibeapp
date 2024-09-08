import 'package:flutter/material.dart';
import 'package:vibeapp/const/colors.dart';

class VideoCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Main video view (background)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/okumu2.png"), // Replace with actual video stream
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Thumbnail video view (miniature in the upper right corner)
          Positioned(
            top: 60,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Container(
                width: 100, // Adjust the width as needed
                height: 130, // Adjust the height as needed
                decoration: BoxDecoration(
                  border: Border.all(color: Coloors.primary, width: 2),
                ),
                child: Image.asset(
                  'assets/images/okumu.png', // Replace with actual thumbnail video stream
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Control buttons (bottom center) inside a green container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  height: 10,
                  width: double.infinity,
                  color: Coloors.primary,
                ),
                Container(
                  height: 100,
                  color: Colors.white, // Set background color to green
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildControlButton(Icons.videocam, Colors.white),
                      SizedBox(width: 20),
                      _buildControlButton(Icons.mic, Colors.white),
                      SizedBox(width: 20),
                      _buildControlButton(Icons.message_rounded, Colors.white),
                      SizedBox(width: 20),
                      ClipOval(
                        child: Material(
                          color: Colors.black, // Button color
                          child: InkWell(
                            splashColor: Colors.grey, // Splash color
                            onTap: () {
                              // Add functionality here
                            },
                            child: SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(Icons.call_end, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        "00:09:54",
                        style: TextStyle(color: Coloors.primary),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton(IconData icon, Color color) {
    return ClipOval(
      child: Material(
        color: Coloors.primary, // Button color
        child: InkWell(
          splashColor: Colors.grey, // Splash color
          onTap: () {
            // Add functionality here
          },
          child: SizedBox(
            width: 56,
            height: 56,
            child: Icon(icon, color: color),
          ),
        ),
      ),
    );
  }
}
