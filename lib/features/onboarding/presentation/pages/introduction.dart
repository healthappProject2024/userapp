import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/config/route/route_name.dart';
import 'package:userapp/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:userapp/features/onboarding/presentation/pages/widget/introduction_page_button.dart';
import 'package:userapp/utils/const/asset_helper/image_helper.dart';
import 'package:userapp/utils/const/string/app_strings.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 375.w,
            child: Image.asset(
              ImageHelper.introductionImage,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          _buildSpacedText(
            data: AppStrings.introductionHeading,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(
            height: 15.h,
          ),
          _buildSpacedText(
            data: AppStrings.introductionPara,
            style: Theme.of(context).textTheme.labelSmall,
          )
        ],
      ),
      floatingActionButton: IntroductionPageButton(
        onPressed: () {
           context.read<OnboardingCubit>().completeOnboarding();
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteName.loginDecision,
            (Route<dynamic> route) => false,
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }

  Widget _buildSpacedText({required String data, required TextStyle? style}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Text(
        data,
        style: style,
      ),
    );
  }
}
