import 'package:flutter/material.dart';

import '../constants/sizes.dart';
import 'collection_constants.dart';
import 'collection_detail_screen.dart';

class CollectionTabContents extends StatelessWidget {
  const CollectionTabContents({
    super.key,
    required this.collectionType,
    required this.imageIndexList,
    required this.clearCount,
  });

  final CollectionType collectionType;
  final List<String> imageIndexList;
  final int clearCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      itemCount: imageIndexList.length,
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
            opacity: (index > clearCount - 1) ? 0.07 : 1.0,
            child: Image(
              image: _getImage(index),
            ),
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    if (index < clearCount) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CollectionDetailScreen(
            index: index,
            imageIndexList: imageIndexList.sublist(
              0,
              clearCount,
            ),
            collectionType: collectionType,
          ),
        ),
      );
    }
  }

  AssetImage _getImage(int index) {
    var imageName = imageIndexList[index];
    return (collectionType == CollectionType.normal)
        ? AssetImage("assets/images/gamebg/$imageName.jpg")
        : AssetImage("assets/images/gamebg/special/$imageName.jpg");
  }
}
