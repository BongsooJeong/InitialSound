import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../constants/sizes.dart';
import '../../constants/const_data.dart';

class KeyboardButton extends StatefulWidget {
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
  State<KeyboardButton> createState() => _KeyboardButtonState();
}

class _KeyboardButtonState extends State<KeyboardButton>
    with TickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 500,
    ),
  );
  late final _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.reverse();
    _controller.dispose();
    super.dispose();
  }

  double getAnimatedDepth() {
    return (_animation.value * 11) - 7;
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      margin: EdgeInsets.only(top: 10),
      onPressed: () => widget._listener(widget.inputCharacter),
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
        color: Colors.grey[300],
        border: NeumorphicBorder(
          color: Colors.black12,
          width: 1,
        ),
        depth: widget._isPressed ? -7 : getAnimatedDepth(),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size8,
        vertical: Sizes.size3,
      ),
      child: (widget.inputCharacter == '←')
          ? Padding(
              padding: const EdgeInsets.all(Sizes.size3),
              child: Icon(
                Icons.backspace_rounded,
                size: Sizes.size24,
              ),
            )
          : Text(
              widget.inputCharacter,
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight:
                    widget._isPressed ? FontWeight.bold : FontWeight.normal,
                color: GameDarkColor,
              ),
            ),
    );
  }
}
