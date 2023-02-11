// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:initialsound/src/constants/const_data.dart';
import 'package:initialsound/src/settings/music_info_screen.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../constants/gaps.dart';
import '../constants/sizes.dart';
import '../in_app_purchase/in_app_purchase.dart';
import '../player_progress/player_progress.dart';
import '../style/responsive_screen.dart';
import 'custom_name_dialog.dart';
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
            const Text(
              '설정',
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
                '효과음',
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
                '음악',
                Icon(
                  musicOn ? Icons.music_note : Icons.music_off,
                  color: Colors.blue[300],
                ),
                onSelected: () => settings.toggleMusicOn(),
              ),
            ),
            Gaps.v10,
            Consumer<InAppPurchaseController?>(
                builder: (context, inAppPurchase, child) {
              if (inAppPurchase == null) {
                // In-app purchases are not supported yet.
                // Go to lib/main.dart and uncomment the lines that create
                // the InAppPurchaseController.
                return const SizedBox.shrink();
              }

              Widget icon;
              VoidCallback? callback;
              if (inAppPurchase.adRemoval.active) {
                icon = const Icon(Icons.check);
              } else if (inAppPurchase.adRemoval.pending) {
                icon = const CircularProgressIndicator();
              } else {
                icon = const Icon(Icons.ad_units);
                callback = () {
                  inAppPurchase.buy();
                };
              }
              return _SettingsLine(
                'Remove ads',
                icon,
                onSelected: callback,
              );
            }),
            _SettingsLine(
              '진행 초기화',
              Icon(
                Icons.delete,
                color: Colors.red[400],
              ),
              onSelected: () {
                PlayerProgress.resetClearedList();
                final audioController = context.read<AudioController>();
                audioController.playSfx(SfxType.erase);
                final messenger = ScaffoldMessenger.of(context);
                messenger.showSnackBar(
                  const SnackBar(
                      content: Text('Player progress has been reset.')),
                );
              },
            ),
            Gaps.v10,
            _SettingsLine(
              '음악 정보',
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
              "돌아가기",
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
}

class _NameChangeLine extends StatelessWidget {
  final String title;

  const _NameChangeLine(this.title);

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();

    return InkResponse(
      highlightShape: BoxShape.rectangle,
      onTap: () => showCustomNameDialog(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: const TextStyle(
                  fontFamily: 'Permanent Marker',
                  fontSize: 30,
                )),
            const Spacer(),
            ValueListenableBuilder(
              valueListenable: settings.playerName,
              builder: (context, name, child) => Text(
                '‘$name’',
                style: const TextStyle(
                  fontFamily: 'Permanent Marker',
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
