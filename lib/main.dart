import 'package:flutter/material.dart';
import 'package:vibeapp/view/pages/chat_screen.dart';
import 'package:vibeapp/view/pages/home_screen.dart';
import 'package:vibeapp/view/pages/intro.dart';
import 'package:vibeapp/widgets/bottom_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: MainHome()
      home: IntroScreen()
      // home: ChatScreen(),
    );
  }
}

