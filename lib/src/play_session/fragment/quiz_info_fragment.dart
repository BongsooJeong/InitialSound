import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../../constants/const_data.dart';
import '../widget/custom_box_shadow.dart';
import '../widget/result_character.dart';

class QuizInfoFragment extends StatelessWidget {
  const QuizInfoFragment({
    super.key,
    required int characterIndex,
    required List<String> hintList,
    required void Function(int) callBack,
  })  : _characterIndex = characterIndex,
        _hintList = hintList,
        _callBack = callBack;

  final int _characterIndex;
  final _hintList;
  final void Function(int) _callBack;

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
                  Icons.movie_creation_rounded,
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
                  '영화제목',
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
            spacing: Sizes.size12,
            alignment: WrapAlignment.start,
            children: [
              for (int i = 0; i < _hintList.length; i++)
                (_hintList[i] != ' ')
                    ? GestureDetector(
                        onTap: () => _callBack(i),
                        child: ResultCharacter(
                          initial: _hintList[i],
                          isFocused: (_characterIndex == i),
                        ),
                      )
                    : Gaps.h14,
            ],
          ),
        ],
      ),
    );
  }
}
