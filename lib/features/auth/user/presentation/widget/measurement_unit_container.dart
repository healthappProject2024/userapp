import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/utils/const/app_colors.dart/my_colors.dart';

class MeasurementUnitContainer extends StatelessWidget {
  final String unit;
  const MeasurementUnitContainer({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: 55.w,
      decoration: BoxDecoration(
        color: MyColors.gradientEndColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Center(
        child: Text(
          unit,
          style: TextStyle(
            color: MyColors.whiteColor,
            fontWeight: FontWeight.w700,
            fontSize: 14.sp
          ),
        ),
      ),
    );
  }
}
