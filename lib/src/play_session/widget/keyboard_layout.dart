import 'package:flutter/material.dart';
import 'package:game_template/src/play_session/const_data.dart';
import 'package:game_template/src/play_session/widget/keyboard_button.dart';
import '../../constants/sizes.dart';

class KeyboardLayout extends StatelessWidget {
  const KeyboardLayout({super.key, required this.layout});

  final keyboardType layout;

  List<Widget> getKeys() {
    List<Widget> resultList = <Widget>[];
    switch (layout) {
      case keyboardType.motherKey:
        {
          for (var motherChar in motherCharacters) {
            resultList.add(
              KeyboardButton(
                inputCharacter: motherChar,
              ),
            );
          }
        }
        break;
      case keyboardType.finalKey:
        {
          for (var finalChar in finalCharacters) {
            resultList.add(
              KeyboardButton(
                inputCharacter: finalChar,
              ),
            );
          }
        }
        break;
      case keyboardType.initialKey:
        assert(false);
    }
    return resultList;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Sizes.size12,
      runSpacing: Sizes.size12,
      children: getKeys(),
    );
  }
}
