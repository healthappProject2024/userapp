import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/utils/const/app_colors.dart/my_colors.dart';

class CommonTextfield extends StatelessWidget {
  final bool isPasswordBox;
  final String hintText;
  final Widget prefixIcon;
  final Widget? showPasswordIcon;
  final double width; 
  final FormFieldValidator<String>? validator;

  const CommonTextfield({
    super.key,
    this.isPasswordBox = false,
    required this.hintText,
    required this.prefixIcon,
    this.showPasswordIcon,
    this.width = 315, 
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
       width: width.w,
      child: TextFormField(
        validator: validator,
        obscureText: isPasswordBox,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: MyColors.hintTextColor,
            fontSize: 14.sp,
          ),
          prefixIcon: prefixIcon,
          constraints: BoxConstraints(minHeight: 60.h,maxHeight: 70.h),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(14.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(14.r),
          ),
          fillColor: Theme.of(context).indicatorColor,
          filled: true,
          suffixIcon: isPasswordBox ? showPasswordIcon : null,
          errorStyle: TextStyle(
            height: 0.5,
            fontSize: 10.sp,
          ),
        ),
      ),
    );
  }
}
