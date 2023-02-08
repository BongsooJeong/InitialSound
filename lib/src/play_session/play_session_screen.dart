// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:game_template/src/constants/const_data.dart';
import 'package:game_template/src/level_selection/levels.dart';
import 'package:game_template/src/play_session/fragment/keyboard_layout.dart';
import 'package:game_template/src/play_session/model/string_info.dart';
import 'package:game_template/src/play_session/fragment/bottom_button_fragment.dart';
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
import '../player_progress/player_progress.dart';
import 'fragment/quiz_info_fragment.dart';
import 'fragment/specialkey_fragment.dart';
import 'game_utils.dart';
import '../player_progress/game_info.dart';
import 'fragment/game_clear_fragment.dart';
import 'widget/background_image.dart';
import 'widget/title_text.dart';

class PlaySessionScreen extends StatefulWidget {
  const PlaySessionScreen({
    super.key,
  });

  @override
  State<PlaySessionScreen> createState() => _PlaySessionScreenState();
}

class _PlaySessionScreenState extends State<PlaySessionScreen> {
  static final _log = Logger('PlaySessionScreen');
  static const _preCelebrationDuration = Duration(milliseconds: 500);
  static const _backgroundPreviewDuration = Duration(milliseconds: 1000);

  late GameLevel _currentLevel;
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
            onWin: _playerWon,
          ),
        ),
      ],
      child: Scaffold(
        body: Stack(
          children: [
            BackgroundImage(
              duringCelebration: _duringCelebration,
              currentLevel: _currentLevel,
              getOpacity: getOpacity,
            ),
            Visibility(
              visible: !_duringCelebration && !_duringPreview,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.size20,
                  vertical: Sizes.size40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gaps.v32,
                    TitleText(),
                    QuizInfoFragment(
                      characterIndex: _characterIndex,
                      hintList: _currentResult,
                      callBack: _onFocusTapped,
                      category: GameUtils.getCategory(
                        _currentLevel,
                      ),
                    ),
                    Spacer(),
                    KeyboardLayout(
                        key: ValueKey(_currentLevel.hashCode +
                            _currentKeyboardType.hashCode),
                        keyboardType: _currentKeyboardType,
                        listener: onKeyboardPressed),
                    Gaps.v12,
                    SpecialKeyFragment(
                      currentKeyboardType: _currentKeyboardType,
                      onSpecialkeyPresseed: onSpecialkeyPresseed,
                    ),
                    Spacer(),
                    BottomButtons(
                      restartStage: restartStage,
                      onNextTap: _onNextTap,
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
            ),
            GameClearFragment(
              duringCelebration: _duringCelebration,
              onNextTap: _onNextTap,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _currentLevel = GameInfo.getRandomQuiz();
    restartStage();
    // Preload ad for the win screen.
    final adsRemoved =
        context.read<InAppPurchaseController?>()?.adRemoval.active ?? false;
    if (!adsRemoved) {
      final adsController = context.read<AdsController?>();
      adsController?.preloadAd();
    }
  }

  Future<void> _showPreview() async {
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
      _duringCelebration = false;
      _initialResult = StringInfo().setInfoFromString(
        GameInfo.quizInfo[_currentLevel.number].contents,
      );
      _currentResult.setInfoFromInitialList(
        _initialResult.getInitialCharList(),
      );
      _startOfPlay = DateTime.now();
      _characterIndex = _initialResult.getHangulStartIndex();
    });
    _showPreview();
  }

  Future<void> _playerWon() async {
    _log.info('Level ${_currentLevel.number} won');

    final score = Score(
      _currentLevel.number,
      1, //_currentLevel.difficulty,
      DateTime.now().difference(_startOfPlay),
    );

    final playerProgress = context.read<PlayerProgress>();
    playerProgress.setLevelReached(_currentLevel.number);

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
      if (_currentLevel.awardsAchievement) {
        await gamesServicesController.awardAchievement(
          android: _currentLevel.achievementIdAndroid!,
          iOS: _currentLevel.achievementIdIOS!,
        );
      }

      // Send score to leaderboard.
      await gamesServicesController.submitLeaderboardScore(score);
    }

    if (!mounted) return;

    GameInfo.quizInfo[_currentLevel.number].isCleared = true;
  }

  bool checkWin() {
    return _currentResult.resultString == _initialResult.resultString;
  }

  double getOpacity() {
    if (_duringPreview) return 0.15;

    double baseValue = 0.05;
    int fullLength = _currentResult.resultString.length;
    double moveRange = 0.3;

    return baseValue + (moveRange * (_characterIndex / fullLength));
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

  void _onNextTap() {
    _currentLevel = GameInfo.getRandomQuiz();
    restartStage();
  }

  void onKeyboardPressed(String key) {
    print("onKeyboardPressed: $key");
    setState(
      () {
        if (GameUtils.isJungsungChar(key)) {
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
}
