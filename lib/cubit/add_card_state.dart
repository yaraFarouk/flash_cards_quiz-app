part of 'add_card_cubit.dart';

@immutable
sealed class AddCardState {}

final class AddCardInitial extends AddCardState {}

final class AddCardLoading extends AddCardState {}

final class AddCardSuccess extends AddCardState {}

final class AddCardFailure extends AddCardState {
  final String errMessage;

  AddCardFailure({required this.errMessage});
}
