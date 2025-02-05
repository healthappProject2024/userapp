import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/utils/const/app_colors.dart/my_colors.dart';

class Userbox extends StatelessWidget {
  const Userbox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: MyColors.whiteColor,
        elevation: 5.0,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 18.w,vertical: 18.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.w,
                children: [
                  Container(
                    height: 87.h,
                    width: 87.w,
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                  Column(
                    children: [
                      Text('NAME'),
                      Text("ID"),
                      Text('AGE')
                    ],
                  ),
                  CircleAvatar(
                    radius: 17.r,
                    backgroundColor: Colors.green,
                  ),
                  CircleAvatar(
                    radius: 17.r,
                    backgroundColor: Colors.yellow,
                  ),
                  CircleAvatar(
                    radius: 17.r,
                    backgroundColor: Colors.red,
                  ),
                ],
              ),
              SizedBox(height:15.h),
              Container(
                height: 50.h,
                width: 135.w,
                decoration: BoxDecoration(
                  color: MyColors.gradientEndColor,
                  borderRadius: BorderRadius.circular(10.r)
                ),
                child: Center(
                  child: Text("view more",style: TextStyle(color: MyColors.whiteColor,fontWeight: FontWeight.bold),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
