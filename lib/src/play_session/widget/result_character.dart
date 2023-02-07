import 'package:game_template/src/constants/const_data.dart';

import '../../constants/sizes.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ResultCharacter extends StatefulWidget {
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
  State<ResultCharacter> createState() => _ResultCharacterState();
}

class _ResultCharacterState extends State<ResultCharacter>
    with TickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 500,
    ),
  );
  late final _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.reverse();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Neumorphic(
        padding: EdgeInsets.all(
          widget._circleSize,
        ),
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.circle(),
          color: widget._isFocused ? GameWarningColor : Colors.white,
          depth: widget._isFocused ? -4 : 4,
        ),
        child: Text(
          widget._initial,
          style: TextStyle(
            color: GameDarkColor,
            fontSize: Sizes.size28,
            fontWeight: widget._isFocused ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
