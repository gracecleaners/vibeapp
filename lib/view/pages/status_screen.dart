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
            top: 40,
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
            top: 50,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Coloors.primary, width: 3),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  "assets/images/okumu.png",
                  height: 55,
                  width: 55,
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Allan Junior",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10),
                Text(
                  "12 MINUTES AGO",
                  style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 10),
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          // Status counter centered at the bottom
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                '${_currentIndex + 1} of ${widget.statusImages.length}',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


