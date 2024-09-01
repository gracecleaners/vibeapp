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
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF5800),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Coloors.primary, width: 3),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              "assets/images/okumu${index + 1}.png",
                              height: 55,
                              width: 55,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10), // Added spacing for better layout
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Allan Junior",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis, // Prevent overflow
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Let me send you the pdf version of the document",
                                maxLines: 1, // Limit text to one line
                                overflow: TextOverflow.ellipsis, // Truncate text with ellipsis
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        // const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "08:22",
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFFFF5800),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              alignment: Alignment.center,
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF5800),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Text(
                                "4",
                                style: TextStyle(color: Colors.white, fontSize: 10),
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
