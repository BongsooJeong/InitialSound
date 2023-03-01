// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:initialsound/src/constants/const_data.dart';
import 'package:initialsound/src/settings/music_info_screen.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../constants/gaps.dart';
import '../constants/sizes.dart';
import '../player_progress/player_progress.dart';
import '../style/responsive_screen.dart';
import 'settings.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const _gap = SizedBox(height: 60);

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();

    return Scaffold(
      backgroundColor: GameDarkColor,
      body: ResponsiveScreen(
        squarishMainArea: ListView(
          children: [
            Text(
              tr("Settings"),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                height: 1,
              ),
            ),
            _gap,
/*             const _NameChangeLine(
              'Name',
            ),
 */
            ValueListenableBuilder<bool>(
              valueListenable: settings.soundsOn,
              builder: (context, soundsOn, child) => _SettingsLine(
                tr("Effects"),
                Icon(
                  soundsOn ? Icons.graphic_eq : Icons.volume_off,
                  color: Colors.blue[300],
                ),
                onSelected: () => settings.toggleSoundsOn(),
              ),
            ),
            Gaps.v10,
            ValueListenableBuilder<bool>(
              valueListenable: settings.musicOn,
              builder: (context, musicOn, child) => _SettingsLine(
                tr("Music"),
                Icon(
                  musicOn ? Icons.music_note : Icons.music_off,
                  color: Colors.blue[300],
                ),
                onSelected: () => settings.toggleMusicOn(),
              ),
            ),
            Gaps.v10,
            _SettingsLine(
              tr("ProgressReset"),
              Icon(
                Icons.delete,
                color: Colors.red[400],
              ),
              onSelected: () => _onClearGame(context),
            ),
            Gaps.v10,
            _SettingsLine(
              tr("MusicInfo"),
              Icon(
                Icons.info_outline,
                color: Colors.blue[300],
              ),
              onSelected: () {
                final audioController = context.read<AudioController>();
                audioController.playSfx(SfxType.specialButtonTap);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MusicInfoScreen(),
                  ),
                );
              },
            ),
            Gaps.v10,
            _SettingsLine(
              "Version Info",
              Text(
                "v1.0",
                style: TextStyle(
                  color: Colors.blue[300],
                ),
              ),
              onSelected: () {},
            ),
            _gap,
          ],
        ),
        rectangularMenuArea: Padding(
          padding: const EdgeInsets.all(8.0),
          child: NeumorphicButton(
            style: NeumorphicStyle(
              color: Colors.grey.shade600,
              shadowLightColor: Colors.black,
            ),
            padding: EdgeInsets.symmetric(
              vertical: Sizes.size12,
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              tr("Back"),
              style: TextStyle(
                fontSize: Sizes.size20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  void _onClearGame(BuildContext context) {
    final audioController = context.read<AudioController>();
    audioController.playSfx(SfxType.popup);

    showCupertinoDialog(
        context: context,
        builder: (BuildContext ctx) {
          return CupertinoAlertDialog(
            title: Text(tr("ProgressReset")),
            content: Text(tr("ProgressResetDesc")),
            actions: [
              // The "No" button
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(tr("Cancel")),
                isDefaultAction: false,
                isDestructiveAction: false,
              ),
              // The "Yes" button
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                  PlayerProgress.resetClearedList();
                  final audioController = context.read<AudioController>();
                  audioController.playSfx(SfxType.erase);
                  final messenger = ScaffoldMessenger.of(context);
                  messenger.showSnackBar(
                    SnackBar(
                      content: Text(tr("ProgressResetDone")),
                    ),
                  );
                },
                child: Text(tr("Reset")),
                isDefaultAction: true,
                isDestructiveAction: true,
              ),
            ],
          );
        });
  }
}

class _SettingsLine extends StatelessWidget {
  final String title;

  final Widget icon;

  final VoidCallback? onSelected;

  const _SettingsLine(this.title, this.icon, {this.onSelected});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      highlightShape: BoxShape.rectangle,
      onTap: onSelected,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: const TextStyle(
                  fontSize: Sizes.size24,
                )),
            const Spacer(),
            icon,
          ],
        ),
      ),
    );
  }
}
