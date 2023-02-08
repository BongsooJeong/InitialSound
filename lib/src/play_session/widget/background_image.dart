import 'package:flutter/material.dart';
import 'package:game_template/src/level_selection/levels.dart';

import '../game_utils.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
    required this.duringCelebration,
    required this.currentLevel,
    required this.getOpacity,
  });

  final bool duringCelebration;
  final GameLevel currentLevel;
  final double Function() getOpacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
      ),
      child: AnimatedOpacity(
        opacity: duringCelebration ? 1.0 : getOpacity(),
        duration: Duration(
          milliseconds: 1000,
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: GameUtils.getBackgroundImage(
                currentLevel,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
