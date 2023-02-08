import '../../constants/const_data.dart';
import '../../constants/sizes.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: Sizes.size8,
          right: Sizes.size24,
        ),
        child: NeumorphicText(
          'ㅊㅅ Quiz',
          textAlign: TextAlign.right,
          style: NeumorphicStyle(
            color: GameInfoColor,
            depth: 4,
            intensity: 1,
            shadowLightColor: Colors.white,
            shadowDarkColor: Colors.grey,
          ),
          textStyle: NeumorphicTextStyle(
            fontSize: Sizes.size28,
            fontFamily: 'Retrosans',
          ),
        ),
      ),
    );
  }
}
