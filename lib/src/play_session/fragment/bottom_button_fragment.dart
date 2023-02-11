import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../audio/audio_controller.dart';
import '../../audio/sounds.dart';
import '../../constants/const_data.dart';
import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    super.key,
    required this.restartStage,
    required this.onNextTap,
    required this.onBackTap,
  });

  final void Function() restartStage;
  final void Function() onNextTap;
  final Future<bool> Function() onBackTap;

  void _onNextTap(BuildContext context) {
    final audioController = context.read<AudioController>();
    audioController.playSfx(SfxType.popup);

    showCupertinoDialog(
        context: context,
        builder: (BuildContext ctx) {
          return CupertinoAlertDialog(
            title: const Text('다음 퀴즈'),
            content: const Text('그냥 다음 퀴즈로 넘어갈까요?'),
            actions: [
              // The "No" button
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('더 해볼래'),
                isDefaultAction: false,
                isDestructiveAction: false,
              ),
              // The "Yes" button
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                  onNextTap();
                },
                child: const Text('가자!'),
                isDefaultAction: true,
                isDestructiveAction: true,
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
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
        Gaps.h20,
        NeumorphicButton(
          style: NeumorphicStyle(
            color: GameDarkColor,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size32,
            vertical: Sizes.size12,
          ),
          onPressed: () => _onNextTap(context),
          child: FaIcon(
            FontAwesomeIcons.forward,
            size: Sizes.size24,
            color: Colors.white,
          ),
        ),
        Gaps.h20,
        NeumorphicButton(
          style: NeumorphicStyle(
            color: GameDarkColor,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size32,
            vertical: Sizes.size12,
          ),
          onPressed: () => onBackTap(),
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
