import 'package:flutter/material.dart';
import 'package:game_template/src/collection/collection_constants.dart';
import 'package:game_template/src/collection/collection_tab_contents.dart';
import 'package:game_template/src/constants/const_data.dart';

import '../constants/sizes.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

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
          ),
          CollectionTabContents(
            collectionType: CollectionType.special,
          ),
          CollectionTabContents(
            collectionType: CollectionType.normal_missing,
          ),
          CollectionTabContents(
            collectionType: CollectionType.special_missing,
          ),
        ]),
      ),
    );
  }
}
