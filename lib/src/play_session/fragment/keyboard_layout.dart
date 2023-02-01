import 'package:flutter/material.dart';
import 'package:game_template/src/constants/const_data.dart';
import 'package:game_template/src/play_session/widget/keyboard_button.dart';
import '../../constants/sizes.dart';

class KeyboardLayout extends StatelessWidget {
  const KeyboardLayout({
    super.key,
    required KeyboardType setKeyboardType,
    required void Function(String) listener,
  })  : _listener = listener,
        _setKeyboardType = setKeyboardType;

  final KeyboardType _setKeyboardType;
  final void Function(String) _listener;

  List<Widget> getKeys() {
    List<Widget> resultList = <Widget>[];
    var inputList;

    switch (_setKeyboardType) {
      case KeyboardType.motherKey1:
        inputList = MotherCharacters1;
        break;
      case KeyboardType.motherKey2:
        inputList = MotherCharacters2;
        break;
      case KeyboardType.finalKey1:
        inputList = FinalCharacters1;
        break;
      case KeyboardType.finalKey2:
        inputList = FinalCharacters2;
        break;
      case KeyboardType.initialKey:
        assert(false);
    }
    for (var eachKey in inputList) {
      resultList.add(
        KeyboardButton(
          inputCharacter: eachKey,
          listener: _listener,
        ),
      );
    }
    return resultList;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Sizes.size10,
      runSpacing: Sizes.size10,
      alignment: WrapAlignment.center,
      children: getKeys(),
    );
  }
}
