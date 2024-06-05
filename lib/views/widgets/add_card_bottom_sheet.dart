import 'package:flashcard_quize_app/cubits/cubit/add_cards_cubit.dart';
import 'package:flashcard_quize_app/views/widgets/custom_button.dart';
import 'package:flashcard_quize_app/views/widgets/cutom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddCardBottomSheet extends StatelessWidget {
  const AddCardBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: BlocConsumer<AddCardsCubit, AddCardsState>(
          listener: (context, state) {
            if (state is AddCardSuccess) {
              Navigator.pop(context);
            }
            if (state is AddCardFailure) {
              print("failed ${state.errMessage}");
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is AddCardLoading ? true : false,
                child: const AddCardForm());
          },
        ),
      ),
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
          CustomButton(
            onTap: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
              } else {
                validatorMode = AutovalidateMode.always;
                setState(() {});
              }
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
