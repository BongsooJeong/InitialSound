import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:game_template/src/play_session/model/string_info.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../../constants/const_data.dart';
import '../widget/custom_box_shadow.dart';
import '../widget/result_character.dart';

class QuizInfoFragment extends StatelessWidget {
  const QuizInfoFragment({
    super.key,
    required int characterIndex,
    required StringInfo hintList,
    required void Function(int) callBack,
    required QuizCategory category,
  })  : _characterIndex = characterIndex,
        _hintList = hintList,
        _callBack = callBack,
        _category = category;

  final int _characterIndex;
  final StringInfo _hintList;
  final void Function(int) _callBack;
  final QuizCategory _category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.size20,
        vertical: Sizes.size10,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade300.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          CustomBoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(3, 3),
            blurRadius: 15,
            blurStyle: BlurStyle.outer,
          ),
          CustomBoxShadow(
            color: Colors.white.withOpacity(0.5),
            offset: Offset(-3, -3),
            blurRadius: 15,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Column(
        children: [
          Gaps.v10,
          Neumorphic(
            padding: EdgeInsets.all(10),
            style: NeumorphicStyle(
              color: Colors.grey.shade200.withOpacity(
                0.5,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  getCategoryIcon(),
                  color: GameDarkColor,
                  size: Sizes.size32,
                ),
                Text(
                  ' Category : ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    color: GameDarkColor,
                  ),
                ),
                Gaps.h3,
                Text(
                  getCategoryTitle(),
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    color: GameDarkColor,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Gaps.v16,
          Wrap(
            spacing: Sizes.size4,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: hintWidgets(),
          ),
        ],
      ),
    );
  }

  String getCategoryTitle() {
    switch (_category) {
      case QuizCategory.drama:
        return '드라마';
      case QuizCategory.kpop:
        return 'K팝';
      case QuizCategory.movie:
        return '영화';
      case QuizCategory.proverb:
        return '속담';
    }
  }

  IconData getCategoryIcon() {
    switch (_category) {
      case QuizCategory.drama:
        return Icons.tv_rounded;
      case QuizCategory.kpop:
        return Icons.library_music_rounded;
      case QuizCategory.movie:
        return Icons.movie_creation_rounded;
      case QuizCategory.proverb:
        return Icons.chat_rounded;
    }
  }

  List<Widget> hintWidgets() {
    List<Widget> hintWidgetList = [];
    var textSize = Sizes.size24;
    var circleSize = Sizes.size12;

    if (_hintList.resultStringList.length > 50) {
      textSize = Sizes.size20;
      circleSize = Sizes.size8;
    }

    for (var eachChar in _hintList.resultStringList) {
      if (eachChar.isBlank) {
        hintWidgetList.add(Gaps.h16);
      } else if (!eachChar.isHangul) {
        hintWidgetList.add(
          Text(
            eachChar.contents,
            style: TextStyle(
              fontSize: textSize,
              color: GameDarkColor,
            ),
          ),
        );
      } else {
        hintWidgetList.add(
          GestureDetector(
            onTap: () => _callBack(
              _hintList.resultStringList.indexOf(eachChar),
            ),
            child: ResultCharacter(
              initial: eachChar.getDisplayChar(),
              isFocused: (_characterIndex ==
                  _hintList.resultStringList.indexOf(eachChar)),
              circleSize: circleSize,
            ),
          ),
        );
      }
    }
    return hintWidgetList;
  }
}
