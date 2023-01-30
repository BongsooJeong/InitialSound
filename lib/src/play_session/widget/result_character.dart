import 'package:flutter/material.dart';
import 'package:game_template/src/constants/gaps.dart';

import '../../constants/sizes.dart';

class ResultCharacter extends StatelessWidget {
  const ResultCharacter({
    super.key,
    required String initial,
    required isFocused,
  })  : _isFocused = isFocused,
        _initial = initial;

  final String _initial;
  final bool _isFocused;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        Sizes.size14,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 5,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            _initial,
            style: TextStyle(
              color: _isFocused ? Colors.blue : Colors.black,
              fontSize: Sizes.size32,
              fontWeight: _isFocused ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Gaps.v6,
        ],
      ),
    );
  }
}
