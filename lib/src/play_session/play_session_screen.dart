// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game_template/src/constants/const_data.dart';
import 'package:game_template/src/play_session/fragment/keyboard_layout.dart';
import 'package:game_template/src/play_session/model/string_info.dart';
import 'package:logging/logging.dart' hide Level;
import 'package:provider/provider.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
import 'fragment/quiz_info_fragment.dart';
import 'model/game_info.dart';
import 'widget/keyboard_button.dart';

class PlaySessionScreen extends StatefulWidget {
  final GameLevel level;

  const PlaySessionScreen({
    required this.level,
    super.key,
  });

  @override
  State<PlaySessionScreen> createState() => _PlaySessionScreenState();
}

class _PlaySessionScreenState extends State<PlaySessionScreen> {
  static final _log = Logger('PlaySessionScreen');
  static const _celebrationDuration = Duration(milliseconds: 5000);
  static const _preCelebrationDuration = Duration(milliseconds: 500);
  static const _backgroundPreviewDuration = Duration(milliseconds: 500);

  int _characterIndex = 0;
  bool _duringCelebration = false;
  bool _duringPreview = false;
  late DateTime _startOfPlay;
  KeyboardType _currentKeyboardType = KeyboardType.keyboardLayout1;

  StringInfo _initialResult = StringInfo();
  StringInfo _currentResult = StringInfo();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LevelState(
//            goal: widget.level.difficulty,
            onWin: _playerWon,
          ),
        ),
      ],
      child: IgnorePointer(
        ignoring: _duringCelebration,
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                ),
                child: AnimatedOpacity(
                  opacity: _duringCelebration ? 1.0 : getOpacity(),
                  duration: Duration(
                    seconds: 1,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: getBackgroundImage(),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !_duringCelebration,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.size20,
                    vertical: Sizes.size40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Gaps.v32,
                      Align(
                        alignment: Alignment.centerRight,
                        child: NeumorphicText(
                          'ㅊㅅ Quiz',
                          style: NeumorphicStyle(
                            color: GameInfoColor,
                            depth: 4,
                            intensity: 1,
                            shadowLightColor: Colors.white,
                            shadowDarkColor: Colors.grey,
                          ),
                          textStyle: NeumorphicTextStyle(
                            fontSize: Sizes.size28,
                            fontFamily: 'Retrosans',
                          ),
                        ),
                      ),
                      Gaps.v5,
                      QuizInfoFragment(
                        characterIndex: _characterIndex,
                        hintList: _currentResult,
                        callBack: _onFocusTapped,
                        category: getCategory(),
                      ),
                      Spacer(),
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
                          keyboardType: _currentKeyboardType,
                          listener: onKeyboardPressed),
                      Gaps.v12,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          KeyboardButton(
                            inputCharacter: '  ↑ Shift  ',
                            listener: onSpecialkeyPresseed,
                            isPressed: (_currentKeyboardType ==
                                KeyboardType.keyboardLayout2),
                          ),
                          Gaps.h12,
                          KeyboardButton(
                            inputCharacter: '←',
                            listener: onSpecialkeyPresseed,
                          ),
                          Gaps.h12,
                          KeyboardButton(
                            inputCharacter: '  Next  ',
                            listener: onSpecialkeyPresseed,
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NeumorphicButton(
                            style: NeumorphicStyle(
                              border: NeumorphicBorder(
                                color: Colors.black12,
                                width: 1,
                              ),
                              depth: 1,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: Sizes.size32,
                              vertical: Sizes.size12,
                            ),
                            onPressed: restartStage,
                            child: FaIcon(
                              FontAwesomeIcons.rotateLeft,
                              size: Sizes.size24,
                            ),
                          ),
                          NeumorphicButton(
                            style: NeumorphicStyle(
                              border: NeumorphicBorder(
                                color: Colors.black12,
                                width: 1,
                              ),
                              depth: 1,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: Sizes.size32,
                              vertical: Sizes.size12,
                            ),
                            onPressed: () => _onNextTap(),
                            child: FaIcon(
                              FontAwesomeIcons.forward,
                              size: Sizes.size24,
                            ),
                          ),
                          NeumorphicButton(
                            style: NeumorphicStyle(
                              border: NeumorphicBorder(
                                color: Colors.black12,
                                width: 1,
                              ),
                              depth: 1,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: Sizes.size32,
                              vertical: Sizes.size12,
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                            child: FaIcon(
                              FontAwesomeIcons.arrowLeft,
                              size: Sizes.size24,
                            ),
                          ),
                        ],
                      ),
                      Gaps.v20,
                    ],
                  ),
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
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    restartStage();
    // Preload ad for the win screen.
    final adsRemoved =
        context.read<InAppPurchaseController?>()?.adRemoval.active ?? false;
    if (!adsRemoved) {
      final adsController = context.read<AdsController?>();
      adsController?.preloadAd();
    }

    showPreview();
  }

  Future<void> showPreview() async {
    setState(() {
      _duringPreview = true;
    });
    await Future<void>.delayed(_backgroundPreviewDuration);
    setState(() {
      _duringPreview = false;
    });
  }

  void restartStage() {
    setState(() {
      _initialResult = StringInfo().setInfoFromString(
        GameInfo.quizInfo[widget.level.number].contents,
      );
      _currentResult.setInfoFromInitialList(
        _initialResult.getInitialCharList(),
      );
      _startOfPlay = DateTime.now();
      _characterIndex = _initialResult.getHangulStartIndex();
    });
  }

  Future<void> _playerWon() async {
    _log.info('Level ${widget.level.number} won');

    final score = Score(
      widget.level.number,
      1, //widget.level.difficulty,
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

    GameInfo.quizInfo[widget.level.number].isCleared = true;
    _onNextTap();
  }

  bool checkWin() {
    return _currentResult.resultString == _initialResult.resultString;
  }

  void onKeyboardPressed(String key) {
    print("onKeyboardPressed: $key");
    setState(
      () {
        if (isJungsungChar(key)) {
          _currentResult.addMiddle(_characterIndex, key);
        } else if (getCurrentInputStatus() != InputStatus.initialOnly) {
          _currentResult.addLast(_characterIndex, key);
          increaseFocusIndex();
        }
      },
    );
    if (checkWin()) _playerWon();
  }

  void onSpecialkeyPresseed(String key) {
    if (key == '←') {
      switch (getCurrentInputStatus()) {
        case InputStatus.initialOnly:
          decreaseFocusIndex();
          break;
        case InputStatus.MotherCharAdded:
          _currentResult.removeMiddle(_characterIndex);
          break;
        case InputStatus.AllDone:
          _currentResult.removeLast(_characterIndex);
          break;
      }
    } else if (key.contains('Next')) {
      increaseFocusIndex();
    } else if (key.contains('Shift')) {
      _currentKeyboardType =
          (KeyboardType.keyboardLayout1 == _currentKeyboardType)
              ? KeyboardType.keyboardLayout2
              : KeyboardType.keyboardLayout1;
    }
    setState(() {});
    if (checkWin()) _playerWon();
  }

  void _onFocusTapped(int index) {
    setState(() {
      _characterIndex = index;
    });
  }

  void increaseFocusIndex() {
    if (_characterIndex < _initialResult.getHangulEndIndex()) {
      _characterIndex++;
      while (!_currentResult.resultStringList[_characterIndex].isHangul)
        _characterIndex++;
    }
  }

  void decreaseFocusIndex() {
    if (_characterIndex > _initialResult.getHangulStartIndex())
      _characterIndex--;
    while (!_currentResult.resultStringList[_characterIndex].isHangul)
      _characterIndex--;
  }

  double getOpacity() {
    if (_duringPreview) return 0.5;

    double baseValue = 0.05;
    int fullLength = _currentResult.resultString.length;
    double moveRange = 0.25;

    return baseValue + (moveRange * (_characterIndex / fullLength));
  }

  bool isJungsungChar(String input) {
    return Jungsung.indexOf(input) >= 0;
  }

  InputStatus getCurrentInputStatus() {
    if (_currentResult.resultStringList[_characterIndex].middle >= 0) {
      if (_currentResult.resultStringList[_characterIndex].last > 0) {
        return InputStatus.AllDone;
      }
      return InputStatus.MotherCharAdded;
    }
    return InputStatus.initialOnly;
  }

  QuizCategory getCategory() {
    return GameInfo.quizInfo[widget.level.number].category;
  }

  void _onNextTap() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PlaySessionScreen(
          level: GameInfo.getRandomQuiz(),
        ),
      ),
    );
  }

  AssetImage getBackgroundImage() {
    var imageName = GameInfo.quizInfo[widget.level.number].imageId;
    var imagePath = "assets/images/gamebg/$imageName.jpg";
    return AssetImage(imagePath);
  }
}
