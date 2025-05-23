import 'package:flutter/material.dart';
import 'package:simple_chat/features/chat/presentation/pages/chatting_page.dart';
import 'package:simple_chat/features/chat/presentation/pages/dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Chat App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ChattingPage(),
    );
  }
}

