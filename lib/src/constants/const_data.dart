import 'package:flutter/material.dart';

enum KeyboardType {
  keyboardLayout1,
  keyboardLayout2,
}

enum InputStatus {
  initialOnly,
  MotherCharAdded,
  AllDone,
}

enum QuizCategory {
  movie,
  drama,
  kpop,
  proverb,
}

const KeyboardLayout1 = [
  [
    "ㅂ",
    "ㅈ",
    "ㄷ",
    "ㄱ",
    "ㅅ",
    "ㅗ",
    "ㅐ",
    "ㅔ",
  ],
  [
    "ㅁ",
    "ㄴ",
    "ㅇ",
    "ㄹ",
    "ㅎ",
    "ㅓ",
    "ㅏ",
    "ㅣ",
  ],
  [
    "ㅋ",
    "ㅌ",
    "ㅊ",
    "ㅍ",
    "ㅜ",
    "ㅡ",
    "ㅛ",
    "ㅕ",
  ],
];

const KeyboardLayout2 = [
  [
    "ㅃ",
    "ㅉ",
    "ㄸ",
    "ㄲ",
    "ㅆ",
    "ㄳ",
    "ㄵ",
    "ㄶ",
    "ㄺ",
    "ㄻ",
    "ㄼ",
    "ㄽ",
    "ㄾ",
    "ㄿ",
    "ㅀ",
    "ㅄ",
    "ㅑ",
    "ㅒ",
    "ㅖ",
    "ㅘ",
    "ㅙ",
    "ㅚ",
    "ㅝ",
    "ㅞ",
    "ㅟ",
    "ㅢ",
  ],
];

const Chosung = [
  "ㄱ",
  "ㄲ",
  "ㄴ",
  "ㄷ",
  "ㄸ",
  "ㄹ",
  "ㅁ",
  "ㅂ",
  "ㅃ",
  "ㅅ",
  "ㅆ",
  "ㅇ",
  "ㅈ",
  "ㅉ",
  "ㅊ",
  "ㅋ",
  "ㅌ",
  "ㅍ",
  "ㅎ",
];

const Jungsung = [
  "ㅏ",
  "ㅐ",
  "ㅑ",
  "ㅒ",
  "ㅓ",
  "ㅔ",
  "ㅕ",
  "ㅖ",
  "ㅗ",
  "ㅘ",
  "ㅙ",
  "ㅚ",
  "ㅛ",
  "ㅜ",
  "ㅝ",
  "ㅞ",
  "ㅟ",
  "ㅠ",
  "ㅡ",
  "ㅢ",
  "ㅣ",
];
const Jongsung = [
  "",
  "ㄱ",
  "ㄲ",
  "ㄳ",
  "ㄴ",
  "ㄵ",
  "ㄶ",
  "ㄷ",
  "ㄹ",
  "ㄺ",
  "ㄻ",
  "ㄼ",
  "ㄽ",
  "ㄾ",
  "ㄿ",
  "ㅀ",
  "ㅁ",
  "ㅂ",
  "ㅄ",
  "ㅅ",
  "ㅆ",
  "ㅇ",
  "ㅈ",
  "ㅊ",
  "ㅋ",
  "ㅌ",
  "ㅍ",
  "ㅎ",
];

const Color GamePrimaryColor = Color(0xffe6e7ee);
const Color GameSecondaryColor = Color(0xff2d4cc8);
const Color GameInfoColor = Color(0xff0056b3);
const Color GameWarningColor = Color(0xfff0b400);
const Color GameSuccessColor = Color(0xff18634B);
const Color GameDangerColor = Color(0xffA91E2C);
const Color GameDarkColor = Color(0xff31344B);
const Color GameBackgroundColor = Color(0xffE6E7EE);
