import 'package:flashcard_quize_app/views/widgets/card_item.dart';
import 'package:flutter/material.dart';

class CardsListView extends StatelessWidget {
  const CardsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, indx) {
          return const NoteItem();
        });
  }
}
