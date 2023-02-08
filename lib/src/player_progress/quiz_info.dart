import 'package:game_template/src/constants/const_data.dart';

class QuizInfo {
  QuizInfo({
    required QuizCategory category,
    required String contents,
    required int index,
    required String imageId,
    bool? isCleared,
    int? clearedTime,
  })  : this.category = category,
        this.contents = contents,
        this.index = index,
        this.imageId = imageId,
        this.isCleared = (isCleared != null) ? isCleared : false,
        this.clearTime = (clearedTime != null) ? clearedTime : -1;

  final int index;
  final QuizCategory category;
  final String contents;
  final String imageId;
  bool isCleared;
  int clearTime;
}
