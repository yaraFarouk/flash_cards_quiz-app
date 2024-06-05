import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class CardModel extends HiveObject {
  @HiveField(0)
  final String question;
  @HiveField(1)
  final String answer;

  @HiveField(2)
  final String date;
  @HiveField(3)
  final int color;

  CardModel(
      {required this.question,
      required this.answer,
      required this.date,
      required this.color});
}
