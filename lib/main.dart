import 'package:flashcard_quize_app/constants.dart';
import 'package:flashcard_quize_app/cubits/cubit/add_cards_cubit.dart';
import 'package:flashcard_quize_app/models/note_model.dart';
import 'package:flashcard_quize_app/views/cards_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kCardsBox);
  Hive.registerAdapter(CardModelAdapter());
  runApp(const FlashCardsQuizApp());
}

class FlashCardsQuizApp extends StatelessWidget {
  const FlashCardsQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddCardsCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const CardsView(),
      ),
    );
  }
}
