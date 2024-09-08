import 'package:flutter/material.dart';
import 'package:vibeapp/const/colors.dart';
import 'package:vibeapp/view/pages/profile_screen.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    SizedBox(width: 5),
                    image(context),
                    const SizedBox(width: 15),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Allan Junior",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis, // Prevent overflow
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Sometimes it's better to be alone",
                            maxLines: 1, // Limit text to one line
                            overflow: TextOverflow
                                .ellipsis, // Truncate text with ellipsis
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    // const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 15),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          alignment: Alignment.center,
                          height: 20,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF5800),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            "MOBILE",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey[300], // Adjust color as needed
              height: 1,
              thickness: 1,
            ),
          ],
        );
      },
    );
  }

  Widget image(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Ensures the notification count is not clipped
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            radius: 30, // Adjust the radius as needed
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(
                "assets/images/okumu.png"), // Use AssetImage for local images
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Coloors.primary, width: 3),
              ),
            ),
          ),
        ),
        // Only show if notificationCount is greater than 0
        Positioned(
          top: 0,
          right: 12,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                  color: Coloors
                      .primary), // Background color for the notification icon
            ),
            child: Center(
              child: Text(
                "3",
                style: TextStyle(
                  color: Coloors.primary,
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
