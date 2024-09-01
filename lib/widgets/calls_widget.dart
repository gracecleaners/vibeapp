import 'package:flutter/material.dart';
import 'package:vibeapp/const/colors.dart';

class CallsWidget extends StatelessWidget {
  const CallsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         Padding(
          padding: const EdgeInsets.only(top: 20),
          
        ),
        ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        SizedBox(width: 5),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Coloors.primary, width: 3),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              "assets/images/okumu${index + 1}.png",
                              height:55,
                              width: 55,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Allan Junior",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "12 MINUTES AGO",
                                maxLines: 1,
                                style: TextStyle(color: Colors.black54, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Coloors.primary.withOpacity(0.8), width: 3),
                              ),
                              child: Icon(Icons.arrow_upward, size: 10,color: Coloors.primary,),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              alignment: Alignment.center,
                              height: 15, 
                              width: 15, 
                              decoration: BoxDecoration(
                                color: Coloors.primary,
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Text("4", style: TextStyle(color: Colors.white, fontSize: 10),),
                            ),
                            
                          ],
                        )
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
        ),
      ],
    );
  }
}