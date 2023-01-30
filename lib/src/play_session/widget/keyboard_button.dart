import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/sizes.dart';

class KeyboardButton extends StatefulWidget {
  KeyboardButton({
    Key? key,
    String? inputCharacter,
    Icon? inputIcon,
  })  : this.inputCharacter = inputCharacter,
        this.inputIcon = inputIcon,
        super(key: key);

  final String? inputCharacter;
  final Icon? inputIcon;

  @override
  State<KeyboardButton> createState() => _KeyboardButtonState();
}

class _KeyboardButtonState extends State<KeyboardButton> {
  bool _isElevated = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (onTapDown) {
        setState(() {
          _isElevated = false;
        });
      },
      onTapUp: (onTapDown) {
        setState(() {
          _isElevated = true;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 100,
        ),
        height: Sizes.size36,
        width: Sizes.size36,
        alignment: Alignment.center,
        child: (this.widget.inputIcon != null)
            ? Icon(
                FontAwesomeIcons.gear,
                size: _isElevated ? 28 : 27,
                color: Colors.black,
              )
            : Text(
                this.widget.inputCharacter!,
                style: TextStyle(
                  fontSize: Sizes.size20,
                  color: Colors.black,
                ),
              ),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
          boxShadow: _isElevated
              ? [
                  const BoxShadow(
                    color: Colors.grey,
                    offset: Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
      ),
    );
  }
}
