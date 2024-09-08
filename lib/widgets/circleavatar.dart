import 'package:flutter/material.dart';
import 'package:vibeapp/const/colors.dart';

class CircleAvatarImage extends StatelessWidget {
  const CircleAvatarImage({
    Key? key,
 
     // Initialize the onTap callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 35, // Adjust the radius as needed
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage("assets/images/okumu.png"), // Use AssetImage for local images
     
    );
  }
}
