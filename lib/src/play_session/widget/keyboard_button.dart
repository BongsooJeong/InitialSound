import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../constants/sizes.dart';
import '../../constants/const_data.dart';

class KeyboardButton extends StatelessWidget {
  KeyboardButton({
    Key? key,
    required String inputCharacter,
    bool? isPressed = false,
    required void Function(String) listener,
  })  : this.inputCharacter = inputCharacter,
        this._listener = listener,
        this._isPressed = isPressed,
        super(key: key);

  final String inputCharacter;
  final _listener;
  final _isPressed;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      margin: EdgeInsets.only(top: 10),
      onPressed: () => _listener(inputCharacter),
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
        color: Colors.grey[300],
        border: NeumorphicBorder(
          color: Colors.black12,
          width: 1,
        ),
        depth: _isPressed ? -4 : 4,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size10,
        vertical: Sizes.size3,
      ),
      child: (inputCharacter == '←')
          ? Padding(
              padding: const EdgeInsets.all(Sizes.size3),
              child: Icon(
                Icons.backspace_rounded,
                size: Sizes.size28,
              ),
            )
          : Text(
              inputCharacter,
              style: TextStyle(
                fontSize: Sizes.size24,
                color: GameDarkColor,
              ),
            ),
    );
  }
}
