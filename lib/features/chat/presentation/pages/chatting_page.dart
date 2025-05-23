import 'package:flutter/material.dart';
import 'package:simple_chat/features/chat/presentation/widgets/chat_bubble_widget.dart';

class ChattingPage extends StatelessWidget {
  const ChattingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f8fa),
      appBar: AppBar(
        leading: BackButton(onPressed: () {}),
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black12,
              ),
              height: 35,
              width: 35,
              margin: EdgeInsets.only(right: 10),
              child: Stack(
                children: [
                  Icon(Icons.person, color: Colors.white, size: 35),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreenAccent,
                        shape: BoxShape.circle,
                      ),
                      height: 10,
                      width: 10,
                    ),
                  ),
                ],
              ),
            ),
            Text("Username", style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(20),
        itemBuilder: (context, index) {
          return ChatBubble(
            chatPosition:
                index % 2 == 0 ? ChatPosition.right : ChatPosition.left,
            text: "Hai there!!!",
            date: "09.00",
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 5);
        },
        itemCount: 10,
      ),
    );
  }
}
