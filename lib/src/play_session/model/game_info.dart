import 'dart:math';

import 'package:game_template/src/constants/const_data.dart';
import 'package:game_template/src/constants/game_data.dart';
import 'package:game_template/src/level_selection/levels.dart';
import 'package:game_template/src/play_session/model/quiz_info.dart';

class GameInfo {
  GameInfo() {
    int index = 1;
    for (int i = 0; i < gameRawData.length; i += 2) {
      quizInfo.add(
        QuizInfo(
            index: index++,
            category: QuizCategory.values.byName(
              gameRawData[i],
            ),
            contents: gameRawData[i + 1]),
        // todo : need to add stage clear info and image
      );
    }
  }
  static List<QuizInfo> quizInfo = [];

  static List<QuizInfo> getUnclearedList() {
    List<QuizInfo> result = [];
    for (var quiz in quizInfo) {
      if (!quiz.isCleared) {
        result.add(quiz);
      }
    }
    return result;
  }

  static GameLevel getRandomQuiz() {
    final unclearedStage = GameInfo.getUnclearedList();
    final randomStage = Random().nextInt(unclearedStage.length);
    return GameLevel(number: unclearedStage[randomStage].index);
  }
}
