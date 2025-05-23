import 'package:flutter/material.dart';

enum ChatPosition { left, right }

class ChatBubble extends StatelessWidget {
  final String text;
  final String date;
  final ChatPosition chatPosition;

  const ChatBubble({
    super.key,
    required this.text,
    required this.date,
    required this.chatPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          chatPosition == ChatPosition.right
              ? Alignment.centerRight
              : Alignment.centerLeft,
      child: CustomPaint(
        painter: ChatBubblePainter(chatPosition: chatPosition),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 10, 10),
          child: Column(
            children: [
              Text(text, style: TextStyle(color: Colors.white)),
              Text(date, style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatBubblePainter extends CustomPainter {
  final ChatPosition chatPosition;

  ChatBubblePainter({super.repaint, required this.chatPosition});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color =
              chatPosition == ChatPosition.right ? Colors.blue : Colors.black87
          ..style = PaintingStyle.fill;

    final r = Radius.circular(12);
    final path = Path();

    // Start at top-left with radius
    path.moveTo(0, r.y);
    path.quadraticBezierTo(0, 0, r.x, 0); // top-left corner

    // Top edge
    path.lineTo(size.width - r.x, 0);
    path.quadraticBezierTo(size.width, 0, size.width, r.y); // top-right

    if (chatPosition == ChatPosition.right) {
      // Bottom edge to left (before tail)
      path.lineTo(size.width, size.height - 10); // leave space for tail

      // Draw tail pointing to the left
      path.lineTo(size.width + 10, size.height); // tail tip (facing left)

      path.lineTo(r.x, size.height);
      path.quadraticBezierTo(
        0,
        size.height,
        0,
        size.height - r.y,
      ); // bottom-right
    } else {
      // Right edge
      path.lineTo(size.width, size.height - r.y);
      path.quadraticBezierTo(
        size.width,
        size.height,
        size.width - r.x,
        size.height,
      ); // bottom-right

      // Bottom edge to left (before tail)
      path.lineTo(-10, size.height); // leave space for tail

      // Draw tail pointing to the left
      path.lineTo(0, size.height - 10); // tail tip (facing left)
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
