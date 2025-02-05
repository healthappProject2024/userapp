import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/config/route/route_name.dart';
import 'package:userapp/config/theme/text_theme.dart';
import 'package:userapp/features/auth/user/presentation/widget/dropdown_field.dart';
import 'package:userapp/features/auth/user/presentation/widget/measurement_unit_container.dart';
import 'package:userapp/utils/const/app_colors.dart/my_colors.dart';
import 'package:userapp/utils/const/asset_helper/icon_helper.dart';
import 'package:userapp/utils/const/asset_helper/image_helper.dart';
import 'package:userapp/utils/const/string/app_strings.dart';
import 'package:userapp/utils/resources/widgets/common_button.dart';
import 'package:userapp/utils/resources/widgets/common_textfield.dart';

class ProfileComplete extends StatelessWidget {
  const ProfileComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15.h,
              children: [
                SizedBox(
                  width: 349.w,
                  height: 263.h,
                  child: Image.asset(ImageHelper.letUsCompleteYourProfile),
                ),
                Text(
                  AppStrings.letuscompleteyourprofile,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  AppStrings.completeprofilespecialpage,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                CustomDropdownField(),
                CommonTextfield(
                  hintText: 'Date of Birth',
                  prefixIcon: Icon(
                    CupertinoIcons.calendar,
                    color: MyColors.hintTextColor,
                  ),
                ),
                _buildTextFieldRow(
                  textFieldHintText: 'Your Weight',
                  unit: 'CM',
                  prefixIcon: Image.asset(IconHelper.weightScale),
                ),
                _buildTextFieldRow(
                    textFieldHintText: 'Your Height',
                    unit: 'KG',
                    prefixIcon: Image.asset(IconHelper.updown)),
                CommonButton(
                  height: 60.h,
                  width: 315.w,
                  isRow: true,
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10.w,
                    children: [
                      Text(
                        "NEXT",
                        style: AppTextTheme.textTheme.bodyLarge,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20.r,
                        color: MyColors.whiteColor,
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, RouteName.userHome);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldRow({
    required String textFieldHintText,
    required String unit,
    required Widget prefixIcon,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10.w,
      children: [
        CommonTextfield(
          width: 245,
          hintText: textFieldHintText,
          prefixIcon: prefixIcon,
        ),
        MeasurementUnitContainer(unit: unit),
      ],
    );
  }
}
