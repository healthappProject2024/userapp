import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/utils/const/app_colors.dart/my_colors.dart';

class CommonButton extends StatelessWidget {
  final double height;
  final double width;
  final Function() onPressed;
  final double fontSize;
  final String? buttonText;
  final bool isRow;
  final Widget? widget;
  const CommonButton({
    super.key,
    required this.height,
    required this.width,
    required this.onPressed,
    this.fontSize = 16,
    this.buttonText,
    this.isRow = false, this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.center,
            colors: [MyColors.gradientStartColor, MyColors.gradientEndColor],
          ),
        ),
        height: height,
        width: width,
        child: Center(
          child:  isRow && widget !=null ? widget : Text(
             buttonText ?? '',
            style: TextStyle(
              fontSize: fontSize.sp,
              fontWeight: FontWeight.bold,
              color: MyColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
