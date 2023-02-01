import 'package:game_template/src/constants/const_data.dart';

import '../../constants/sizes.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ResultCharacter extends StatelessWidget {
  const ResultCharacter({
    super.key,
    required String initial,
    required isFocused,
  })  : _isFocused = isFocused,
        _initial = initial;

  final String _initial;
  final bool _isFocused;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      padding: EdgeInsets.all(Sizes.size12),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
      ),
      child: Text(
        _initial,
        style: TextStyle(
          color: _isFocused ? GameSecondaryColor : GameDarkColor,
          fontSize: Sizes.size36,
          fontWeight: _isFocused ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
