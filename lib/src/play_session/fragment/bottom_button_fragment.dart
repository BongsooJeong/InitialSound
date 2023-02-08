import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/const_data.dart';
import '../../constants/sizes.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    super.key,
    required this.restartStage,
    required this.onNextTap,
  });

  final void Function() restartStage;
  final void Function() onNextTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NeumorphicButton(
          style: NeumorphicStyle(
            color: GameDarkColor,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size32,
            vertical: Sizes.size12,
          ),
          onPressed: restartStage,
          child: FaIcon(
            FontAwesomeIcons.rotateLeft,
            size: Sizes.size24,
            color: Colors.white,
          ),
        ),
        NeumorphicButton(
          style: NeumorphicStyle(
            color: GameDarkColor,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size32,
            vertical: Sizes.size12,
          ),
          onPressed: () => onNextTap(),
          child: FaIcon(
            FontAwesomeIcons.forward,
            size: Sizes.size24,
            color: Colors.white,
          ),
        ),
        NeumorphicButton(
          style: NeumorphicStyle(
            color: GameDarkColor,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size32,
            vertical: Sizes.size12,
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: FaIcon(
            FontAwesomeIcons.arrowLeft,
            size: Sizes.size24,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
