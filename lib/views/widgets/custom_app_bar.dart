import 'package:flashcard_quize_app/views/widgets/custom_search_icon.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DefaultTextStyle(
          style: const TextStyle(fontSize: 30),
          child: Text(title),
        ),
        CustomAppBarIcon(icon: icon),
      ],
    );
  }
}
