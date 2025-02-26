import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/utils/resources/widgets/common_button.dart';
import 'package:userapp/utils/resources/widgets/common_textfield.dart';
import 'package:userapp/utils/resources/widgets/home_top_section.dart';

class HomeErrorStateWidget extends StatelessWidget {
  final bool isNotError;
  final String name;
  final Function() reTryFn;
  final Function() adduserBtn;

  const HomeErrorStateWidget({
    super.key,
    required this.reTryFn,
    required this.adduserBtn,
    this.isNotError = false,
    this.name = "unknown",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 20.h,
          ),
          child: Column(
            spacing: 10.h,
            children: [
              HomeTopSection(
                iconButton: IconButton(
                  onPressed: adduserBtn,
                  icon: Icon(Icons.add),
                ),
                name: name,
              ),
              SizedBox(
                height: 10.h,
              ),
              CommonTextfield(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
              Spacer(),
              isNotError
                  ? Text("There is no user yet")
                  : Text("There is an issue"),
              CommonButton(
                height: 40.h,
                width: 120.w,
                buttonText: "ReLoad",
                onPressed: reTryFn,
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
