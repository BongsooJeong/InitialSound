import 'package:game_template/src/constants/const_data.dart';

import '../../constants/sizes.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ResultCharacter extends StatelessWidget {
  const ResultCharacter({
    super.key,
    required initial,
    required isFocused,
    required circleSize,
  })  : _isFocused = isFocused,
        _initial = initial,
        _circleSize = circleSize;

  final String _initial;
  final bool _isFocused;
  final double _circleSize;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      padding: EdgeInsets.all(
        _circleSize,
      ),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
        color: _isFocused ? GameWarningColor : Colors.white,
        depth: _isFocused ? -4 : 4,
      ),
      child: Text(
        _initial,
        style: TextStyle(
          color: GameDarkColor,
          fontSize: Sizes.size28,
          fontWeight: _isFocused ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
