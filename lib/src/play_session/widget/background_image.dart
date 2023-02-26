import 'package:flutter/material.dart';
import 'package:initialsound/src/game_internals/firebase_image_loader.dart';
import 'package:initialsound/src/level_selection/levels.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../game_utils.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
    required this.duringCelebration,
    required this.currentLevel,
    required this.getOpacity,
    required this.isSpecial,
  });

  final bool duringCelebration;
  final GameLevel currentLevel;
  final double Function() getOpacity;
  final bool isSpecial;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
      ),
      child: AnimatedOpacity(
        opacity: duringCelebration ? 1.0 : getOpacity(),
        duration: Duration(
          seconds: 2,
        ),
        child: isSpecial
            ? FutureBuilder(
                future: FirebaseImageLoader().getImage(
                  GameUtils.getSpecialBackgroundImage(
                    currentLevel,
                  ),
                ),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Something went wrong");
                  }
                  final thumb = Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: GameUtils.getSpecialBackgroundThumbImage(
                          currentLevel,
                        ),
                      ),
                    ),
                  );

                  if (snapshot.connectionState == ConnectionState.done) {
                    final url = snapshot.data.toString();
                    return CachedNetworkImage(
                      key: ValueKey(currentLevel),
                      fit: BoxFit.fitHeight,
                      width: double.infinity,
                      height: double.infinity,
                      imageUrl: url,
                      placeholder: (context, url) => thumb,
                    );
                  }
                  return thumb;
                },
              )
            : Container(
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
