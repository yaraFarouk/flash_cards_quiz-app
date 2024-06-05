import 'package:flashcard_quize_app/views/widgets/custom_app_bar.dart';
import 'package:flashcard_quize_app/views/widgets/cards_list_view.dart';
import 'package:flutter/material.dart';

class CardsViewBody extends StatelessWidget {
  const CardsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          CustomAppBar(
            title: 'Flash Cards',
            icon: Icons.search,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(child: CardsListView())
        ],
      ),
    );
  }
}
