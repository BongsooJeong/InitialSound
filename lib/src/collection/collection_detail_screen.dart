import 'package:flutter/material.dart';
import 'package:game_template/src/constants/const_data.dart';

import '../constants/sizes.dart';
import '../player_progress/game_info.dart';
import 'collection_constants.dart';

class CollectionDetailScreen extends StatelessWidget {
  const CollectionDetailScreen({
    super.key,
    required this.imageIndex,
    required this.collectionType,
  });

  final int imageIndex;
  final CollectionType collectionType;

  @override
  Widget build(BuildContext context) {
    final isSpecial = CollectionType.special == collectionType ||
        CollectionType.special_missing == collectionType;

    return Scaffold(
      backgroundColor: GameDarkColor,
      appBar: AppBar(
        title: Text(
          isSpecial ? "스페셜 컬렉션  #$imageIndex" : "일반 컬렉션  #$imageIndex",
          style: TextStyle(
            color: GamePrimaryColor,
          ),
        ),
        backgroundColor: GameDarkColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size5,
              vertical: Sizes.size20,
            ),
            child: Container(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image(
                image: _getImage(
                  imageIndex,
                  isSpecial: isSpecial,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AssetImage _getImage(int index, {bool isSpecial = false}) {
    var imageName = GameInfo.quizInfo[index + 1].imageId;
    var imagePath = isSpecial
        ? "assets/images/gamebg/special/$imageName.jpg"
        : "assets/images/gamebg/$imageName.jpg";
    return AssetImage(imagePath);
  }
}
