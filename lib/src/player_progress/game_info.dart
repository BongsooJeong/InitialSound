import 'dart:math';

import 'package:initialsound/src/constants/const_data.dart';
import 'package:initialsound/src/constants/game_data.dart';
import 'package:initialsound/src/level_selection/levels.dart';
import 'package:initialsound/src/player_progress/quiz_info.dart';

import '../constants/game_data_special.dart';

class GameInfo {
  GameInfo() {
    int index = 1;
    for (int i = 0; i < gameRawData.length; i += 3) {
      quizInfo.add(
        QuizInfo(
            index: index,
            imageId: gameRawData[i],
            category: QuizCategory.values.byName(
              gameRawData[i + 1],
            ),
            contents: gameRawData[i + 2]),
        // todo : need to add stage clear info and image
      );

      quizSpecialInfo.add(
        QuizInfo(
            index: index++,
            imageId: gameSpecialRawData[i],
            category: QuizCategory.values.byName(
              gameSpecialRawData[i + 1],
            ),
            contents: gameSpecialRawData[i + 2]),
        // todo : need to add stage clear info and image
      );
    }
  }
  static List<QuizInfo> quizInfo = [];
  static List<QuizInfo> quizSpecialInfo = [];

  static List<QuizInfo> getUnclearedQuizList({isSpecial = false}) {
    List<QuizInfo> result = [];

    if (isSpecial) {
      for (var quiz in quizSpecialInfo) {
        if (!quiz.isCleared) {
          result.add(quiz);
        }
      }
    } else {
      for (var quiz in quizInfo) {
        if (!quiz.isCleared) {
          result.add(quiz);
        }
      }
    }
    return result;
  }

  static GameLevel getRandomQuiz({isSpecial = false}) {
    final unclearedStage = GameInfo.getUnclearedQuizList(
      isSpecial: isSpecial,
    );
    final randomStage = Random().nextInt(unclearedStage.length);
    print(
      "This stage is ${quizInfo[unclearedStage[randomStage].index].imageId}",
    );
/*     print(
      "This stage is ${quizInfo[unclearedStage[randomStage].index].contents}",
    );
 */
    return GameLevel(number: unclearedStage[randomStage].index);
  }

  static bool isFirstGame() {
    return getUnclearedQuizList().length == quizInfo.length;
  }
  
}
