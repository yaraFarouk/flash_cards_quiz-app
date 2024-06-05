import 'package:flashcard_quize_app/views/widgets/add_card_bottom_sheet.dart';
import 'package:flashcard_quize_app/views/widgets/cards_view_body.dart';
import 'package:flutter/material.dart';

class CardsView extends StatelessWidget {
  const CardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const AddCardBottomSheet();
              });
        },
        // ignore: sort_child_properties_last
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: const Color.fromARGB(255, 126, 238, 214),
      ),
      body: const CardsViewBody(),
    );
  }
}
