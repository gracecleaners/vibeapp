import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        children: [
          for( int i = 1; i < 11; i++)
          InkWell(
            onTap: (){},
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset("assets/images/okumu$i.png", height: 65,width: 65,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Allan Junior", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        SizedBox(height: 8,), 
                        Text("Let me send you the pdf version", maxLines: 1,style: TextStyle(color: Colors.black54),)
                      ],
                    ),
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("08:22", style: TextStyle(fontSize: 10, color: Color(0xFFFF5800), fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Container(
                        alignment: Alignment.center,
                        height: 20, 
                        width: 20, 
                        decoration: BoxDecoration(
                          color: Color(0xFFFF5800),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text("4", style: TextStyle(color: Colors.white, fontSize: 12),),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}