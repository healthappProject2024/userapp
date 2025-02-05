import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/utils/const/app_colors.dart/my_colors.dart';

class HomeCard extends StatelessWidget {
  final bool animation;
  final double width;
  final int index;
  const HomeCard({super.key, required this.animation, required this.width, required this.index});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400 + (index * 250)),
      curve: Curves.easeIn,
      transform: Matrix4.translationValues(animation ? 0 : width, 0, 0),
      height: 146.h,
      width: 315.w,
      margin: EdgeInsets.only(top: 30.h),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "First",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: 35.h,
            width: 101.w,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(MyColors.gradientStartColor),
                foregroundColor: WidgetStatePropertyAll(MyColors.whiteColor),
              ),
              child: Text(
                "view more",
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
