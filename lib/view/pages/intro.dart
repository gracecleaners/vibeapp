import 'package:flutter/material.dart';
import 'package:vibeapp/const/colors.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image covering full screen
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/intro.png'), // Replace with your image asset
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          // Gradient overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Coloors.primary.withOpacity(0.8), // Start color with opacity
                    Coloors.primary.withOpacity(0.8), // Start color with opacity
                     // End color
                  ],
                ),
              ),
            ),
          ),
          // Centered text
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'VIBE APP', // Replace with your desired text
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){},
                  child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Text("Continue", style: TextStyle(fontSize: 18, color: Colors.white),)
                     ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

