// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_template/src/play_session/const_data.dart';
import 'package:game_template/src/play_session/widget/keyboard_layout.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart' hide Level;
import 'package:provider/provider.dart';

import '../ads/ads_controller.dart';
import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../constants/gaps.dart';
import '../constants/sizes.dart';
import '../game_internals/level_state.dart';
import '../games_services/games_services.dart';
import '../games_services/score.dart';
import '../in_app_purchase/in_app_purchase.dart';
import '../level_selection/levels.dart';
import '../player_progress/player_progress.dart';
import '../style/confetti.dart';
import '../style/palette.dart';
import 'widget/result_character.dart';

const initialData = ['ㅅ', 'ㅅ', 'ㅋ', ' ', 'ㅌ', 'ㅊ'];
const initialResult = "쇼생크 탈출";

class PlaySessionScreen extends StatefulWidget {
  final GameLevel level;

  const PlaySessionScreen(this.level, {super.key});

  @override
  State<PlaySessionScreen> createState() => _PlaySessionScreenState();
}

class _PlaySessionScreenState extends State<PlaySessionScreen> {
  static final _log = Logger('PlaySessionScreen');
  static const _celebrationDuration = Duration(milliseconds: 2000);
  static const _preCelebrationDuration = Duration(milliseconds: 500);

  int _characterIndex = 0;
  bool _duringCelebration = false;
  late DateTime _startOfPlay;

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LevelState(
            goal: widget.level.difficulty,
            onWin: _playerWon,
          ),
        ),
      ],
      child: IgnorePointer(
        ignoring: _duringCelebration,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/gamebg/1.jpg'),
            ),
          ),
          child: Scaffold(
            backgroundColor: palette.backgroundPlaySession.withOpacity(0.90),
            appBar: AppBar(
              title: Text(
                'ㅊㅅ Quiz',
                style: TextStyle(
                  fontFamily: 'Retrosans',
                ),
              ),
              backgroundColor: Colors.white.withOpacity(0.4),
            ),
            body: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.size20,
                    vertical: Sizes.size40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /*                       Align(
                        alignment: Alignment.centerRight,
                        child: InkResponse(
                          onTap: () => GoRouter.of(context).push('/settings'),
                          child: Image.asset(
                            'assets/images/settings.png',
                            semanticLabel: 'Settings',
                            color: Colors.white,
                          ),
                        ),
                      ), */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.movie_rounded,
                            color: palette.appMainColor,
                            size: Sizes.size40,
                          ),
                          Gaps.h14,
                          Text(
                            '영화제목',
                            style: TextStyle(
                              fontFamily: 'Retrosans',
                              fontSize: Sizes.size32,
                              letterSpacing: 3,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Gaps.v40,
                      Wrap(
                        spacing: Sizes.size12,
                        children: [
                          for (int i = 0; i < initialData.length; i++)
                            (initialData[i] != ' ')
                                ? ResultCharacter(
                                    initial: initialData[i],
                                    isFocused: (_characterIndex == i),
                                  )
                                : Gaps.h14,
                        ],
                      ),
                      Gaps.v32,
/*                       Container(
                        padding: EdgeInsets.only(
                          left: Sizes.size12,
                          right: Sizes.size12,
                          bottom: Sizes.size6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                        child: Text(
                          '쇼',
                          style: TextStyle(
                            color: palette.appMainColor,
                            fontSize: Sizes.size44,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
 */
/*                       Consumer<LevelState>(
                        builder: (context, levelState, child) => Slider(
                          label: 'Level Progress',
                          autofocus: true,
                          value: levelState.progress / 100,
                          onChanged: (value) =>
                              levelState.setProgress((value * 100).round()),
                          onChangeEnd: (value) => levelState.evaluate(),
                        ),
                      ), */
                      KeyboardLayout(
                        layout: keyboardType.motherKey,
                      ),
                    ],
                  ),
                ),
                SizedBox.expand(
                  child: Visibility(
                    visible: _duringCelebration,
                    child: IgnorePointer(
                      child: Confetti(
                        isStopped: !_duringCelebration,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.white.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size32,
                  vertical: Sizes.size16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      color: palette.appMainColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.size32,
                        vertical: Sizes.size12,
                      ),
                      onPressed: () => GoRouter.of(context).go('/play'),
                      child: Text(
                        'Reset',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    CupertinoButton(
                      color: palette.appMainColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.size32,
                        vertical: Sizes.size12,
                      ),
                      onPressed: () => GoRouter.of(context).go('/play'),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    CupertinoButton(
                      color: palette.appMainColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.size32,
                        vertical: Sizes.size12,
                      ),
                      onPressed: () => GoRouter.of(context).go('/play'),
                      child: Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _startOfPlay = DateTime.now();

    // Preload ad for the win screen.
    final adsRemoved =
        context.read<InAppPurchaseController?>()?.adRemoval.active ?? false;
    if (!adsRemoved) {
      final adsController = context.read<AdsController?>();
      adsController?.preloadAd();
    }
  }

  Future<void> _playerWon() async {
    _log.info('Level ${widget.level.number} won');

    final score = Score(
      widget.level.number,
      widget.level.difficulty,
      DateTime.now().difference(_startOfPlay),
    );

    final playerProgress = context.read<PlayerProgress>();
    playerProgress.setLevelReached(widget.level.number);

    // Let the player see the game just after winning for a bit.
    await Future<void>.delayed(_preCelebrationDuration);
    if (!mounted) return;

    setState(() {
      _duringCelebration = true;
    });

    final audioController = context.read<AudioController>();
    audioController.playSfx(SfxType.congrats);

    final gamesServicesController = context.read<GamesServicesController?>();
    if (gamesServicesController != null) {
      // Award achievement.
      if (widget.level.awardsAchievement) {
        await gamesServicesController.awardAchievement(
          android: widget.level.achievementIdAndroid!,
          iOS: widget.level.achievementIdIOS!,
        );
      }

      // Send score to leaderboard.
      await gamesServicesController.submitLeaderboardScore(score);
    }

    /// Give the player some time to see the celebration animation.
    await Future<void>.delayed(_celebrationDuration);
    if (!mounted) return;

    GoRouter.of(context).go('/play/won', extra: {'score': score});
  }
}
