import 'package:flashcard_quize_app/views/widgets/custom_app_bar.dart';
import 'package:flashcard_quize_app/views/widgets/cutom_field.dart';
import 'package:flutter/material.dart';

class EditCardViewBody extends StatelessWidget {
  const EditCardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 70),
              CustomAppBar(
                title: 'Edit Card',
                icon: Icons.check,
              ),
              SizedBox(height: 50),
              Material(
                child: CustomTextField(
                  hint: 'Question',
                  maxlines: 3,
                ),
              ),
              SizedBox(height: 20),
              Material(
                child: CustomTextField(
                  hint: 'Answer',
                  maxlines: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
