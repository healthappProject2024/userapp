import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:userapp/utils/const/asset_helper/image_helper.dart';
import 'package:userapp/utils/const/string/app_strings.dart';
import 'package:userapp/utils/resources/widgets/common_button.dart';

class LoginDecision extends StatelessWidget {
  const LoginDecision({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.heythere,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              AppStrings.logindecisionLoginText,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            _commonSpacing(),
            SizedBox(
              width: 375.w,
              child: Image.asset(
                ImageHelper.introductionImage,
                fit: BoxFit.fitWidth,
              ),
            ),
            _commonSpacing(),
            _buildButton(
              onPressed: () => context.pushNamed('userLogin'),
              buttonText: 'User Login',
            ),
            SizedBox(height: 15.h),
            _buildButton(
              onPressed: () => context.pushNamed('therapistLogin'),
              buttonText: 'Therpist Login',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
      {required Function() onPressed, required String buttonText}) {
    return CommonButton(
      height: 60.h,
      width: 315.w,
      onPressed: onPressed,
      buttonText: buttonText,
    );
  }

  Widget _commonSpacing() {
    return SizedBox(
      height: 40.h,
    );
  }
}
