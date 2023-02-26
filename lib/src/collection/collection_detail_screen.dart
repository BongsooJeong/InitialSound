import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:initialsound/src/constants/const_data.dart';

import '../constants/sizes.dart';
import 'collection_constants.dart';

class CollectionDetailScreen extends StatefulWidget {
  const CollectionDetailScreen({
    super.key,
    required this.index,
    required this.imageIndexList,
    required this.collectionType,
  });

  final int index;
  final List<String> imageIndexList;
  final CollectionType collectionType;

  @override
  State<CollectionDetailScreen> createState() => _CollectionDetailScreenState();
}

class _CollectionDetailScreenState extends State<CollectionDetailScreen> {
  late final PageController controller;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
    controller = PageController(
      initialPage: _currentIndex,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSpecial = CollectionType.special == widget.collectionType;

    return Scaffold(
      backgroundColor: GameDarkColor,
      appBar: AppBar(
        title: Text(
          isSpecial
              ? "${tr("SpecialCollection")}  #${widget.imageIndexList[_currentIndex]}"
              : "${tr("NormalCollection")}  #${widget.imageIndexList[_currentIndex]}",
          style: TextStyle(
            color: GamePrimaryColor,
          ),
        ),
        backgroundColor: GameDarkColor,
      ),
      body: PageView.builder(
        onPageChanged: _onPageChanged,
        controller: controller,
        itemCount: widget.imageIndexList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
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
                      widget.imageIndexList[index],
                      isSpecial: isSpecial,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentIndex = page;
    });
  }

  AssetImage _getImage(String imageName, {bool isSpecial = false}) {
    var imagePath = isSpecial
        ? "assets/images/gamebg/special/$imageName.jpg"
        : "assets/images/gamebg/$imageName.jpg";
    return AssetImage(imagePath);
  }
}
