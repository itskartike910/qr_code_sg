

import 'package:flutter/material.dart';
import 'package:qr_code_sg/main_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      MainScreen(),
    );
  }
}

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Icon(
          Icons.start,
          size: 50,
          color: Colors.lightGreen,
        ),
      ),
    );
  }
}