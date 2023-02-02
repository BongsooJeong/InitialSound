import '../../constants/const_data.dart';

class CharInfo {
  int initial = -1;
  int middle = -1;
  int last = 0;
  bool isHangul = true;
  bool isBlank = false;
  String contents = "";

  CharInfo setInfoFromString(String input) {
    final firstChar = input.codeUnitAt(0);

    if (input.isEmpty || input == ' ') {
      initial = middle = last = -1;
      isBlank = true;
      isHangul = false;
      contents = ' ';
    } else if (!_isCharHangul(firstChar)) {
      initial = middle = last = -1;
      isHangul = false;
      contents = input;
    } else if (firstChar < 44032) {
      initial = Chosung.indexOf(input);
    } else {
      int uniBase = firstChar - 44032;
      initial = uniBase / 28 ~/ 21;
      middle = (uniBase / 28 % 21).toInt();
      last = (uniBase % 28).toInt();
    }
    return this;
  }

  bool isChosungOnly() {
    return (middle == -1);
  }

  bool _isCharHangul(int c) {
    return (0x1100 <= c && c <= 0x11FF) ||
        (0x3130 <= c && c <= 0x318F) ||
        (0xAC00 <= c && c <= 0xD7AF);
  }

  String getDisplayChar() {
    if (isBlank) {
      return " ";
    } else if (!isHangul) {
      return contents;
    } else if (middle == -1) {
      return Chosung[initial];
    }
    return String.fromCharCode((initial * 21 + middle) * 28 + last + 44032);
  }
}
