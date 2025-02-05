import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/features/therapist/home/presentation/widget/userbox.dart';
import 'package:userapp/utils/resources/widgets/common_button.dart';
import 'package:userapp/utils/resources/widgets/common_textfield.dart';
import 'package:userapp/utils/resources/widgets/home_top_section.dart';

class TherapistHome extends StatelessWidget {
  const TherapistHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20.h,
          children: [
            HomeTopSection(),
            CommonTextfield(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
            Userbox(),
            Align(
              alignment: Alignment(0, 0),
              child: CommonButton(
                height: 55.h,
                width: 130.w,
                buttonText: 'Add User',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
