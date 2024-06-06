import 'package:flashcard_quize_app/cubits/cubit/add_cards_cubit.dart';
import 'package:flashcard_quize_app/models/note_model.dart';
import 'package:flashcard_quize_app/views/widgets/custom_button.dart';
import 'package:flashcard_quize_app/views/widgets/cutom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddCardBottomSheet extends StatelessWidget {
  const AddCardBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCardsCubit, AddCardsState>(
      listener: (context, state) {
        if (state is AddCardSuccess) {
          Navigator.pop(context);
        }
        if (state is AddCardFailure) {
          print("failed ${state.errMessage}");
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddCardLoading ? true : false,
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(child: AddCardForm()),
          ),
        );
      },
    );
  }
}

class AddCardForm extends StatefulWidget {
  const AddCardForm({
    super.key,
  });

  @override
  State<AddCardForm> createState() => _AddCardFormState();
}

class _AddCardFormState extends State<AddCardForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode? validatorMode = AutovalidateMode.disabled;
  String? question, answer;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: validatorMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onSaved: (value) {
              question = value;
            },
            hint: 'Question',
            maxlines: 3,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              answer = value;
            },
            hint: 'Answer',
            maxlines: 3,
          ),
          const SizedBox(
            height: 60,
          ),
          BlocBuilder<AddCardsCubit, AddCardsState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddCardLoading ? true : false,
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var cardModel = CardModel(
                        question: question!,
                        answer: answer!,
                        date: DateTime.now().toString(),
                        color: Colors.greenAccent.value);
                    BlocProvider.of<AddCardsCubit>(context).addCard(cardModel);
                  } else {
                    validatorMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 18,
          )
        ],
      ),
    );
  }
}
