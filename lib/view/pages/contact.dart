import 'package:flutter/material.dart';
import 'package:vibeapp/widgets/contact_widget.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ContactWidget(),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Color(0xFFFF5800),
        onPressed: (){}, child: Icon(Icons.person_add_alt_rounded, color: Colors.white,),),
    );
  }
}