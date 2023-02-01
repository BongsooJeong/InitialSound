import 'dart:core';

import 'package:game_template/src/constants/const_data.dart';

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
      initialList.add(
        (eachChar.initial >= 0) ? Chosung[eachChar.initial] : ' ',
      );
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
}

class CharInfo {
  int initial = -1;
  int middle = -1;
  int last = 0;

  CharInfo setInfoFromString(String input) {
    if (input.isEmpty || input == ' ') {
      initial = middle = last = -1;
    } else if (input.codeUnitAt(0) < 44032) {
      initial = Chosung.indexOf(input);
    } else {
      int uniBase = input.codeUnitAt(0) - 44032;

      initial = uniBase / 28 ~/ 21;
      middle = (uniBase / 28 % 21).toInt();
      last = (uniBase % 28).toInt();
    }
    return this;
  }

  bool isBlank() {
    return (initial + middle + last <= 0);
  }

  bool isChosungOnly() {
    return (middle == -1);
  }

  String getDisplayChar() {
    if (isBlank()) {
      return " ";
    } else if (middle == -1) {
      return Chosung[initial];
    }
    return String.fromCharCode((initial * 21 + middle) * 28 + last + 44032);
  }
}
