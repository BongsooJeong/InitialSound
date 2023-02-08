import 'package:game_template/src/player_progress/game_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayerProgress {
  static Future<SharedPreferences> instanceFuture =
      SharedPreferences.getInstance();

  static const ClearedTimeStampKey = "clearedTimeStamp";

  static void loadClearedList() async {
    final prefs = await instanceFuture;
    final timestampList = prefs.getStringList(ClearedTimeStampKey);

    if (timestampList == null ||
        timestampList.length != GameInfo.quizInfo.length) {
      return;
    }
    for (int i = 0; i < GameInfo.quizInfo.length; i++) {
      int timeStamp = int.parse(timestampList[i]);
      if (timeStamp == -1) {
        GameInfo.quizInfo[i].isCleared = false;
        GameInfo.quizInfo[i].clearTime = -1;
      } else {
        GameInfo.quizInfo[i].isCleared = true;
        GameInfo.quizInfo[i].clearTime = timeStamp;
      }
    }
  }

  static void saveClearedList() async {
    final prefs = await instanceFuture;
    List<String> timeStampList = [];

    for (int i = 0; i < GameInfo.quizInfo.length; i++) {
      timeStampList.add(
        GameInfo.quizInfo[i].clearTime.toString(),
      );
    }
    prefs.setStringList(ClearedTimeStampKey, timeStampList);
  }
}
