// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:initialsound/src/collection/collection_screen.dart';
import 'package:initialsound/src/settings/settings_screen.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../constants/sizes.dart';
import '../games_services/games_services.dart';
import '../play_session/play_session_screen.dart';
import '../settings/settings.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final gamesServicesController = context.watch<GamesServicesController?>();
    final settingsController = context.watch<SettingsController>();
    final audioController = context.watch<AudioController>();

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/dark_background.jpg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: palette.backgroundMain,
        body: ResponsiveScreen(
          mainAreaProminence: 0.45,
          squarishMainArea: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Transform.rotate(
                  angle: -0.1,
                  child: Text(
                    'ㅊㅅ',
                    style: TextStyle(
                      shadows: const <Shadow>[
                        Shadow(
                          offset: Offset(7.0, 7.0),
                          blurRadius: 15.0,
                          color: Colors.black,
                        )
                      ],
                      fontSize: 110,
                      fontWeight: FontWeight.w700,
                      height: 1,
                      fontFamily: 'Retrosans',
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 120,
                    ),
                  ),
                  Text(
                    'Quiz',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Retrosans',
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(7.0, 7.0),
                          blurRadius: 15.0,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          rectangularMenuArea: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size72,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 15,
                        offset: Offset(7.0, 7.0),
                        color: Colors.black,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side: BorderSide(
                        style: BorderStyle.solid,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlaySessionScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      '시작하기',
                      style: TextStyle(
                        fontFamily: 'Retrosans',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                _gap,
                if (gamesServicesController != null) ...[
                  _hideUntilReady(
                    ready: gamesServicesController.signedIn,
                    child: ElevatedButton(
                      onPressed: () =>
                          gamesServicesController.showAchievements(),
                      child: const Text('Achievements'),
                    ),
                  ),
                  _gap,
                  _hideUntilReady(
                    ready: gamesServicesController.signedIn,
                    child: ElevatedButton(
                      onPressed: () =>
                          gamesServicesController.showLeaderboard(),
                      child: const Text('Leaderboard'),
                    ),
                  ),
                  _gap,
                ],
                Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 15,
                        offset: Offset(7.0, 7.0),
                        color: Colors.black,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 60,
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      audioController.playSfx(SfxType.buttonTap);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
                        ),
                      );
                    },
                    child: Text(
                      '설정하기',
                      style: TextStyle(
                        fontFamily: 'Retrosans',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                _gap,
                Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 15,
                        offset: Offset(7.0, 7.0),
                        color: Colors.black,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 40,
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      audioController.playSfx(SfxType.buttonTap);
                      _showAlert(
                        title: "스페셜 모드",
                        message:
                            "< Paid Swimsuit version > \n향후 버전에서 지원 예정입니다 !",
                        context: context,
                      );
/*                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CollectionScreen(),
                        ),
                      ); */
                    },
                    child: Text(
                      '스페셜 모드',
                      style: TextStyle(
                        fontFamily: 'Retrosans',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                _gap,
                Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 15,
                        offset: Offset(7.0, 7.0),
                        color: Colors.black,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 60,
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      audioController.playSfx(SfxType.buttonTap);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CollectionScreen(),
                        ),
                      );
                    },
                    child: Text(
                      '컬렉션',
                      style: TextStyle(
                        fontFamily: 'Retrosans',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                _gap,
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: ValueListenableBuilder<bool>(
                    valueListenable: settingsController.muted,
                    builder: (context, muted, child) {
                      return IconButton(
                        onPressed: () => settingsController.toggleMuted(),
                        icon: Icon(
                          muted ? Icons.volume_off : Icons.volume_up,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
                _gap,
                const Text(
                  'Music by DayDreamSound',
                  textAlign: TextAlign.center,
                ),
                _gap,
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Prevents the game from showing game-services-related menu items
  /// until we're sure the player is signed in.
  ///
  /// This normally happens immediately after game start, so players will not
  /// see any flash. The exception is folks who decline to use Game Center
  /// or Google Play Game Services, or who haven't yet set it up.
  Widget _hideUntilReady({required Widget child, required Future<bool> ready}) {
    return FutureBuilder<bool>(
      future: ready,
      builder: (context, snapshot) {
        // Use Visibility here so that we have the space for the buttons
        // ready.
        return Visibility(
          visible: snapshot.data ?? false,
          maintainState: true,
          maintainSize: true,
          maintainAnimation: true,
          child: child,
        );
      },
    );
  }

  void _showAlert({
    required String title,
    required String message,
    required BuildContext context,
  }) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("확인"),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }

  static const _gap = SizedBox(height: 10);
}
