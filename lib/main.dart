import 'package:flashcard_quize_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlashCardQuizApp());
}

class FlashCardQuizApp extends StatelessWidget {
  const FlashCardQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
