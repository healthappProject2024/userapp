import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/utils/const/app_colors.dart/my_colors.dart';

class DetailBox extends StatelessWidget {
  final String badge;
  final String value;

  const DetailBox({
    super.key,
    required this.badge,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5.h,
      children: [
        Text(badge),
        Container(
          height: 40.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: MyColors.hintTextColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
            child: Text(value),
          ),
        ),
      ],
    );
  }
}
