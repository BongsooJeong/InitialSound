import 'dart:collection';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/const_data.dart';
import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../../style/confetti.dart';

class GameClearFragment extends StatelessWidget {
  const GameClearFragment({
    super.key,
    required this.duringCelebration,
    required this.onNextTap,
  });

  final bool duringCelebration;
  final void Function() onNextTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Visibility(
        visible: duringCelebration,
        child: GestureDetector(
          onTap: () => onNextTap(),
          child: Stack(
            children: [
              Confetti(
                isStopped: !duringCelebration,
              ),
              Positioned(
                bottom: 90,
                left: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Stage Cleared !",
                      style: TextStyle(
                        fontSize: Sizes.size24,
                        color: GamePrimaryColor,
                        fontWeight: FontWeight.bold,
                        shadows: outlinedText(
                          strokeColor: Colors.black,
                        ),
                      ),
                    ),
                    Gaps.v10,
                    Text(
                      tr("NewCard"),
                      style: TextStyle(
                        fontSize: Sizes.size20,
                        color: GamePrimaryColor,
                        shadows: outlinedText(
                          strokeColor: Colors.black.withOpacity(0.1),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static List<Shadow> outlinedText(
      {double strokeWidth = 2,
      Color strokeColor = Colors.black,
      int precision = 5}) {
    Set<Shadow> result = HashSet();
    for (int x = 1; x < strokeWidth + precision; x++) {
      for (int y = 1; y < strokeWidth + precision; y++) {
        double offsetX = x.toDouble();
        double offsetY = y.toDouble();
        result.add(Shadow(
            offset: Offset(-strokeWidth / offsetX, -strokeWidth / offsetY),
            color: strokeColor));
        result.add(Shadow(
            offset: Offset(-strokeWidth / offsetX, strokeWidth / offsetY),
            color: strokeColor));
        result.add(Shadow(
            offset: Offset(strokeWidth / offsetX, -strokeWidth / offsetY),
            color: strokeColor));
        result.add(Shadow(
            offset: Offset(strokeWidth / offsetX, strokeWidth / offsetY),
            color: strokeColor));
      }
    }
    return result.toList();
  }
}
