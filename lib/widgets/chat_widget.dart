import 'package:flutter/material.dart';
import 'package:vibeapp/const/colors.dart';
import 'package:vibeapp/view/pages/chat_screen.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final ScrollController _scrollController = ScrollController();
  double _scrollProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateScrollProgress);
  }

  void _updateScrollProgress() {
    setState(() {
      if (_scrollController.hasClients) {
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final viewportHeight = _scrollController.position.viewportDimension;
        _scrollProgress = maxScrollExtent > 0
            ? _scrollController.offset / (maxScrollExtent - viewportHeight)
            : 0.0;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateScrollProgress);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF5800),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
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
                              height: 65,
                              width: 65,
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
                                "Let me send you the pdf version",
                                maxLines: 1,
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "08:22",
                              style: TextStyle(fontSize: 10, color: Color(0xFFFF5800), fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Color(0xFFFF5800),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "4",
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
        ),
      ],
    );
  }
}
