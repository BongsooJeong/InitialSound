import 'package:initialsound/src/player_progress/game_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayerProgress {
  static Future<SharedPreferences> instanceFuture =
      SharedPreferences.getInstance();

  static const ClearedTimeStampKey = "clearedTimeStamp";
  static const ClearedSpecialTimeStampKey = "clearedSpecialTimeStamp";
  static bool isFirst = true;

  static void loadClearedList() async {
    final prefs = await instanceFuture;
    final timestampList = prefs.getStringList(ClearedTimeStampKey);
    final specialTimestampList =
        prefs.getStringList(ClearedSpecialTimeStampKey);

    if (timestampList != null &&
        timestampList.length == GameInfo.quizInfo.length) {
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
      isFirst = false;
    }
    if (specialTimestampList != null &&
        specialTimestampList.length == GameInfo.quizInfo.length) {
      for (int i = 0; i < GameInfo.quizInfo.length; i++) {
        int timeStamp = int.parse(specialTimestampList[i]);
        if (timeStamp == -1) {
          GameInfo.quizSpecialInfo[i].isCleared = false;
          GameInfo.quizSpecialInfo[i].clearTime = -1;
        } else {
          GameInfo.quizSpecialInfo[i].isCleared = true;
          GameInfo.quizSpecialInfo[i].clearTime = timeStamp;
        }
      }
      isFirst = false;
    }
  }
  
  static void resetClearedList() async {
    for (int i = 0; i < GameInfo.quizInfo.length; i++) {
      GameInfo.quizInfo[i].isCleared = false;
      GameInfo.quizInfo[i].clearTime = -1;
      GameInfo.quizSpecialInfo[i].isCleared = false;
      GameInfo.quizSpecialInfo[i].clearTime = -1;
    }

    saveClearedList();
  }

  static void saveClearedList() async {
    final prefs = await instanceFuture;
    List<String> timeStampList = [];
    List<String> timeStampSpecialList = [];

    for (int i = 0; i < GameInfo.quizInfo.length; i++) {
      timeStampSpecialList.add(
        GameInfo.quizSpecialInfo[i].clearTime.toString(),
      );
      timeStampList.add(
        GameInfo.quizInfo[i].clearTime.toString(),
      );
    }
    prefs.setStringList(ClearedSpecialTimeStampKey, timeStampSpecialList);
    prefs.setStringList(ClearedTimeStampKey, timeStampList);
  }
}
