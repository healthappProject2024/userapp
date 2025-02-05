import 'package:flutter/material.dart';
import 'package:userapp/utils/const/app_colors.dart/my_colors.dart';

class IntroductionPageButton extends StatelessWidget {
  final Function() onPressed;
  const IntroductionPageButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: MyColors.gradientEndColor,
      shape: CircleBorder(),
      onPressed: onPressed,
      child: Icon(
        Icons.arrow_forward_ios_sharp,
        color: MyColors.whiteColor,
      ),
    );
  }
}
