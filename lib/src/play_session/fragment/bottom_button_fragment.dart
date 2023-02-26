import 'package:easy_localization/easy_localization.dart';
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
            title: Text(tr("NextQuiz")),
            content: Text(tr("NextQuizDesc")),
            actions: [
              // The "No" button
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(tr("TryMode")),
                isDefaultAction: false,
                isDestructiveAction: false,
              ),
              // The "Yes" button
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                  onNextTap();
                },
                child: Text(tr("LetsMove")),
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
