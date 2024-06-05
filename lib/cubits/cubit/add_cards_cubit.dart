import 'package:bloc/bloc.dart';
import 'package:flashcard_quize_app/constants.dart';
import 'package:flashcard_quize_app/models/note_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

part 'add_cards_state.dart';

class AddCardsCubit extends Cubit<AddCardsState> {
  AddCardsCubit() : super(AddCardsInitial());
  addCard(CardModel card) async {
    emit(AddCardLoading());
    try {
      var cardBox = Hive.box<CardModel>(kCardsBox);
      emit(AddCardSuccess());
      await cardBox.add(card);
    } catch (e) {
      AddCardFailure(errMessage: e.toString());
    }
  }
}
