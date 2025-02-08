import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/config/theme/text_theme.dart';
import 'package:userapp/utils/const/asset_helper/icon_helper.dart';
import 'package:userapp/utils/const/string/app_strings.dart';
import 'package:userapp/utils/const/validator/email_validator.dart';
import 'package:userapp/utils/const/validator/password_validator.dart';
import 'package:userapp/utils/resources/widgets/common_button.dart';
import 'package:userapp/utils/resources/widgets/common_textfield.dart';

class Login extends StatelessWidget {

  final Function() loginButtonOnpressed;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const Login({
    super.key,
    required this.loginButtonOnpressed,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.heythere,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                AppStrings.loginpagewelcome,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              _commonSpacing(),
              CommonTextfield(
                prefixIcon: Icon(CupertinoIcons.mail),
                hintText: 'Email',
                validator: EmailValidator.emailValidator,
              ),
              SizedBox(height: 10.h),
              CommonTextfield(
                prefixIcon: Icon(CupertinoIcons.lock),
                hintText: 'Password',
                isPasswordBox: true,
                showPasswordIcon: Icon(CupertinoIcons.eye_slash),
                // validator: PasswordValidator.passwordValidator,
              ),
              _commonSpacing(),
              _buildLoginButton(
                onPressed: loginButtonOnpressed,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton({required Function() onPressed}) {
    return CommonButton(
      height: 53.h,
      width: 315.w,
      isRow: true,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5.w,
        children: [
          SizedBox(
            height: 24.h,
            width: 24.w,
            child: Image.asset(IconHelper.loginbuttonIcon),
          ),
          Text(
            'Login',
            style: AppTextTheme.textTheme.bodyLarge,
          )
        ],
      ),
      onPressed: onPressed,
    );
  }

  Widget _commonSpacing() {
    return SizedBox(height: 20.h);
  }
}


