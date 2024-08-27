import 'package:flutter/material.dart';
import 'package:vibeapp/const/colors.dart';

class CircleImage extends StatelessWidget {
  final String imageUrl;

  const CircleImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: CircleAvatar(
        radius: 35, // Adjust the radius as needed
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(imageUrl), // Or use AssetImage for local images
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Coloors.primary, width: 3),
          ),
        ),
      ),
    );
  }
}
