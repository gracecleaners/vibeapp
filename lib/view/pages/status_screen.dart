import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vibeapp/const/colors.dart';

class StatusView extends StatefulWidget {
  final List<String> statusImages;

  StatusView({super.key, required this.statusImages});

  @override
  _StatusViewState createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  late PageController _pageController;
  late Timer _timer;
  int _currentIndex = 0;
  double _progress = 0.0;
  final double _progressDuration = 10.0; // Duration in seconds

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _progress += 0.1 / _progressDuration;
        if (_progress >= 1.0) {
          _progress = 0.0;
          if (_currentIndex < widget.statusImages.length - 1) {
            _currentIndex++;
            _pageController.jumpToPage(_currentIndex);
          } else {
            _timer.cancel(); // Stop the timer when the last status is reached
            Navigator.pop(context); // Navigate back to ChatPage
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.statusImages.length,
            itemBuilder: (context, index) {
              return Center(
                child: Container(
                  height: screenHeight * 0.75,
                  width: screenWidth,
                  child: Image.asset(
                    widget.statusImages[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
                _progress = 0.0;
              });
            },
          ),
          // Progress bar
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: LinearProgressIndicator(
              value: _progress,
              backgroundColor: Colors.white.withOpacity(0.3),
              color: Coloors.primary,
              minHeight: 4,
            ),
          ),
          // Navigation controls
          Positioned(
            top: 20,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: StatusView(
      statusImages: [
        'assets/images/status1.png',
        'assets/images/status2.png',
      ],
    ),
  ));
}
