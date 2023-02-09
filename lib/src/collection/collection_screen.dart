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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: GameDarkColor,
        appBar: AppBar(
          title: Text(
            "컬렉션",
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
                text: "일반",
              ),
              Tab(
                text: "스페셜",
              ),
              Tab(
                text: "일반?",
              ),
              Tab(
                text: "스페셜?",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          CollectionTabContents(
            collectionType: CollectionType.normal,
            imageIndexList: normal,
          ),
          CollectionTabContents(
            collectionType: CollectionType.special,
            imageIndexList: special,
          ),
          CollectionTabContents(
            collectionType: CollectionType.normal_missing,
            imageIndexList: normalYet,
          ),
          CollectionTabContents(
            collectionType: CollectionType.special_missing,
            imageIndexList: specialYet,
          ),
        ]),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < GameInfo.quizInfo.length; i++) {
      if (GameInfo.quizInfo[i].isCleared) {
        normal.add(GameInfo.quizInfo[i].imageId);
      } else {
        normalYet.add(GameInfo.quizInfo[i].imageId);
      }

      if (GameInfo.quizSpecialInfo[i].isCleared) {
        special.add(GameInfo.quizSpecialInfo[i].imageId);
      } else {
        specialYet.add(GameInfo.quizSpecialInfo[i].imageId);
      }
    }
  }
}
