import 'package:flutter/material.dart';
import 'package:vibeapp/const/colors.dart';

class CircleImage extends StatelessWidget {
  final String imageUrl;
  final int notificationCount; // Add a field for the notification count

  const CircleImage({
    Key? key,
    required this.imageUrl,
    this.notificationCount = 4, // Default to 0 if not provided
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Ensures the notification count is not clipped
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            radius: 35, // Adjust the radius as needed
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(imageUrl), // Use AssetImage for local images
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Coloors.primary, width: 3),
              ),
            ),
          ),
        ),
        if (notificationCount > 0) // Only show if notificationCount is greater than 0
          Positioned(
            top: 0,
            right: 12,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red, // Background color for the notification icon
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
    );
  }
}
