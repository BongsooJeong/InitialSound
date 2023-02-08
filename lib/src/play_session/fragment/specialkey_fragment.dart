import 'package:flutter/material.dart';
import 'package:game_template/src/constants/const_data.dart';

import '../../constants/gaps.dart';
import '../widget/keyboard_button.dart';

class SpecialKeyFragment extends StatelessWidget {
  const SpecialKeyFragment({
    super.key,
    required this.onSpecialkeyPresseed,
    required this.currentKeyboardType,
  });

  final void Function(String) onSpecialkeyPresseed;
  final KeyboardType currentKeyboardType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        KeyboardButton(
          inputCharacter: '  ↑ Shift  ',
          listener: onSpecialkeyPresseed,
          isPressed: (currentKeyboardType == KeyboardType.keyboardLayout2),
        ),
        Gaps.h12,
        KeyboardButton(
          inputCharacter: '←',
          listener: onSpecialkeyPresseed,
        ),
        Gaps.h12,
        KeyboardButton(
          inputCharacter: '  Next  ',
          listener: onSpecialkeyPresseed,
        ),
      ],
    );
  }
}
