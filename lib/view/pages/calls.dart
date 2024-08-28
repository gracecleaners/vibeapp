import 'package:flutter/material.dart';
import 'package:vibeapp/const/colors.dart';
import 'package:vibeapp/widgets/calls_widget.dart';
import 'package:vibeapp/widgets/chat_widget.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CallsWidget(),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Color(0xFFFF5800),
        onPressed: (){}, child: Icon(Icons.call, color: Colors.white,),),
    );
  }
}