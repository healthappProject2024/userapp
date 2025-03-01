import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:userapp/config/route/route_name.dart';
import 'package:userapp/utils/const/app_colors.dart/my_colors.dart';
import 'package:userapp/utils/const/asset_helper/image_helper.dart';
import 'package:userapp/utils/const/string/app_strings.dart';
import '../../../../utils/resources/widgets/common_button.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(
        AssetImage(
          ImageHelper.introductionImage,
        ),
        context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.appName,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 36.sp,
                    color: MyColors.gradientEndColor,
                  ),
            ),
            Text(
              AppStrings.appTagLine,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        child: CommonButton(
          height: 60.h,
          width: 315.w,
          buttonText: "Get Started",
          onPressed: () => context.goNamed('introduction'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
