import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/utils/const/string/app_strings.dart';

class HomeTopSection extends StatelessWidget {
  final bool isUser;
  const HomeTopSection({super.key, this.isUser = false});

  @override
  Widget build(BuildContext context) {
    return isUser ? Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.loginpagewelcome,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              "NAME",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: Theme.of(context).indicatorColor,
            borderRadius: BorderRadius.circular(8.r)
          ),
          child: Icon(Icons.bluetooth),
        )
      ],
    ) : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.loginpagewelcome,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Text(
          "NAME",
          style: Theme.of(context).textTheme.headlineLarge,
        )
      ],
    );
  }
}
