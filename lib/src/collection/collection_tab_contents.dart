import 'package:flutter/material.dart';

import '../constants/sizes.dart';
import '../player_progress/game_info.dart';
import 'collection_constants.dart';
import 'collection_detail_screen.dart';

class CollectionTabContents extends StatelessWidget {
  const CollectionTabContents({
    super.key,
    required this.collectionType,
  });

  final CollectionType collectionType;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: Sizes.size10,
        mainAxisSpacing: Sizes.size10,
        childAspectRatio: 512 / 768,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => _onTap(context, index),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Opacity(
            opacity: (collectionType == CollectionType.normal_missing ||
                    collectionType == CollectionType.special_missing)
                ? 0.07
                : 1.0,
            child: Image(
              image: _getImage(index),
            ),
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    if (collectionType != CollectionType.normal_missing &&
        collectionType != CollectionType.special_missing) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CollectionDetailScreen(
            imageIndex: index,
            collectionType: collectionType,
          ),
        ),
      );
    }
  }

  AssetImage _getImage(int index) {
    var imageName = GameInfo.quizInfo[index + 1].imageId;

    switch (collectionType) {
      case CollectionType.normal:
      case CollectionType.normal_missing:
        return AssetImage("assets/images/gamebg/$imageName.jpg");
      case CollectionType.special:
      case CollectionType.special_missing:
        return AssetImage("assets/images/gamebg/special/$imageName.jpg");
    }
  }
}
