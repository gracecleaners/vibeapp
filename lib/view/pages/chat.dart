import 'package:flutter/material.dart';
import 'package:vibeapp/widgets/chat_widget.dart';
import 'package:vibeapp/widgets/circle_image.dart';
import 'package:vibeapp/widgets/drawer_items.dart';

class ChatsPage extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/images/okumu.png',
    'assets/images/okumu.png',
    'assets/images/okumu.png',
    'assets/images/okumu.png',
    'assets/images/okumu.png',
    'assets/images/okumu.png',
    'assets/images/okumu.png',
  ];

  ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(),
          ),
          SizedBox(
            height: 80, // Adjust the height to fit the circle images
            child: Row(
              children: [
                SizedBox(width: 10,),
                Text("STORY", style: TextStyle(fontSize: 18, color: Colors.black26),),
                SizedBox(width: 10,),
                Container(
                  width: 1, 
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                  ),
                ),
                SizedBox(width: 2,),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageUrls.length,
                    itemBuilder: (context, index) {
                      return CircleImage(
                        imageUrl: imageUrls[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          ChatWidget(),  // Your chat widget containing messages
        ],
      ),
    );
  }
}
