import 'dart:core';

import 'package:initialsound/src/constants/const_data.dart';

import 'char_info.dart';

class StringInfo {
  String resultString = "";
  List<CharInfo> resultStringList = [];

  StringInfo setInfoFromString(String input) {
    resultString = input;
    resultStringList.clear();
    for (int i = 0; i < input.length; i++) {
      resultStringList.add(
        CharInfo().setInfoFromString(input[i]),
      );
    }
    return this;
  }

  StringInfo setInfoFromList(List<CharInfo> resultList) {
    resultStringList = resultList;
    resultString = "";

    for (var eachChar in resultList) {
      resultString += eachChar.getDisplayChar();
    }
    return this;
  }

  StringInfo setInfoFromInitialList(List<String> resultList) {
    resultString = "";
    for (var eachChar in resultList) {
      resultString += eachChar;
    }
    setInfoFromString(resultString);
    return this;
  }

  List<String> getInitialCharList() {
    List<String> initialList = [];
    for (var eachChar in resultStringList) {
      if (eachChar.isBlank) {
        initialList.add(" ");
      } else if (!eachChar.isHangul) {
        initialList.add(eachChar.contents);
      } else {
        initialList.add(
          (eachChar.initial >= 0) ? Chosung[eachChar.initial] : ' ',
        );
      }
    }
    return initialList;
  }

  List<String> getStringAsArray() {
    List<String> resultArray = [];
    for (int i = 0; i < resultString.length; i++) {
      resultArray.add(resultString[i]);
    }
    return resultArray;
  }

  StringInfo addMiddle(int index, String middle) {
    resultStringList[index].middle = Jungsung.indexOf(middle);
    setInfoFromList(resultStringList);
    return this;
  }

  StringInfo addLast(int index, String last) {
    resultStringList[index].last = Jongsung.indexOf(last);
    setInfoFromList(resultStringList);
    return this;
  }

  StringInfo removeMiddle(int index) {
    resultStringList[index].middle = -1;
    setInfoFromList(resultStringList);
    return this;
  }

  StringInfo removeLast(int index) {
    resultStringList[index].last = 0;
    setInfoFromList(resultStringList);
    return this;
  }

  int getHangulStartIndex() {
    int index = 0;
    while (!resultStringList[index].isHangul) index++;
    return index;
  }

  int getHangulEndIndex() {
    int index = resultStringList.length - 1;
    while (!resultStringList[index].isHangul) index--;
    return index;
  }
}
