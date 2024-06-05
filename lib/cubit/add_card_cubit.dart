import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_card_state.dart';

class AddCardCubit extends Cubit<AddCardState> {
  AddCardCubit() : super(AddCardInitial());
}
