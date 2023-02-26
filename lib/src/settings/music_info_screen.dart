import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:initialsound/src/constants/const_data.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/gaps.dart';
import '../constants/sizes.dart';

const musicInfoList = [
  "Song : Raon Raul - 비눗방울",
  "https://youtu.be/b0O7E3BfmL0",
  "Follow Artist : https://bit.ly/3XnYnNQ",
  "https://bit.ly/3XnYnNQ",
  "Music promoted by DayDreamSound : https://youtu.be/b0O7E3BfmL0",
  "https://youtu.be/b0O7E3BfmL0",
  "Song : HOMI - Sukkoraka ",
  "https://youtu.be/s6gL13l73cM",
  "Follow Artist : https://bit.ly/3vJQMx8",
  "https://bit.ly/3vJQMx8",
  "Music promoted by DayDreamSound : https://youtu.be/s6gL13l73cM",
  "https://youtu.be/s6gL13l73cM",
  "Song :  Circle.S - 외계 꼬마",
  "https://youtu.be/HNafDti_scg",
  "Follow Artist :  https://bit.ly/3To6kRj",
  "https://bit.ly/3To6kRj",
  "Music promoted by DayDreamSound : https://youtu.be/HNafDti_scg",
  "https://youtu.be/HNafDti_scg",
  "Song : Circle.S - 친애하는 우리네 일상에게",
  "https://youtu.be/7z_wy0WNuCE",
  "Follow Artist : https://bit.ly/3To6kRj",
  "https://bit.ly/3To6kRj",
  "Music promoted by DayDreamSound : https://youtu.be/7z_wy0WNuCE",
  "https://youtu.be/7z_wy0WNuCE",
  "Song :  LeonMusic - Birdcall ",
  "https://youtu.be/oNE2h1QhMlk",
  "Follow Artist : https://bit.ly/3wUTEbC",
  "https://bit.ly/3wUTEbC",
  "Music promoted by DayDreamSound : https://youtu.be/oNE2h1QhMlk",
  "https://youtu.be/oNE2h1QhMlk",
  "Song : NATONI - 발걸음",
  "https://youtu.be/lz1q-rZD-E8",
  "Follow Artist : https://bit.ly/3FSbLlu",
  "https://bit.ly/3FSbLlu",
  "Music promoted by DayDreamSound : https://youtu.be/lz1q-rZD-E8",
  "https://youtu.be/lz1q-rZD-E8",
  "Song : SYD - Vacation",
  "https://youtu.be/ogwyet5o4zo",
  "Follow Artist : https://bit.ly/3vD3PBB",
  "https://bit.ly/3vD3PBB",
  "Music promoted by DayDreamSound : https://youtu.be/ogwyet5o4zo",
  "https://youtu.be/ogwyet5o4zo",
];

class MusicInfoScreen extends StatelessWidget {
  const MusicInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: GameDarkColor,
        shadowColor: Colors.white,
        title: Text(
          tr("MusicInfo"),
          style: TextStyle(
            color: GamePrimaryColor,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: musicInfoList.length ~/ 2,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return InkWell(
                  onTap: () => {
                    launchUrl(Uri.parse(
                      musicInfoList[index * 2 + 1],
                    ))
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            musicInfoList[index * 2],
                            style: TextStyle(
                              fontSize: Sizes.size14,
                              color: GamePrimaryColor,
                            ),
                          ),
                        ),
                      ),
                      (index % 3 == 2) ? Divider() : Gaps.h1,
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
