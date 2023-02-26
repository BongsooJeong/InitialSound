import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:initialsound/src/collection/collection_constants.dart';
import 'package:initialsound/src/collection/collection_tab_contents.dart';
import 'package:initialsound/src/constants/const_data.dart';

import '../constants/sizes.dart';
import '../player_progress/game_info.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  final List<String> normal = [];
  final List<String> normalYet = [];
  final List<String> special = [];
  final List<String> specialYet = [];
  late final int normalCount;
  late final int specialCount;
  late final int normalRatio;
  late final int specialRatio;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: GameDarkColor,
        appBar: AppBar(
          title: Text(
            tr("Collection"),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: GamePrimaryColor,
            ),
          ),
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            unselectedLabelColor: Colors.grey.shade500,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w400,
            ),
            tabs: [
              Tab(
                text: "${tr("Normal")} ($normalRatio%)",
              ),
              Tab(
                text: "${tr("Special")} ($specialRatio%)",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          CollectionTabContents(
            collectionType: CollectionType.normal,
            imageIndexList: normal,
            clearCount: normalCount,
          ),
          CollectionTabContents(
            collectionType: CollectionType.special,
            imageIndexList: special,
            clearCount: specialCount,
          ),
        ]),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Map normalMap = {}, specialMap = {};
    for (int i = 0; i < GameInfo.quizInfo.length; i++) {
      if (GameInfo.quizInfo[i].isCleared) {
        normalMap[GameInfo.quizInfo[i].imageId] =
            GameInfo.quizInfo[i].clearTime;
      } else {
        normalYet.add(GameInfo.quizInfo[i].imageId);
      }

      if (GameInfo.quizSpecialInfo[i].isCleared) {
        specialMap[GameInfo.quizSpecialInfo[i].imageId] =
            GameInfo.quizSpecialInfo[i].clearTime;
      } else {
        specialYet.add(GameInfo.quizSpecialInfo[i].imageId);
      }
    }
    normalCount = normalMap.length;
    final normalSort = Map.fromEntries(
      normalMap.entries.toList()
        ..sort(
          (e2, e1) => e1.value.compareTo(
            e2.value,
          ),
        ),
    );
    normal.addAll(
        normalSort.keys.toList().map((item) => item as String).toList());
    normal.addAll(normalYet);

    specialCount = specialMap.length;
    final specialSort = Map.fromEntries(
      specialMap.entries.toList()
        ..sort(
          (e2, e1) => e1.value.compareTo(
            e2.value,
          ),
        ),
    );
    special.addAll(
        specialSort.keys.toList().map((item) => item as String).toList());
    special.addAll(specialYet);

    normalRatio = ((normalCount / normal.length) * 100).toInt();
    specialRatio = ((specialCount / special.length) * 100).toInt();
  }
}
