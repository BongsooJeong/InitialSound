import 'package:flutter/material.dart';
import 'package:game_template/src/constants/const_data.dart';
import 'package:game_template/src/play_session/widget/keyboard_button.dart';
import '../../constants/sizes.dart';

class KeyboardLayout extends StatelessWidget {
  const KeyboardLayout({
    super.key,
    required KeyboardType keyboardType,
    required void Function(String) listener,
  })  : _listener = listener,
        _setKeyboardType = keyboardType;

  final void Function(String) _listener;
  final KeyboardType _setKeyboardType;

  List<Widget> getKeys(List<String> inputList) {
    List<Widget> resultList = <Widget>[];
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

  List<Widget> getWraps() {
    var inputList = (_setKeyboardType == KeyboardType.keyboardLayout1)
        ? KeyboardLayout1
        : KeyboardLayout2;
    List<Widget> resultList = <Widget>[];
    for (var rowList in inputList) {
      resultList.add(
        Wrap(
          spacing: Sizes.size7,
          runSpacing: Sizes.size7,
          alignment: WrapAlignment.center,
          children: getKeys(rowList),
        ),
      );
    }
    return resultList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getWraps(),
    );
  }
}
