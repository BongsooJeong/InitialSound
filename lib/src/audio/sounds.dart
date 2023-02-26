// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

List<String> soundTypeToFilename(SfxType type) {
  switch (type) {
    case SfxType.buttonTap:
      return const [
        'key1.wav',
      ];
    case SfxType.specialButtonTap:
      return const [
        'key2.wav',
      ];
    case SfxType.congrats:
      return const [
        'success2.mp3',
      ];
    case SfxType.erase:
      return const [
        'erase.wav',
      ];
    case SfxType.gameStart:
      return const [
        'startIntro.mp3',
      ];
    case SfxType.popup:
      return const [
        'popup.wav',
      ];
  }
}

/// Allows control over loudness of different SFX types.
double soundTypeToVolume(SfxType type) {
  switch (type) {
    case SfxType.congrats:
    case SfxType.erase:
    case SfxType.popup:
    case SfxType.buttonTap:
    case SfxType.specialButtonTap:
    case SfxType.gameStart:
      return 1.0;
  }
}

enum SfxType {
  buttonTap,
  congrats,
  erase,
  gameStart,
  popup,
  specialButtonTap,
}
