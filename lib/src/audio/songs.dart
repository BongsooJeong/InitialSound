// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

const Set<Song> songs = {
  // Filenames with whitespace break package:audioplayers on iOS
  // (as of February 2022), so we use no whitespace.
  Song('1.mp3', '비눗방울', artist: 'Raon Raul'),
  Song('2.mp3', 'Sukkoraka', artist: 'HOMI'),
  Song('3.mp3', '외계 꼬마', artist: 'Circle.S'),
  Song('4.mp3', '친애하는 우리네 일상에게', artist: 'Circle.S'),
  Song('5.mp3', 'Birdcall', artist: 'LeonMusic'),
  Song('6.mp3', '발걸음', artist: 'NATONI'),
  Song('7.mp3', 'Vacation', artist: 'SYD'),
};

class Song {
  final String filename;

  final String name;

  final String? artist;

  const Song(this.filename, this.name, {this.artist});

  @override
  String toString() => 'Song<$filename>';
}
