import 'package:flutter/material.dart';
import 'package:game_template/src/level_selection/levels.dart';

import '../constants/const_data.dart';
import '../player_progress/game_info.dart';

class GameUtils {
    static bool isJungsungChar(String input) {
    return Jungsung.indexOf(input) >= 0;
  }

   static AssetImage getBackgroundImage(GameLevel currentLevel) {
    var imageName = GameInfo.quizInfo[currentLevel.number].imageId;
    var imagePath = "assets/images/gamebg/$imageName.jpg";
    return AssetImage(imagePath);
  }

  static  QuizCategory getCategory(GameLevel currentLevel) {
    return GameInfo.quizInfo[currentLevel.number].category;
  }

}