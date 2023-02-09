import 'package:initialsound/src/player_progress/game_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayerProgress {
  static Future<SharedPreferences> instanceFuture =
      SharedPreferences.getInstance();

  static const ClearedTimeStampKey = "clearedTimeStamp";
  static const ClearedSpecialTimeStampKey = "clearedSpecialTimeStamp";

  static void loadClearedList() async {
    final prefs = await instanceFuture;
    final timestampList = prefs.getStringList(ClearedTimeStampKey);
    final specialTimestampList =
        prefs.getStringList(ClearedSpecialTimeStampKey);

    for (int i = 0; i < GameInfo.quizInfo.length; i++) {
      if (timestampList != null &&
          timestampList.length == GameInfo.quizInfo.length) {
        int timeStamp = int.parse(timestampList[i]);
        if (timeStamp == -1) {
          GameInfo.quizInfo[i].isCleared = false;
          GameInfo.quizInfo[i].clearTime = -1;
        } else {
          GameInfo.quizInfo[i].isCleared = true;
          GameInfo.quizInfo[i].clearTime = timeStamp;
        }
      }
      if (specialTimestampList != null &&
          specialTimestampList.length == GameInfo.quizInfo.length) {
        int timeStamp = int.parse(specialTimestampList[i]);
        if (timeStamp == -1) {
          GameInfo.quizSpecialInfo[i].isCleared = false;
          GameInfo.quizSpecialInfo[i].clearTime = -1;
        } else {
          GameInfo.quizSpecialInfo[i].isCleared = true;
          GameInfo.quizSpecialInfo[i].clearTime = timeStamp;
        }
      }
    }
  }

  static void resetClearedList() async {
    final prefs = await instanceFuture;
    List<String> timeStampList = [];
    prefs.setStringList(ClearedTimeStampKey, timeStampList);
    prefs.setStringList(ClearedSpecialTimeStampKey, timeStampList);
  }

  static void saveClearedList({isSpecial = false}) async {
    final prefs = await instanceFuture;
    List<String> timeStampList = [];

    for (int i = 0; i < GameInfo.quizInfo.length; i++) {
      if (isSpecial) {
        timeStampList.add(
          GameInfo.quizSpecialInfo[i].clearTime.toString(),
        );
      } else {
        timeStampList.add(
          GameInfo.quizInfo[i].clearTime.toString(),
        );
      }
    }
    final prevtimestampList = isSpecial
        ? prefs.getStringList(ClearedSpecialTimeStampKey)
        : prefs.getStringList(ClearedTimeStampKey);

    if (isSpecial)
      prefs.setStringList(ClearedSpecialTimeStampKey, timeStampList);
    else
      prefs.setStringList(ClearedTimeStampKey, timeStampList);
  }
}
