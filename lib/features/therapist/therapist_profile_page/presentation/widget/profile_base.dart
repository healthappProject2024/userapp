import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/features/therapist/therapist_profile_page/presentation/widget/detail_box.dart';
import 'package:userapp/utils/const/app_colors.dart/my_colors.dart';
import 'package:userapp/utils/resources/widgets/common_button.dart';

class ProfileBase extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String email;
  final String uid;
  final Function() onPressed;
  const ProfileBase({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.email,
    required this.uid,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          spacing: 20.h,
          children: [
            imageUrl.isEmpty
                ? CircleAvatar(
                    radius: 60.r,
                    backgroundColor: MyColors.hintTextColor,
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                    radius: 60.r,
                  ),
            Text(
              name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              height: 10.h,
            ),
            DetailBox(
              badge: "Name",
              value: name,
            ),
            DetailBox(
              badge: "User ID",
              value: uid,
            ),
            DetailBox(
              badge: "Email",
              value: email,
            ),
            SizedBox(
              height: 10.h,
            ),
            CommonButton(
              height: 45.h,
              width: 150.0,
              buttonText: "Log Out",
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    ));
  }
}
