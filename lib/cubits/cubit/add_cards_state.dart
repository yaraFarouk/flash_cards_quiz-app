part of 'add_cards_cubit.dart';

@immutable
sealed class AddCardsState {}

final class AddCardsInitial extends AddCardsState {}

final class AddCardInitial extends AddCardsState {}

final class AddCardLoading extends AddCardsState {}

final class AddCardSuccess extends AddCardsState {}

final class AddCardFailure extends AddCardsState {
  final String errMessage;

  AddCardFailure({required this.errMessage});
}
