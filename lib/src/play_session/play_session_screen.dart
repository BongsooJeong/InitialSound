// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:initialsound/src/constants/const_data.dart';
import 'package:initialsound/src/level_selection/levels.dart';
import 'package:initialsound/src/play_session/fragment/keyboard_layout.dart';
import 'package:initialsound/src/play_session/model/string_info.dart';
import 'package:initialsound/src/play_session/fragment/bottom_button_fragment.dart';
import 'package:initialsound/src/player_progress/player_progress.dart';
import 'package:logging/logging.dart' hide Level;
import 'package:provider/provider.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../constants/gaps.dart';
import '../constants/sizes.dart';
import '../games_services/games_services.dart';
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
  static const _hintStage = 359;

  late GameLevel _currentLevel;
  int _characterIndex = 0;
  bool _duringCelebration = false;
  bool _duringPreview = false;
  KeyboardType _currentKeyboardType = KeyboardType.keyboardLayout1;
  bool _isSpecialGame = true;
  var _backgroundPreviewDuration;

  StringInfo _initialResult = StringInfo();
  StringInfo _currentResult = StringInfo();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackTap(),
      child: Scaffold(
        body: Stack(
          children: [
            BackgroundImage(
              key: ValueKey(_currentLevel.hashCode),
              duringCelebration: _duringCelebration,
              currentLevel: _currentLevel,
              getOpacity: getOpacity,
              isSpecial: _isSpecialGame,
            ),
            Visibility(
              visible: !_duringCelebration && !_duringPreview,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.size20,
                  vertical: Sizes.size40,
                ),
                child: SingleChildScrollView(
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
                      Gaps.v4,
                      _getHint(),
                      Gaps.v32,
                      SizedBox(
                        height: (_initialResult.resultStringList.length > 30)
                            ? 500
                            : 280,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GameClearFragment(
              duringCelebration: _duringCelebration,
              onNextTap: _onNextTap,
            ),
          ],
        ),
        floatingActionButton: Visibility(
          visible: !_duringCelebration && !_duringPreview,
          child: Padding(
            padding: const EdgeInsets.only(
              left: Sizes.size28,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                KeyboardLayout(
                    key: ValueKey(
                        _currentLevel.hashCode + _currentKeyboardType.hashCode),
                    keyboardType: _currentKeyboardType,
                    listener: onKeyboardPressed),
                Gaps.v12,
                SpecialKeyFragment(
                  currentKeyboardType: _currentKeyboardType,
                  onSpecialkeyPresseed: onSpecialkeyPresseed,
                ),
                Gaps.v44,
                BottomButtons(
                  restartStage: restartStage,
                  onNextTap: _onNextTap,
                  onBackTap: _onBackTap,
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

    _currentLevel = GameInfo.isFirstGame()
        ? GameLevel(number: _hintStage)
        : GameInfo.getRandomQuiz();
    //_currentLevel = GameLevel(number: 351);

    _backgroundPreviewDuration = _isSpecialGame
        ? Duration(milliseconds: 2000)
        : Duration(milliseconds: 1000);

    restartStage();
    // Preload ad for the win screen.
/*     final adsRemoved =
        context.read<InAppPurchaseController?>()?.adRemoval.active ?? false;
    if (!adsRemoved) {
      final adsController = context.read<AdsController?>();
      adsController?.preloadAd();
    } */
  }

  Future<void> _showPreview() async {
    final audioController = context.read<AudioController>();
    audioController.playSfx(SfxType.gameStart);
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
      _characterIndex = _initialResult.getHangulStartIndex();
    });
    _showPreview();
    PlayerProgress.loadClearedList;
  }

  Future<void> _playerWon() async {
    _log.info('Level ${_currentLevel.number} won');

    GameInfo.quizInfo[_currentLevel.number].clearTime =
        DateTime.now().microsecondsSinceEpoch;
    GameInfo.quizInfo[_currentLevel.number].isCleared = true;
    PlayerProgress.saveClearedList();

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
//      await gamesServicesController.submitLeaderboardScore(score);
    }
    if (!mounted) return;
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
    final audioController = context.read<AudioController>();
    audioController.playSfx(SfxType.buttonTap);

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
    final audioController = context.read<AudioController>();
    audioController.playSfx(SfxType.specialButtonTap);

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

  Future<bool> _onBackTap() {
    final audioController = context.read<AudioController>();
    audioController.playSfx(SfxType.popup);
    showCupertinoDialog(
      context: context,
      builder: (BuildContext ctx) {
        return CupertinoAlertDialog(
          title: Text(tr('Back')),
          content: Text(tr('BackDesc')),
          actions: [
            // The "Yes" button
            // The "No" button
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(tr("Cancel")),
              isDefaultAction: false,
              isDestructiveAction: false,
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text(tr("Confirm")),
              isDefaultAction: true,
              isDestructiveAction: true,
            ),
          ],
        );
      },
    );
    return Future.value(false);
  }

  Widget _getHint() {
    if (_currentLevel.number != _hintStage || !GameInfo.isFirstGame()) {
      return Gaps.h1;
    }
    return Text(
      "${tr("Firsthint")} : ${_initialResult.resultString}",
      style: TextStyle(
        color: GameDarkColor,
        fontSize: Sizes.size16,
      ),
    );
  }
}
