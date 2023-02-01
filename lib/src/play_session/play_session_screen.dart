// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game_template/src/constants/const_data.dart';
import 'package:game_template/src/play_session/fragment/keyboard_layout.dart';
import 'package:game_template/src/play_session/model/string_info.dart';
import 'package:go_router/go_router.dart';
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
import 'widget/keyboard_button.dart';

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
  InputStatus _currentInputStatus = InputStatus.step1_mother;
  KeyboardType _currentKeyboardType = KeyboardType.motherKey1;

  StringInfo _initialResult = StringInfo().setInfoFromString("쇼생크 탈출");
  StringInfo _currentResult = StringInfo();

  @override
  Widget build(BuildContext context) {
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
            backgroundColor: Colors.grey.shade300.withOpacity(0.95),
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
                        hintList: _currentResult.getStringAsArray(),
                        callBack: _onFocusTapped,
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
                          setKeyboardType: _currentKeyboardType,
                          listener: onKeyboardPressed),
                      Gaps.v12,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          KeyboardButton(
                            inputCharacter: '  ↑ Shift  ',
                            listener: onSpecialkeyPresseed,
                            isPressed: (_currentKeyboardType ==
                                    KeyboardType.motherKey2 ||
                                _currentKeyboardType == KeyboardType.finalKey2),
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
                            onPressed: () => GoRouter.of(context).go('/play'),
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
                            onPressed: () => GoRouter.of(context).go('/play'),
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
                            onPressed: () => GoRouter.of(context).go('/'),
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
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _currentResult.setInfoFromInitialList(
      _initialResult.getInitialCharList(),
    );
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

  bool checkWin() {
    return _currentResult.resultString == _initialResult.resultString;
  }

  void onKeyboardPressed(String key) {
    print("onKeyboardPressed: $key");
    setState(
      () {
        switch (_currentInputStatus) {
          case InputStatus.step1_mother:
            _currentResult.addMiddle(_characterIndex, key);
            _currentInputStatus = InputStatus.step2_final;
            break;
          case InputStatus.step2_final:
            _currentResult.addLast(_characterIndex, key);
            _currentInputStatus = InputStatus.step1_mother;
            increaseFocusIndex();
            break;
          default:
            print("No step now");
        }
        updateKeyboardType();
      },
    );
    if (checkWin()) _playerWon();
  }

  void onSpecialkeyPresseed(String key) {
    if (key == '←') {
      switch (_currentInputStatus) {
        case InputStatus.step1_mother:
          decreaseFocusIndex();
          break;
        case InputStatus.step2_final:
          _currentResult.removeMiddle(_characterIndex);
          break;
        case InputStatus.step3_end:
          _currentResult.removeLast(_characterIndex);
          break;
      }
      updateKeyboardType();
    } else if (key.contains('Next')) {
      increaseFocusIndex();
      updateKeyboardType();
    } else if (key.contains('Shift')) {
      shiftAction();
    }
    setState(() {});
    if (checkWin()) _playerWon();
  }

  void _onFocusTapped(int index) {
    setState(() {
      _characterIndex = index;
      updateKeyboardType();
    });
  }

  void increaseFocusIndex() {
    if (_characterIndex < _currentResult.resultString.length - 1) {
      _characterIndex += 1;
      if (_currentResult.resultStringList[_characterIndex].isBlank())
        _characterIndex += 1;
    }
  }

  void decreaseFocusIndex() {
    if (_characterIndex > 0) {
      _characterIndex -= 1;
      if (_currentResult.resultStringList[_characterIndex].isBlank())
        _characterIndex -= 1;
    }
  }

  void updateKeyboardType() {
    if (_currentResult.resultStringList[_characterIndex].isChosungOnly()) {
      _currentKeyboardType = KeyboardType.motherKey1;
      _currentInputStatus = InputStatus.step1_mother;
    } else if (_currentResult.resultStringList[_characterIndex].last == 0) {
      _currentKeyboardType = KeyboardType.finalKey1;
      _currentInputStatus = InputStatus.step2_final;
    } else {
      _currentInputStatus = InputStatus.step3_end;
    }
  }

  void shiftAction() {
    switch (_currentKeyboardType) {
      case KeyboardType.motherKey1:
        _currentKeyboardType = KeyboardType.motherKey2;
        break;
      case KeyboardType.motherKey2:
        _currentKeyboardType = KeyboardType.motherKey1;
        break;
      case KeyboardType.finalKey1:
        _currentKeyboardType = KeyboardType.finalKey2;
        break;
      case KeyboardType.finalKey2:
        _currentKeyboardType = KeyboardType.finalKey1;
        break;
      default:
        print("Error");
    }
  }
}
